<%-- 
    Document   : listar_niveles
    Created on : 09/06/2017, 11:08:43 AM
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
           
        function editarClavemov(id){
            var params=new Object();
            params.id=id;
            $.post("controladorclavemov?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarClavemov(id){
            
            confirma("", "Eliminar Clave de Movimiento", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorclavemov?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#clavemovlist').DataTable();
        });
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
        
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-file-text" style="color: #fff; padding: 5px"></span> Catálogo de Claves de Movimiento de Estado de Cuenta
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladorclavemov?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorclavemov?operacion=reporte" target="_blank">
                    <img src="imagenes/reportesb.png" />
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="clavemovlist">
            <thead>
                <tr>
                    <th>Clave de Movimiento</th>
                    <th>Descripcion</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="clavemov" items="${requestScope.clave_movs}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td> <c:out value="${clavemov.clave_mov}" /></td>
                        <td> <c:out value="${clavemov.descripcion}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Registro" onclick="editarClavemov(${clavemov.id_clave_mov});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" onclick="eliminarClavemov(${clavemov.id_clave_mov});" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div> 
    </body>
</html>
