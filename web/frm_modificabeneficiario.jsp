<%-- 
    Document   : frm_modificabeneficiario
    Created on : 12/07/2017, 01:33:00 PM
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
                params.id_beneficiario=$("#id_beneficiario").val();
                params.id_catprog=$("#id_catprog").val();
                params.numcontrato=$("#numcontrato").val();
                params.clave_elect=$("#clave_elect").val();
                params.curp=$("#curp").val();
                params.rfc=$("#rfc").val();
                params.nombre=$("#nombre").val();
                params.conyuge=$("#conyuge").val();
                params.fecha_con=$("#fecha_con").val();
                params.mza=$("#mza").val();
                params.lte=$("#lte").val();
                params.area=$("#area").val();
                params.domicilio=$("#domicilio").val();
                params.clave_cat=$("#clave_cat").val();
                params.id_tipocredito=$("#id_tipocredito").val();
                params.fecha_ip=$("#fecha_ip").val();
                params.capital=$("#capital").val();
                params.sub_inic=$("#sub_inic").val();
                params.enganche=$("#enganche").val();
                params.pagant=$("#pagant").val();
                params.admon=$("#admon").val();
                params.comision=$("#comision").val();
                params.interes=$("#interes").val();
                params.seguro=$("#seguro").val();
                if(params.id_catprog == 0){
                    alert("Seleccione un programa");
                    return false;
                }
                
                if(params.id_tipocredito == 0){
                    alert("Seleccione un tipo de crédito");
                    return false;
                }
                                
                $.post("controladorbeneficiario?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
                        
            function listar(){
                               
                $.post("controladorbeneficiario?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-address-book" style="color: #fff;padding: 5px"></span> Modificar Beneficiario (Parámetros para la apertura del Edo. Cuenta)</h4></div>
                <div class="panel-body transparent">
                    <form id="form_CA" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_beneficiario" id="id_beneficiario" value="${benef.id_beneficiario}" />
                        
                        <div class="form-group">
                            <label for="id_catprog" class="col-xs-12 col-md-2 control-label  ">Programa:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_catprog" required class="form-control"> 
                                    <option value="0">SELECCIONE UNO</option>
                                    <c:forEach  var="prog" items="${requestScope.prog}">
                                        <OPTION VALUE="${prog.id_catprog}" ${prog.id_catprog == benef.id_catprog ? 'selected':''}>${prog.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                                                    
                            <label for="numcontrato" class="col-xs-12 col-md-2 control-label ">Num. Contrato:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="numcontrato" class="form-control" id="numcontrato" required pattern="(^[0-9]{5}$)" placeholder="5 caracteres" maxlength="5" value="${benef.numcontrato}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="clave_elect" class="col-xs-12 col-md-2 control-label">Clave Elector:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_elect"   class="form-control" id="clave_elect"  placeholder="Máx.18 caracteres" maxlength="18" style="text-transform:uppercase" value="${benef.clave_elect}"/>
                            </div>
                            
                            <label for="curp" class="col-xs-12 col-md-2 control-label">Curp::</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="curp" class="form-control" id="curp" pattern="(^[A-Z]{1}[AEIOU]{1}[A-Z]{2}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])[HM]{1}(AS|BC|BS|CC|CS|CH|CL|CM|DF|DG|GT|GR|HG|JC|MC|MN|MS|NT|NL|OC|PL|QT|QR|SP|SL|SR|TC|TS|TL|VZ|YN|ZS|NE)[B-DF-HJ-NP-TV-Z]{3}[0-9A-Z]{1}[0-9]{1}$)" placeholder="Máx.24 caracteres" maxlength="24" style="text-transform:uppercase" value="${benef.curp}" />

                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="rfc" class="col-xs-12 col-md-2 control-label">RFC:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="rfc" class="form-control" id="rfc"  pattern="(^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$)"  placeholder="Máx.13 caracteres" maxlength="13" style="text-transform:uppercase" value="${benef.rfc}"/>
                            </div>
                            
                            <label for="nombre" class="col-xs-12 col-md-2 control-label">Nombre:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="nombre" class="form-control" id="nombre"  placeholder="Máx.50 caracteres" maxlength="50" style="text-transform:uppercase" value="${benef.nombre}" />

                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="conyuge" class="col-xs-12 col-md-2 control-label">Conyuge:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="conyuge" class="form-control" id="conyuge"  placeholder="Máx.50 caracteres" maxlength="3" style="text-transform:uppercase" value="${benef.conyuge}"/>
                            </div>
                            
                            <label for="fecha_con" class="col-xs-12 col-md-2 control-label">Fecha de Contrato:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" id="fecha_con" class="form-control" required  value="${benef.fecha_con}" />

                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="mza" class="col-xs-12 col-md-2 control-label">Manzana:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="mza" class="form-control" id="mza" pattern="(^[0-9]{3}$)" placeholder="Máx. 3 caracteres" maxlength="13" style="text-transform:uppercase" value="${benef.mza}"/>
                            </div>
                            
                            <label for="lte" class="col-xs-12 col-md-2 control-label">Lote:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="lte" class="form-control" id="lte" pattern="(^[0-9a-zA-Z]{3,6}$)"  placeholder="Máx. 6 caracteres" maxlength="6" style="text-transform:uppercase" value="${benef.lte}" />

                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="area" class="col-xs-12 col-md-2 control-label">Area:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="area" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${benef.area}" />
                            </div>
                            
                            <label for="domicilio" class="col-xs-12 col-md-2 control-label">Domicilio:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="domicilio" class="form-control" id="domicilio"  placeholder="Máx.50 caracteres" maxlength="50" style="text-transform:uppercase" value="${benef.domicilio}" />

                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="clave_cat" class="col-xs-12 col-md-2 control-label">Clave Catastral:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_cat" class="form-control" id="clave_cat"  placeholder="Máx.20 caracteres" maxlength="20" style="text-transform:uppercase" value="${benef.clave_cat}" />
                            </div>
                            <label for="id_tipocredito" class="col-xs-12 col-md-2 control-label  ">Tipo de Crédito:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_tipocredito" required class="form-control"> 
                                    <option value="0">SELECCIONE UNO</option>
                                    <c:forEach  var="tipo" items="${requestScope.tipo}">
                                        <OPTION VALUE="${tipo.id_tipocredito}" ${tipo.id_tipocredito == benef.id_tipocredito ? 'selected':''}>${tipo.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                            
                        </div>
                            
                         <div class="form-group">
                                                       
                            <label for="fecha_con" class="col-xs-12 col-md-2 control-label">Fecha Inicio de Pago:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" id="fecha_ip" class="form-control" required  value="${benef.fecha_ip}" />

                            </div>
                                
                            <label for="capital" class="col-xs-12 col-md-2 control-label">Capital:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="capital" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${benef.capital}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                                                          
                            <label for="sub_inic" class="col-xs-12 col-md-2 control-label">Subsidio Inicial:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="sub_inic" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${benef.sub_inic}" />
                            </div>
                            
                            <label for="enganche" class="col-xs-12 col-md-2 control-label">Enganche:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="enganche" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${benef.enganche}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                                                          
                            <label for="pagant" class="col-xs-12 col-md-2 control-label">Pagos Anticipados:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="pagant" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${benef.pagant}" />
                            </div>
                            
                            <label for="admon" class="col-xs-12 col-md-2 control-label">Admon:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="admon" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${benef.admon}" />
                            </div>
                        </div>
                            
                        <div class="form-group">
                                                          
                            <label for="comision" class="col-xs-12 col-md-2 control-label">Comisión:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="comision" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${benef.comision}" />
                            </div>
                            
                            <label for="interes" class="col-xs-12 col-md-2 control-label">Interes:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="interes" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${benef.interes}" />
                            </div>
                            
                        </div>
                        
                        <div class="form-group">
                                                          
                            <label for="seguro" class="col-xs-12 col-md-2 control-label">Seguro Vida:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="seguro" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${benef.seguro}" />
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
