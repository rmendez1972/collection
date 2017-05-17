<%-- 
    Document   : frm_reportesolicitudes
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
        <!--<link rel="stylesheet" href="css/ui-lightness/jquery-ui-1.10.4.custom.min.css">-->
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
        <script type="text/javascript"  src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script type="text/javascript" src="js/fechaActual.js"></script>
        
        <script type="text/javascript">
            
            
            $(document).ready(function()
            {
               
                
                
                //agregando tooltips para los que tienen title
                /*$( document ).tooltip({
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
                
                
                //evento change del selector unidadadtva
                $("#unidadadtva").change(function()
                {
                    //la respuesta viene del servlet tramites2
                    $.getJSON("tramites2", 
                    {
                        //evaluar el id de unidad administrativa del lado del modelo
                        id_unidadAdministrativa: $(this).val(),    
                        ajax: 'true'
                    },
                    function(data)
                    {
                                                
                        //limpiamos el selector para poblar
                        $("#tramites").find('option').remove();
                        $("#tramites").append('<option value="">'+'Selecciona una opción del catálogo...'+'</option>');
                        $.each(data.Tramites, function(i,item){
                            $("#tramites").append("<option value='"+item.id_tramite+"'>"+item.nombre+"</option>");
                        });
                    });
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
                    $( "#divimprimiendo" ).show( selectedEffect, options, 2000, callback );
                };

                //callback function to bring a hidden box back
                function callback() {
                  setTimeout(function() {
                    $( "#divimprimiendo p" ).text('Reporte generado en PDF');
                  }, 5000 );
                };
                
                
                $("form#frm_reportesolicitudes").submit(function(event)
                {
                    event.preventDefault();
                    $(":submit",this).attr("disabled", "disabled"); //desactivo el submit para no reenviar
                    runEffect();
                    var mshow= document.getElementById('show');
                    mshow.style.display="block";
                    var mid_status=$('#id_status').val();
                    var mfecha_inicial=$('#fecha_inicial').val();
                    var mfecha_final=$('#fecha_final').val();
                    var mid_unidadadministrativa=$('#unidadadtva').val();
                    var mid_tramite=$('#tramites').val();
                    //$('#divimprimiendo').show();
                    if ((mid_status==null) || (mid_status==""))mid_status=0;
                    if ((mid_unidadadministrativa==null) || (mid_unidadadministrativa==""))mid_unidadadministrativa=0;
                    if ((mid_tramite==null) || (mid_tramite==""))mid_tramite=0;
                    
                    var controlador="controladorreportes?operacion=solicitudes&id_unidadadministrativa="+mid_unidadadministrativa+"&id_status="+mid_status+"&fecha_inicial="+mfecha_inicial+"&fecha_final="+mfecha_final+"&id_tramite="+mid_tramite;
                    
                    
                    $.ajax(
                    {
                    
                        url: $('#show').attr('src',controlador),
                        type: 'GET',
                        data: $(this).serialize(),
                        async: false,
                        success: function (resultado) 
                        {
                        
                              
                        },
                        beforeSend: function()
                        {
                            
                            
                        },
                        cache: false,
                        contentType: false,
                        processData: false
                    });
                    var mfrm_reportesolicitudes= document.getElementById('frm_reportesolicitudes');
                    mfrm_reportesolicitudes.style.display="none";
                    return false;

                });
                
                //alert('apunto de aplicar datepicker..');
                //$('#fecha_inicial').datepicker();
                //$('#fecha_final').datepicker(); 
                
                
           });
           document.getElementById('fecha_inicial').value=fechaActual();  
           document.getElementById('fecha_final').value=fechaActual();  
        </script>
        
    </head>
    
    
       
    <body>
        <h2>
          <img src="imagenes/reporte_solicitudes.png" width="42" height="42"/>
          Reporte de Solicitudes
        </h2>
        <secttion id="wrapper_frm_reportes">
            <form name="frm_reportesolicitudes" id="frm_reportesolicitudes"  >
            <fieldset>
                <legend>Parametriza tu reporte</legend>
                <p><label for="fecha_inicial">Fecha Inicial:</label> <input id="fecha_inicial"  name="fecha_inicial" type="date"  title="Ingresa fecha inicial de registro de la solicitud" required><label for="fecha_final">Fecha Final:</label> <input id="fecha_final"  name="fecha_final" type="date"  title="Ingresa fecha final de registro de la solicitud" required></p>
                    <p><label for="unidadadtva">Subsecretaría:</label> 
                        <select name="unidadadtva" id="unidadadtva">
                            <option value="" selected="selected" >Selecciona una opción del catálogo...</option>
                            <c:forEach  var="ua" items="${requestScope.ua}">
                                <option  required value="${ua.id_unidadAdministrativa}">${ua.nombre}</option>
                            </c:forEach>
                        </select>
                    </p>
                    <p><label for="tramites">Trámite:</label>
                        <select name="tramites" id="tramites">
                            <option value="" selected="selected">Selecciona una opción del catálogo...</option>
                        </select>
                    </p>
                    <p><label for="id_estatus">Estatus del Trámite:</label>
                        <select name="id_status" id="id_status">
                            <option value="" selected="selected">Todos los estatus...</option>
                            <c:forEach  var="status" items="${requestScope.status}">
                                <OPTION VALUE="${status.id_status}">${status.nombre}</OPTION>
                            </c:forEach>
                        </select>
                    </p>
                    <p><input type="submit" id="imprimir" value="Imprimir"  /><input type="reset" value="Cancelar" class="frm-btn" /></p>
            </fieldset>    
        </form>
        
        </section>
        
        <div id="divimprimiendo" class="divimprimiendo"><p>Generando Reporte ...</p></div>
        <!--<iframe  name="show" id="show" align="middle" frameborder="0" marginwidth="0" marginheight="0" width="95%" height="85%" scrolling="no"  title="En la parte inferior derecha boton para imprimir..." style="display:none; margin: 10px" ></iframe>-->    
    </body>
</html>
