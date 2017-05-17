<%-- 
    Document   : ver_permisos
    Created on : 18/12/2013, 01:05:31 PM
    Author     : arturo
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Permisos</title>
        <script>
            function guardarPermisos(){
                var params=$("#frm_permisos").serialize();
                $.post("controladorpermiso?operacion=guardar", params, function(datos){
                  $("#div_permisos").html(datos);  
                },"html");
                
                return false;
            }
            
            <c:if test="${msg != null}">
                alert('${msg}');
            </c:if>
        </script>
    </head>
    <body>
        <form id="frm_permisos" onsubmit="return guardarPermisos();">
            <input type="hidden" id="id_grupo" name="id_grupo" value="${id_grupo}" />
            <table id="tab_permisos" class="tablesorter" style="width:420px">
                <thead>
                    <tr>
                        <th>Módulo</th>
                        <th width="80">Permiso</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="permiso" items="${requestScope.permisos}" varStatus="loop">
                        <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                            <td>${permiso.modulo}</td>
                            <td><input id="perm_${permiso.id_modulo}" name="perm_${permiso.id_modulo}" type="checkbox" value="1" ${permiso.valor == 1 ? "checked" : ""} /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <input type="submit" class="frm-btn" value="Guardar" />
        </form>
    </body>
</html>
