<%-- 
    Document   : listarseguimiento
    Created on : 21/11/2013, 02:32:54 PM
    Author     : Rafael Mendez
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <!--<link href="css/estilos.css" rel="stylesheet" type="text/css">!-->
        
        <!-- framework jquery -->
        <script type="text/javascript" language="JavaScript" src="js/jquery-1.7.2.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/jquery.tablesorter.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
        <title>Listado de Solicitudes</title>
        
        <script>
            /*variable que trae la bandera de exito o fracaso del modelo*/
            var mensaje='${requestScope.mensaje}';
            if (mensaje!=null)
            {
                alert (mensaje);
            }
            
            
            $(document).ready(function(){         
                $("#seguimientos").tablesorter();
                
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
        <center> 
        
        <br>
        <table border=0 width="98%">
            <tr>
                <td width="80%" align="left"> 
                    <h1>Listado de Seguimientos de la Solicitud</h1>
                    <p style="padding:0.1em"><strong>Núm. Solicitud: </strong>${solicitud.id_solicitud}</p>
                    <p style="padding:0.1em">Tramite: ${tramite.nombre}</p>
                    <p style="padding:0.1em">Solicitante: ${solicitante.nombre} ${solicitante.apellido_paterno} ${solicitante.apellido_materno}</p>
                    <p style="padding:0.1em">Subsecretaría: ${tramite.unidadAdministrativa}</p>
                    <p style="padding:0.1em">Dirección: ${tramite.direccion}</p>
                </td>
                <td width="20%" align="right"> 
                    <div class="btn-catalogo">
                        <a href="controladorseguimiento?operacion=imprimir&id_solicitud=${solicitud.id_solicitud}" target="new"><img  src="imagenes/reportesb.png"  width="30" height="30"alt="Imprimir"/><p>Imprimir</p></a>
                    </div>
                    
                    
                </td>
            </tr>
             
        </table>
        
        <table id="seguimientos"  class="tablesorter" width="98%" >
            <thead>
                <tr><th >Fecha de Seguimiento</th><th>Observaciones</th><th>Usuario que Reporta</th><th>Adjuntos?</th><th>Estatus</th><th>Acciones</th></tr>
            </thead>
            <tbody>
                <c:forEach var="seguimientos" items="${requestScope.seguimientos}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}"> 
                        <td width="25%"><c:out value="${seguimientos.fecha}" /></td> <td width="45%"><c:out value="${seguimientos.observaciones}" /></td> <td width="15%"><c:out value="${seguimientos.usuario}" /></td><c:choose>
                             <c:when test="${seguimientos.adjunto==true}">
                                    <td width="10%" style="font-size: 8px;text-align:center"><img src="imagenes/ok.png"    title="seguimiento con archivos adjuntos"/></td>
                            </c:when>
                                    
                            <c:when test="${seguimientos.adjunto==false}">
                                    <td width="10%" style="font-size: 8px;text-align:center"><img src="imagenes/mal.png"   title="seguimiento sin archivos adjuntos"/></td>
                            </c:when>
                                    
                                
                                        
                        </c:choose><td width="10%"><c:out value="${seguimientos.estatus}" /></td>  
                        <td width="5%">
                            
                            <button value="controladoradjunto?operacion=listar&id_seguimiento=${seguimientos.id_seguimiento}" id="listar" titulo="Confirme el listado de adjuntos" mensaje="Está Ud. seguro de listar los adjuntos de este seguimiento!">
                                <img src="imagenes/adjunto.png" class="btn-tabla"  alt="Listar" title="listar adjuntos del seguimiento"/>
                            </button>    
                            
                        </td>
                    </tr>

                </c:forEach>
                
           </tbody>
        </table>

    </center>
    </body>
</html>
