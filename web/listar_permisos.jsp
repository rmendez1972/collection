<%-- 
    Document   : listar_permisos
    Created on : 18/12/2013, 12:35:15 PM
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
            function cargarPermisos(grupo){
                if(grupo!=0){
                    var params=new Object();
                    params.id_grupo=grupo;
                    
                    $.post("controladorpermiso?operacion=verPermisos", params, function(datos){
                        $("#div_permisos").html(datos);
                    },"html");
                }
                else
                    $("#div_permisos").html("");
            }
        </script>
    </head>
    <body>
        
        <div style="padding:10px;"><h3>Permisos</h3>
            Grupo: 
            <select id="grupos" onchange="cargarPermisos(this.value)">
                <option value="0">Seleccione uno</option>
                <c:forEach var="grupo" items="${requestScope.grupos}">
                    <option value="${grupo.id_grupo}">${grupo.nombre}</option>
                </c:forEach>
            </select>
        </div>
        <div id="div_permisos"></div>
    </body>
</html>
