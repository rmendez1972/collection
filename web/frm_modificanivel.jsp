<%-- 
    Document   : frm_modificanivel
    Created on : 30/05/2017, 04:13:22 PM
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
                params.id_nivel=$("#id_nivel").val();
                params.descripcion=$("#descripcion").val();
                params.privilegios=$("#privilegios").val();                
                
                $.post("controladornivel?operacion=editarGuardar", params, function(datos){
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
            <div class="panel-heading"><h4><span class="fa fa-sort-amount-desc" style="color: #fff"></span> Modificar Nivel</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" id="id_nivel" name="id_nivel" value="${niveles.id_nivel}" />
                        <div class="form-group">
                            <label for="Nombre" class="col-xs-12 col-md-2 control-label col-md-offset-3">Nombre:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="descripcion" class="form-control"  id="descripcion" pattern="([a-zA-Z ]{5,50})"  placeholder="Max. 50 caracteres"  maxlength="50" required style="text-transform:uppercase; width: 300px; font-size: 25px" value="${niveles.descripcion}" />
                            </div>
                            
                        </div>

                        <div class="form-group">
                            <label for="importe" class="col-xs-12 col-md-2 control-label col-md-offset-3">Privilegios:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="privilegios" class="form-control" id="privilegios" pattern="([a-zA-Z ]{5,80})"  placeholder="Max. 80 caracteres"  maxlength="80" required style="text-transform:uppercase; width: 300px; font-size: 25px" value="${niveles.privilegios}" />
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
