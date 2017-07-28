<%-- 
    Document   : frm_mov_bonific
    Created on : 24/07/2017, 03:14:46 PM
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
                params.id_movedoscta=$("#id_movedoscta").val();
                params.id_benef=$("#id_benef").val();
                params.imp_cap=$("#imp_cap").val();
                params.imp_int=$("#imp_int").val();
                params.imp_adm=$("#imp_adm").val();
                params.imp_seg=$("#imp_seg").val();
                params.imp_osg=$("#imp_osg").val();
                params.id_catbonific=$("#id_catbonific").val();
                params.estatus=$("#estatus").val();
                params.clave_b=$("#clave_b").val();
                params.recibo=$("#recibo").val();
                params.serie=$("#serie").val();
                params.numcontrato=$("#numcontrato").val();
                params.id_catprog=$("#id_catprog").val();
                
                 if(params.id_catbonific == 0){
                    alert("Seleccione una Bonificación");
                    return false;
                }
                
                
                $.post("controladormovbonific?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        
            
             function listar(id){
                var params=new Object();
                params.id=id;              
                $.post("controladormovbonific?operacion=listarbonific", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
        </script>
    </head>
    <body>
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-dollar" style="color: #fff"></span> Registro Bonificaciones.</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
                        
                        <input type="hidden" name="id_movedoscta" class="form-control" id="id_movedoscta"   placeholder="Máx.80 caracteres" maxlength="80" style="text-transform:uppercase" value="${edocta.id_movedoscta}" />
                        <input type="hidden" name="id_benef" class="form-control" id="id_benef"  placeholder="Máx.80 caracteres" maxlength="80" style="text-transform:uppercase" value="${edocta.id_benef}" />
                                
                        <div class="form-group">
                            <label for="imp_cap" class="col-xs-12 col-md-2 control-label">imp capital:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_cap" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                                
                            <label for="imp_int" class="col-xs-12 col-md-2 control-label">imp int:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_int" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="imp_adm" class="col-xs-12 col-md-2 control-label">imp adm:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_adm" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                                
                            <label for="imp_seg" class="col-xs-12 col-md-2 control-label">imp seg:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_seg" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="imp_osg" class="col-xs-12 col-md-2 control-label">imp osg:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_osg" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                                
                            <label for="id_catbonific" class="col-xs-12 col-md-2 control-label">Bonificacion:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_catbonific" required class="form-control">
                                    <option value="0">SELECCIONE UNA</option>
                                        <c:forEach  var="bon" items="${requestScope.bonificacion}">
                                            <OPTION VALUE="${bon.id_bonific}">${bon.clave_bonific}</OPTION>
                                        </c:forEach>
                                </select>
                            </div>
                        </div>
                                
                         <div class="form-group">
                            <label for="estatus" class="col-xs-12 col-md-2 control-label">Estatus:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="estatus" class="form-control" id="estatus" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{1,1})"  placeholder="Máx.1 caracteres" maxlength="1" style="text-transform:uppercase" />
                            </div>
                            
                            <label for="clave_b" class="col-xs-12 col-md-2 control-label">Clave b:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_b" class="form-control" id="clave_b" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,12})"  placeholder="Máx.12 caracteres" maxlength="12" style="text-transform:uppercase"  value="${edocta.clave_b}" readonly />
                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="recibo" class="col-xs-12 col-md-2 control-label">Recibo:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="1" class="form-control" id="recibo" required  placeholder="Sólo se aceptan enteros" maxlength="12"/>
                            </div>
                            
                           <label for="serie" class="col-xs-12 col-md-2 control-label">Serie:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="serie" class="form-control" id="serie" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{1,1})"  placeholder="Máx.1 caracteres" maxlength="1" style="text-transform:uppercase" />
                            </div>  
                        </div>
                        
               
                        <div class="form-group">
                           <label for="numcontrato" class="col-xs-12 col-md-2 control-label">Número de Contrato:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="numcontrato" class="form-control" id="numcontrato" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{3,5})"  placeholder="Máx.5 caracteres" maxlength="5" style="text-transform:uppercase" value="${edocta.numcontrato}" readonly />
                            </div>  
                        </div>
                                
                       <!-- <div class="form-group">
                            <label for="id_catprog" class="col-xs-12 col-md-2 control-label">id_catprog:</label>
                            <div class="col-xs-12 col-md-4">
                                

                            </div>
                   
                        </div>-->
                        <input type="hidden" name="id_catprog" class="form-control" id="id_catprog" placeholder="Máx.80 caracteres" maxlength="80" style="text-transform:uppercase" value="${edocta.id_catprog}" />
                        
                        <div class="form-group" style="text-align:center">
                            <input type="submit" value="Aceptar" class="btn btn-primary" />
                            <input type="reset" value="Cancelar" onclick="return listar(${edocta.id_movedoscta})" class="btn btn-default" />
                        </div>


                    </form>
                </div>
        </div>
    </body>
</html>
