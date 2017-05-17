<%-- 
    Document   : listarsolicitudes
    Created on : 21/11/2013, 02:32:54 PM
    Author     : Rafael Mendez
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <link href="css/estilos.css" rel="stylesheet" type="text/css">
        
        <!-- framework jquery -->
        <script type="text/javascript" language="JavaScript" src="js/jquery-1.7.2.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/jquery.tablesorter.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Solicitudes</title>
        <style>
          .btn-catalogo{
                width:50px;
              
                background-color: #ef9c00;
                /*border: 1px solid #b6b2b2;}*/
                text-align: center;
                margin-left: 5px;
                padding:5px;
                cursor:pointer;
                float:left;
                opacity: 0.5;
               
            }
            .btn-catalogo:hover{
                /*background-color: #f5f5f5;*/
                opacity: 1;
            }
            .btn-catalogo img{
                width: 23px;
                height: 23px;
            }
          .btn-catalogo p{
                font-size:12px;
                text-align: center;
                color: #000;
            } 
       </style>
        <script>
            /*variable que trae la bandera de exito o fracaso del modelo*/
            var mensajeloc='${requestScope.mensajeloc}';
            if (mensajeloc!=null)
            {
                alert (mensajeloc);
            }
            
            
            $(document).ready(function(){         
                $("#solicitudes").tablesorter();
                
                $(":button").click(function(event) 
                {  
                   event.preventDefault();  
                    var url = $(this).attr('value');
                   // alert ('controlador '+url);
                    
                    $.post(url,  function(resultado) 
                    {  
                        $('#contenido').html(resultado);  
                    });  
                });
                
            }); 
            
        </script>
    </head>
    <body>
        <center> 
        
        <br>
        <table border=0 width="98%">
            <tr>
                <td width="90%" align="right"> 
                    <h1>Listado de Solicitudes</h1>
                    <p style="padding:0.1em"><strong>Núm. Solicitud: </strong>${solicitud.id_solicitud}</p>
                    <p style="padding:0.1em"><strong>Tramite: </strong>${tramite.nombre}</p>
                    <p style="padding:0.1em"><strong>Costo $: </strong>${solicitante.costo}</p>
                    <p style="padding:0.1em"><strong>Solicitante:</strong> ${solicitante.nombre} ${solicitante.apellido_paterno} ${solicitante.apellido_materno}</p>
                    <p style="padding:0.1em"><strong>Subsecretaría: </strong>${tramite.unidadAdministrativa} </p>
                    <p style="padding:0.1em"><strong>Dirección:</strong> ${tramite.direccion}</p>
                </td>
                <td width="8%" align="right">
                    <div class="btn-catalogo">
                        <a href="controladorregistro?operacion=imprimir" target="new"><img src="imagenes/reportesb.png" width="30" height="30" alt="Imprimir"/><p>Imprimir</p></a>
                    </div>
                </td>
                
            </tr>
             
        </table>
       
        <div id="buscar2" style="display: none;width: 100%">
            
            <table border="0" widht="100%">
                <tr><td width="20px"></td>
                    <td width="200px"><p>Introduce núm. solicitud:</p></td>
                    <td width="220px">
                        <input id="mns" type="text" name="id_solicitud" required validate pattern="([0-9]{1,10})" >
                        
                    </td>
                    <td onclick="$('#buscar').fadeIn('slow'); var msolicitud= (document.getElementById('mns').value);localizarTramite(msolicitud);"
                          id="localizar" titulo="Confirme la busqueda." mensaje="Está Ud. seguro de localizar este registro?">
                     <img src="imagenes/buscar.png" class="btn-tabla" alt="localizar" title="localizar solicitud."/>
                   
                       
                    </td>
                    <td> <div style="height:20px;float: bottom" onclick="$('#buscar2').fadeOut('slow');$('#buscar').fadeIn('slow');">
                            <img src="imagenes/cancelar.png" class="btn-tabla" alt="cancelar" title="Cancela búsqueda"/>
                        </div></td>
                </tr>
            </table>
            
         </div>
        
        <table id="solicitudes"  class="tablesorter" width="98%">
            <thead>
            <tr><th>ID</th><th>Ingreso</th><th>Trámite</th><th>Solicitante</th><th>Estatus</th><th>Acciones</th></tr>
            </thead>
            <tbody>
                
                    <tr>
                        <td width="8%"><c:out value="${solicitud.id_solicitud}"/></td> 
                        <td width="8%"><c:out value="${solicitud.fecha_ingreso}"/></td> 
                        <td width="31%"><c:out value="${solicitud.tramite}" /></td> 
                        <td width="31%"><c:out value="${solicitud.solicitante}" /></td>
                        <c:choose>
                <c:when test="${solicitud.id_status=='1'}">
                    <!--<td width="8%" style="font-size: 8px"><div class="statusTurnado"></div><div class="circulo"></div><div class="circulo"></div><c:out value="${solicitudes.status}"/></td>-->
                    <td style="font-size: 14px;text-align: center; color:#FF0000;"><div class="colorturnado circulo turnado"></div>Turnado</td>
                </c:when>
                <c:when test="${solicitud.id_status=='2'}">
                    <!--<td width="8%"style="font-size: 8px;text-align: center;"><div class="circulo"></div><div class="statusTramite"></div><div class="circulo"></div><c:out value="${solicitudes.status}"/></td>-->
                    <td style="font-size: 14px;text-align: center; color:#FFBF00;"><div class="circulo tramite"></div>Tramite</td>
                </c:when>
                <c:when test="${solicitud.id_status=='3'}">
                    <!--<td width="8%"style="font-size: 8px"><div class="circulo"></div><div class="circulo"></div><div class="statusConcluido"></div><c:out value="${solicitudes.status}"/></td>-->
                <td style="font-size: 14px;text-align: center; color:#00FF00;"><div class="circulo concluido"></div>Concluido</td>
                </c:when> 

                <c:when test="${solicitud.id_status=='4'}">
                    <td style="font-size: 14px;text-align: center; color:#2E9AFE;"><div class="circulo inconcluso"></div>Inconcluso</td>
                </c:when> 
                <c:when test="${solicitud.id_status=='5'}">
                <td style="font-size: 14px;text-align: center; color:#8258FA;"><div class="circulo revertido"></div>Revertido</td>
                </c:when>         

                <c:otherwise>
                    <!--<td width="8%" ><c:out value="${solicitud.id_status}"/></td>-->
                </c:otherwise>
            </c:choose>
                        
                       
                        <td width="20%">
                                
                            <button value="controladorseguimiento?operacion=capturar&id_solicitud=${solicitud.id_solicitud}" id="agregar">
                                <img src="imagenes/agregar.png" class="btn-tabla" alt="Agregar" onClick="return confirm('Va a agregar un registro')" title="Agregar un seguimiento" />
                            </button>
                            
                            <button value="controladorseguimiento?operacion=listar&id_solicitud=${solicitud.id_solicitud}" id="listar">
                                <img src="imagenes/listar.png" class="btn-tabla"  alt="Listar" title="listar seguimientos de la solicitud"/>
                            </button>
                        </td>
                    </tr>

                
           </tbody>
        </table>

    </center>
    </body>
</html>
