<%-- 
    Document   : scr_consulta
    Created on : 27/11/2013, 09:49:17 AM
    Author     : Ismael García Hernández (igh1@hotmail.com)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>scr_reports</title>
        <link rel="stylesheet" href="css/ui-lightness/jquery-ui-1.10.4.custom.min.css">
        
        <!-- framework jquery -->
        <script type="text/javascript"  src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <style> .datepicker{}</style>
        <script>
            $(function() {
                $( "#tabs" ).tabs();
                
                $(":button").click(function(event) 
                {  
                   
                   event.preventDefault();  
                    var url = $(this).attr('value');
                    
                    
                    $.post(url,  function(resultado) 
                    {  
                        $('#contenido').html(resultado);
                        
                    });  
                });
            });
                        
        </script>
    </head>
    <body>
        
        <div id="reports">
            <h1>Reportes de sistema</h1>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
        
        <div id="tabs">
            <ul>
              <li><a href="#rep-operacionales">Reportes Operacionales</a></li>
              <li><a href="#rep-administrativos">Reportes Administrativos</a></li>

            </ul>
            <div id="rep-operacionales">
                <table class="reportes">
                    <tbody>
                        <tr>
                            <td width="30%">
                                <button value="controladorreportes?operacion=frm_reportesolicitudes" id="rep_solicitudes" >

                                        <img src="imagenes/reporte_solicitudes.png" class="btn-report" alt="Primer Reporte"/>
                                        <p>Solicitudes</p>
                                </button>
                            </td>
                            <td width="30%">
                                <button value="controladorreportes?operacion=frm_reporteseguimientos" id="rep_seguimientos"> 
                                        <img src="imagenes/reporte_seguimiento.png" class="btn-report" alt="Reporte de seguimientos a solicitudes"/>
                                        <p>Seguimiento</p>
                                        

                                </button>
                            </td>
                            <td width="30%">
                                <button value="controladorreportes?operacion=frm_reporteadjuntos" id="rep_adjuntos"> 
                                        <img src="imagenes/reporte_adjuntos.png" class="btn-report" alt="Reporte de adjuntos a seguimientos" />
                                        <p>Adjuntos</p>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%">
                                <button value="controladorregistro?operacion=localizar&id_solicitud=${solicitudes.id_solicitud}" id="editar" 
                                        titulo="Confirme la edición." mensaje="Está Ud. seguro de editar esta solicitud!">
                                        <img src="imagenes/editar.png" class="btn-report" />
                                        <p>Cuarto Reporte</p>
                                </button>
                            </td>
                            <td width="30%">
                                <button value="controladorregistro?operacion=localizar&id_solicitud=${solicitudes.id_solicitud}" id="editar" 
                                        titulo="Confirme la edición." mensaje="Está Ud. seguro de editar esta solicitud!">
                                        <img src="imagenes/editar.png" class="btn-report" />
                                        <p>Quinto Reporte</p>
                                </button>
                            </td>
                            <td width="30%">
                                <button value="controladorregistro?operacion=localizar&id_solicitud=${solicitudes.id_solicitud}" id="editar" 
                                        titulo="Confirme la edición." mensaje="Está Ud. seguro de editar esta solicitud!">
                                        <img src="imagenes/editar.png" class="btn-report" />
                                        <p>Sexto Reporte</p>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="rep-administrativos">
              <table class="reportes">
                    <tbody>
                        <tr>
                            <td width="30%">
                                <button value="controladorreportes?operacion=frm_reporteusuarios" id="rep_usuarios" >
                                        <img src="imagenes/myspace alt2122.png" class="btn-report"  title="Usuarios Sistema"/>
                                        <p>Usuarios de sistema</p>
                                </button>
                            </td>
                            <td width="30%">
                                <button value="controladorreportes?operacion=frm_reportetramites" id="rep_tramites">
                                        <img src="imagenes/listar.png" class="btn-report"  title="Trámites por Subsecretaría"/>
                                        <p>Trámites por Subsecretaría</p>
                                </button>
                            </td>
                            <td width="30%">
                                <button value="controladorregistro?operacion=localizar&id_solicitud=${solicitudes.id_solicitud}" id="editar" 
                                        titulo="Confirme la edición." mensaje="Está Ud. seguro de editar esta solicitud!">
                                        <img src="imagenes/requisitos.png" class="btn-report" title="Requisitos"/>
                                        <p>Requisitos por Trámite</p>
                                </button>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
            
        </div>
        
    </body>
</html>
