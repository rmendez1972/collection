<%-- 
    Document   : listaradjunto
    Created on : 21/11/2013, 02:32:54 PM
    Author     : Rafael Mendez
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        
        <!-- framework jquery -->
        <script type="text/javascript" language="JavaScript" src="js/jquery-1.7.2.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/jquery.tablesorter.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/jquery.confirm.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/script_confirm.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" type="text/css" href="css/estilos.css"/>!-->
        
        <!--Estilos!-->
	<link rel="stylesheet" type="text/css" href="css/estilos.css"/> 
       
        <title>Listado de Seguimientos</title>
        
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
                   titulo=$(this,"button").attr("titulo");//Se obtiene el id del botón para presentarlo como titulo del confirm
                   logo=$(this,"button").attr("id");
                   mensaje=$(this,"button").attr("mensaje");
                     

                   var url = $(this).attr('value'); //Obteniendo la opcion que ejecutará el controlador.
                   
                   //Invocamos al confirm personalizado pasandole parametros
                   confirma(url, titulo,mensaje,logo,
                                function(url)
                                {
                                    $.post(url,function(resultado) 
                                    {  
                                        $('#contenido').html(resultado);  
                                    });
                                    return true;
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
                    <h1>Listado de Adjuntos del Seguimiento</h1>
                    <p style="padding:0.1em"><strong>Núm. Solicitud: </strong>${solicitud.id_solicitud}</p>
                    <p style="padding:0.1em"><strong>Tramite: </strong>${tramite.nombre}</p>
                    <p style="padding:0.1em"><strong>Solicitante:</strong> ${solicitante.nombre} ${solicitante.apellido_paterno} ${solicitante.apellido_materno}</p>
                    <p style="padding:0.1em"><strong>Subsecretaría: </strong>${tramite.unidadAdministrativa}</p>
                    <p style="padding:0.1em"><strong>Dirección:</strong> ${tramite.direccion}</p><br>
                    <p style="padding:0.1em"><strong>Seguimiento:</strong> ${seguimiento.observaciones}</p>
                    <p style="padding:0.1em"><strong>Fecha de Seguimiento:</strong> ${seguimiento.fecha}</p>
                </td>
                <td width="20%" align="right"> 
                    <div class="btn-catalogo">
                        <a href="controladoradjunto?operacion=imprimir&id_seguimiento=${seguimiento.id_seguimiento}" target="new"><img  src="imagenes/reportesb.png"  width="30" height="30"alt="Imprimir"/><p>Imprimir</p></a>
                    </div>
                    
                    
                </td>
            </tr>
             
        </table>
        
        <table id="adjuntos"  class="tablesorter" width="98%">
            <thead>
                <tr><th><strong>Nombre del Archivo Adjunto</strong></th><th></th><th><strong>Usuario que Adjunta</strong></th></tr>
            </thead>
            <tbody>
                <c:forEach var="adjunto" items="${requestScope.adjuntos}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}"> 
                        <c:if test="${adjunto.nombreusuario != 'CIUDADANO'}">
   

                            <td width="65%"><a href="${requestScope.pathadjuntos}${adjunto.nombre}" download="${adjunto.nombre}" ><c:out value="${adjunto.nombre}" /></a></td> 
                            <td width="5%"><a href="${requestScope.pathadjuntos}${adjunto.nombre}" download="${adjunto.nombre}" ><img src="imagenes/download.png" width="26px" height="26px" style="text-align:right"/></a></td> 
                                                
                        </c:if>
                            
                        <c:if test="${adjunto.nombreusuario == 'CIUDADANO'}">
   

                            <td width="65%"><a href="${requestScope.pathuploads}${adjunto.nombre}" download="${requestScope.pathuploads}${adjunto.nombre}" ><c:out value="${adjunto.nombre}" /></a></td> 
                            <td width="5%"><a href="${requestScope.pathuploads}${adjunto.nombre}" download="${requestScope.pathuploads}${adjunto.nombre}" ><img src="imagenes/upload.png" width="26px" height="26px" style="text-align:right"/></a></td> 
                                                
                        </c:if>
                            
                        
                        <td width="30%"><c:out value="${adjunto.nombreusuario}" /></td> 
                       
                    </tr>

                </c:forEach>
           </tbody>
        </table>

    </center>
    </body>
</html>
