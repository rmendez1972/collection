<%-- 
    Document   : listar_status
    Created on : 17/12/2013, 11:28:41 AM
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
            function eliminarStatus(id){
                confirma("", "Eliminar estatus", "Confirmar eliminación", "eliminar", function(){
                    var params=new Object();
                    params.id=id;

                    $.post("controladorestatus?operacion=eliminar", params, function(datos){
                        $("#admin").html(datos);
                    },"html");
                });
            }
            function editarStatus(id){
                var params=new Object();
                params.id=id;
                
                $.post("controladorestatus?operacion=editar", params, function(datos){
                    $("#admin").html(datos);
                },"html")
            }
            
            <c:if test="${msg != null}">
                alert('${msg}');
            </c:if>
        </script>
    </head>
    <body>
        <table width="960" border="0">
  <tr>
    <td width="750"><h1>Listado de estatus</h1></td>
    <td width="210"><div style="display:table; margin-bottom: 5px;">
            <div class="btn-catalogo" onclick="cargar('controladorestatus?operacion=nuevo','#admin')">
                <img src="imagenes/agregar.png" />
                <p>Agregar</p>
            </div>
            <a href="controladorestatus?operacion=reporte">
                <div class="btn-catalogo">
                    <img src="imagenes/reportesb.png" />
                    <p>Imprimir</p>
                </div>
            </a>
        </div>  
    </td>
  </tr>
</table>

        
      
        
        <table id="estatus" class="tablesorter" style="margin:auto; width:60%">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th width="80">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="st" items="${requestScope.status}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}"> 
                        <td><c:out value="${st.nombre}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Estatus" onclick="editarStatus(${st.id_status})" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Estatus" onclick="eliminarStatus(${st.id_status})" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
