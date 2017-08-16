<%-- 
    Document   : frm_autoriza
    Created on : 15/06/2017, 10:29:00 AM
    Author     : Ismael 
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="javabeans.CatProgramas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <a href="../src/java/controladores/ControladorBendiv.java"></a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>frm_bendiv</title>
        <script>
            
            $(document).ready(function() {
  
                var $select3 = $('.select2').select2({
                    containerCssClass: "wrap"
                })
            })
            
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
                //params.id_usuario=$("#id_usuario").val();
                              
                
                if(params.id_catprog == 0){
                    alert("Seleccione un programa");
                    return false;
                }

                //alert ('Aqui estoy a punto de grabar');
                $.post("controladorbendiv?operacion=nuevoGuardar", params, function(datos){
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
            document.getElementById('fecha_con').value=fechaActual();
            document.getElementById('fecha_jur').value=fechaActual();
            document.getElementById('fecha').value=fechaActual();
            
        </script>
    </head>
    <body>
       
            <div class="panel panel-primary" style="margin-top: 60px">
                
                <div class="panel-heading">
                    <h3 style="font-family:Conv_roundedelegance;margin:0px;padding:0px;text-align: center;">
                        <span class="fa fa-id-badge" style="color: #fff; padding: 5px"></span> 
                        Registro de Beneficiacioes Diversos
                    </h3>
                </div>
                
                <div class="panel-body transparent">
                    
                    <form id="form_bendiv" onsubmit="return registrar()"  class="form-horizontal">
                        
                        <div class="form-group">
                            <label for="id_catprog" class="col-xs-12 col-md-2 control-label">
                                Programa:
                            </label>

                            <div class="col-xs-12 col-md-4">
                                <select id="id_catprog" required class="select2 wrap form-control"> 
                                    <option value="0">SELECCIONE UN PROGRAMA</option>
                                    <c:forEach  var="programa" items="${requestScope.programas}">
                                        <OPTION VALUE="${programa.id_catprog}">[${programa.clave}]${programa.descripcion}</OPTION>
                                        
                                    </c:forEach>
                                </select>
                            </div>

                            <label for="contrato" class="col-xs-12 col-md-2 control-label">
                                Núm.contrato:
                            </label>

                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="numcontrato" class="form-control" 
                                   id="numcontrato" maxlength="5" placeholder="Teclee 5 digitos" 
                                   pattern="[0-9]{5}"/>
                            </div>
                        </div>

                        <div class="form-group">                            
                            <!--<label for="clave_elect" class="col-xs-12 col-md-2 control-label col-md-offset-3 ">-->
                            <label for="clave_elect" class="col-xs-12 col-md-2 control-label">
                                Clave de elector:
                            </label>

                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_elect" class="form-control" 
                                       id="clave_elect" required autofocus 
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,18})" 
                                       maxlength="18" placeholder="Mín.4 Máx. 18 caracteres" 
                                       style="text-transform:uppercase" />           
                            </div>

                            <label for="curp" class="col-xs-12 col-md-2 control-label">
                                CURP:
                            </label>

                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="curp" class="form-control" 
                                       id="curp" required
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,20})" 
                                       maxlength="20" placeholder="Mín.4 Máx. 20 caracteres" 
                                       style="text-transform:uppercase" />
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
                                       style="text-transform:uppercase" readonly/>
                            </div>
                            <label for="nombre" class="col-xs-12 col-md-2 control-label">
                                Nombre Beneficiario:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="nombre" class="form-control" 
                                       id="nombre" required
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,80})" 
                                       maxlength="80" placeholder="Mín.4 Máx. 80 caracteres" 
                                       style="text-transform:uppercase" />
                            </div>
                        </div>
                        
                        <div class="form-group"> 
                            <label for="fecha_con" class="col-xs-12 col-md-2 control-label">
                                Fecha contrato:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" name="fecha_con" class="form-control" 
                                       id="fecha_con"/>
                            </div>
                            <label for="capital" class="col-xs-12 col-md-2 control-label">
                                Capital $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="capital" class="form-control" 
                                       id="capital" value="0.00" />         
                            </div>
                        </div>
                        
                        
                        <div class="form-group"> 
                            <label for="sub_inic" class="col-xs-12 col-md-2 control-label">
                                Subsidio inicial$:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="sub_inic" class="form-control" 
                                       id="sub_inic" value="0.00"/>
                            </div>
                            <label for="enganche" class="col-xs-12 col-md-2 control-label">
                                Enganche $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="enganche" step="0.01" name="enganche" class="form-control" 
                                       id="enganche" value="0.00" />         
                            </div>
                        </div>
                        
                        <div class="form-group"> 
                            <label for="interes" class="col-xs-12 col-md-2 control-label">
                                Interes $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="interes" class="form-control" 
                                       id="interes" value="0.00"/>
                            </div>
                            <label for="admon" class="col-xs-12 col-md-2 control-label">
                                Gto.Admon $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="admon" class="form-control" 
                                       id="admon" value="0.00" />         
                            </div>
                        </div>
                        
                        <div class="form-group"> 
                            <label for="seguro" class="col-xs-12 col-md-2 control-label">
                                Seguro $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="seguro" class="form-control" 
                                       id="seguro" value="0.00"/>
                            </div>
                            <label for="o_seg" class="col-xs-12 col-md-2 control-label">
                                Otros Seg.$:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="o_seg" class="form-control" 
                                       id="o_seg" value="0.00" />         
                            </div>
                        </div>
                        
                        <div class="form-group"> 
                            <label for="plazo" class="col-xs-12 col-md-2 control-label">
                                Plazo :
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" name="plazo" class="form-control" 
                                       id="plazo" value="0"/>
                            </div>
                            <label for="pago_mes" class="col-xs-12 col-md-2 control-label">
                                Pago mes $:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="pago_mes" class="form-control" 
                                       id="pago_mes" value="0.00" />         
                            </div>
                        </div>
                        
                        <div class="form-group"> 
                            <label for="sal_con" class="col-xs-12 col-md-2 control-label">
                                Sal con:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" name="sal_con" class="form-control" 
                                       id="sal_con" value="0.00"/>
                            </div>
                            <label for="juridico" class="col-xs-12 col-md-2 control-label">
                                Jurídico:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <select id="juridico" required class="wrap form-control"> 
                                    <option value="N">No</OPTION>
                                    <option value="S">Sí</OPTION>
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
                                       style="text-transform:uppercase"/>
                            </div>
                            
                            <label for="fecha_jur" class="col-xs-12 col-md-2 control-label">
                                Fecha Jur:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" name="fecha_jur" class="form-control" 
                                       id="fecha_jur"/>
                            </div>
                            
                            
                        </div>
                        
                        <div class="form-group">
                            <label for="mza" class="col-xs-12 col-md-2 control-label">
                                Manzana:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="mza" class="form-control" 
                                       id="mza" placeholder="Máx. 3 caracteres" maxlength="3"
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{1,3})" style="text-transform:uppercase"/>     
                            </div>
                            
                            <label for="lte" class="col-xs-12 col-md-2 control-label">
                                Lote:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="lte" class="form-control" 
                                       id="lte" placeholder="Máx. 6 caracteres" maxlength="6"
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
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{0,30})" style="text-transform:uppercase"/>     
                            </div>
                            
                            <label for="fecha" class="col-xs-12 col-md-2 control-label">
                                Fecha:
                            </label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" name="fecha" class="form-control" 
                                       id="fecha"/>
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
                            <input type="submit" value="Aceptar" class="btn btn-primary" />
                            <input type="reset" value="Cancelar" onclick="return listar()" class="btn btn-default" />
                        </div>

                    </form>
                </div>
            </div>   
    </body>
</html>
