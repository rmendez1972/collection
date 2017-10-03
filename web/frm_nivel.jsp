<%-- 
    Document   : frm_nivel
    Created on : 30/05/2017, 03:04:13 PM
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
                params.descripcion=$("#descripcion").val();
                params.privilegios=$("#privilegios").val();
                
                $.post("controladornivel?operacion=nuevoGuardar", params, function(datos){
                    $('#show').html(datos);
                },"html");
                
                return false;
            }
            
            function listar(){
                               
                $.post("controladornivel?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-sort-amount-desc" style="color: #fff"></span> Registro de Nivel</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
            
                        <div class="form-group">
                            <label for="Nombre" class="col-xs-12 col-md-2 control-label col-md-offset-3">Nombre:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="descripcion" class="form-control"  id="descripcion" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ]{4,50})"  placeholder="Max. 50 caracteres" maxlength="50" required style=" text-transform:uppercase; width: 300px; font-size: 25px " />
                            </div>
                            
                        </div>

                        <div class="form-group">
                            <label for="importe" class="col-xs-12 col-md-2 control-label col-md-offset-3">Privilegios:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="privilegios" class="form-control" id="privilegios" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ]{4,80})"  placeholder="Max. 80 caracteres" maxlength="80" required style="text-transform:uppercase; width: 300px; font-size: 25px" />
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
