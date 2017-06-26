<%-- 
    Document   : frm_delegacion
    Created on : 8/06/2017, 01:37:43 PM
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
                params.descripcion=$("#descripcion").val();
                params.direccion=$("#direccion").val();
                
                $.post("controladordelegacion?operacion=nuevoGuardar", params, function(datos){
                    $('#show').html(datos);
                },"html");
                
                return false;
            }
            
            function listar(){
                               
                $.post("controladordelegacion?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-group" style="color: #fff"></span> Registro de Delegacion</h4></div>
                <div class="panel-body transparent">
                    <form id="form_DE" onsubmit="return registrar()"  class="form-horizontal">
            
                        <div class="form-group">
                            <label for="Nombre" class="col-xs-12 col-md-2 control-label col-md-offset-3">Nombre:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="descripcion" class="form-control"  id="descripcion" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ#.\0-9]{5,50})"  maxlength="50"  placeholder="Max. 50 caracteres" required style=" text-transform:uppercase; width: 300px; font-size: 25px " />
                            </div>
                            
                        </div>

                        <div class="form-group">
                            <label for="direccion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Dirección:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="direccion" class="form-control" id="direccion" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ#.\0-9]{5,80})"  maxlength="80" placeholder="Max. 80 caracteres" required style="text-transform:uppercase; width: 300px; font-size: 25px" />
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
