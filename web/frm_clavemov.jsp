<%-- 
    Document   : frm_clavemov
    Created on : 09/06/2017, 03:04:13 PM
    Author     : Rafael Méndez
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
                params.descripcion=$("#descripcion").val();
                params.clave_mov=$("#clave_mov").val();
                
                $.post("controladorclavemov?operacion=nuevoGuardar", params, function(datos){
                    $('#show').html(datos);
                },"html");
                
                return false;
            }
            
            function listar(){
                               
                $.post("controladorclavemov?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-file-text" style="color: #fff; padding: 5px"></span> Registro de Clave de Movimiento de Estado de Cuenta</h4></div>
                <div class="panel-body transparent">
                    <form id="form_CM" onsubmit="return registrar()"  class="form-horizontal">
            
                        <div class="form-group">
                            <label for="Nombre" class="col-xs-12 col-md-2 control-label col-md-offset-3">Clave de Movimiento:</label>
                            <div class="col-xs-12 col-md-1">
                                <input type="text" name="clave_mov" class="form-control"  id="clave_mov" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ#.\0-9]{3,3})"  maxlength="3" placeholder="3 caracteres" required style=" text-transform:uppercase; width: 70px; font-size: 25px " />
                            </div>
                            
                        </div>

                        <div class="form-group">
                            <label for="descripcion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Descripción:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="descripcion" class="form-control" id="descripcion" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ#.\0-9]{5,30})"  placeholder="Mínimo 5 caracteres" required style="text-transform:uppercase; width: 300px; font-size: 25px" />
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
