<%-- 
    Document   : listar_catbonific
    Created on : 6/06/2017, 11:18:31 AM
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
           
        function editarEmisor(id){
            var params=new Object();
            params.id=id;
            $.post("controladoremisor?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarEmisor(id){
            
            confirma("", "Eliminar Usuario", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladoremisor?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#bonificacionlist').DataTable();
        });
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-podcast" style="color: #fff"></span> Catálogo de Emisores
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladoremisor?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladoremisor?operacion=reporte" target="_blank">
                    <img src="imagenes/reportesb.png" />
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="bonificacionlist">
            <thead>
                <tr>
                    <th>Descripción</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="emisor" items="${requestScope.emisor}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td> <c:out value="${emisor.descripcion}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Registro" onclick="editarEmisor(${emisor.id_emisor});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" onclick="eliminarEmisor(${emisor.id_emisor});" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div> 
    </body>
</html>
