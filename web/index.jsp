<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javabeans.Usuario"%>

<!DOCTYPE html>
<html lang="es">
  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/img/favicon.ico">

    <title>Sistema de Cobrtanza</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template 
    <link href="assets/css/navbar-fixed-top.css" rel="stylesheet">-->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Fuentes Conv_Futura-T-OT-Book y Conv_roundedelegance -->
    <link href="assets/css/fonts.css" rel="stylesheet">
    <!-- Iconos fuentes personalizadas para la aplicaciÃ³n -->
    <link href="assets/css/iconmoon.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
    <!-- Estilos personalizados para la aplicaciÃ³n -->
    <link href="assets/css/style.css" rel="stylesheet">
    
    
    
 </head>

 <body>
    <!-- Fixed navbar -->
    <!--<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #ffffff;">-->
    <nav class="navbar navbar-default navbar-fixed-top" style="border-width: 0 0 2px;padding-bottom:2px; ">  
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!--<a class="navbar-brand" href="#">Project name</a>-->
          <img src="assets/img/header2.png"  alt="" class="img-responsive">
        </div>

        <div style="display: inline-block; vertical-align: middle;margin-left: 30px;">  
          <img src="assets/img/logo.png"  alt="" class="img-responsive">
        </div> 
        <div id="navbar" class="navbar-collapse collapse navbar-right">
            <div id="menu" style="display:none">
                <ul class="nav navbar-nav navbar-right">
                  <!--<li class="active"><a href="#">OpciÃ³n1</a></li>-->
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="fa fa-folder" style="color: #00A6CA"></span> Programas de Crédito<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li id="programas"><a href="#" ><span class="fa fa-folder"></span> Condiciones Financieras</a></li>
                    </ul>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="fa fa-users" style="color: #00A6CA"></span> Beneficiarios<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li id="candidatos"><a href="#" ><span class="fa fa-address-book"></span> Contratados</a></li>
                      <li id="bendiv"><a href="#" ><span class="fa fa-id-badge"></span> Diversos</a></li>
                    </ul>  
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="fa fa-book" style="color: #00A6CA"></span> Catálogos<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li id="usuarios"><a href="#" ><span class="fa fa-user"></span> Usuarios</a></li>
                      <li id="niveles"><a href="#" ><span class="fa fa-sort-amount-desc"></span> Niveles</a></li>
                      <li id="delegaciones"><a href="#" ><span class="fa fa-group"></span> Delegaciones</a></li>
                      <li id="autoriza"><a href="#" ><span class="fa fa-pencil-square-o "></span> Autoriza</a></li>
                      <li id="firmantes"><a href="#" ><span class="fa fa-pencil-square-o"></span> Firmantes</a></li>
                      <li id="modrecaudacion"><a href="#" ><span class="fa fa-window-restore"></span> Modulos Recaudación</a></li>

                      <li role="separator" class="divider"></li>
                      <li class="dropdown-header">Tasas Financieras</li>
                      <li id="cpp"><a href="#" ><span class="fa fa-dollar"></span> CPP</a></li>
                      <li id="salmin"><a href="#" ><span class="fa fa-dollar"></span> Salarios Minimos</a></li>
                      <li id="salmindf"><a href="#" ><span class="fa fa-dollar"></span> Salarios Minimos DF</a></li>
                      <li role="separator" class="divider"></li>
                      <li class="dropdown-header">Claves de Movimiento</li>
                      <li id="clavemov"><a href="#" ><span class="fa fa-file-text"></span> Claves de Movimiento</a></li>
                      <li id="clvdiv"><a href="#" ><span class="fa fa-tag"></span> Claves de Movimientos Diversos</a></li>
                      <li role="separator" class="divider"></li>
                      <li id="emisores"><a href="#" ><span class="fa fa-podcast"></span> Emisores</a></li>
                      <li id="caja"><a href="#" ><span class="fa fa-bank"></span> Cajas</a></li>
                      <li role="separator" class="divider"></li>
                      <li id="tipocredito"><a href="#" ><span class="fa fa-credit-card-alt"></span> Tipos de Crédito</a></li>
                      <li id="banco"><a href="#" ><span class="fa fa-bank"></span>Bancos</a></li>
                      <li id="bonificacion"><a href="#" ><span class="fa fa-handshake-o"></span> Bonificaciones</a></li>
                      <li id="colonia"><a href="#" ><span class="fa fa-building"></span> Colonias</a></li>
                      <li id="localidades"><a href="#" ><span class="fa fa-map-marker"></span> Localidades</a></li>

                    </ul>
                  <li id="logout"><a href="#r"><span class="fa fa-power-off"></span> Cerrar sesión</a></li>

                </ul>
                
             <div style="text-align:right;font-size:10px;">
                <p id="datosUsuario">
                    <span class="fa fa-user" style="color: #000; padding: 5px; font-size:14px"></span>
                </p>
            </div>
            </div>
        

        </div>
        
    </div><!--/.nav-collapse -->

    </nav>
    <!-- Main component for a primary marketing message or call to action -->
    <div class="container" style="padding-left:0px;padding-right:0px;">
     
      <div class="show" id="show"> <!-- SecciÃ³n principal para renderizar-->
        <!--<div class="container" style="text-align: center;padding-top: 50px;">
            <img src="assets/img/logo-qroo_gris_50_25.png" class="img-responsive" alt="Imagen de fondo">
        </div>-->
      </div>

    </div> <!-- /container -->

    <div class="container" style="background-color:#00A6CA;border-radius:6px; margin-bottom:5px;">
	<div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12">

		<div class="col-lg-4-fondo">
                    Secretaría de Desarrollo Urbano y vivienda</br>
                    Gobierno del Estado de Quintana Roo.</br>
                    Administración 2016-2022.</br>
                    Av. Álvaro Obregón #474 Col. Centro C.P.77000</br>
                    <a href="http://seduvi.qroo.gob.mx" target="_blank" style="text-decoration:none;color:#384452">http://seduvi.qroo.gob.mx</a>
		</div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12">

		<p style="text-align:center;padding-top:30px;font-size:2em;">
                    <!--<a href="#"><i class="fa fa-dribbble"></i></a>-->
                    <a href="https://www.facebook.com/SEDUVI" target="_blank"><i class="fa fa-facebook" style="color:#ffffff;"></i></a>
                    <i></i>
                    <a href="https://twitter.com/SEDUVIQROO" target="_blank"><i class="fa fa-twitter" style="color:#ffffff;"></i></a>

		</p>
            </div>

 	</div><!--/row -->
    </div><!--/container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
    <!-- Librerias javaScript de la aplicacion tramites -->
    <script type="text/javascript" language="JavaScript" src="assets/js/script_cobranza.js"></script>
    <script src="assets/js/jquery.confirm.js"></script>
    
  
    <script type="text/javascript" charset="utf-8" src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
           
    <script> //Script para definir las área en donde se cargará el contenido
            $(document).ready(function(){
                //Cuando el doom esté cargado llamar a login
                cargar('controladorusuario?operacion=nuevoLogin','#show');
                
                //Logout
                $("#logout").click(function (event) {
                    event.preventDefault();
                    cargar('controladorusuario?operacion=logout','#show');
                });
                
            
                //Menu colgante: Catálologos
                $("#usuarios").click(function (event) {
                    
                    event.preventDefault();
                    cargar('controladorusuario?operacion=listar','#show');
                });
                
                $("#niveles").click(function (event) {
                    
                    event.preventDefault();
                    cargar('controladornivel?operacion=listar','#show');
                });
                
                $("#delegaciones").click(function (event) {
                    event.preventDefault();
                    cargar('controladordelegacion?operacion=listar','#show');
                });
                
                $("#autoriza").click(function (event) {
                    event.preventDefault();
                    cargar('controladorautoriza?operacion=listar','#show');
                });
                
                $("#salmin").click(function (event) {
                    
                    event.preventDefault();
                    cargar('controladorsalmin?operacion=listar','#show');
                });
                
                $("#salmindf").click(function (event) {
                    
                    event.preventDefault();
                    cargar('controladorsalmindf?operacion=listar','#show');
                });
                
                $("#caja").click(function (event) {
                    
                    event.preventDefault();
                    cargar('controladorcaja?operacion=listar','#show');
                });
                
                $("#emisores").click(function (event) {
                    
                    event.preventDefault();
                    cargar('controladoremisor?operacion=listar','#show');
                });
                
                $("#consultar").click(function (event) {
                    event.preventDefault();
                    cargar('controladorregistro?operacion=listar','#contenido');
                });
                
                $("#cpp").click(function (event) {
                    event.preventDefault();
                    cargar('controladorcpp?operacion=listar','#show');
                });
                
                $("#tipocredito").click(function (event) {
                    event.preventDefault();
                    cargar('controladortipocredito?operacion=listar','#show');
                });
                
                $("#banco").click(function (event) {
                    event.preventDefault();
                    cargar('controladorbanco?operacion=listar','#show');
                });
                
                $("#bonificacion").click(function (event) {
                    event.preventDefault();
                    cargar('controladorbonificacion?operacion=listar','#show');
                });
                
                $("#colonia").click(function (event) {
                    event.preventDefault();
                    cargar('controladorcolonia?operacion=listar','#show');
                });
                

                $("#clavemov").click(function (event) {
                    event.preventDefault();
                    cargar('controladorclavemov?operacion=listar','#show');
                });
                
                $("#clvdiv").click(function (event) {
                    event.preventDefault();
                    cargar('controladorclavediversos?operacion=listar','#show');

                });
                

                $("#firmantes").click(function (event) {
                    event.preventDefault();
                    cargar('controladorfirmantes?operacion=listar','#show');
                    
                });

                $("#localidades").click(function (event) {
                    event.preventDefault();
                    cargar('controladorlocalidad?operacion=listar','#show');

                });
                
                $("#modrecaudacion").click(function (event) {
                    event.preventDefault();
                    cargar('controladormodrec?operacion=listar','#show');

                });
                $("#candidatos").click(function (event) {
                    event.preventDefault();
                    cargar('controladorcandidato?operacion=listar','#show');

                });
                
                $("#programas").click(function (event) {
                    event.preventDefault();
                    cargar('controladorprogramas?operacion=listar','#show');

                });
                
                $("#reportes").click(function (event) {
                    event.preventDefault();
                    cargar('scr_reports.jsp','#contenido');
                });
                
                // Menu colgante: Beneficiarios
                $("#bendiv").click(function (event) {
                event.preventDefault();
                cargar('controladorbendiv?operacion=listar','#show');
                });
            });
            
            
            function cargar(seccion, div){
                
                $.post(seccion, function(datos){
                    $(div).html(datos);
                });
            }
            
            //window.addEventListener("load", cargar('fondo.html','#contenido') , false);
            
    </script>
  </body>
</html>
