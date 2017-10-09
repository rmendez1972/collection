<%-- 
    Document   : frm_reporteusuarios
    Created on : 06/06/2014, 03:08:25 PM
    Author     : Rafael Mendez Asencio
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="javabeans.UnidadAdministrativa"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javabeans.Solicitante"%>
<%@page import="javabeans.Solicitud"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>frm_reportesolicitudes</title>
        <link rel="stylesheet" href="css/ui-lightness/jquery-ui-1.10.4.custom.min.css">
        <style>
            .ui-tooltip, .arrow:after {
              background: cadetblue;
              border: 2px solid white;
            }
            .ui-tooltip {
              padding: 10px 20px;
              color: white;
              border-radius: 20px;
              font: bold 14px "Helvetica Neue", Sans-Serif;
              text-transform: uppercase;
              box-shadow: 0 0 7px black;
            }
            .arrow {
              width: 70px;
              height: 16px;
              overflow: hidden;
              position: absolute;
              left: 50%;
              margin-left: -35px;
              bottom: -16px;
            }
            .arrow.top {
              top: -16px;
              bottom: auto;
            }
            .arrow.left {
              left: 20%;
            }
            .arrow:after {
              content: "";
              position: absolute;
              left: 20px;
              top: -20px;
              width: 25px;
              height: 25px;
              box-shadow: 6px 5px 9px -9px black;
              -webkit-transform: rotate(45deg);
              -moz-transform: rotate(45deg);
              -ms-transform: rotate(45deg);
              -o-transform: rotate(45deg);
              tranform: rotate(45deg);
            }
            .arrow.top:after {
              bottom: -20px;
              top: auto;
            }
        </style>
        
        
        
        <!-- framework jquery -->
        <script type="text/javascript"  src="js/jquery-1.7.2.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
        
        
        <script type="text/javascript">
            $(function()
            {
                
                
                
                //agregando tooltips para los que tienen title
               /* $( document ).tooltip({
                    position: {
                      my: "center bottom-20",
                      at: "center top",
                      using: function( position, feedback ) {
                        $( this ).css( position );
                        $( "<div>" )
                          .addClass( "arrow" )
                          .addClass( feedback.vertical )
                          .addClass( feedback.horizontal )
                          .appendTo( this );
                      }
                    }
                });*/
                
                
                $( "input[type=submit], button, input[type=reset] " ) // estilo de botones con jquery-ui
                    .button()
                    .click(function( event ) {
                        //event.preventDefault();
                });
                
                
                
                
                
                function runEffect() {
                    
                    // get effect type from
                    var selectedEffect = "slide";

                    // most effect types need no options passed by default
                    var options = {};
                    // some effects have required parameters
                    if ( selectedEffect === "scale" ) {
                      options = { percent: 100 };
                    } else if ( selectedEffect === "size" ) {
                      options = { to: { width: 280, height: 185 } };
                    }

                    // run the effect
                    $( "#divimprimiendo" ).show( selectedEffect, options, 1000, callback );
                };

                //callback function to bring a hidden box back
                function callback() {
                  setTimeout(function() {
                    $( "#divimprimiendo p" ).text('Reporte generado en PDF');
                  }, 5000 );
                };
                
                
                $("form#frm_reporteusuarios").submit(function(event)
                {
                    event.preventDefault();
                    
                    runEffect();
                    var mshow= document.getElementById('show');
                    mshow.style.display="block";
                    var mid_grupo=$('#id_grupo').val();
                    var mid_unidadadministrativa=$('#unidadadtva').val();
                    //alert('Reporte Generado Exitosamente');
                    
                    $.ajax(
                    {
                        
                        url: $('#show').attr('src','controladorreportes?operacion=usuarios&id_grupo='+mid_grupo+'&id_unidadadministrativa='+mid_unidadadministrativa),
                        type: 'POST',
                        data: $(this).serialize(),
                        async: false,
                        success: function (resultado) 
                        {
                            
                            $('#frm_reporteusuarios').css('display','none');
                              
                        },
                        beforeSend: function()
                        {
                            
                            
                        },
                        cache: false,
                        contentType: false,
                        processData: false
                    });
                    var mfrm_reporteusuarios= document.getElementById('frm_reporteusuarios');
                    mfrm_reporteusuarios.style.display="none";
                    return false;

                });
                
                
           });
            
            
        </script>
        
    </head>
    
    
       
    <body>
        <h1>Reporte de Usuarios</h1>
        <secttion id="wrapper_frm_reportes">
            <form name="frm_reporteusuarios" id="frm_reporteusuarios"  >
            <fieldset>
                <legend>Parametriza tu reporte</legend>
                
                <p><label for="unidadadtva">Subsecretaría:</label> 
                        <select name="unidadadtva" id="unidadadtva" title="Seleccione la Unidad Adtva.">
                            <option value="" selected="selected" >Selecciona una opción del catálogo...</option>
                            <c:forEach  var="ua" items="${requestScope.ua}">
                                <option  required value="${ua.id_unidadAdministrativa}">${ua.nombre}</option>
                            </c:forEach>
                        </select>
                </p>
                
                <p><label for="id_grupo">Nivel Usuario:</label>
                        <select name="id_grupo" id="id_grupo" title="Seleccione un nivel de usuario...">
                            <option value="" selected="selected">Todos los niveles...</option>
                            <c:forEach  var="grupos" items="${requestScope.gp}">
                                <OPTION VALUE="${grupos.id_grupo}">${grupos.nombre}</OPTION>
                            </c:forEach>
                        </select>
                </p>
                <p><input type="submit" id="imprimir" value="Imprimir"  /><input type="reset" value="Cancelar" class="frm-btn" /></p>
            </fieldset>    
            </form>
        
        </section>
        
        <div id="divimprimiendo" class="divimprimiendo"><p>Generando Reporte ...</p></div>
        <!--<iframe  name="show" id="show" align="middle" frameborder="0" marginwidth="0" marginheight="0" width="95%" height="85%" scrolling="no"  title="En la parte superior derecha boton para imprimir..." style="display:none; margin: 10px" ></iframe>-->
    </body>
</html>
