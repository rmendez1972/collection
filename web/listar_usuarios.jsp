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

        function editarUsuario(id){
            var params=new Object();
            params.id=id;
            $.post("controladorusuario?operacion=editar", params, function(datos){
                $("#admin").html(datos);
            },"html");
        }   
        function eliminarUsuario(id){
            confirma("", "Eliminar Usuario", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorusuario?operacion=eliminar", params, function(datos){
                    $("#admin").html(datos);
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
            <span class="fa fa-address-card-o" style="color: #fff"></span> Catálogo de Usuarios
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladorusuario?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorusuario?operacion=reporte" target="_blank">
                    <img src="imagenes/reportesb.png" />
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="usuarios">
            <thead>
                <tr>
                    <th>Usuario</th>
                    <th>Nombre</th>
                    <th>Subsecretaría</th>
                    <th>Dirección</th>
                    <th>Grupo</th>
                    <th >Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="usr" items="${requestScope.usuarios}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}"> 
                        <td> <c:out value="${usr.usuario}" /></td>
                        <td><c:out value="${usr.nombre} ${usr.apellido_paterno} ${usr.apellido_materno}" /></td>
                        <td><c:out value="${usr.unidadAdministrativa}" /></td>
                        <td><c:out value="${usr.direccion}" /></td>
                        <td><c:out value="${usr.grupo}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Usuario" onclick="editarUsuario(${usr.id_usuario});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Usuario" onclick="eliminarUsuario(${usr.id_usuario})" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>    
      
    </body>
</html>