<%-- 
    Document   : login
    Created on : 25/11/2013, 09:37:19 PM
    Author     : Ismael García Hernández (igh1@hotmail.com)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javabeans.Usuario"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="imagenes/map1.ico" type="image/x-icon" rel="shortcut icon" />
	<!--<meta http-equiv="refresh" content="2">!-->
      <!--<link rel="stylesheet" type="text/css" href="css/estilos.css"/>!-->
	<title>Autenticación</title>
        <!-- framework jquery 
        <script type="text/javascript" language="JavaScript" src="js/jquery-1.7.2.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/jquery.tablesorter.js"></script>
        <script src="js/script_alert.js"></script>-->
	
	<style type="text/css">
            
            @import url('css/fuentes.css');
            body{background-image: url(imagenes/login1.png);font-family: helveticanuelightext;}
            h1,h2,h3,h4,p{font-family: helveticanuelightext;color:#0080ff;}
                      
            #caja{
		/*background: #f0f0f0;*/width: 500px;border:1px solid white; margin:100px auto;
		padding:10px;border-radius: 6px;opacity: 1;box-shadow: 0px 5px 3px 0px #c0c0c0;
                background-image: url(imagenes/ceiba_opaco.png);
                /*opacity: 0.5;*/
            }

            #caja:hover{border:1px solid greenyellow;
                        border:1px solid #459cc1;
          
                }
            
            input[type=text], input[type=password]{
            	margin:0 0 .5em 0;font-size: 26px; width: 200px;border: 0px;
                padding: .5em;border-radius: 5px;
                opacity: 0.8;
            }

                     
            /*Clase bottonlogin*/
            .bottonlogin/*input[type="submit"]*/ {
                width: 100px;height: 100px;border: none;color: #ffffff;
                font: 13px Tahoma, Arial, sans-serif;
                /*padding: 10px 15px;*/
                text-decoration: none; cursor: pointer;border: 1px solid #333;
                letter-spacing: 1px; text-shadow: 0px -1px 0px #333333;
                background-image: url(imagenes/loginbutton.png);
                /**** Bordes redondeados ****/
                /* W3C */
                border:1px solid #459cc1;
                border-radius: 5px;
                /* Firefox */
                -moz-border-radius: 5px;
                opacity: 0.5;
                
             }
            .bottonlogin/*iinput[type="submit"]*/:hover {opacity: 1;}
            #campos{
                width: 100%;
                height: 200px;
                /*background: url(imagenes/loginicon.png) no-repeat left center;*/
                /*margin-left:  5%;*/
                
                
            }
            #user{
               float: left;
               width: 200px;
               margin-left: 25%;
               margin-top: 10%;
              
            }
            #password{
               float: left;
               width: 200px;
               margin-left: 25%;
               margin-top: 5%;
               margin-bottom: 10px;
              
            }
           #boton{
                width: 100px;
                height: 100px;
                margin: auto;
                margin-bottom: 20px;
                    
            }

            

	</style>
        

    </head>
   
    <!--encapsulamiento de los datos del usuario en el Javabean-->
    <jsp:useBean id="usuario" scope="request" class="javabeans.Usuario"/>

    
    <%
    if((request.getParameter("user")!=null) && (request.getParameter("password")!=null) )
    {
        String user=request.getParameter("user").toUpperCase();
        usuario.setUsuario(user);
        String password=request.getParameter("password").toUpperCase();
        usuario.setPassword(password);
        
        String nombre=request.getParameter("nombre").toUpperCase();
        usuario.setNombre(nombre);

    %>
   
           
        <jsp:forward page="controladorlogin?operacion=iniciar"/>
    <%}%>  
    
    
    <body>
        <div id="caja" ><!--onclick="document.body.style.backgroundColor='none'; 
                document.body.style.backgroundImage='url(imagenes/backg2.png)';">
            <!--<a href="#" onclick="javascript:document.body.style.backgroundColor='none'; 
                document.body.style.backgroundImage='url(imagenes/backg2.png)';">Rojo</a>!-->
            <center>
                <h4 style="color: #459cc1; text-shadow: white 0.1em 0.1em 0.2em">Ventanilla Única de Gestión de Trámites y Servicios<br> Versión 1.0</h4>
                <!--<img SRC="imagenes\loginicon.png">!-->
		
                <form name="login" id="login"   method="post">
                    <div id="campos">
                        <div id="user">
                            <label for="user"></label>
                            <input type="text" name="user"   placeholder="Usuario" required>
                            <input type="hidden" name="nombre">
                        </div>
                        <div id="password"
                            <label for="password"></label>
                            <input type="password" name="password"  placeholder="contraseña" required>
                          
                        </div>
                    </div>
                    <div id="boton">
                        <input type="submit"  class="bottonlogin" name="boton"  value="">
                    
                    </div>
			
                </form>
            </center>
            
	</div>

    </body>
    
</html>
