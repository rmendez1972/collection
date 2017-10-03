<%-- 
    Document   : frm_modificaclavemov
    Created on : 09/06/2017, 04:13:22 PM
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
                params.id_clave_mov=$("#id_clave_mov").val();
                params.descripcion=$("#descripcion").val();
                params.clave_mov=$("#clave_mov").val();                
                
                $.post("controladorclavemov?operacion=editarGuardar", params, function(datos){
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
            <div class="panel-heading"><h4><span class="fa fa-file-text" style="color: #fff; padding: 5px"></span> Modificar Clave de Movimiento de Estado de Cuenta</h4></div>
                <div class="panel-body transparent">
                    <form id="form_CM" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" id="id_clave_mov" name="id_clave_mov" value="${clavemov.id_clave_mov}" />
                        <div class="form-group">
                            <label for="clave_mov" class="col-xs-12 col-md-2 control-label col-md-offset-3">Clave de Movimientto:</label>
                            <div class="col-xs-12 col-md-1">
                                <input type="text" name="clave_mov" class="form-control"  id="clave_mov" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ#.\0-9]{3,3})"  placeholder="3 caracteres" required maxlength="3" style="text-transform:uppercase; width: 70px; font-size: 25px" value="${clavemov.clave_mov}" />
                            </div>
                            
                        </div>

                        <div class="form-group">
                            <label for="descripcion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Descripcion:</label>
                            <div class="col-xs-12 col-md-3">
                                <input type="text" name="descripcion" class="form-control" id="descripcion" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ#.\0-9]{5,30})"  maxlength="30" placeholder="Mínimo 5 caracteres" required style="text-transform:uppercase; width: 300px; font-size: 25px" value="${clavemov.descripcion}" />
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
