<%-- 
    Document   : frm_modificastatus
    Created on : 17/12/2013, 02:29:09 PM
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
            function registrar(){
                var params=new Object();
                params.id_status=$("#id_status").val();
                params.nombre=$("#nombre").val();
                
                $.post("controladorestatus?operacion=editarGuardar", params, function(datos){
                    $('#admin').html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        <h1>Modificar Estatus</h1>
        <form id="form_UA" onsubmit="return registrar()">
            <input type="hidden" id="id_status" name="id_status" value="${status.id_status}" />
            <table border="0" align="center">
                <tr>
                    <td>Nombre</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" id="nombre" pattern="([a-zA-Z ]{5,15})"  placeholder="Mínimo 5 caracteres" required style="width: 300px; font-size: 25px" value="${status.nombre}" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Aceptar" class="frm-btn" /> <input type="reset" value="Cancelar" class="frm-btn" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
