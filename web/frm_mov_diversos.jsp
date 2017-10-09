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
                //params.id_movdiversos=$("#id_movdiversos").val();
                
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
                             
                $.post("controladormov_diversos?operacion=nuevoGuardar", params, function(datos){
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
                    Alta Movimiento de Estado de Cuenta de Diversos
                </h4>
            </div>
           
            <input id="id_bendiv" type="hidden" value="${beneficiario.id_bendiv}">
            
            <div class="panel-body transparent">
                <form id="form_MP" onsubmit="return registrar()"  class="form-horizontal">
                    

                    <div class="form-group">
                        <label for="clave_b" class="col-xs-12 col-md-2 control-label ">
                            Clave SEDETUS:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" name="clave_b" class="form-control" id="clave_b" 
                                   required  placeholder="6 caracteres" maxlength="12" value="${beneficiario.clave_b}" readonly/>
                        </div>
                        
                        <label for="id_catprog" class="col-xs-12 col-md-2 control-label">
                            Programa:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <select id="id_catprog" required class="select2  wrap form-control" disabled> 
                                <option value="0">SELECCIONE UNO</option>
                                <c:forEach  var="prog" items="${requestScope.prog}">
                                    
                                    <OPTION value="${prog.id_catprog}" ${prog.id_catprog == beneficiario.id_catprog ? 'selected':''}>[${prog.clave}]${prog.descripcion}</OPTION>
                                </c:forEach>
                            </select> 
                        </div>
                        
                    </div>

                    <div class="form-group">
                        <label for="numcontrato" class="col-xs-12 col-md-2 control-label">
                            Número contrato:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" class="form-control" required
                                id="numcontrato"   placeholder="Máx. 5 caracteres" 
                                maxlength="5" value="${beneficiario.numcontrato}" readonly/>
                        </div>
                        
                        <label for="id_bendiv" class="col-xs-12 col-md-2 control-label" >
                            Beneficiario:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" class="form-control"
                               id="id_bendiv" VALUE="${beneficiario.nombre}" readonly/>
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
                        
                        <label for="descripcion" class="col-xs-12 col-md-2 control-label">
                            Descripcion:
                        </label>
                                
                        <div class="col-xs-12 col-md-4">
                            <input type="text" name="descripcion"   class="form-control" 
                                id="descripcion"  placeholder="Máx. 120 caracteres" maxlength="120" 
                                style="text-transform:uppercase" />
                        </div>
                    </div>
                        
                    <div class="form-group">
                        <label for="fecha_div" class="col-xs-12 col-md-2 control-label">
                            Fecha de Movimiento:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="date" id="fecha_div" class="form-control" 
                                required />
                        </div>

                        <label for="poliza" class="col-xs-12 col-md-2 control-label">
                            Poliza:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" name="poliza"   class="form-control" 
                                id="poliza"  placeholder="Máx. 4 caracteres" maxlength="4" 
                                style="text-transform:uppercase"/>
                        </div>

                    </div>
                        
                        
                        
                    <div class="form-group">
                        <label for="recibo" class="col-xs-12 col-md-2 control-label">
                            Núm. recibo:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input  type="number" name="recibo"class="form-control" required  
                                id="recibo" placeholder="Sólo acepta números" />
                        </div>
                        
                        <label for="serie" class="col-xs-12 col-md-2 control-label">
                            Serie:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" required class="form-control" 
                                id="serie" placeholder="Solo se aceptan 1 caracter" 
                                maxlength="1" style="text-transform:uppercase" />
                        </div>
                    </div>
                        
                    <div class="form-group">    
                        <label for="id_emisor" class="col-xs-12 col-md-2 control-label">
                            Emisor:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <select id="id_emisor" required class="select2  wrap form-control"> 
                                <option value="0">SELECCIONE UNO</option>
                                <c:forEach  var="emisor" items="${requestScope.emisores}">
                                    
                                    <OPTION value="${emisor.id_emisor}" ${emisor.id_emisor == movimiento.id_emisor ? 'selected':''}>${emisor.descripcion}</OPTION>
                                </c:forEach>
                            </select> 
                        </div>
                        
                        <label for="fecha_apli" class="col-xs-12 col-md-2 control-label">
                            Fecha aplicado:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="date" class="form-control" required  
                                id="fecha_apli"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="poliza_apli" class="col-xs-12 col-md-2 control-label">
                            Poliza aplicado:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" name="poliza_apli" class="form-control" 
                                id="poliza_apli" placeholder="Máx. 4 caracteres" 
                                maxlength="4" style="text-transform:uppercase" 
                                />
                        </div>
                        
                        <label for="aplicado" class="col-xs-12 col-md-2 control-label">
                            Aplicado:
                        </label>
                        
                        <div class="col-xs-12 col-md-4">
                            <select id="aplicado" required class="wrap form-control"> 
                                <option value="false" >INACTIVO</OPTION>
                                <option value="true" >ACTIVO</OPTION>
                                
                            </select>   
                        </div>
                    </div>
                                
                    <div class="form-group">
                        <label for="estatus" class="col-xs-12 col-md-2 control-label">
                            Estatus:
                        </label>
                        
                        <div class="col-xs-12 col-md-4">
                            <select id="estatus" required class="wrap form-control"> 
                                <option value="B">BAJA</OPTION>
                                <option value="A">ACTIVO</OPTION>
                                
                            </select>   
                        </div>
                            
                        <label for="cargo" class="col-xs-12 col-md-2 control-label">
                            cargo $:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" id="cargo" 
                                class="form-control" required  
                                placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="0.00"/>
                        </div>
                    </div>            

                    <div class="form-group">
                        <label for="abono" class="col-xs-12 col-md-2 control-label">
                            Abono $:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" id="abono" 
                                class="form-control" required  placeholder="Solo se aceptan dos decimales"
                                maxlength="12" value="0.00" />
                        </div>
                        
                        <label for="seguro" class="col-xs-12 col-md-2 control-label">
                            Seguro $:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" 
                                id="seguro" class="form-control" required 
                                placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="0.00" />
                        </div>
                    </div>

                    <div class="form-group">
                        

                        <label for="otros" class="col-xs-12 col-md-2 control-label">
                            Otros $:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" 
                                id="otros" class="form-control" required  
                                placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="0.00" />
                        </div>
                        
                        <label for="interes" class="col-xs-12 col-md-2 control-label">
                            Interes $:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" 
                                id="interes" class="form-control" required  
                                placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="0.00" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="moratorios" class="col-xs-12 col-md-2 control-label">
                            Moratorios $:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" 
                                id="moratorios" class="form-control" 
                                required  placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="0.00" />
                        </div>

                        <label for="bonificacion" class="col-xs-12 col-md-2 control-label">
                            Bonificacion $:
                        </label>
                        <div class="col-xs-12 col-md-4">
                            <input type="number" step="0.01" 
                                id="bonificacion" class="form-control" 
                                required  placeholder="Solo se aceptan dos decimales" 
                                maxlength="12" value="0.00" />
                        </div>
                    </div>
                        
                    <div class="form-group">
                        <label for="bonific" class="col-xs-12 col-md-2 control-label">
                            Bonificado:
                        </label>
                        
                        <div class="col-xs-12 col-md-4">
                            <select id="bonific" required class="wrap form-control"> 
                                <option value="false" >INACTIVO</OPTION>
                                <option value="true" >ACTIVO</OPTION>
                                
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
