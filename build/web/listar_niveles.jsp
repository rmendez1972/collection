<%-- 
    Document   : listar_niveles
    Created on : 30/05/2017, 11:08:43 AM
    Author     : Marlon
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
       <script>
           
        function editarNivel(id){
            var params=new Object();
            params.id=id;
            $.post("controladornivel?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarNivel(id){
            
            confirma("", "Eliminar Usuario", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladornivel?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#niveleslist').DataTable();
        });
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
        
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-sort-amount-desc" style="color: #fff"></span> Catálogo de Niveles
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladornivel?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladornivel?operacion=reporte" target="_blank">
                    <img src="imagenes/reportesb.png" />
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="niveleslist">
            <thead>
                <tr>
                    <th>Descripcion</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="niv" items="${requestScope.niveles}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td> <c:out value="${niv.descripcion}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Registro" onclick="editarNivel(${niv.id_nivel});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" onclick="eliminarNivel(${niv.id_nivel});" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div> 
    </body>
</html>
