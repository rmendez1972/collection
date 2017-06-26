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
                params.id_bendiv=$("#id_bendiv").val();
                params.clave_elect=$("#clave_elect").val();
                params.curp=$("#curp").val();
                params.clave_b=$("#clave_b").val();
                params.nombre=$("#nombre").val();
                params.id_catprog=$("#id_catprog").val();
                params.id_usuario=$("#id_usuario").val();
                                
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
                            
                            <label for="clave_elect" class="col-xs-12 col-md-2 control-label col-md-offset-3 ">
                                Clave de elector:
                            </label>
                            
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_elect" class="form-control" 
                                       id="clave_elect" required autofocus 
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,18})" 
                                       maxlength="18" placeholder="Mín.4 Máx. 18 caracteres" 
                                       style="text-transform:uppercase" value="${bendiv.clave_elect}"/>
                                                                
                                <input type="hidden" name="id_usuario" class="form-control" 
                                       id="id_usuario" value="1"/>
                            </div>
                                       
                            <label for="curp" class="col-xs-12 col-md-2 control-label col-md-offset-3 ">
                                CURP:
                            </label>
                            
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="curp" class="form-control" 
                                       id="curp" required 
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,20})" 
                                       maxlength="20" placeholder="Mín.4 Máx. 20 caracteres" 
                                       style="text-transform:uppercase" value="${bendiv.curp}"/>
                            </div>
                            
                            <label for="clave_b" class="col-xs-12 col-md-2 control-label col-md-offset-3 ">
                                Clave Beneficiario:
                            </label>
                            
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="clave_b" class="form-control" 
                                       id="clave_b"
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,12})" 
                                       maxlength="12" placeholder="Mín.4 Máx. 12 caracteres" 
                                       style="text-transform:uppercase" value="${bendiv.clave_b}"/>
                            </div>
                            
                            <label for="nombre" class="col-xs-12 col-md-2 control-label col-md-offset-3 ">
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
                            <label for="id_catprog" class="col-xs-12 col-md-2 control-label col-md-offset-3">
                                Programa:
                            </label>
                            
                            <div class="col-xs-12 col-md-4">
                                <select id="id_catprog" required class="form-control"> 
                                    <option value="0">Seleccione un programa...</option>
                                    <c:forEach  var="programa" items="${requestScope.programas}">
                                        <OPTION VALUE="${programa.id_catprog}" ${programa.id_catprog==bendiv.id_catprog ? 'selected':''}>${programa.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
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
