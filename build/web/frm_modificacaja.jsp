<%-- 
    Document   : frm_modificacaja
    Created on : 5/06/2017, 01:18:00 PM
    Author     : SEDUVI
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
                params.id_caja=$("#id_caja").val();
                params.fecha=$("#fecha").val();
                params.folio_inicial=$("#folio_inicial").val();
                params.folio_final=$("#folio_final").val();
                params.poliza=$("#poliza").val();
                params.monto_inicial=$("#monto_inicial").val();
                params.id_usuario=$("#id_usuario").val();
                
                if(params.monto_inicial < 0){
                    alert("Sólo se aceptan números positivos");
                    return false;
                }
                                          
                $.post("controladorcaja?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            function listar(){
                               
                $.post("controladorcaja?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-bank" style="color: #fff"></span> Modificar Caja</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_caja" id="id_caja" value="${caja.id_caja}" />
                        <div class="form-group">
                            <label for="fecha" class="col-xs-12 col-md-2 control-label">Fecha:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" name="fecha" class="form-control" id="fecha" required autofocus required value="${caja.fecha}" />
                            </div>
                            
                            <label for="folio_inicial" class="col-xs-12 col-md-2 control-label ">Folio Inicial:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" name="folio_inicial" class="form-control" id="folio_inicial" required  placeholder="SÓLO SE ACEPTAN DECIMALES" value="${caja.folio_inicial}" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="folio_final" class="col-xs-12 col-md-2 control-label ">Folio Final:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" name="folio_final" class="form-control" id="folio_final" required  placeholder="SÓLO SE ACEPTAN DECIMALES" value="${caja.folio_final}"/>
                            </div>
                            
                            <label for="fecha" class="col-xs-12 col-md-2 control-label ">Poliza:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="poliza" class="form-control" id="poliza" required autofocus required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{0,8})" maxlength="4" placeholder="Máx. 4 caracteres" style="text-transform:uppercase" value="${caja.poliza}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="importe" class="col-xs-12 col-md-2 control-label ">Monto Inicial:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="monto_inicial" required  placeholder="SÓLO SE ACEPTAN DECIMALES" maxlength="12" value="${caja.monto_inicial}"/>
                            </div>
                            
                            <label for="fecha" class="col-xs-12 col-md-2 control-label ">Usuario:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_usuario" class="form-control" required>
                                    <option value="">Seleccione uno</option>
                                    <c:forEach  var="usuario" items="${requestScope.usuario}">
                                        <OPTION VALUE="${usuario.id_usuario}" ${usuario.id_usuario == caja.id_usuario ? 'selected':''} >${usuario.usuario}</OPTION>
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
