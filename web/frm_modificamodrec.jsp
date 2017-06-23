<%-- 
    Document   : frm_modificamodrec
    Created on : 15/06/2017, 01:52:42 PM
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
                params.descripcion=$("#descripcion").val();
                params.direccion=$("#direccion").val();
                params.id_delegacion=$("#id_delegacion").val();
                params.id_modulo=$("#id_modulo").val();
                
                if(params.id_delegacion == 0){
                    alert("Seleccione una delegacion");
                    return false;
                }
                
                $.post("controladormodrec?operacion=editarGuardar", params, function(datos){
                    $('#show').html(datos);
                },"html");
                
                return false;
            }
            
            function listar(){
                               
                $.post("controladormodrec?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-window-restore" style="color: #fff"></span> Modifica Modulos Recaudación</h4></div>
                <div class="panel-body transparent">
                    <form id="form_CD" onsubmit="return registrar()"  class="form-horizontal">
                         <input type="hidden" name="id_modulo" id="id_modulo" value="${rm.id_modulo}" />
                         
                         
                        <div class="form-group">
                            <label for="Descripcion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Descripción:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="descripcion" class="form-control"  id="descripcion" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ#.\0-9]{5,50})" maxlength="50" placeholder="Máx. 50 caracteres" required style=" text-transform:uppercase; width: 300px; font-size: 25px " value="${rm.descripcion}" />
                            </div>
                            
                        </div>

                        <div class="form-group">
                            <label for="direccion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Dirección:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="direccion" class="form-control" id="direccion" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ#.\0-9]{5,80})" maxlength="80" placeholder="Max.80 caracteres" required style="text-transform:uppercase; width: 300px; font-size: 25px" value="${rm.direccion}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="delegacion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Delegacion:</label>
                            <div class="col-xs-12 col-md-2">
                                <select id="id_delegacion" required class="form-control">
                                    <option value="0">SELECCIONE UNA</option>
                                        <c:forEach  var="del" items="${requestScope.del}">
                                            <OPTION VALUE="${del.id_delegacion}" ${del.id_delegacion == rm.id_delegacion ? 'selected':''}>${del.descripcion}</OPTION>
                                        </c:forEach>
                                </select>
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
