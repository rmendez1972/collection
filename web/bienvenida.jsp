<%-- 
    Document   : bienvenida
    Created on : 27/06/2017, 01:07:12 PM
    Author     : USUARIO
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenida</title>
    </head>
    <body>
        
    </body>
    <script>
        
        <c:if test="${usuario != null}">
            alert('Autenticación exitosa');
            //alert('Autenticación exitosa'+'${usuario.usuario}');
            document.getElementById('menu').style.display = 'block';
            $("#datosUsuario").append('${usuario.usuario}');
            //cargar('bienvenida.jsp','#show');
        </c:if>
    </script>
</html>