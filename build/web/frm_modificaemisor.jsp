<%-- 
    Document   : frm_modificacatbonific
    Created on : 7/06/2017, 09:13:36 AM
    Author     : Marlon
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function registrar(){
                var params=new Object();
                params.id_emisor=$("#id_emisor").val();
                params.descripcion=$("#descripcion").val();                
                
                $.post("controladoremisor?operacion=editarGuardar", params, function(datos){
                    $('#show').html(datos);
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
            <div class="panel-heading"><h4><span class="fa fa-podcast" style="color: #fff"></span> Editar Emisor</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" id="id_emisor" name="id_emisor" value="${emisor.id_emisor}" />

                        <div class="form-group">
                            <label for="descripcion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Descripción:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="descripcion" class="form-control" id="descripcion" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9\0-9]{5,50})" maxlength="50" placeholder="Max 50 caracteres" required style="text-transform:uppercase; width: 300px; font-size: 25px" value="${emisor.descripcion}" />
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
