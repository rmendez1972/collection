<%-- 
    Document   : listar_ua
    Created on : 29/11/2013, 12:19:45 PM
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
            function eliminarUA(id){
                confirma("", "Eliminar Unidad Administrativa", "Confirmar eliminación", "eliminar", function(){
                    var params=new Object();
                    params.id=id;
                    $.post("controladorunidadadtva?operacion=eliminar",params,function(datos){
                        $("#admin").html(datos);
                    },"html");
                });
            }
            function editarUA(id){
                var params=new Object();
                params.id=id;
                $.post("controladorunidadadtva?operacion=modificar",params,function(datos){
                    $("#admin").html(datos);
                },"html");
            }
            
            <c:if test="${msg != null}">
                alert('${msg}');
            </c:if>
        </script>
    </head>
    <body>
        <table width="960" border="0">
  <tr>
    <td width="750"><h3>Subsecretarías</h3></td>
    <td width="210"><div style="display:table; margin-bottom: 5px;">
            <div class="btn-catalogo" onclick="cargar('controladorunidadadtva?operacion=nuevo','#admin')">
                <img src="imagenes/agregar.png" />
                <p>Agregar</p>
            </div>
            <a href="controladorunidadadtva?operacion=reporte" target="_blank">
                <div class="btn-catalogo">
                    <img src="imagenes/reportesb.png" />
                    <p>Imprimir</p>
                </div>
            </a>
        </div>  
    </td>
  </tr>
</table>

        
      
        
        <table id="unidadadministrativa" class="tablesorter" style="margin:auto; width:70%; font-size: 14px">
            <thead>
                <tr>
                    <th style="font-size: 16px">Nombre</th>
                    <th style="font-size: 16px"width="20%">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="ua" items="${requestScope.ua}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}"> 
                        <td><c:out value="${ua.nombre}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Unidad de Atención" onclick="editarUA(${ua.id_unidadAdministrativa})" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Unidad de Atención" onclick="eliminarUA(${ua.id_unidadAdministrativa})" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
