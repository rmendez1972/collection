<%-- 
    Document   : frm_clavediv
    Created on : 9/06/2017, 12:21:02 PM
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
                params.clave_div=$("#clave_div").val();
                params.descripcion=$("#descripcion").val();
                params.importe=$("#importe").val();
                params.cuenta_cont=$("#cuenta_cont").val();
                
                if(params.importe < 0){
                    alert("Sólo se aceptan números positivos");
                    return false;
                }
                                          
                $.post("controladorclavediversos?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            function listar(){
                               
                $.post("controladorclavediversos?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            
        </script>
    </head>
    <body>
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-tag" style="color: #fff"></span> Registro de Claves de Movimientos Diversos</h4></div>
                <div class="panel-body transparent">
                    <form id="form_CD" onsubmit="return registrar()"  class="form-horizontal">
            
                        <div class="form-group">
                            <label for="clave_div" class="col-xs-12 col-md-2 control-label">Clave Diversos:</label>
                            <div class="col-xs-12 col-md-1">
                                <input type="text" name="clave_div" class="form-control" id="clave_div" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{3,3})"  maxlength="3" placeholder="Máx. 3 caracteres" style="text-transform:uppercase; width: 70px;" />
                            </div>
                            
                            <label for="descripcion" class="col-xs-12 col-md-5 control-label ">Descripción:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="descripcion" class="form-control" id="descripcion" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{1,50})"  maxlength="50" placeholder="Máx. 50 caracteres" style="text-transform:uppercase"  />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="importe" class="col-xs-12 col-md-2 control-label ">Importe:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="importe" class="form-control" id="importe" required  placeholder="SÓLO SE ACEPTAN DECIMALES" maxlength="12"/>
                            </div>
                            
                            <label for="cuenta_cont" class="col-xs-12 col-md-2 control-label ">Cuenta Contabilidad:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="cuenta_cont" class="form-control" id="cuenta_cont" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{1,50})"  maxlength="50" placeholder="Máx. 50 caracteres" style="text-transform:uppercase"  />
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
