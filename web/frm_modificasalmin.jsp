<%-- 
    Document   : frm_modificasalmin
    Created on : 1/06/2017, 10:48:48 AM
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
                params.id_salmin=$("#id_salmin").val();
                params.fecha=$("#fecha").val();
                params.importe=$("#importe").val();
                                
                if(params.importe < 0){
                    alert("Sólo se aceptan números positivos");
                    return false;
                }
                
                $.post("controladorsalmin?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            function listar(){
                               
                $.post("controladorsalmin?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
             
        </script>
    </head>
    <body>
        
            <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-dollar" style="color: #fff"></span> Modificar Salario Minimo.</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_salmin" id="id_salmin" value="${salmin.id_salmin}" />
                        <div class="form-group">
                            <label for="fecha" class="col-xs-12 col-md-2 control-label col-md-offset-3">Fecha:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="date" name="fecha" class="form-control" id="fecha" required autofocus required value="${salmin.fecha}" />

                            </div>
                            
                        </div>

                        <div class="form-group">
                            <label for="importe" class="col-xs-12 col-md-2 control-label col-md-offset-3">Importe:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="number" step="0.01" class="form-control" id="importe" required  placeholder="Sólo se aceptan dos decimales" maxlength="12" value="${salmin.importe}" /></td>

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
