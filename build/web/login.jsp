<%-- 
    Document   : login
    Created on : 26/06/2017, 09:37:19 PM
    Author     : Ismael García Hernández (igh1@hotmail.com)
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="javabeans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<a href="../src/java/controladores/controladorusuario.java"></a>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="imagenes/map1.ico" type="image/x-icon" rel="shortcut icon" />
	<!--<meta http-equiv="refresh" content="2">!-->
      <!--<link rel="stylesheet" type="text/css" href="css/estilos.css"/>!-->
	<title>Autenticación</title>
        <script>
            function mostrar(){
                document.getElementById('menu').style.display = 'block';
            }
            
            function ocultar(){
                document.getElementById('menu').style.display = 'none';
            }
            function entrar(){
                
            
                var params=new Object();
                params.usuario=$("#usuario").val();
                params.password=$("#password").val();
                //params.nombre=$("#nombre").val();
                
                $.post("controladorusuario?operacion=login", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
            
            <c:if test="${usuario== null}">
                
                <c:if test="${msg != null}">
                    alert('${msg}');
                </c:if>
                //alert('Salida exitosa');
                //alert('Autenticación exitosa'+'${usuario.usuario}');
                document.getElementById('menu').style.display = 'none';

        </c:if>
  
        </script>
    </head>
   
    <body>
        <div class="panel panel-primary" style="margin-top: 60px;">
            
            <div class="panel-heading">
                <h3 style="font-family:Conv_roundedelegance;margin:0px;padding:0px;text-align: center;">
                    <span class="fa fa-user" style="color: #fff; padding: 5px"></span> 
                    Login
                </h3>
            </div>
		
            <div class="panel-body transparent">
                
                <form name="login" id="login" onsubmit="return entrar()" class="form-horizontal">
                    <div class="form-group">
                        <label for="usuario" class="col-xs-12 col-md-2 control-label col-md-offset-3 ">Usuario:</label>
                        <div class="col-xs-12 col-md-4">
                            <input type="text" name="usuario" class="form-control"
                                id="usuario" required autofocus
                                pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,8})"
                                maxlength="8" placeholder="Mín.4 Máx. 8 caracteres"
                                style="text-transform:uppercase" 
                                />
                        </div>
                    </div>   
                    
                    <div class="form-group">
                        <label for="password" class="col-xs-12 col-md-2 control-label col-md-offset-3 ">
                                Password:
                        </label>                        
                        <div class="col-xs-12 col-md-4">
                            <input type="password" name="password" class="form-control"
                               id="password" required
                               pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{4,12})" 
                               maxlength="12" placeholder="Mín.4 Máx. 12 caracteres"
                               style="text-transform:uppercase"
                               />                          
                        </div>
                        
                    </div>
                    
                    <div class="form-group" style="text-align:center">
                        <input type="submit"  value="Aceptar" class="btn btn-primary">
                        <input type="reset" value="Limpiar"  class="btn btn-warning">
                        
                    </div>
			
                </form>
                
            </div>    
            
	</div>

    </body>
    
</html>
