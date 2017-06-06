<%-- 
    Document   : listar_cajas
    Created on : 2/06/2017, 01:45:14 PM
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
           
        function editarCaja(id){
            var params=new Object();
            params.id=id;
            $.post("controladorcaja?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarCaja(id){
            
            confirma("", "Eliminar Usuario", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorcaja?operacion=eliminar", params, function(datos){
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
            <span class="fa fa-bank" style="color: #fff"></span> Catálogo de Cajas
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladorcaja?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorcaja?operacion=reporte" target="_blank">
                    <img src="imagenes/reportesb.png" />
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="usuarios">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Folio Inicial</th>
                    <th>Folio Final</th>
                    <th>Poliza</th>
                    <th>Monto Inicial</th>
                    <th>Usuario</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="caja" items="${requestScope.caja}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td> <c:out value="${caja.fecha}" /></td>
                        <td> <c:out value="${caja.folio_inicial}" /></td>
                        <td> <c:out value="${caja.folio_final}" /></td>
                        <td> <c:out value="${caja.poliza}" /></td>
                        <td> <c:out value="${caja.monto_inicial}" /></td>
                        <td> <c:out value="${caja.usuario}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Registro" onclick="editarCaja(${caja.id_caja});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" onclick="eliminarCaja(${caja.id_caja});" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div> 
    </body>
</html>
