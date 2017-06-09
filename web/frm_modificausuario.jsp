<%-- 
    Document   : frm_modificausuario
    Created on : 26/05/2017, 01:33:00 PM
    Author     : marlon
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
                params.id_usuario=$("#id_usuario").val();
                params.usuario=$("#usuario").val();
                params.nombre=$("#nombre").val();
                params.direccion=$("#direccion").val();
                params.cargo=$("#cargo").val();
                params.serie=$("#serie").val();
                params.id_nivel=$("#id_nivel").val();
                params.id_delegacion=$("#id_delegacion").val();
                params.password=$("#password").val();
                
                /*
                if(params.password != null){
                    $.post("controladorusuario?operacion=validarPass", params, function(datos){
                    $("#show").html(datos);
                    },"html");
                    
                }*/
                
                if(params.id_nivel == 0){
                    alert("Seleccione un nivel");
                    return false;
                }
                if(params.id_delegacion == 0){
                    alert("Seleccione una delegacion");
                    return false;
                }
                
                
                
                $.post("controladorusuario?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            function actualizaDir(id){
                
                var params=new Object();
                params.id_unidadadministrativa=id;
                                
                $.post("controladordirecciones?operacion=listarPorunidad", params, function(datos){
                    
                    $("#direccion").find('option').remove();
                    $("#direccion").append('<option value="">'+'Selecciona una Dirección'+'</option>');
                    $.each(datos, function(i,v){
                        $("#direccion").append('<option value="'+v.id_direccion+'">'+v.nombre+'</option>');
                    });
                },"json");
                
                return false;
            }
            
            function listar(){
                               
                $.post("controladorusuario?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        
        <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-address-book-o" style="color: #fff"></span> Modificar usuario.</h4></div>
                <div class="panel-body transparent">
                    <form id="form_UA" onsubmit="return registrar()"  class="form-horizontal">
                        <input type="hidden" name="id_usuario" id="id_usuario" value="${usr.id_usuario}" />
                        
                        <div class="form-group">
                            <label for="usuario" class="col-xs-12 col-md-2 control-label  ">Usuario:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="usuario" class="form-control" id="usuario" required autofocus required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,8})" maxlength="8" placeholder="Mín.4 Máx. 8 caracteres" style="text-transform:uppercase" value="${usr.usuario}" />
                            </div>
                                                    
                            <label for="paswword" class="col-xs-12 col-md-2 control-label ">Contraseña:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="password" name="password" class="form-control" id="password" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9\0-9]{5,12})" placeholder="Mín.5 Máx. 12 caracteres"maxlength="12" value="" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="nombrecompleto" class="col-xs-12 col-md-2 control-label">Nombre Completo:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="nombre" class="form-control" id="nombre" required placeholder="Máx.60 caracteres" maxlength="60" style="text-transform:uppercase" value="${usr.nombre}"/>
                            </div>
                            
                            <label for="direccion" class="col-xs-12 col-md-2 control-label">Direccion::</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="direccion" class="form-control" id="direccion" required placeholder="Máx.80 caracteres" maxlength="80" style="text-transform:uppercase" value="${usr.direccion}" />

                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="cargo" class="col-xs-12 col-md-2 control-label ">Cargo:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="cargo" class="form-control" id="cargo" required  placeholder="Máx.80 caracteres" maxlength="80" style="text-transform:uppercase" value="${usr.cargo}" />
                            </div>
                            <label for="serie" class="col-xs-12 col-md-2 control-label">Serie:</label>
                            <div class="col-xs-12 col-md-1">
                                <input type="text" name="serie" class="form-control" id="serie" required pattern="([a-zA-Z]{1,1})" placeholder="Máx.1 caracteres" maxlength="1" style="text-transform:uppercase; width: 70px;" value="${usr.serie}" />
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                        <label for="nivel" class="col-xs-12 col-md-2 control-label ">Nivel:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_nivel" required class="form-control"  onChange="actualizaDir(this.value)"> 
                                    <option value="0">SELECCIONE UNA</option>
                                    <c:forEach  var="niv" items="${requestScope.niv}">
                                        <OPTION VALUE="${niv.id_nivel}" ${niv.id_nivel == usr.id_nivel ? 'selected':''}>${niv.descripcion}</OPTION>
                                    </c:forEach>
                                </select>
                            </div>
                            <label for="importe" class="col-xs-12 col-md-2 control-label ">Delegación:</label>
                            <div class="col-xs-12 col-md-4">
                                <select id="id_delegacion" required class="form-control">
                                    <option value="0">SELECCIONE UNA</option>
                                        <c:forEach  var="del" items="${requestScope.del}">
                                            <OPTION VALUE="${del.id_delegacion}" ${del.id_delegacion == usr.id_del ? 'selected':''}>${del.descripcion}</OPTION>
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
