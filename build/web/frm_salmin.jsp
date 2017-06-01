<%-- 
    Document   : frm_salmin
    Created on : 31/05/2017, 11:32:07 AM
    Author     : Marlon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>frm_salmin</title>
                <script>
            function registrar(){
                var params=new Object();
                params.fecha=$("#fecha").val();
                params.importe=$("#importe").val();
                
                if(params.importe < 0){
                    alert("Sólo se aceptan números positivos");
                    return false;
                }
                                          
                $.post("controladorsalmin?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            /*inicializando campo tipo date a la fecha del dia*/
            document.getElementById('fecha').value=fechaActual();
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado"><span class="fa fa-dollar" style="color: #fff"></span> Registro Salario Minimo.</h3>
   
        <form id="form_UA" onsubmit="return registrar()">
            
            <table border="0" align="center">
                <tr>
                    <td>Fecha:</td>
                    <td>Importe:</td>
                    
                </tr>
                <tr>
                    <td><input type="date" id="fecha" required /></td>
                    <td><input type="number" step="0.01" id="importe" required  placeholder="Sólo se aceptan dos decimales" maxlength="12"/></td>
                                        
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td></td>
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
