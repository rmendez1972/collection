<%-- 
    Document   : frm_unidadAdministrativaEditar
    Created on : 2/12/2013, 10:11:56 AM
    Author     : arturo
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="javabeans.UnidadAdministrativa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function registrar(){
                var params=new Object();
                params.id_unidadAdministrativa=$("#id_unidadAdministrativa").val();
                params.nombre=$("#nombre").val();
                params.email=$("#email").val();
                
                $.post("controladorunidadadtva?operacion=modificarGuardar", params, function(datos){
                    $("#admin").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        
        <form id="form_UA" onsubmit="return registrar()">
            <h1>Editar Unidad Administrativa</h1>
            <input type="hidden" id="id_unidadAdministrativa" value="${ua.id_unidadAdministrativa}" />
            <table border="0" align="center">
                <tr>
                    <td>Nombre:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" id="nombre" pattern="([a-zA-ZñÑçÇáéíóúüÁÉÍÓÚÜ ]{15,100})"  placeholder="Mínimo 15 caracteres" required style=" width: 500px; font-size: 14px" value="${ua.nombre}" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="email" id="email" required style="text-transform:none; width: 300px; font-size: 13px" value="${ua.email}" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Aceptar" class="frm-btn" /> <input type="reset" value="Cancelar" class="frm-btn" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
