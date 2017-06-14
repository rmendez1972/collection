<%-- 
    Document   : listar_firmantes
    Created on : 13/06/2017, 09:37:03 AM
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
           
        function editarFir(id){
            var params=new Object();
            params.id=id;
            $.post("controladorfirmantes?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarFir(id){
            
            confirma("", "Eliminar Usuario", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorfirmantes?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#firmanteslist').DataTable();
        });
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-pencil-square-o" style="color: #fff"></span> Catálogo de Firmantes
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladorfirmantes?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorfirmantes?operacion=reporte" target="_blank">
                    <img src="imagenes/reportesb.png" />
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="firmanteslist">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Cargo</th>
                    <th>Firma</th>
                    <th>Descargar</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="firm" items="${requestScope.firm}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td> <c:out value="${firm.nombre}" /></td>
                        <td> <c:out value="${firm.cargo}" /></td>
                        <td><img src="data:image/jpg;base64,<c:out value='${firm.imagen}'/>" width="200px" height="100px" /></td>
                        <td><a href="${requestScope.pathfirmantes}${firm.firma}" download="${firm.firma}"><img img src="assets/img/download.png" width="26px" height="26px"/></a></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Registro" onclick="editarFir(${firm.id_firmante});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" onclick="eliminarFir(${firm.id_firmante});" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div> 
    </body>
</html>
