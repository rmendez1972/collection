<%-- 
    Document   : frm_programas
    Created on : 19/06/2017, 12:06:35 PM
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
                params.clave=$("#clave").val();
                params.descripcion=$("#descripcion").val();
                params.sub_ini=$("#sub_ini").val();
                params.eng_fon=$("#eng_fon").val();
                params.eng_inv=$("#eng_inv").val();
                params.interes=$("#interes").val();
                params.admon=$("#admon").val();
                params.seguro=$("#seguro").val();
                params.costo_m2=$("#costo_m2").val();
                params.por_sub=$("#por_sub").val();
                params.por_admon=$("#por_admon").val();
                params.por_sv=$("#por_sv").val();
                params.por_os=$("#por_os").val();
                params.sal_min=$("#sal_min").val();
                params.pago_mes=$("#pago_mes").val();
                params.por_eng=$("#por_eng").val();
                params.anual=$("#anual").val();
                params.plazo=$("#plazo").val();
                params.por_cap=$("#por_cap").val();
                params.status=$("#status").val();
                params.mecanica=$("#mecanica").val();
                params.id_tipocred=$("#id_tipocred").val();
                params.mensual=$("#mensual").val();
                params.sub_bp=$("#sub_bp").val();
                params.apor_fij=$("#apor_fij").val();
                params.por_pm=$("#por_pm").val();
                params.por_pf=$("#por_pf").val();
                params.clave_ant=$("#clave_ant").val();
                params.id_colonia=$("#id_colonia").val();
                params.dias_gracia=$("#dias_gracia").val();
                params.mora=$("#mora").val();
                params.por_ga=$("#por_ga").val();
                params.cuenta_cont=$("#cuenta_cont").val();
                params.id_delegacion=$("#id_delegacion").val();
                params.id_modulo=$("#id_modulo").val();
                params.condicion_fija=$("#condicion_fija").val();
                
                
                if(params.status == 0){
                    alert("Seleccione un status");
                    return false;
                }
                if(params.mora == 0){
                    alert("Seleccione mora");
                    return false;
                }
                if(params.condicion_fija == 0){
                    alert("Seleccione una condicion fija");
                    return false;
                }
                
 
                                                          
                $.post("controladorprogramas?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            function listar(){
                               
                $.post("controladorprogramas?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            

        </script>
    </head>
    <body>
       <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-folder" style="color: #fff; padding: 5px"></span> Registro de Programa</h4></div>
                <div class="panel-body transparent">
                    <form id="form_CL" onsubmit="return registrar()"  class="form-horizontal">
            
                        <div class="form-group">
                            <label for="clave" class="col-xs-12 col-md-2 control-label ">Clave:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave" class="form-control" id="clave" required autofocus pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,6})" maxlength="6" placeholder="Máx. 6 caracteres" style="text-transform:uppercase" />
                            </div>
                            
                            <label for="descripcion" class="col-xs-12 col-md-2 control-label ">Descripción:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="descripcion" class="form-control" id="descripcion" required autofocus pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,80})" maxlength="80" placeholder="Máx. 80 caracteres" style="text-transform:uppercase" />
                            </div>

                        </div>
                                      
                        <div class="form-group">
                            <label for="sub_ini" class="col-xs-12 col-md-2 control-label ">Sub ini:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="sub_ini" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                            
                            <label for="eng_fon" class="col-xs-12 col-md-2 control-label ">Eng fon:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="eng_fon" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>

                        </div>
                        
                        <div class="form-group">
                            <label for="eng_inv" class="col-xs-12 col-md-2 control-label ">Eng inv:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="eng_inv" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                            
                            <label for="interes" class="col-xs-12 col-md-2 control-label ">Interes:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="interes" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>

                        </div>
                        
                        <div class="form-group">
                            <label for="admon" class="col-xs-12 col-md-2 control-label ">Admon:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="admon" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                            
                            <label for="seguro" class="col-xs-12 col-md-2 control-label ">Seguro:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="seguro" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="costo_m2" class="col-xs-12 col-md-2 control-label ">Costo m2:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="costo_m2" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                            
                            <label for="por_sub" class="col-xs-12 col-md-2 control-label ">Por sub:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_sub" required  placeholder="Sólo se aceptan dos decimales" maxlength="12"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="por_admon" class="col-xs-12 col-md-2 control-label ">Por admon:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_admon" required  placeholder="Sólo se aceptan dos decimales" maxlength="12"/>
                            </div>
                            
                            <label for="por_sv" class="col-xs-12 col-md-2 control-label ">Por sv:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_sv" required  placeholder="Sólo se aceptan dos decimales" maxlength="12"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="por_os" class="col-xs-12 col-md-2 control-label ">Por os:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_os" required  placeholder="Sólo se aceptan dos decimales" maxlength="12"/>
                            </div>
                            
                            <label for="sal_min" class="col-xs-12 col-md-2 control-label ">Sal min:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="sal_min" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="pago_mes" class="col-xs-12 col-md-2 control-label ">Pago mes:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="pago_mes" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                            
                            <label for="por_eng" class="col-xs-12 col-md-2 control-label ">Por eng:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_eng" required  placeholder="Sólo se aceptan dos decimales" maxlength="12"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="anual" class="col-xs-12 col-md-2 control-label ">Anual:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="anual" required  placeholder="Sólo se aceptan dos decimales" maxlength="12"/>
                            </div>
                            
                            <label for="plazo" class="col-xs-12 col-md-2 control-label ">Plazo:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" class="form-control" id="plazo" required  placeholder="Sólo se aceptan enteros" maxlength="12"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="por_cap" class="col-xs-12 col-md-2 control-label ">Por cap:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_cap" required  placeholder="Sólo se aceptan dos decimales" maxlength="12"/>
                            </div>
                            
                            <label for="status" class="col-xs-12 col-md-2 control-label ">Status:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="status" required class="form-control">
                                    <option value="0">Seleccione un Status...</option>
                                    <option value="false">Inactivo</option>
                                    <option value="true">Activo</option>
                                </select> 
                            </div>   
                        </div>
                        
                        <div class="form-group">
                            <label for="mecanica" class="col-xs-12 col-md-2 control-label ">Mecánica:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" class="form-control" id="mecanica" required  placeholder="Sólo se aceptan enteros" maxlength="12"/>
                            </div>
                            
                            <label for="id_tipocred" class="col-xs-12 col-md-2 control-label ">Tipo de Credito:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_tipocred" required class="form-control"> 
                                    <option value="0">Seleccione un Credito...</option>
                                    <c:forEach  var="tc" items="${requestScope.tc}">
                                        <OPTION VALUE="${tc.id_tipocredito}">${tc.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>   
                        </div>
                        
                        <div class="form-group">
                            <label for="mensual" class="col-xs-12 col-md-2 control-label ">Mensual:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="mensual" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                            
                            <label for="sub_bp" class="col-xs-12 col-md-2 control-label ">Sub bp:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="sub_bp" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="apor_fij" class="col-xs-12 col-md-2 control-label ">Aporte Fijo:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="apor_fij" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                            
                            <label for="por_pm" class="col-xs-12 col-md-2 control-label ">Por pm:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="por_pm" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="por_pf" class="col-xs-12 col-md-2 control-label ">Por pf:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_pf" required  placeholder="Sólo se aceptan tres decimales" maxlength="12"/>
                            </div>
                            
                            <label for="clave_ant" class="col-xs-12 col-md-2 control-label ">Clave_ant:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_ant" class="form-control" id="clave_ant" required autofocus pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,6})" maxlength="6" placeholder="Máx. 6 caracteres" style="text-transform:uppercase" />
                            </div>
                        </div>
                        
                        <div class="form-group">                   
                            <label for="id_colonia" class="col-xs-12 col-md-2 control-label ">Colonia:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_colonia" required class="form-control"> 
                                    <option value="0">Seleccione una Colonia...</option>
                                    <c:forEach  var="col" items="${requestScope.col}">
                                        <OPTION VALUE="${col.id_colonia}">${col.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <label for="dias_graia" class="col-xs-12 col-md-2 control-label ">Dias gracia:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" class="form-control" id="dias_gracia" required  placeholder="Sólo se aceptan enteros" maxlength="12"/>
                            </div>
                        </div>
                        
                        <div class="form-group">                        
                            <label for="mora" class="col-xs-12 col-md-2 control-label ">Mora:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="mora" required class="form-control">
                                    <option value="0">Seleccione mora...</option>
                                    <option value="false">Inactivo</option>
                                    <option value="true">Activo</option>
                                </select> 
                            </div>
                            
                            <label for="por_ga" class="col-xs-12 col-md-2 control-label ">Por ga:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_ga" required  placeholder="Sólo se aceptan dos decimales" maxlength="12"/>
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                            <label for="cuenta_cont" class="col-xs-12 col-md-2 control-label ">Cuenta cont:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="cuenta_cont" class="form-control" id="cuenta_cont" required autofocus pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,50})" maxlength="50" placeholder="Máx. 50 caracteres" style="text-transform:uppercase" />
                            </div>
                            
                            <label for="id_delegacion" class="col-xs-12 col-md-2 control-label">Delegación:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_delegacion" required class="form-control"> 
                                    <option value="0">Seleccione una Delegacion...</option>
                                    <c:forEach  var="del" items="${requestScope.del}">
                                        <OPTION VALUE="${del.id_delegacion}">${del.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div> 
                        </div>
                        
                        <div class="form-group">
                            <label for="id_modulo" class="col-xs-12 col-md-2 control-label">Modulo:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_modulo" required class="form-control"> 
                                    <option value="0">Seleccione un Modulo...</option>
                                    <c:forEach  var="modu" items="${requestScope.modu}">
                                        <OPTION VALUE="${modu.id_modulo}">${modu.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <label for="condicion_fija" class="col-xs-12 col-md-2 control-label ">Condicion Fija:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="condicion_fija" required class="form-control">
                                    <option value="0">Seleccione una condicion fija...</option>
                                    <option value="false">Inactivo</option>
                                    <option value="true">Activo</option>
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
