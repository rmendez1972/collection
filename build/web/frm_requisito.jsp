<%-- 
    Document   : frm_requisito
    Created on : 6/01/2014, 04:16:17 PM
    Author     : arturo
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
                params.nombre=$("#nombre").val();
                
                $.post("controladorrequisito?operacion=nuevoGuardar", params, function(datos){
                    $('#admin').html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        <h1>Nuevo Requisito</h1>
        
        <form id="form_UA" onsubmit="return registrar()">
            <table border="0" align="center">
                <tr>
                    <td>Nombre:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><textarea id="nombre" name="nombre" rows="5" style="width:500px"></textarea></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Aceptar" class="frm-btn" /> <input type="reset" value="Cancelar" class="frm-btn" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
