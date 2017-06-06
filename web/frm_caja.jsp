<%-- 
    Document   : frm_caja
    Created on : 5/06/2017, 11:41:30 AM
    Author     : Marlon
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>frm_caja</title>
        <script>
            function registrar(){
                var params=new Object();
                params.fecha=$("#fecha").val();
                params.folio_inicial=$("#folio_inicial").val();
                params.folio_final=$("#folio_final").val();
                params.poliza=$("#poliza").val();
                params.monto_inicial=$("#monto_inicial").val();
                params.id_usuario=$("#id_usuario").val();
                
                if(params.monto_inicial < 0){
                    alert("Sólo se aceptan números positivos");
                    return false;
                }
                                          
                $.post("controladorcaja?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            /*inicializando campo tipo date a la fecha del dia*/
            document.getElementById('fecha').value=fechaActual();
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado"><span class="fa fa-bank" style="color: #fff"></span> Registro Caja</h3>
   
        <form id="form_UA" onsubmit="return registrar()">
            
            <table border="0" align="center">
                <tr>
                    <td>Fecha:</td>
                    <td>Folio Inicial:</td>
                    <td>Folio Final:</td>
                    <td>Poliza:</td>
                    <td>Monto Inicial:</td>
                </tr>
                <tr>
                    <td><input type="date" id="fecha" required /></td>
                    <td><input type="number" id="folio_inicial" required  placeholder="Sólo se aceptan decimales"/></td>
                    <td><input type="number" id="folio_final" required  placeholder="Sólo se aceptan decimales"/></td>
                    <td><input type="text" id="poliza" required autofocus required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{0,8})" maxlength="4" placeholder="Máx. 4 caracteres" /></td>
                    <td><input type="number" step="0.01" id="monto_inicial" required  placeholder="Sólo se aceptan decimales" maxlength="12"/></td>
                </tr>
                <tr>
                    <td>Usuario</td>
                </tr>
                <tr>
                    <td>
                        <select id="id_usuario" required>
                            <option value="">Seleccione uno</option>
                            <c:forEach  var="usuario" items="${requestScope.usuario}">
                                <OPTION VALUE="${usuario.id_usuario}">${usuario.usuario}</OPTION>
                              </c:forEach>
                        </select>
                    </td>
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
