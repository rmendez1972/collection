<%-- 
    Document   : frm_modificausuario
    Created on : 06/06/2017, 01:33:00 PM
    Author     : Rafael Méndez
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
                params.id_tipocredito=$("#id_tipocredito").val();
                params.descripcion=$("#descripcion").val();
                              
                $.post("controladortipocredito?operacion=editarGuardar", params, function(datos){
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
            <div class="panel-heading"><h4><span class="fa fa-credit-card-alt" style="color: #fff; padding: 5px;"></span>Modificar Tipo de Crédito</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_tipocredito" id="id_tipocredito" value="${tipocredito.id_tipocredito}" />
            
                        <div class="form-group">
                            <label for="descripcion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Descripción:</label>
                            <div class="col-xs-12 col-md-3">
                                <input type="text" id="descripcion" class="form-control" maxlength="50" style="text-transform:uppercase" required autofocus  value="${tipocredito.descripcion}" />

                            </div>
                            
                        </div>

                        <div class="form-group" style="text-align:center">
                            <input type="submit" value="Modificar" class="btn btn-primary" />
                            <input type="reset" value="Cancelar" onclick="return listar()" class="btn btn-default" />
                        </div>


                    </form>
                </div>
        </div>
        
    </body>
</html>
