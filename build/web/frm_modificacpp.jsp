<%-- 
    Document   : frm_modificausuario
    Created on : 26/05/2017, 01:33:00 PM
    Author     : marlon
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
                params.id_cpp=$("#id_cpp").val();
                params.fecha=$("#fecha").val();
                params.importe=$("#importe").val();
                                
                if(params.importe < 0){
                    alert("Sólo se aceptan números positivos");
                    return false;
                }
                
                $.post("controladorcpp?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
             /*inicializando campo tipo date a la fecha del dia*/
            document.getElementById('fecha').value=fechaActual();
        </script>
    </head>
    <body>
        <form id="form_UA" onsubmit="return registrar()">
            <input type="hidden" name="id_cpp" id="id_cpp" value="${cpp.id_cpp}" />
            <h1>Modificar CPP.</h1>
            <table border="0" align="center">
                <tr>
                    <td>Fecha:</td>
                    <td>Importe:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="date" id="fecha" required autofocus required value="${cpp.fecha}" /></td>
                    <td><input type="number" step="0.01" id="importe" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${cpp.importe}" /></td>
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
