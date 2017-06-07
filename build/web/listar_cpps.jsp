<%-- 
    Document   : listar_usuarios
    Created on : 18/05/2017, 01:16:34 PM
    Author     : Rafael Méndez
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
        
        $(document).ready(function(){
            
            $('#usuarioslist').DataTable();
        });
        
        
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
        <table class="table table-condensed table-hover" id="usuarioslist">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Importe</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cpp" items="${requestScope.cpps}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <th> <c:out value="${cpp.fecha}" /></th>
                        <th> <c:out value="$${cpp.importe}" /></th>
                        <th><img src="imagenes/editar.png" class="btn-tabla" title="Editar CPP" onclick="editarCpp(${cpp.id_cpp});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar CPP" onclick="eliminarCpp(${cpp.id_cpp});" /></th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
            
        </div>    
        
    </body>
</html>