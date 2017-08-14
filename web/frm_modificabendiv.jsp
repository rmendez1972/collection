<%-- 
    Document   : frm_modificabendiv
    Created on : 16/06/2017, 01:33:00 PM
    Author     : Ismael García
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
                params.clave_elect= $("#clave_elect").val();
                params.curp=        $("#curp").val();
                params.clave_b=     $("#clave_b").val();
                params.nombre=      $("#nombre").val();
                params.fecha_con=   $("#fecha_con").val();
                params.capital=     $("#capital").val();
                params.sub_inic=    $("#sub_inic").val();
                params.enganche=    $("#enganche").val();
                params.interes=     $("#interes").val();
                params.admon=       $("#admon").val();
                params.seguro=      $("#seguro").val();
                params.o_seg=       $("#o_seg").val();
                params.plazo=       $("#plazo").val();
                params.pago_mes=    $("#pago_mes").val();
                params.sal_con=     $("#sal_con").val();
                params.juridico=    $("#juridico").val();
                params.referencia_jur=  $("#referencia_jur").val();
                params.fecha_jur=   $("#fecha_jur").val();
                params.id_catprog=  $("#id_catprog").val();
                params.mza=         $("#mza").val();
                params.lte=         $("#lte").val();
                params.conyuge=     $("#conyuge").val();
                params.fecha=       $("#fecha").val();
                params.aperturado=  $("#aperturado").val();
                params.numcontrato= $("#numcontrato").val();
                params.id_bendiv=   $("#id_bendiv").val();
                                
                if(params.id_catprog == 0){
                    alert("Seleccione un programa");
                    return false;
                }
               
                $.post("controladorbendiv?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            
            function listar(){
                               
                $.post("controladorbendiv?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
             
        </script>
    </head>
    <body>
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading">
                <h3 style="font-family:Conv_roundedelegance;margin:0px;padding:0px;text-align: center;">
                    <span class="fa fa-id-badge" style="color: #fff; padding: 5px"></span>
                    Modifica Beneficiarios Diversos
                </h3>
            </div>
                <div class="panel-body transparent">
                    <form id="form_bendiv" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_bendiv" id="id_bendiv" value="${bendiv.id_bendiv}" />
            
                        <div class="form-group">
                            <label for="id_catprog" class="col-xs-12 col-md-2 control-label">
                                Programa:
                            </label>                            
                            <div class="col-xs-12 col-md-4">
                                <select id="id_catprog" required class="form-control" disabled> 
                                    <option value="0">Seleccione un programa...</option>
                                    <c:forEach  var="programa" items="${requestScope.programas}">
                                        <OPTION VALUE="${programa.id_catprog}" ${programa.id_catprog==bendiv.id_catprog ? 'selected':''}>${programa.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                            <label for="contrato" class="col-xs-12 col-md-2 control-label">
                                Núm.contrato:
                            </label>

                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="numcontrato" class="form-control" 
                                   id="numcontrato" value="${bendiv.numcontrato}" readonly/>
                            </div>
                        </div>    
                        
                        <div class="form-group">
                            <label for="clave_elect" class="col-xs-12 col-md-2 control-label">
                                Clave de elector:
                            </label>                            
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_elect" class="form-control" 
                                       id="clave_elect" required autofocus 
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,18})" 
                                       maxlength="18" placeholder="Mín.4 Máx. 18 caracteres" 
                                       style="text-transform:uppercase" value="${bendiv.clave_elect}"/>
                            </div>                                       
                            <label for="curp" class="col-xs-12 col-md-2 control-label">
                                CURP:
                            </label>                            
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="curp" class="form-control" 
                                       id="curp" required 
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,20})" 
                                       maxlength="20" placeholder="Mín.4 Máx. 20 caracteres" 
                                       style="text-transform:uppercase" value="${bendiv.curp}"/>
                            </div>
                        </div>
                            
                        <div class="form-group">    
                            <label for="clave_b" class="col-xs-12 col-md-2 control-label">
                                Clave Beneficiario:
                            </label>                            
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_b" class="form-control" 
                                       id="clave_b"
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,12})" 
                                       maxlength="12" placeholder="Mín.4 Máx. 12 caracteres" 
                                       style="text-transform:uppercase" value="${bendiv.clave_b}" readonly/>
                            </div>                            
                            <label for="nombre" class="col-xs-12 col-md-2 control-label">
                                Nombre Beneficiario:
                            </label>                            
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="nombre" class="form-control" 
                                       id="nombre" required
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,80})" 
                                       maxlength="80" placeholder="Mín.4 Máx. 80 caracteres" 
                                       style="text-transform:uppercase" value="${bendiv.nombre}"/>
                            </div>                            
                        </div>
                                
                        <div class="form-group"> 
                            <label for="fecha_con" class="col-xs-12 col-md-2 control-label">
                                Fecha contrato:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" name="fecha_con" class="form-control" 
                                       id="fecha_con" value="${bendiv.fecha_con}"/>
                            </div>
                            <label for="capital" class="col-xs-12 col-md-2 control-label">
                                Capital $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="capital" class="form-control" 
                                       id="capital" value="${bendiv.capital}" />         
                            </div>
                        </div>
                        
                        
                        <div class="form-group"> 
                            <label for="sub_inic" class="col-xs-12 col-md-2 control-label">
                                Subsidio inicial$:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="sub_inic" class="form-control" 
                                       id="sub_inic" value="${bendiv.sub_inic}"/>
                            </div>
                            <label for="enganche" class="col-xs-12 col-md-2 control-label">
                                Enganche $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="enganche" step="0.01" name="enganche" class="form-control" 
                                       id="enganche" value="${bendiv.enganche}" />         
                            </div>
                        </div>
                        
                        <div class="form-group"> 
                            <label for="interes" class="col-xs-12 col-md-2 control-label">
                                Interes $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="interes" class="form-control" 
                                       id="interes" value="${bendiv.interes}"/>
                            </div>
                            <label for="admon" class="col-xs-12 col-md-2 control-label">
                                Gto.Admon $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="admon" class="form-control" 
                                       id="admon" value="${bendiv.admon}" />         
                            </div>
                        </div>
                        
                        <div class="form-group"> 
                            <label for="seguro" class="col-xs-12 col-md-2 control-label">
                                Seguro $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="seguro" class="form-control" 
                                       id="seguro" value="${bendiv.seguro}"/>
                            </div>
                            <label for="o_seg" class="col-xs-12 col-md-2 control-label">
                                Otros Seg.$:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="o_seg" class="form-control" 
                                       id="o_seg" value="${bendiv.o_seg}" />         
                            </div>
                        </div>
                        
                        <div class="form-group"> 
                            <label for="plazo" class="col-xs-12 col-md-2 control-label">
                                Plazo :
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" name="plazo" class="form-control" 
                                       id="plazo" value="${bendiv.plazo}"/>
                            </div>
                            <label for="pago_mes" class="col-xs-12 col-md-2 control-label">
                                Pago mes $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="pago_mes" class="form-control" 
                                       id="pago_mes" value="${bendiv.pago_mes}" />         
                            </div>
                        </div>
                        
                        <div class="form-group"> 
                            <label for="sal_con" class="col-xs-12 col-md-2 control-label">
                                Sal con:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="sal_con" class="form-control" 
                                       id="sal_con" value="${bendiv.sal_con}"/>
                            </div>
                            <label for="juridico" class="col-xs-12 col-md-2 control-label">
                                Jurídico:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <select id="juridico" required class="wrap form-control"> 
                                    <option value="N" ${bendiv.juridico == "N" ? 'selected':''}>No</OPTION>
                                    <option value="S" ${bendiv.juridico == "S" ? 'selected':''}>Sí</OPTION>
                                </select>     
                            </div>
                        </div>
                        
                        <div class="form-group"> 
                            <label for="referencia_jur" class="col-xs-12 col-md-2 control-label">
                                Referencia Jur:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="referencia_jur" class="form-control" 
                                       id="referencia_jur" placeholder="Máx. 14 caracteres" maxlength="14"
                                       value="${bendiv.referencia_jur}" style="text-transform:uppercase"/>
                            </div>
                            
                            <label for="fecha_jur" class="col-xs-12 col-md-2 control-label">
                                Fecha Jur:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" name="fecha_jur" class="form-control" 
                                       id="fecha_jur" value="${bendiv.fecha_jur}"/>
                            </div>
                            
                            
                        </div>
                        
                        <div class="form-group">
                            <label for="mza" class="col-xs-12 col-md-2 control-label">
                                Manzana:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="mza" class="form-control" 
                                       id="mza" placeholder="Máx. 3 caracteres" maxlength="3"
                                       value="${bendiv.mza}"
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{1,3})" style="text-transform:uppercase"/>     
                            </div>
                            
                            <label for="lte" class="col-xs-12 col-md-2 control-label">
                                Lote:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="lte" class="form-control" 
                                       id="lte" placeholder="Máx. 6 caracteres" maxlength="6"
                                       value="${bendiv.lte}"
                                       pattern="([0-9]{1,6})"/>
                            </div>
                            
                        </div>
                        
                        <div class="form-group">
                            <label for="conyuge" class="col-xs-12 col-md-2 control-label">
                                Conyuge:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="conyuge" class="form-control" 
                                       id="conyuge" placeholder="Máx.30 caracteres" maxlength="30"
                                       value="${bendiv.conyuge}"
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{0,30})" style="text-transform:uppercase"/>     
                            </div>
                            
                            <label for="fecha" class="col-xs-12 col-md-2 control-label">
                                Fecha:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" name="fecha" class="form-control" 
                                       id="fecha" value="${bendiv.fecha}"/>
                            </div>
                            
                            
                        </div>
                        <div class="form-group">
                            <label for="contrato" class="col-xs-12 col-md-2 control-label">
                                    Aperturado
                                </label>

                                <div class="col-xs-12 col-md-4">
                                    <input type="text" name="aperturado" class="form-control" 
                                       id="aperturado" value="0" readonly/>
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
