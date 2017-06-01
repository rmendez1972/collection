<%-- 
    Document   : frm_modificanivel
    Created on : 30/05/2017, 04:13:22 PM
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
            function registrar(){
                var params=new Object();
                params.id_nivel=$("#id_nivel").val();
                params.descripcion=$("#descripcion").val();
                params.privilegios=$("#privilegios").val();                
                
                $.post("controladornivel?operacion=editarGuardar", params, function(datos){
                    $('#show').html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        <h1>Modificar Nivel</h1>
        <form id="form_UA" onsubmit="return registrar()">
            <input type="hidden" id="id_nivel" name="id_nivel" value="${niveles.id_nivel}" />
            <table border="0" align="center">
                <tr>
                    <td>Nombre</td>
                    <td>Privilegios</td>
                </tr>
                <tr>
                    <td><input type="text" id="descripcion" pattern="([a-zA-Z ]{5,20})"  placeholder="Mínimo 5 caracteres" required style="width: 300px; font-size: 25px" value="${niveles.descripcion}" /></td>
                    <td><input type="text" id="privilegios" pattern="([a-zA-Z ]{5,20})"  placeholder="Mínimo 5 caracteres" required style="width: 300px; font-size: 25px" value="${niveles.privilegios}" /></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Aceptar" class="frm-btn" /> <input type="reset" value="Cancelar" class="frm-btn" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
