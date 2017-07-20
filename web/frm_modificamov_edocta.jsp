<%-- 
    Document   : frm_modifica_mov_edocta
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
                params.capital=$("#capital").val();
                params.admon=$("#admon").val();
                params.conyuge=$("#conyuge").val();
                params.fecha_con=$("#fecha_con").val();
                params.mza=$("#mza").val();
                params.lte=$("#lte").val();
                params.area=$("#area").val();
                params.domicilio=$("#domicilio").val();
                params.clave_cat=$("#clave_cat").val();
                params.id_tipocredito=$("#id_tipocredito").val();
                params.fecha_ip=$("#fecha_ip").val();
                if(params.id_catprog == 0){
                    alert("Seleccione un programa");
                    return false;
                }
                
                if(params.id_tipocredito == 0){
                    alert("Seleccione un tipo de crédito");
                    return false;
                }
                                
                $.post("controladorcandidato?operacion=editarGuardar", params, function(datos){
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
            <div class="panel-heading"><h4><span class="fa fa-money" style="color: #fff"></span> Modificar Movimiento de Estado de Cuenta de Programos</h4></div>
                <div class="panel-body transparent">
                    <form id="form_MP" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_movedoscta" id="id_movedoscta" value="${movimiento.id_movedoscta}" />
                        
                        <div class="form-group">
                            <label for="id_benef" class="col-xs-12 col-md-2 control-label  ">Beneficiario:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_benef" required class="select2  wrap form-control"> 
                                    <option value="0">SELECCIONE UNO</option>
                                    <c:forEach  var="benef" items="${requestScope.beneficiarios}">
                                        <OPTION VALUE="${benef.id_beneficiario}" ${benef.id_beneficiario == movimiento.id_benef ? 'selected':''}>${benef.nombre}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                                                    
                            <label for="clave_b" class="col-xs-12 col-md-2 control-label ">Clave SEDUVI:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_b" class="form-control" id="clave_b" required  placeholder="6 caracteres" maxlength="12" value="${movimiento.clave_b}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="clave_mov" class="col-xs-12 col-md-2 control-label">Clave Movimiento:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_mov"   class="form-control" id="clave_mov"  placeholder="Máx. 3 caracteres" maxlength="3" style="text-transform:uppercase" value="${movimiento.clave_mov}"/>
                            </div>
                            
                            <label for="fecha_mov" class="col-xs-12 col-md-2 control-label">Fecha de Movimiento::</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" id="fecha_mov" class="form-control" required  value="${movimiento.fecha_mov}" />

                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="poliza" class="col-xs-12 col-md-2 control-label">Poliza:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="poliza"   class="form-control" id="poliza"  placeholder="Máx. 6 caracteres" maxlength="3" style="text-transform:uppercase" value="${movimiento.poliza}"/>
                            </div>
                            
                            <label for="fecha_pol" class="col-xs-12 col-md-2 control-label">Fecha de Poliza::</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" id="fecha_pol" class="form-control" required  value="${movimiento.fecha_pol}" />

                            </div>
                        </div>
                                                       
                        <div class="form-group">
                            <label for="capital" class="col-xs-12 col-md-2 control-label">Capital:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="capital" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${movimiento.capital}" />
                            </div>
                            
                            <label for="admon" class="col-xs-12 col-md-2 control-label">Admon:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="admon" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${movimiento.admon}" />
                            </div>
                        </div>
                            
                        <div class="form-group">
                            <label for="seguro" class="col-xs-12 col-md-2 control-label">Seguro:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="seguro" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${movimiento.seguro}" />
                            </div>
                            
                            <label for="o_seguro" class="col-xs-12 col-md-2 control-label">Otro seguro:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="o_seguro" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${movimiento.o_seguro}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="comisiones" class="col-xs-12 col-md-2 control-label">Comisiones:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="comisiones" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${movimiento.comisiones}" />
                            </div>
                            
                            <label for="tit" class="col-xs-12 col-md-2 control-label">Titulación:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="tit" class="form-control" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${movimiento.tit}" />
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
