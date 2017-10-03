<%-- 
    Document   : frm_autoriza
    Created on : 15/06/2017, 10:29:00 AM
    Author     : Ismael 
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="javabeans.Delegacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <a href="../src/java/controladores/ControladorAutoriza.java"></a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>frm_autoriza</title>
        <script>
            function registrar(){
                var params=new Object();
                params.nombre=$("#nombre").val();
                params.cargo=$("#cargo").val();
                params.id_delegacion=$("#id_delegacion").val();
                              
                
                if(params.id_delegacion == 0){
                    alert("Seleccione una delegación");
                    return false;
                }
                //alert ('Aqui estoy a punto de grabar');
                $.post("controladorautoriza?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
                      
            function listar(){
                               
                $.post("controladorautoriza?operacion=listar", function(datos){
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
                        <span class="fa fa-pencil-square-o" style="color: #fff; padding: 5px"></span> 
                        Registro personas que autorizan
                    </h3>
                </div>
                
                <div class="panel-body transparent">
                    <form id="form_autoriza" onsubmit="return registrar()"  class="form-horizontal">
            
                        <div class="form-group">
                            <label for="nombre" class="col-xs-12 col-md-2 control-label col-md-offset-3 ">Nombre:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="nombre" class="form-control" 
                                       id="nombre" required autofocus 
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,80})" 
                                       maxlength="80" placeholder="Mín.4 Máx. 80 caracteres" 
                                       style="text-transform:uppercase" />
                            </div>

                            <label for="cargo" class="col-xs-12 col-md-2 control-label col-md-offset-3 ">
                                Cargo:
                            </label>
                            
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="cargo" class="form-control" 
                                       id="cargo" required autofocus 
                                       pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,80})" 
                                       maxlength="80" placeholder="Mín.4 Máx. 80 caracteres" 
                                       style="text-transform:uppercase" />
                            </div>
                            
                            
                        </div>
                                                
                        <div class="form-group">
                            <label for="id_delegacion" class="col-xs-12 col-md-2 control-label col-md-offset-3">
                                Delegación:
                            </label>
                            
                            <div class="col-xs-12 col-md-4">
                                <select id="id_delegacion" required class="form-control"> 
                                    <option value="0">Seleccione una Delegacion...</option>
                                    <c:forEach  var="delegacion" items="${requestScope.delegaciones}">
                                        <OPTION VALUE="${delegacion.id_delegacion}">${delegacion.descripcion}</OPTION>
                                    </c:forEach>
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
