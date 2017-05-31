<%-- 
    Document   : frm_usuario
    Created on : 26/05/2017, 10:29:00 AM
    Author     : Marlon
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <a href="../src/java/controladores/ControladorCpp.java"></a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" type="text/css" href="css/estilos.css"/>-->
        <title>frm_cpp</title>
        <script>
            function registrar(){
                var params=new Object();
                params.fecha=$("#fecha").val();
                params.importe=$("#importe").val();
                                
                
                if(params.importe < 0){
                    alert("Sólo se aceptan números positivos");
                    return false;
                }
                
                
                $.post("controladorcpp?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            function actualizaDir(id){
                
                var params=new Object();
                params.id_unidadadministrativa=id;
                                
                $.post("controladordirecciones?operacion=listarPorunidad", params, function(datos){
                    
                    $("#direccion").find('option').remove();
                    $("#direccion").append('<option value="">'+'Selecciona una Dirección'+'</option>');
                    $.each(datos, function(i,v){
                        $("#direccion").append('<option value="'+v.id_direccion+'">'+v.nombre+'</option>');
                    });
                },"json");
                
                return false;
            }
            
            /*inicializando campo tipo date a la fecha del dia*/
            document.getElementById('fecha').value=fechaActual();
        </script>
    </head>
    <body>
       
        <h3 class="bg-primary encabezado"><span class="fa fa-address-book-o" style="color: #fff"></span> Registro de CPP</h3>
   
        <form id="form_UA" onsubmit="return registrar()">
            
            <table border="0" align="center">
                <tr>
                    <td>Fecha:</td>
                    <td>Importe:</td>
                </tr>
                <tr>
                    <td><input type="date" name="fecha" id="fecha" required autofocus required /></td>
                    <td><input type="number" step="0.01" id="importe" required  placeholder="Sólo se aceptan dos decimales" maxlength="12"/></td>
                    
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


