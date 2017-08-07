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
        <title>frm_autoriza</title>
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
                params.id_catprog=  $("#id_catprog").val();
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
                                   style="text-transform:uppercase" />
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
