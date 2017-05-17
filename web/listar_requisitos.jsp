<%-- 
    Document   : listar_requisitos
    Created on : 6/01/2014, 02:26:47 PM
    Author     : arturo
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function editarRequisito(id){
                var params=new Object();
                params.id_requisito=id;
                
                $.post("controladorrequisito?operacion=editar", params, function(datos){
                    $("#admin").html(datos);
                }, "html");
            }
            
            function eliminarRequisito(id){
                var params=new Object();
                params.id_requisito=id;
                
                confirma("", "Eliminar Requisito", "Confirmar eliminación", "eliminar", function(){
                    $.post("controladorrequisito?operacion=eliminar", params, function(datos){
                        $("#admin").html(datos);
                    }, "html");
                });
            }
            
        </script>
    </head>
    <body>
        <table width="960" border="0">
  <tr>
    <td width="753"><h3>Listado de requisitos</h3></td>
    <td width="197"><div style="display:table; margin-bottom: 5px;">
            <div class="btn-catalogo" onclick="cargar('controladorrequisito?operacion=nuevo','#admin')">
                <img src="imagenes/agregar.png" />
                <p>Agregar</p>
            </div>
            <a href="controladorrequisito?operacion=reporte" target="_blank">
                <div class="btn-catalogo">
                    <img src="imagenes/reportesb.png" />
                    <p>Imprimir</p>
                </div>
            </a>
        </div>  
    </td>
  </tr>
</table>
        
        <table id="requisitos" class="tablesorter" style="margin:auto; width:98%">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th width="80">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="req" items="${requestScope.req}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}"> 
                        <td><c:out value="${req.nombre}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Requisito" onclick="editarRequisito(${req.id_requisito})" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Requisito" onclick="eliminarRequisito(${req.id_requisito})" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <script>
            <c:if test="${msg != null}">
                alert('${msg}');
            </c:if>
        </script>
    </body>
</html>
