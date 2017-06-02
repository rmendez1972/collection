<%-- 
    Document   : frm_nivel
    Created on : 30/05/2017, 03:04:13 PM
    Author     : Marlon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function registrar(){
                var params=new Object();
                params.descripcion=$("#descripcion").val();
                params.privilegios=$("#privilegios").val();
                
                $.post("controladornivel?operacion=nuevoGuardar", params, function(datos){
                    $('#show').html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        <h1>Nuevo Nivel</h1>
        <form id="form_UA" onsubmit="return registrar()">
            <table border="0" align="center">
                <tr>
                    <td>Nombre:</td>
                    <td>Privilegios</td>
                </tr>
                <tr>
                    <td><input type="text" id="descripcion" pattern="([a-zA-Z ]{5,50})"  placeholder="Mínimo 5 caracteres" required style="width: 300px; font-size: 25px"/></td>
                    <td><input type="text" id="privilegios" pattern="([a-zA-Z ]{5,50})"  placeholder="Mínimo 5 caracteres" required style="width: 300px; font-size: 25px"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Aceptar" class="frm-btn" /> <input type="reset" value="Cancelar" class="frm-btn" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
