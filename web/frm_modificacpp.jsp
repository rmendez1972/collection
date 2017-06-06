<%-- 
    Document   : frm_modificausuario
    Created on : 26/05/2017, 01:33:00 PM
    Author     : marlon
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
                params.id_cpp=$("#id_cpp").val();
                params.fecha=$("#fecha").val();
                params.importe=$("#importe").val();
                                
                if(params.importe < 0){
                    alert("Sólo se aceptan números positivos");
                    return false;
                }
                
                $.post("controladorcpp?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            
            function listar(){
                               
                $.post("controladorcpp?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
             
        </script>
    </head>
    <body>
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-address-book-o" style="color: #fff"></span>Modificar CPP</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_cpp" id="id_cpp" value="${cpp.id_cpp}" />
            
                        <div class="form-group">
                            <label for="fecha" class="col-xs-12 col-md-2 control-label col-md-offset-3">Fecha:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="date" id="fecha" class="form-control" required autofocus required value="${cpp.fecha}" />

                            </div>
                            
                        </div>

                        <div class="form-group">
                            <label for="importe" class="col-xs-12 col-md-2 control-label col-md-offset-3">Importe:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="number" step="0.01" id="importe" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${cpp.importe}" />

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
