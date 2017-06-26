<%-- 
    Document   : frm_modificacandidatoapertura
    Created on : 22/06/2017, 01:33:00 PM
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
                
                confirma("", "Ingresar Candidato", "Confirmar ingreso de Contratado a la CxC", "agregar", function(){
                    var params=new Object();
                    params.id_candidato=$("#id_candidato").val();
                    params.poliza=$("#poliza").val().toUpperCase();
                    params.fecha_pol=$("#fecha_pol").val();
                    $.post("controladorcandidato?operacion=aperturarGuardar", params, function(datos){
                        $("#show").html(datos);
                    },"html");
                });
                return false;
            }
            
                        
            function listar(){
                               
                $.post("controladorcandidato?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            /*inicializando campo tipo date a la fecha del dia*/
            document.getElementById('fecha_pol').value=fechaActual();
            /*inicializando la poliza del dia*/
            var dateobj= new Date() ;
            var day = dateobj.getDate() ;
            document.getElementById('poliza').value='D0'+day;
            
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-file-text-o" style="color: #fff"></span> Registro de Candidato en Catálogo de Beneficiarios (ciudadano contratado ingresa a la cuenta por cobrar)</h4></div>
                <div class="panel-body transparent">
                    <form id="form_CA" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_candidato" id="id_candidato" value="${candidato.id_candidato}" />
                        
                        <div class="form-group">
                            <label for="id_catprog" class="col-xs-12 col-md-2 control-label  ">Programa:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_catprog" disabled="true" required class="form-control"> 
                                    <option value="0">SELECCIONE UNO</option>
                                    <c:forEach  var="prog" items="${requestScope.prog}">
                                        <OPTION VALUE="${prog.id_catprog}" ${prog.id_catprog == candidato.id_catprog ? 'selected':''}>${prog.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                                                    
                            <label for="numcontrato" class="col-xs-12 col-md-2 control-label ">Num. Contrato:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="numcontrato" class="form-control" id="numcontrato" disabled="true" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9\0-9]{5})" placeholder="5 caracteres" maxlength="5" value="${candidato.numcontrato}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="clave_elect" class="col-xs-12 col-md-2 control-label">Clave Elector:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_elect" class="form-control" id="clave_elect" disabled="true"  placeholder="Máx.18 caracteres" maxlength="18" style="text-transform:uppercase" value="${candidato.clave_elect}"/>
                            </div>
                            
                            <label for="curp" class="col-xs-12 col-md-2 control-label">Curp::</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="curp" class="form-control" id="curp" disabled="true"  placeholder="Máx.24 caracteres" maxlength="24" style="text-transform:uppercase" value="${candidato.curp}" />

                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="rfc" class="col-xs-12 col-md-2 control-label">RFC:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="rfc" class="form-control" id="rfc" disabled="true"  placeholder="Máx.13 caracteres" maxlength="13" style="text-transform:uppercase" value="${candidato.rfc}"/>
                            </div>
                            
                            <label for="nombre" class="col-xs-12 col-md-2 control-label">Nombre::</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="nombre" class="form-control" id="nombre" disabled="true"  placeholder="Máx.50 caracteres" maxlength="50" style="text-transform:uppercase" value="${candidato.nombre}" />

                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="conyuge" class="col-xs-12 col-md-2 control-label">Conyuge:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="conyuge" class="form-control" id="conyuge" disabled="true"  placeholder="Máx.50 caracteres" maxlength="3" style="text-transform:uppercase" value="${candidato.conyuge}"/>
                            </div>
                            
                            <label for="fecha_con" class="col-xs-12 col-md-2 control-label">Fecha de Contrato:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" id="fecha_con" class="form-control" disabled="true" required  value="${candidato.fecha_con}" />

                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="mza" class="col-xs-12 col-md-2 control-label">Manzana:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="mza" class="form-control" id="mza" disabled="true"  placeholder="Máx. 3 caracteres" maxlength="13" style="text-transform:uppercase" value="${candidato.mza}"/>
                            </div>
                            
                            <label for="lte" class="col-xs-12 col-md-2 control-label">Lote:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="lte" class="form-control" id="lte" disabled="true"  placeholder="Máx. 6 caracteres" maxlength="6" style="text-transform:uppercase" value="${candidato.lte}" />

                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="area" class="col-xs-12 col-md-2 control-label">Area:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.01" id="area" class="form-control" disabled="true" required  placeholder="Solo se aceptan dos decimales" maxlength="12" value="${candidato.area}" />
                            </div>
                            
                            <label for="domicilio" class="col-xs-12 col-md-2 control-label">Domicilio:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="domicilio" class="form-control" id="domicilio" disabled="true"  placeholder="Máx.50 caracteres" maxlength="50" style="text-transform:uppercase" value="${candidato.domicilio}" />

                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="clave_cat" class="col-xs-12 col-md-2 control-label">Clave Catastral:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_cat" class="form-control" id="clave_cat" disabled="true"  placeholder="Máx.20 caracteres" maxlength="20" style="text-transform:uppercase" value="${candidato.clave_cat}" />
                            </div>
                            <label for="id_tipocredito" class="col-xs-12 col-md-2 control-label  ">Tipo de Crédito:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_tipocredito" disabled="true" required class="form-control"> 
                                    <option value="0">SELECCIONE UNO</option>
                                    <c:forEach  var="tipo" items="${requestScope.tipo}">
                                        <OPTION VALUE="${tipo.id_tipocredito}" ${tipo.id_tipocredito == candidato.id_tipocredito ? 'selected':''}>${tipo.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>    
                        <div class="form-group">
                            <label for="poliza" class="col-xs-12 col-md-2 control-label">Póliza:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="poliza" class="form-control" id="poliza" pattern="(^[D]{1}[0-9]{3}$)" placeholder="Máx.4 caracteres" maxlength="4" style="text-transform:uppercase" />
                            </div>
                            
                            <label for="fecha_pol" class="col-xs-12 col-md-2 control-label">Fecha de Póliza:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="date" id="fecha_pol" class="form-control" required />
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
