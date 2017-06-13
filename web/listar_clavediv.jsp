<%-- 
    Document   : listar_clavediv
    Created on : 9/06/2017, 11:50:11 AM
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
           
        function editarClvdiv(id){
            var params=new Object();
            params.id=id;
            $.post("controladorclavediversos?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarClvdiv(id){
            
            confirma("", "Eliminar Usuario", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorclavediversos?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#clavedivlist').DataTable();
        });
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-tag" style="color: #fff"></span> Catálogo de Claves de Movimientos Diversos
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladorclavediversos?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorclavediversos?operacion=reporte" target="_blank">
                    <img src="imagenes/reportesb.png" />
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="clavedivlist">
            <thead>
                <tr>
                    <th>Clave Diversos</th>
                    <th>Descripción</th>
                    <th>Importe</th>
                    <th>Cuenta Contabilidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cd" items="${requestScope.cd}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td> <c:out value="${cd.clave_div}" /></td>
                        <td> <c:out value="${cd.descripcion}" /></td>
                        <td> <c:out value="${cd.importe}" /></td>
                        <td> <c:out value="${cd.cuenta_cont}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Registro" onclick="editarClvdiv(${cd.id_clave_div});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" onclick="eliminarClvdiv(${cd.id_clave_div});" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div> 
    </body>
</html>
