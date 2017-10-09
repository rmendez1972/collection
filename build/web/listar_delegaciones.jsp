<%-- 
    Document   : listar_delegaciones
    Created on : 8/06/2017, 01:11:41 PM
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
           
        function editarDelegacion(id){
            var params=new Object();
            params.id=id;
            $.post("controladordelegacion?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarDelegacion(id){
            
            confirma("", "Eliminar Usuario", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladordelegacion?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#dellist').DataTable();
        });
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-group" style="color: #fff"></span> Catálogo de Delegaciones
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladordelegacion?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladordelegacion?operacion=reporte" target="_blank">
                    <img src="imagenes/reportesb.png" />
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="dellist">
            <thead>
                <tr>
                    <th>Descripcion</th>
                    <th>Direccion</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="del" items="${requestScope.del}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td> <c:out value="${del.descripcion}" /></td>
                        <td> <c:out value="${del.direccion}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Registro" onclick="editarDelegacion(${del.id_delegacion});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" onclick="eliminarDelegacion(${del.id_delegacion});" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div> 
    </body>
</html>
