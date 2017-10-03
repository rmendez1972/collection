<%-- 
    Document   : frm_modifica_movbonific
    Created on : 25/07/2017, 04:02:09 PM
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
                params.id_bonificacion=$("#id_bonificacion").val();
                params.id_movedoscta=$("#id_movedoscta").val();
                params.id_benef=$("#id_benef").val();
                params.imp_cap=$("#imp_cap").val();
                params.imp_int=$("#imp_int").val();
                params.imp_adm=$("#imp_adm").val();
                params.imp_seg=$("#imp_seg").val();
                params.imp_osg=$("#imp_osg").val();
                params.imp_com=$("#imp_com").val();
                params.imp_mor=$("#imp_mor").val();
                params.imp_tit=$("#imp_tit").val();
                params.id_catbonific=$("#id_catbonific").val();
                params.estatus=$("#estatus").val();
                params.clave_b=$("#clave_b").val();
                params.recibo=$("#recibo").val();
                params.serie=$("#serie").val();
                params.numcontrato=$("#numcontrato").val();
                params.id_catprog=$("#id_catprog").val();
                params.id_autoriza=$("#id_autoriza").val();
                params.id_movdiversos=$("#id_movdiversos").val();
                
                
                $.post("controladormovbonific?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        
            
             function listar(id){
                var params=new Object();
                params.id=id;              
                $.post("controladormovbonific?operacion=listarbonific", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            function listardiv(iddiv){
                var params=new Object();
                params.iddiv=iddiv;              
                $.post("controladormovbonific?operacion=listarbonific", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
        </script>
    </head>
    <body>
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-dollar" style="color: #fff"></span> Editar Bonificaciones.</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
                        
                        <c:set var="id_movedoscta" value="${requestScope.id}"/>
                        <c:set var="id_movdiversos" value="${requestScope.iddiv}"/>
                        
                        <c:if test="${id_movedoscta!=null}">
                            <input type="hidden" name="id_movedoscta" class="form-control" id="id_movedoscta"   placeholder="Máx.80 caracteres" maxlength="80" style="text-transform:uppercase" value="${bon.id_movedoscta}" />    
                        </c:if>
                        <c:if test="${id_movdiversos!=null}">
                            <input type="hidden" name="id_movdiversos" class="form-control" id="id_movdiversos"   placeholder="Máx.80 caracteres" maxlength="80" style="text-transform:uppercase" value="${bon.id_movdiversos}" />    
                        </c:if>
                        
                        <input type="hidden" name="id_bonificacion" id="id_bonificacion" value="${bon.id_bonificacion}" />
                        <input type="hidden" name="id_benef" class="form-control" id="id_benef"  placeholder="Máx.80 caracteres" maxlength="80" style="text-transform:uppercase" value="${bon.id_benef}" />
                               
                        <div class="form-group">
                            <label for="imp_cap" class="col-xs-12 col-md-2 control-label">imp capital:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_cap" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${bon.imp_cap}"/>
                            </div>
                                
                            <label for="imp_int" class="col-xs-12 col-md-2 control-label">imp int:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_int" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${bon.imp_int}"/>
                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="imp_adm" class="col-xs-12 col-md-2 control-label">imp adm:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_adm" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${bon.imp_adm}"/>
                            </div>
                                
                            <label for="imp_seg" class="col-xs-12 col-md-2 control-label">imp seg:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_seg" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${bon.imp_seg}"/>
                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="imp_osg" class="col-xs-12 col-md-2 control-label">imp osg:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_osg" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${bon.imp_osg}"/>
                            </div>
                            
                            <label for="imp_com" class="col-xs-12 col-md-2 control-label">imp com:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_com" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${bon.imp_com}"/>
                            </div>
                        </div>
                            
                        <div class="form-group">
                            <label for="imp_mor" class="col-xs-12 col-md-2 control-label">imp mor:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_mor" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${bon.imp_mor}"/>
                            </div>
                            
                            <label for="imp_tit" class="col-xs-12 col-md-2 control-label">imp tit:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="0.001" class="form-control" id="imp_tit" required  placeholder="Sólo se aceptan tres decimales" maxlength="12" value="${bon.imp_tit}"/>
                            </div>
                        </div>
                                
                         <div class="form-group">
                            <label for="id_catbonific" class="col-xs-12 col-md-2 control-label">Bonificacion:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_catbonific" required class="form-control">
                                    <option value="0">SELECCIONE UNA</option>
                                        <c:forEach  var="boni" items="${requestScope.bonificacion}">
                                            <OPTION VALUE="${boni.id_bonific}" ${boni.id_bonific == bon.id_catbonific ? 'selected':''}>${boni.clave_bonific}</OPTION>
                                        </c:forEach>
                                </select>
                            </div>
                            
                            <label for="estatus" class="col-xs-12 col-md-2 control-label">Estatus:</label>
                            <div class="col-xs-12 col-md-4" id="divstatus">
                                <script>
                                    var estatus = new String;
                                    estatus = ${bon.estatus};
                                    var A = "A";
                                    var B = "B";
                                    if(${bon.estatus} == A){
                
                                        var newS = $("<select>");
                                        newS.append('<option value="A" selected >'+'Aceptado'+'</option>');
                                        newS.append('<option value="B" >'+'Cancelado'+'</option>');
                                        newS.addClass("form-control");
                                        newS.attr("id", "estatus");
                                        $("#divstatus").append(newS);   
                                    }else{
                
                                        var newS = $("<select>");
                                        newS.append('<option value="A" >'+'Aceptado'+'</option>');
                                        newS.append('<option value="B" selected >'+'Cancelado'+'</option>');
                                        newS.addClass("form-control");
                                        newS.attr("id", "estatus");
                                        $("#divstatus").append(newS);
                                    }
                                    
                                </script> 
                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="clave_b" class="col-xs-12 col-md-2 control-label">Clave b:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_b" class="form-control" id="clave_b" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,12})"  placeholder="Máx.12 caracteres" maxlength="12" style="text-transform:uppercase" value="${bon.clave_b}" readonly />
                            </div>
                            
                            <label for="recibo" class="col-xs-12 col-md-2 control-label">Recibo:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="number" step="1" class="form-control" id="recibo" required  placeholder="Sólo se aceptan enteros" maxlength="12" value="${bon.recibo}" />
                            </div>
                        </div>
                        
               
                        <div class="form-group">                   
                           <label for="serie" class="col-xs-12 col-md-2 control-label">Serie:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="serie" class="form-control" id="serie" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{1,1})"  placeholder="Máx.1 caracteres" maxlength="1" style="text-transform:uppercase" value="${bon.serie}" />
                            </div>
                            
                           <label for="numcontrato" class="col-xs-12 col-md-2 control-label">Número de Contrato:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="numcontrato" class="form-control" id="numcontrato" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{3,5})"  placeholder="Máx.5 caracteres" maxlength="5" style="text-transform:uppercase" value="${bon.numcontrato}" readonly />
                            </div>
                        </div>
                                
                        <div class="form-group">
                            <label for="id_catprog" class="col-xs-12 col-md-2 control-label">Programa:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_catprog" required class="form-control" disabled>
                                    <option value="0">SELECCIONE UNA</option>
                                        <c:forEach  var="cp" items="${requestScope.cp}">
                                            <OPTION VALUE="${cp.id_catprog}" ${cp.id_catprog == bon.id_catprog ? 'selected':''} >${cp.descripcion}</OPTION>
                                        </c:forEach>
                                </select>
                            </div>
                            <label for="id_autoriza" class="col-xs-12 col-md-2 control-label">Autoriza:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_autoriza" required class="form-control">
                                    <option value="0">SELECCIONE UNA</option>
                                        <c:forEach  var="aut" items="${requestScope.aut}">
                                            <OPTION VALUE="${aut.id_autoriza}" ${aut.id_autoriza == bon.id_autoriza ? 'selected':''} >${aut.nombre}</OPTION>
                                        </c:forEach>
                                </select>
                            </div>
                        </div>
                            

                        <div class="form-group" style="text-align:center">
                            <input type="submit" value="Aceptar" class="btn btn-primary" />
                            <c:if test="${id_movedoscta!=null}">
                                 <input type="reset" value="Cancelar" onclick="return listar(${bon.id_movedoscta})" class="btn btn-default" />
                            </c:if>
                            
                            <c:if test="${id_movdiversos!=null}">
                                <input type="reset" value="Cancelar" onclick="return listardiv(${bon.id_movdiversos})" class="btn btn-default" />
                            </c:if>
                        </div>


                    </form>
                </div>
        </div>
    </body>
</html>
