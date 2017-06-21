<%-- 
    Document   : frm_modificacandidato
    Created on : 21/06/2017, 01:33:00 PM
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
                params.id_candidato=$("#id_candidato").val();
                params.id_catprog=$("#id_catprog").val();
                params.numcontrato=$("#numcontrato").val();
                params.clave_elect=$("#clave_elect").val();
                params.curp=$("#curp").val();
                
                                
                if(params.id_catprog == 0){
                    alert("Seleccione un programa");
                    return false;
                }
                                
                $.post("controladorcandidato?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
                        
            function listar(){
                               
                $.post("controladorcandidato?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-file-text-o" style="color: #fff"></span> Modificar Candidato (ciudadano contratado)</h4></div>
                <div class="panel-body transparent">
                    <form id="form_CA" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_candidato" id="id_candidato" value="${candidato.id_candidato}" />
                        
                        <div class="form-group">
                            <label for="id_catprog" class="col-xs-12 col-md-2 control-label  ">Programa:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_catprog" required class="form-control"> 
                                    <option value="0">SELECCIONE UNO</option>
                                    <c:forEach  var="prog" items="${requestScope.prog}">
                                        <OPTION VALUE="${prog.id_catprog}" ${prog.id_catprog == candidato.id_catprog ? 'selected':''}>${prog.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                                                    
                            <label for="numcontrato" class="col-xs-12 col-md-2 control-label ">Num. Contrato:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="numcontrato" class="form-control" id="numcontrato" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9\0-9]{5})" placeholder="5 caracteres" maxlength="5" value="${candidato.numcontrato}" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="clave_elect" class="col-xs-12 col-md-2 control-label">Clave Elector:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_elect" class="form-control" id="clave_elect"  placeholder="Máx.18 caracteres" maxlength="18" style="text-transform:uppercase" value="${candidato.clave_elect}"/>
                            </div>
                            
                            <label for="curp" class="col-xs-12 col-md-2 control-label">Curp::</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="curp" class="form-control" id="curp"  placeholder="Máx.24 caracteres" maxlength="24" style="text-transform:uppercase" value="${candidato.curp}" />

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
