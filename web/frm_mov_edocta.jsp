<%-- 
    Document   : frm_mov_edocta
    Created on : 19/07/2017, 01:33:00 PM
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
            
            $(document).ready(function() {
  
                var $select3 = $('.select2').select2({
                    containerCssClass: "wrap"
                })
            })
            
            function registrar(){
                
                var params=new Object();
                params.id_movedoscta=$("#id_movedoscta").val();
                
                params.id_benef=$("#id_benef").val();
                params.clave_b=$("#clave_b").val();
                params.clave_mov=$("#clave_mov").val();
                params.fecha_mov=$("#fecha_mov").val();
                params.poliza=$("#poliza").val();
                params.fecha_pol=$("#fecha_pol").val();
                params.capital=$("#capital").val();
                params.admon=$("#admon").val();
                params.seguro=$("#seguro").val();
                params.o_seguro=$("#o_seguro").val();
                params.comisiones=$("#comisiones").val();
                params.tit=$("#tit").val();
                params.interes=$("#interes").val();
                params.moratorios=$("#moratorios").val();
                params.recibo=$("#recibo").val();
                params.estatus=$("#estatus").val();
                //var x=$("#estatus").val();
                //alert('estatus '+x);
                //alert('hasta aqui no hay problem');
                
                if(params.id_benef == 0){
                    alert("Seleccione un beneficiario");
                    return false;
                }
                                
                $.post("controladormov_edocta?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
                                    
            function listar(){
                               
                $.post("controladormov_edocta?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-money" style="color: #fff"></span> Nuevo Movimiento de Estado de Cuenta de Programos</h4></div>
                <div class="panel-body transparent">
                    <form id="form_MP" onsubmit="return registrar()"  class="form-horizontal">
                                               
                        <div class="form-group">
                            <label for="id_benef" class="col-xs-12 col-md-2 control-label  ">Beneficiario:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_benef" required class="select2  wrap form-control" > 
                                    <option value="0">SELECCIONE UNO</option>
                                    <c:forEach  var="benef" items="${requestScope.beneficiarios}">
                                        <OPTION VALUE="${benef.id_beneficiario}" >[${benef.clave_b}] ${benef.nombre}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <label for="clave_b" class="col-xs-12 col-md-2 control-label ">Clave SEDUVI:</label>
                            <div class="col-xs-12 col-md-4">
                                
                                <input type="text" name="clave_b" class="form-control" id="clave_b" required  placeholder="6 caracteres" maxlength="12"  readonly="" />
                            </div>
                            
                        </div>
                        
                        <div class="form-group">
                            <label for="clave_mov" class="col-xs-12 col-md-2 control-label">Clave Movimiento:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="clave_mov" required class="select2  wrap form-control" > 
                                    <c:forEach  var="clavemov" items="${requestScope.clavemovs}">
                                        <OPTION VALUE="${clavemov.clave_mov}" >[${clavemov.clave_mov}] ${clavemov.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                            <label for="fecha_mov" class="col-xs-12 col-md-2 control-label">Fecha de Movimiento:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" id="fecha_mov" class="form-control" required   />

                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="poliza" class="col-xs-12 col-md-2 control-label">Poliza:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="poliza"   class="form-control" id="poliza"  placeholder="Máx. 6 caracteres" maxlength="3" style="text-transform:uppercase" />
                            </div>
                            
                            <label for="capital" class="col-xs-12 col-md-2 control-label">Capital:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="capital" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12"  />
                            </div>
                        </div>
                                                       
                        <div class="form-group">
                                                        
                            <label for="admon" class="col-xs-12 col-md-2 control-label">Admon:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="admon" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12"  />
                            </div>
                            
                            <label for="seguro" class="col-xs-12 col-md-2 control-label">Seguro:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="seguro" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12"  />
                            </div>
                        </div>
                            
                        <div class="form-group">
                                                       
                            <label for="o_seguro" class="col-xs-12 col-md-2 control-label">Otro seguro:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="o_seguro" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" />
                            </div>
                            
                            <label for="comisiones" class="col-xs-12 col-md-2 control-label">Comisiones:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="comisiones" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                                                        
                            <label for="tit" class="col-xs-12 col-md-2 control-label">Titulación:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="tit" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12"  />
                            </div>
                            <label for="interes" class="col-xs-12 col-md-2 control-label">Interes:</label>
                            
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="interes" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12"  />
                            </div>
                        </div>
                            
                        <div class="form-group">
                                                        
                            <label for="moratorios" class="col-xs-12 col-md-2 control-label">Moratorios:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="moratorios" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" />
                            </div>
                            
                            <label for="recibo" class="col-xs-12 col-md-2 control-label">Recibo:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="recibo"   class="form-control" id="recibo"  placeholder="Máx. 6 digitos"  pattern="(^[0-9]{1,6}$)"  />
                            </div>
                        </div>
                        
                        <div class="form-group">
                                                       
                            <label for="id_catprog" class="col-xs-12 col-md-2 control-label">Programa:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_catprog" required class="select2  wrap form-control"> 
                                    <c:forEach  var="prog" items="${requestScope.progs}">
                                        <OPTION VALUE="${prog.id_catprog}" > ${prog.descripcion}</OPTION>
                                    </c:forEach>
                                    
                                </select>
                            </div>
                            
                            <label for="numcontrato" class="col-xs-12 col-md-2 control-label ">Número Contrato:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="numcontrato" class="form-control" id="numcontrato" required pattern="(^[0-9]{5}$)" placeholder="5 caracteres" maxlength="5"  />
                                
                            </div>
                        </div>
                        <div class="form-group">
                                                       
                            <label for="estatus" class="col-xs-12 col-md-2 control-label">Estatus:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="estatus" required class="select2  wrap form-control"> 
                                    <option value="0">SELECCIONE UNO</option>
                                    <OPTION VALUE="A" >Activo</OPTION>
                                    <OPTION VALUE="B" >Baja</OPTION>
                                    
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
