<%-- 
    Document   : scr_consulta
    Created on : 27/11/2013, 09:49:17 AM
    Author     : Ismael García Hernández (igh1@hotmail.com)
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>scr_consulta</title>
        <style>/* 
            .btn-tabla{
                width:22px;
                height:22px;
                cursor:pointer;
                margin-right: 5px;
                
                -webkit-transition: all .3s ease;
                transition: all .3s ease;
            }
            .btn-tabla:hover{
                -webkit-transform: scale(1.5);
                transform: scale(1.5);
            }
            .btn-catalogo{
                width:80px;
                background-color: #e4e0e0;
                border: 1px solid #b6b2b2;
                text-align: center;
                margin-left: 5px;
                padding:5px;
                cursor:pointer;
                float:left;
            }
            .btn-catalogo:hover{
                background-color: #f5f5f5;
            }
           .btn-catalogo:active{
                background-color: #cccccc;
            }
            .btn-catalogo img{
                width: 23px;
                height: 23px;
            }
            .btn-catalogo p{
                font-size:11px;
                text-align: center;
            } 
            .frm-btn{
                padding:6px 8px 6px 8px;
                font-size:12px;
            }*/
        </style>
    </head>
    <body>
        <!--<div id="adminnav">!-->
            <div id="consola" ><h1 style="color:#fff;">Consola del administrador</h1>
            <!--<div id="tituloconsola" style="float:left;padding-top: 20px;width: 800px">Consola del Administrador
            </div>!-->
                <div class="menuhorizontal">
            
                    <ul>
                        <li onclick="cargar('controladorusuario?operacion=listar','#admin')"><a href="#">Usuarios</a></li>
                        <li onclick="cargar('controladorunidadadtva?operacion=listar','#admin')"><a href="#">Subsecretarías</a></li>
                        <li onclick="cargar('controladordirecciones?operacion=listar','#admin')"><a href="#">Direcciones</a></li>
                        <li onclick="cargar('controladortramite?operacion=listar','#admin')"><a href="#">Trámites</a></li>
                        <li onclick="cargar('controladorrequisito?operacion=listar','#admin')"><a href="#">Requisitos</a></li>
                        <li onclick="cargar('controladorestatus?operacion=listar','#admin')"><a href="#">Estatus</a></li>
                        <li onclick="cargar('controladorpermiso?operacion=listar','#admin')"><a href="#">Permisos</a></li>

                    </ul>
                </div>
            </div>
        <!--</div>!-->
        
         <div id="admin"></div>  
        
        
    </body>
</html>
