<%-- 
    Document   : frm_catbonific
    Created on : 6/06/2017, 11:40:56 AM
    Author     : SEDUVI
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
                params.clave_bonific=$("#clave_bonific").val();
                params.descripcion=$("#descripcion").val();
                                          
                $.post("controladorcatbonific?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        <h1>Nueva Bonificación</h1>
        <form id="form_UA" onsubmit="return registrar()">
            <table border="0" align="center">
                <tr>
                    <td>Clave Bonificación:</td>
                    <td>Descripción</td>
                </tr>
                <tr>
                    <td><input type="text" id="clave_bonific" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9\0-9]{1,5})"  placeholder="Max 5 caracteres" required style="width: 300px; font-size: 25px" maxlength="5"/></td>
                    <td><input type="text" id="descripcion" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9\0-9]{5,50})"  placeholder="Max 50 caracteres" required style="width: 300px; font-size: 25px"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Aceptar" class="frm-btn" /> <input type="reset" value="Cancelar" class="frm-btn" /></td>
                </tr>
            </table>
        </form>

    </body>
</html>
