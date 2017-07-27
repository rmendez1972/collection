<%-- 
    Document   : frm_modifica_mov_edocta
    Created on : 24/07/2017, 01:33:00 PM
    Author     : Ismael garcia
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
               
        <title>JSP Page</title>
        <script>
            
            $(document).ready(function() {
  
                var $select3 = $('.select2').select2({
                    containerCssClass: "wrap"
                })
            })
            
            function registrar(){
                
                var params=new Object();
                params.id_movdiversos=$("#id_movdiversos").val();
                
                params.id_bendiv=$("#id_bendiv").val();
                params.clave_div=$("#clave_div").val();
                params.fecha_div=$("#fecha_div").val();
                params.poliza=$("#poliza").val();
                params.recibo=$("#recibo").val();
                params.cargo=$("#cargo").val();
                params.abono=$("#abono").val();
                params.moratorios=$("#moratorios").val();
                params.otros=$("#otros").val();
                params.fecha_pol=$("#fecha_pol").val();
                params.estatus=$("#estatus").val();
                params.id_usuario=$("#id_usuario").val();
                params.aplicado=$("#aplicado").val();
                params.descripcion=$("#descripcion").val();
                params.id_catprog=$("#id_catprog").val();
                params.bonificacion=$("#bonificacion").val();
                params.serie=$("#serie").val();
                params.poliza_apli=$("#poliza_apli").val();
                params.fecha_apli=$("#fecha_apli").val();
                params.interes=$("#interes").val();
                params.seguro=$("#seguro").val();
                params.id_emisor=$("#id_emisor").val();
                params.clave_b=$("#clave_b").val();
                params.numcontrato=$("#numcontrato").val();
                params.bonific=$("#bonific").val();
                params.id_caja=$("#id_caja").val();
                
                
                
                if(params.id_bendiv == 0){
                    alert("Seleccione un beneficiario");
                    return false;
                }
                             
                $.post("controladormov_diversos?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
                                    
            function listar(){
                               
                $.post("controladormov_diversos?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading">
                <h4><span class="fa fa-folder" style="color: #fff"></span>
                    Modificar Movimiento de Estado de Cuenta de Diversos
                </h4>
            </div>
            <div class="panel-body transparent">
                <form id="form_MP" onsubmit="return registrar()"  class="form-horizontal">
                    <input type="hidden" name="id_movdiversos" id="id_movdiversos" value="${movimiento.id_movdiversos}" />

                    <div class="form-group">
                        <label for="id_bendiv" class="col-xs-12 col-md-2 control-label  ">Beneficiario:</label>
                        <div class="col-xs-12 col-md-4">
                            <select id="id_bendiv" required class="select2  wrap form-control"> 
                                <option value="0">SELECCIONE UNO</option>
                                <c:forEach  var="bendiv" items="${requestScope.beneficiarios}">
                                    <OPTION VALUE="${bendiv.id_bendiv}" ${bendiv.id_bendiv == movimiento.id_bendiv ? 'selected':''}>${bendiv.nombre}</OPTION>
                                </c:forEach>
                            </select>
                        </div>

                        <label for="clave_b" class="col-xs-12 col-md-2 control-label ">Clave SEDUVI:</label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" name="clave_b" class="form-control" id="clave_b" required  placeholder="6 caracteres" maxlength="12" value="${movimiento.clave_b}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="clave_div" class="col-xs-12 col-md-2 control-label">
                            Clave Movimiento:
                        </label>
                        
                        <div class="col-xs-12 col-md-4">
                            <select id="clave_div" required class="select2  wrap form-control"> 
                                <option value="0">SELECCIONE UNO</option>
                                <c:forEach  var="cdiv" items="${requestScope.clavediv}">
                                    
                                    <OPTION VALUE="${cdiv.clave_div}" ${cdiv.clave_div == movimiento.clave_div ? 'selected':''}>[${cdiv.clave_div}]${cdiv.descripcion}</OPTION>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <!--<div class="col-xs-12 col-md-4">
                            <input type="text" name="clave_div" class="form-control" 
                                id="clave_div"  placeholder="Máx. 3 caracteres" maxlength="3" 
                                style="text-transform:uppercase" value="${movimiento.clave_div}"/>
                        </div>-->

                        <label for="fecha_div" class="col-xs-12 col-md-2 control-label">
                            Fecha de Movimiento:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="date" id="fecha_div" class="form-control" 
                                required  value="${movimiento.fecha_div}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="poliza" class="col-xs-12 col-md-2 control-label">
                            Poliza:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" name="poliza"   class="form-control" 
                                id="poliza"  placeholder="Máx. 6 caracteres" maxlength="6" 
                                style="text-transform:uppercase" value="${movimiento.poliza}"/>
                        </div>

                        <label for="fecha_pol" class="col-xs-12 col-md-2 control-label">
                            Fecha de Poliza:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="date" id="fecha_pol" class="form-control" 
                                required  value="${movimiento.fecha_pol}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cargo" class="col-xs-12 col-md-2 control-label">
                            cargo:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" id="cargo" 
                                class="form-control" required  
                                placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="${movimiento.cargo}"/>
                        </div>

                        <label for="abono" class="col-xs-12 col-md-2 control-label">
                            Abono:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" id="abono" 
                                class="form-control" required  placeholder="Solo se aceptan dos decimales"
                                maxlength="12" value="${movimiento.abono}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="seguro" class="col-xs-12 col-md-2 control-label">
                            Seguro:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" 
                                id="seguro" class="form-control" required 
                                placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="${movimiento.seguro}" />
                        </div>

                        <label for="otros" class="col-xs-12 col-md-2 control-label">
                            Otros:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" 
                                id="otros" class="form-control" required  
                                placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="${movimiento.otros}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="moratorios" class="col-xs-12 col-md-2 control-label">
                            Moratorios:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" 
                                id="moratorios" class="form-control" 
                                required  placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="${movimiento.moratorios}" />
                        </div>

                        <label for="bonificacion" class="col-xs-12 col-md-2 control-label">
                            Bonificacion:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" 
                                id="bonificacion" class="form-control" 
                                required  placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="${movimiento.bonificacion}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="interes" class="col-xs-12 col-md-2 control-label">
                            Interes:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" 
                                id="interes" class="form-control" required  
                                placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="${movimiento.interes}" />
                        </div>
                        
                        <label for="estatus" class="col-xs-12 col-md-2 control-label">
                            Estatus:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" name="estatus"   class="form-control" 
                                id="estatus"  placeholder="Máx. 1 caracteres" 
                                maxlength="1" style="text-transform:uppercase" value="${movimiento.estatus}"/>
                        </div>
                   </div>
                        
                    <div class="form-group">
                        <label for="aplicado" class="col-xs-12 col-md-2 control-label">
                            Aplicado:
                        </label>
                        <div class="col-xs-12 col-md-4" id="divaplicado">
                            
                            <script>
                                    
                                    if(${movimiento.aplicado} == 0){
                
                                        var newS = $("<select>");
                                        newS.append('<option value="false" selected >'+'Inactivo'+'</option>');
                                        newS.append('<option value="true" >'+'Activo'+'</option>');
                                        newS.addClass("form-control");
                                        newS.attr("id", "aplicado");
                                        $("#divaplicado").append(newS);   
                                    }else{
                
                                        var newS = $("<select>");
                                        newS.append('<option value="false" >'+'Inactivo'+'</option>');
                                        newS.append('<option value="true" selected >'+'Activo'+'</option>');
                                        newS.addClass("form-control");
                                        newS.attr("id", "aplicado");
                                        $("#divaplicado").append(newS);
                                    }
                                    
                                </script>
                            
                            
                            <!--<input type="number" class="form-control"
                                id="aplicado"  required  placeholder="Solo se aceptan 0 y 1" 
                                class="form-control" maxlength="1" value="${movimiento.aplicado}" />-->
                        </div>
                        
                        <label for="descripcion" class="col-xs-12 col-md-2 control-label">
                            Descripcion:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" name="descripcion"   class="form-control" 
                                id="descripcion"  placeholder="Máx. 120 caracteres" maxlength="120" 
                                style="text-transform:uppercase" value="${movimiento.descripcion}"/>
                        </div>
                   </div>
                        
                    <div class="form-group">
                        <label for="serie" class="col-xs-12 col-md-2 control-label">
                            Serie:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" required class="form-control" 
                                id="serie" placeholder="Solo se aceptan 1 caracter" 
                                maxlength="1" value="${movimiento.serie}" />
                        </div>
                        
                        <label for="id_emisor" class="col-xs-12 col-md-2 control-label">
                            Emisor:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" class="form-control" name="id_emisor"    
                                id="id_emisor"  placeholder="Números positivos" 
                                value="${movimiento.id_emisor}"/>
                        </div>
                   </div>
                        
                    <div class="form-group">
                        <label for="poliza_apli" class="col-xs-12 col-md-2 control-label">
                            Poliza apli:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" name="poliza_apli" class="form-control" 
                                id="poliza_apli" placeholder="Máx. 6 caracteres" 
                                maxlength="6" style="text-transform:uppercase" 
                                value="${movimiento.poliza_apli}"/>
                        </div>

                        <label for="fecha_apli" class="col-xs-12 col-md-2 control-label">
                            Fecha apli.:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="date" class="form-control" required  
                                id="fecha_apli" value="${movimiento.fecha_apli}"/>
                        </div>
                    </div>
                            
                    <div class="form-group">
                        <label for="numcontrato" class="col-xs-12 col-md-2 control-label">
                            Número contrato:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" class="form-control" required
                                id="numcontrato"   placeholder="Máx. 5 caracteres" 
                                maxlength="5" value="${movimiento.numcontrato}" />
                        </div>
                        
                        <label for="id_caja" class="col-xs-12 col-md-2 control-label">
                            Caja:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" name="id_caja"  class="form-control" 
                                id="id_caja" value="${movimiento.id_caja}"/>
                        </div>
                   </div>        
                    
                    <div class="form-group">
                        <label for="id_catprog" class="col-xs-12 col-md-2 control-label">
                            Programa:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" class="form-control"
                                id="id_catprog" placeholder="Solo acepta números" 
                                value="${movimiento.id_catprog}" />
                        </div>
                        
                        <label for="bonific" class="col-xs-12 col-md-2 control-label">
                            Bonificado:</label>
                        <div class="col-xs-12 col-md-4" id="divbonific">
                            
                        <script>
                                    
                                    if(${movimiento.bonific} == 0){
                
                                        var newS = $("<select>");
                                        newS.append('<option value="false" selected >'+'Inactivo'+'</option>');
                                        newS.append('<option value="true" >'+'Activo'+'</option>');
                                        newS.addClass("form-control");
                                        newS.attr("id", "bonific");
                                        $("#divbonific").append(newS);   
                                    }else{
                
                                        var newS = $("<select>");
                                        newS.append('<option value="false" >'+'Inactivo'+'</option>');
                                        newS.append('<option value="true" selected >'+'Activo'+'</option>');
                                        newS.addClass("form-control");
                                        newS.attr("id", "bonific");
                                        $("#divbonific").append(newS);
                                    }
                                    
                                </script>    
                            
                            <!--<input type="number" name="bonific" class="form-control" 
                                id="bonific" placeholder="Solo acepta números" 
                                value="${movimiento.bonific}"/>-->
                        </div>
                   </div> 
                        
                        
                    <div class="form-group">
                        <label for="recibo" class="col-xs-12 col-md-2 control-label">
                            Núm. recibo:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input  type="number" name="recibo"class="form-control" required  
                                id="recibo" placeholder="Sólo acepta números" value="${movimiento.recibo}" />
                        </div>
                        
                        <label for="id_usuario" class="col-xs-12 col-md-2 control-label">
                            Usuario:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="hidden" name="id_usuario"   class="form-control" 
                                id="id_usuario" value="${movimiento.id_usuario}"/>
                            <input type="text" name="nombreusuario"   class="form-control" 
                                id="nombreusuario" value="${movimiento.nombreusuario}" readonly/>
                           
                            
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
