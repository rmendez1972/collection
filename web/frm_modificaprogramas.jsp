<%-- 
    Document   : frm_modificaprogramas
    Created on : 20/06/2017, 04:25:22 PM
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
                params.id_catprog=$("#id_catprog").val();
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
                params.id_usuario=$("#id_usuario").val();
 
                                                          
                $.post("controladorprogramas?operacion=editarGuardar", params, function(datos){
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
            <div class="panel-heading"><h4><span class="fa fa-folder" style="color: #fff; padding: 5px"></span> Modifica Programas</h4></div>
                <div class="panel-body transparent">
                    <form id="form_CL" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_catprog" id="id_catprog" value="${prog.id_catprog}" />
                        <div class="form-group">
                            <label for="clave" class="col-xs-12 col-md-2 control-label ">Clave:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave" class="form-control" id="clave" required autofocus pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,6})" maxlength="6" placeholder="Máx. 6 caracteres" style="text-transform:uppercase" value="${prog.clave}" />
                            </div>
                            
                            <label for="descripcion" class="col-xs-12 col-md-2 control-label ">Descripción:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="descripcion" class="form-control" id="descripcion" required autofocus pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,80})" maxlength="80" placeholder="Mín.4 Máx. 80 caracteres" style="text-transform:uppercase" value="${prog.descripcion}" />
                            </div>

                        </div>
                                      
                        <div class="form-group">
                            <label for="sub_ini" class="col-xs-12 col-md-2 control-label ">Sub ini:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="sub_ini" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.sub_ini}" />
                            </div>
                            
                            <label for="eng_fon" class="col-xs-12 col-md-2 control-label ">Eng fon:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="eng_fon" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.eng_fon}" />
                            </div>

                        </div>
                        
                        <div class="form-group">
                            <label for="eng_inv" class="col-xs-12 col-md-2 control-label ">Eng inv:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="eng_inv" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.eng_inv}" />
                            </div>
                            
                            <label for="interes" class="col-xs-12 col-md-2 control-label ">Interes:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="interes" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.interes}" />
                            </div>

                        </div>
                        
                        <div class="form-group">
                            <label for="admon" class="col-xs-12 col-md-2 control-label ">Admon:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="admon" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.admon}" />
                            </div>
                            
                            <label for="seguro" class="col-xs-12 col-md-2 control-label ">Seguro:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="seguro" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.seguro}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="costo_m2" class="col-xs-12 col-md-2 control-label ">Costo m2:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="costo_m2" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.costo_m2}" />
                            </div>
                            
                            <label for="por_sub" class="col-xs-12 col-md-2 control-label ">Por sub:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_sub" required  placeholder="Sólo se aceptan dos decimales" maxlength="12" value="${prog.por_sub}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="por_admon" class="col-xs-12 col-md-2 control-label ">Por admon:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_admon" required  placeholder="Sólo se aceptan dos decimales" maxlength="12" value="${prog.por_admon}" />
                            </div>
                            
                            <label for="por_sv" class="col-xs-12 col-md-2 control-label ">Por sv:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_sv" required  placeholder="Sólo se aceptan dos decimales" maxlength="12" value="${prog.por_sub}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="por_os" class="col-xs-12 col-md-2 control-label ">Por os:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_os" required  placeholder="Sólo se aceptan dos decimales" maxlength="12" value="${prog.por_os}" />
                            </div>
                            
                            <label for="sal_min" class="col-xs-12 col-md-2 control-label ">Sal min:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="sal_min" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.sal_min}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="pago_mes" class="col-xs-12 col-md-2 control-label ">Pago mes:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="pago_mes" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.pago_mes}" />
                            </div>
                            
                            <label for="por_eng" class="col-xs-12 col-md-2 control-label ">Por eng:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_eng" required  placeholder="Sólo se aceptan dos decimales" maxlength="12" value="${prog.por_eng}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="anual" class="col-xs-12 col-md-2 control-label ">Anual:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="anual" required  placeholder="Sólo se aceptan dos decimales" maxlength="12" value="${prog.anual}" />
                            </div>
                            
                            <label for="plazo" class="col-xs-12 col-md-2 control-label ">Plazo:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" class="form-control" id="plazo" required  placeholder="Sólo se aceptan enteros" maxlength="12" value="${prog.plazo}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="por_cap" class="col-xs-12 col-md-2 control-label ">Por cap:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_cap" required  placeholder="Sólo se aceptan dos decimales" maxlength="12" value="${prog.por_cap}" />
                            </div>
                            
                            <label for="status" class="col-xs-12 col-md-2 control-label ">Status:</label>
                            <div class="col-xs-12 col-md-4" id="divstatus">
                                <script>
                                    
                                    if(${prog.status} == 0){
                
                                        var newS = $("<select>");
                                        newS.append('<option value="false" selected >'+'Inactivo'+'</option>');
                                        newS.append('<option value="true" >'+'Activo'+'</option>');
                                        newS.addClass("form-control");
                                        newS.attr("id", "status");
                                        $("#divstatus").append(newS);   
                                    }else{
                
                                        var newS = $("<select>");
                                        newS.append('<option value="false" >'+'Inactivo'+'</option>');
                                        newS.append('<option value="true" selected >'+'Activo'+'</option>');
                                        newS.addClass("form-control");
                                        newS.attr("id", "status");
                                        $("#divstatus").append(newS);
                                    }
                                    
                                </script>
                            </div>   
                        </div>
                        
                        <div class="form-group">
                            <label for="mecanica" class="col-xs-12 col-md-2 control-label ">Mecánica:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" class="form-control" id="mecanica" required  placeholder="Sólo se aceptan enteros" maxlength="12" value="${prog.mecanica}" />
                            </div>
                            
                            <label for="id_tipocred" class="col-xs-12 col-md-2 control-label ">Tipo de Credito:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_tipocred" required class="form-control"> 
                                    <option value="0">Seleccione un Credito...</option>
                                    <c:forEach  var="tc" items="${requestScope.tc}">
                                         <OPTION VALUE="${tc.id_tipocredito}" ${tc.id_tipocredito == prog.id_tipocred ? 'selected':''} >${tc.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>   
                        </div>
                        
                        <div class="form-group">
                            <label for="mensual" class="col-xs-12 col-md-2 control-label ">Mensual:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="mensual" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.mensual}" />
                            </div>
                            
                            <label for="sub_bp" class="col-xs-12 col-md-2 control-label ">Sub bp:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="sub_bp" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.sub_bp}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="apor_fij" class="col-xs-12 col-md-2 control-label ">Aporte Fijo:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="apor_fij" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.apor_fij}" />
                            </div>
                            
                            <label for="por_pm" class="col-xs-12 col-md-2 control-label ">Por pm:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="por_pm" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.por_pm}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="por_pf" class="col-xs-12 col-md-2 control-label ">Por pf:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="por_pf" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${prog.por_pf}" />
                            </div>
                            
                            <label for="clave_ant" class="col-xs-12 col-md-2 control-label ">Clave_ant:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_ant" class="form-control" id="clave_ant" required autofocus pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,6})" maxlength="6" placeholder="Máx. 6 caracteres" style="text-transform:uppercase" value="${prog.clave_ant}" />
                            </div>
                        </div>
                        
                        <div class="form-group">                   
                            <label for="id_colonia" class="col-xs-12 col-md-2 control-label ">Colonia:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_colonia" required class="form-control"> 
                                    <option value="0">Seleccione una Colonia...</option>
                                    <c:forEach  var="col" items="${requestScope.col}">
                                        <OPTION VALUE="${col.id_colonia}" ${col.id_colonia == prog.id_colonia ? 'selected':''} >${col.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <label for="dias_graia" class="col-xs-12 col-md-2 control-label ">Dias gracia:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" class="form-control" id="dias_gracia" required  placeholder="Sólo se aceptan enteros" maxlength="12" value="${prog.dias_gracia}" />
                            </div>
                        </div>
                        
                        <div class="form-group">                        
                            <label for="mora" class="col-xs-12 col-md-2 control-label ">Mora:</label>
                            <div class="col-xs-12 col-md-4" id="divmora">
                                <script>
                                    
                                    if(${prog.mora} == 0){
                
                                        var newM = $("<select>");
                                        newM.append('<option value="false" selected >'+'Inactivo'+'</option>');
                                        newM.append('<option value="true" >'+'Activo'+'</option>');
                                        newM.addClass("form-control");
                                        newM.attr("id", "mora");
                                        $("#divmora").append(newM);   
                                    }else{
                
                                        var newM = $("<select>");
                                        newM.append('<option value="false" >'+'Inactivo'+'</option>');
                                        newM.append('<option value="true" selected >'+'Activo'+'</option>');
                                        newM.addClass("form-control");
                                        newM.attr("id", "mora");
                                        $("#divmora").append(newM);
                                    }
                                    
                                </script>
                            </div>
                            
                            <label for="por_ga" class="col-xs-12 col-md-2 control-label ">Por ga:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" class="form-control" id="por_ga" required  placeholder="Sólo se aceptan dos decimales" maxlength="12" value="${prog.por_ga}" />
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                            <label for="cuenta_cont" class="col-xs-12 col-md-2 control-label ">Cuenta cont:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="cuenta_cont" class="form-control" id="cuenta_cont" required autofocus pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,50})" maxlength="50" placeholder="Máx. 50 caracteres" style="text-transform:uppercase" value="${prog.cuenta_cont}" />
                            </div>
                            
                            <label for="id_delegacion" class="col-xs-12 col-md-2 control-label">Delegación:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_delegacion" required class="form-control"> 
                                    <option value="0">Seleccione una Delegacion...</option>
                                    <c:forEach  var="del" items="${requestScope.del}">
                                        <OPTION VALUE="${del.id_delegacion}" ${del.id_delegacion == prog.id_delegacion ? 'selected':''} >${del.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div> 
                        </div>
                        
                        <div>
                            <label for="id_modulo" class="col-xs-12 col-md-2 control-label">Modulo:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_modulo" required class="form-control"> 
                                    <option value="0">Seleccione un Modulo...</option>
                                    <c:forEach  var="modu" items="${requestScope.modu}">
                                        <OPTION VALUE="${modu.id_modulo}" ${modu.id_modulo == prog.id_modulo? 'selected':''} >${modu.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <label for="condicion_fija" class="col-xs-12 col-md-2 control-label ">Condicion Fija:</label>
                            <div class="col-xs-12 col-md-4" id="condicion">
                                <script>
                                    
                                    if(${prog.condicion_fija} == 0){
                
                                        var newP = $("<select>");
                                        newP.append('<option value="false" selected >'+'Inactivo'+'</option>');
                                        newP.append('<option value="true" >'+'Activo'+'</option>');
                                        newP.addClass("form-control");
                                        newP.attr("id", "condicion_fija");
                                        $("#condicion").append(newP);   
                                    }else{
                
                                        var newP = $("<select>");
                                        newP.append('<option value="false" >'+'Inactivo'+'</option>');
                                        newP.append('<option value="true" selected >'+'Activo'+'</option>');
                                        newP.addClass("form-control");
                                        newP.attr("id", "condicion_fija");
                                        $("#condicion").append(newP);
                                    }
                                    
                                </script>
                            </div>
                            
                            <input type="hidden" name="id_usuario" id="id_usuario" value="1" />
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
