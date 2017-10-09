<%-- 
    Document   : frm_usuario
    Created on : 06/06/2017, 10:29:00 AM
    Author     : Rafael Méndez
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <a href="../src/java/controladores/ControladorTipocredito.java"></a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" type="text/css" href="css/estilos.css"/>-->
        <title>frm_cpp</title>
        <script>
            function registrar(){
                var params=new Object();
                params.descripcion=$("#descripcion").val();
                
                           
                $.post("controladortipocredito?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
                        
            function listar(){
                               
                $.post("controladortipocredito?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
                        
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-credit-card-alt" style="color: #fff"></span> Registro de Tipo de Crédito</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
            
                        <div class="form-group">
                            <label for="descripcion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Descripción:</label>
                            <div class="col-xs-12 col-md-3">
                                <input type="text" name="descripcion" class="form-control" maxlength="50" style="text-transform:uppercase" id="descripcion" required autofocus />

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


