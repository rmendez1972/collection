<%-- 
    Document   : frm_catbonific
    Created on : 6/06/2017, 11:40:56 AM
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
                                          
                $.post("controladoremisor?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            function listar(){
                               
                $.post("controladoremisor?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-podcast" style="color: #fff"></span> Nuevo Emisor</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">

                        <div class="form-group">
                            <label for="descripcion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Descripción:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="descripcion" class="form-control" id="descripcion" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9\0-9]{5,50})"  placeholder="Max 50 caracteres" required style="text-transform:uppercase; width: 300px; font-size: 25px"/>
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
