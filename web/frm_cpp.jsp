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
            
            function listar(){
                               
                $.post("controladorcpp?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            /*inicializando campo tipo date a la fecha del dia*/
            document.getElementById('fecha').value=fechaActual();
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-address-book-o" style="color: #fff"></span> Registro de CPP</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
            
                        <div class="form-group">
                            <label for="fecha" class="col-xs-12 col-md-2 control-label col-md-offset-3">Fecha:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="date" name="fecha" class="form-control" id="fecha" required autofocus required />

                            </div>
                            
                        </div>

                        <div class="form-group">
                            <label for="importe" class="col-xs-12 col-md-2 control-label col-md-offset-3">Importe:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="number" step="0.01" class="form-control" id="importe" required  placeholder="Sólo se aceptan dos decimales" maxlength="12"/></td>

                            </div>
                        </div>

                        <div class="form-group" style="text-align:center">
                            <input type="submit" value="Aceptar" class="btn btn-primary" />
                            <input type="reset" value="Cancelar" onclick="return listar()" class="btn btn-default" />
                        </div>


                    </form>
                </div>
        </div>
        
   
        
        
    </body>
</html>


