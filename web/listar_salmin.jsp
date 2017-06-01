<%-- 
    Document   : listar_salmin
    Created on : 31/05/2017, 10:17:24 AM
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

        function editarUsuario(id){
            var params=new Object();
            params.id=id;
            $.post("controladorusuario?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarUsuario(id){
            
            confirma("", "Eliminar Usuario", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorusuario?operacion=eliminar", params, function(datos){
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
            <span class="fa fa-dollar" style="color: #fff"></span> Catálogo de Salario Minimo
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladorsalmin?operacion=nuevo','#show')">
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
                    <th>Fecha</th>
                    <th>Importe</th>
                    <th >Acciones</th>


                </tr>
            </thead>
            <tbody>
                <c:forEach var="sal" items="${requestScope.salmin}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}"> 
                        <td><c:out value="${sal.fecha}" /></td>
                        <td><c:out value="$${sal.importe}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Registro" onclick="editarStatus(${sal.id_salmin})" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" onclick="eliminarStatus(${sal.id_salmin})" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>    
      
    </body>
</html>