<%-- 
    Document   : frm_modificalocalidad
    Created on : 13/06/2017, 01:33:00 PM
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
                params.id_localidad=$("#id_localidad").val();
                params.descripcion=$("#descripcion").val();
                params.id_delegacion=$("#id_delegacion").val();
                                
                if(params.id_delegacion == 0){
                    alert("Seleccione una delegacion");
                    return false;
                }
                
                $.post("controladorlocalidad?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            
            function listar(){
                               
                $.post("controladorlocalidad?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
             
        </script>
    </head>
    <body>
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-map-marker" style="color: #fff; padding: 5px"></span>Modificar Localidad</h4></div>
                <div class="panel-body transparent">
                    <form id="form_CL" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_localidad" id="id_localidad" value="${localidad.id_localidad}" />
            
                        <div class="form-group">
                            <label for="descripcion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Descripcion:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" id="descripcion" class="form-control" required autofocus pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,80})" maxlength="80" required style="text-transform:uppercase" value="${localidad.descripcion}" />

                            </div>
                            
                        </div>

                        <div class="form-group">
                            <label for="id_delegacion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Delegación:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_delegacion" required class="form-control"> 
                                    <option value="0">Seleciona una Delegación...</option>
                                    <c:forEach  var="delegacion" items="${requestScope.delegaciones}">
                                        <OPTION VALUE="${delegacion.id_delegacion}" ${delegacion.id_delegacion == localidad.id_delegacion ? 'selected':''}>${delegacion.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
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
