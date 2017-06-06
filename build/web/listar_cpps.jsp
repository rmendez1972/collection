<%-- 
    Document   : listar_usuarios
    Created on : 18/05/2017, 01:16:34 PM
    Author     : Ismael
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script>

        function editarCpp(id){
            var params=new Object();
            params.id=id;
            $.post("controladorcpp?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarCpp(id){
            
            confirma("", "Eliminar CPP", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorcpp?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-dollar" style="color: #fff"></span> Catálogo de CPP
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo"  onclick="cargar('controladorcpp?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" alt="Nuevo" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorcpp?operacion=reporte" target="_blank" >
                    <img src="imagenes/reportesb.png" alt="Imprimir"/>
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="usuarios">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Importe</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody id="newStuff">
                <c:forEach var="cpp" items="${requestScope.cpps}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td> <c:out value="${cpp.fecha}" /></td>
                        <td> <c:out value="$${cpp.importe}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar CPP" onclick="editarCpp(${cpp.id_cpp});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar CPP" onclick="eliminarCpp(${cpp.id_cpp});" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!--<div class="pagination pagination-large">
            <ul class="pager"></ul>
        </div>--> 
        <nav aria-label="...">
            <ul class="pager">
                <li><a href="#">Previous</a></li>
                <li><a href="#">Next</a></li>
            </ul>
        </nav>    
            
        </div>    
        <script>
            var listElement = $('#newStuff');
var perPage = 4; 
var numItems = listElement.children().size();
var numPages = Math.ceil(numItems/perPage);

$('.pager').data("curr",0);

var curr = 0;
while(numPages > curr){
  $('<li><a href="#" class="page_link">'+(curr+1)+'</a></li>').appendTo('.pager');
  curr++;
}

$('.pager .page_link:first').addClass('active');

listElement.children().css('display', 'none');
listElement.children().slice(0, perPage).css('display', 'block');

$('.pager li a').click(function(){
  var clickedPage = $(this).html().valueOf() - 1;
  goTo(clickedPage,perPage);
});

function previous(){
  var goToPage = parseInt($('.pager').data("curr")) - 1;
  if($('.active').prev('.page_link').length==true){
    goTo(goToPage);
  }
}

function next(){
  goToPage = parseInt($('.pager').data("curr")) + 1;
  if($('.active_page').next('.page_link').length==true){
    goTo(goToPage);
  }
}

function goTo(page){
  var startAt = page * perPage,
    endOn = startAt + perPage;
  
  listElement.children().css('display','none').slice(startAt, endOn).css('display','block');
  $('.pager').attr("curr",page);
}
        </script>  
    </body>
</html>