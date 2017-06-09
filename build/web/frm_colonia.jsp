<%-- 
    Document   : frm_colonia
    Created on : 08/06/2017, 10:29:00 AM
    Author     : Marlon
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="javabeans.Delegacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <a href="../src/java/controladores/ControladorColonia.java"></a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" type="text/css" href="css/estilos.css"/>-->
        <title>frm_delegacion</title>
        <script>
            function registrar(){
                var params=new Object();
                params.descripcion=$("#descripcion").val();
                params.id_delegacion=$("#id_delegacion").val();
                              
                
                if(params.id_delegacion == 0){
                    alert("Seleccione una delegacion");
                    return false;
                }
                
                $.post("controladorcolonia?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
                      
            function listar(){
                               
                $.post("controladorcolonia?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
        </script>
    </head>
    <body>
       
            <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-building" style="color: #fff; padding: 5px"></span> Registro de Colonia</h4></div>
                <div class="panel-body transparent">
                    <form id="form_CL" onsubmit="return registrar()"  class="form-horizontal">
            
                        <div class="form-group">
                            <label for="descripcion" class="col-xs-12 col-md-2 control-label col-md-offset-3 ">Descripción:</label>
                            <div class="col-xs-12 col-md-4">
                                <input type="text" name="descripcion" class="form-control" id="descripcion" required autofocus pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,80})" maxlength="80" placeholder="Mín.4 Máx. 80 caracteres" style="text-transform:uppercase" />
                            </div>
                            
                        </div>
                                                
                        <div class="form-group">
                            <label for="id_delegacion" class="col-xs-12 col-md-2 control-label col-md-offset-3">Delegación:</label>
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
