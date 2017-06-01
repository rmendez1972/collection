<%-- 
    Document   : frm_modificasalmin
    Created on : 1/06/2017, 10:48:48 AM
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
                params.id_salmin=$("#id_salmin").val();
                params.fecha=$("#fecha").val();
                params.importe=$("#importe").val();
                                
                if(params.importe < 0){
                    alert("Sólo se aceptan números positivos");
                    return false;
                }
                
                $.post("controladorsalmin?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
             
        </script>
    </head>
    <body>
        <form id="form_UA" onsubmit="return registrar()">
            <input type="hidden" name="id_salmin" id="id_salmin" value="${salmin.id_salmin}" />
            <h1>Modificar Salario Minimo.</h1>
            <table border="0" align="center">
                <tr>
                    <td>Fecha:</td>
                    <td>Importe:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="date" id="fecha" required autofocus required value="${salmin.fecha}" /></td>
                    <td><input type="number" step="0.01" id="importe" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${salmin.importe}" /></td>
                    <td></td>
                </tr>
                
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><input type="submit" value="Aceptar" class="frm-btn" /></td>
                    <td><input type="reset" value="Cancelar" class="frm-btn" /></td>
                    <td></td>
                </tr>
            </table>
        </form>
    </body>
</html>
