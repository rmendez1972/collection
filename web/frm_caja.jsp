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
                
                
                if(params.monto_inicial < 0){
                    alert("Sólo se aceptan números positivos");
                    return false;
                }
                                          
                $.post("controladorcaja?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            function listar(){
                               
                $.post("controladorcaja?operacion=listar", function(datos){
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
            <div class="panel-heading"><h4><span class="fa fa-bank" style="color: #fff"></span> Registro Caja</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
            
                        <div class="form-group">
                            <label for="fecha" class="col-xs-12 col-md-2 control-label">Fecha:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" name="fecha" class="form-control" id="fecha" required autofocus required />
                            </div>
                            
                            <label for="folio_inicial" class="col-xs-12 col-md-2 control-label ">Folio Inicial:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" name="folio_inicial" class="form-control" id="folio_inicial" required  placeholder="SÓLO SE ACEPTAN DECIMALES"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="folio_final" class="col-xs-12 col-md-2 control-label ">Folio Final:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" name="folio_final" class="form-control" id="folio_final" required  placeholder="SÓLO SE ACEPTAN DECIMALES"/>
                            </div>
                            
                            <label for="fecha" class="col-xs-12 col-md-2 control-label ">Poliza:</label>
                            <div class="col-xs-12 col-md-1">
                                <input type="text" name="poliza" class="form-control" id="poliza" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,4})" maxlength="4" placeholder="Máx. 4 caracteres" style="text-transform:uppercase; width: 70px;" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="importe" class="col-xs-12 col-md-2 control-label ">Monto Inicial:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="monto_inicial" required  placeholder="SÓLO SE ACEPTAN DECIMALES" maxlength="12"/>
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
