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
            var mensaje='${requestScope.mensaje}';
            if (mensaje!=null)
            {
                alert (mensaje);
            }
            
            
            function localizarTramite(msolicitud) //Recibe parametro del inputText
            {
                   if (msolicitud==""){
                       message="El numero de solicitud no puede ser nulo, esscriba un número válido";
                   }
                   else{
                      message="Solo se aceptan datos numericos enteros y mayores a cero";
                   }
                   
                   if (msolicitud!="" && parseInt(msolicitud)>0)//No null y que sea enteros mayores a 0
                   {
                        
                        //localiza=document.getElementById("buscar").value='controladorregistro?operacion=localizar&id_solicitud='+msolicitud; /*document.getElementById("mns").value;*/
                        localiza=('controladorregistro?operacion=listarId&id_solicitud='+msolicitud);
                        $.post(localiza,function(resultado)
                        {
                            $('#contenido').html(resultado);
                        },'html');
                    }
                    else
                        {
                            alert(message+'<br/><img src="imagenes/cancelar.png">');
                        }
            }//Fin de la función localizarTramite
            
            
            
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
                <td width="80%" align="right"> 
                    <h1>Listado de Solicitudes</h1>
                    <p style="padding:0.1em;">Subsecretaría:  ${nombreunidadadministrativa}</p>
                    <p style="padding:0.1em;">Dirección:  ${direccion}</p>
                </td>
                <td width="20%" align="right">
                    <div class="btn-catalogo">
                        <a href="controladorregistro?operacion=imprimir" target="new"><img src="imagenes/reportesb.png" width="30" height="30" alt="Imprimir"/><p>Imprimir</p></a>
                    </div>
                    <!--Icono para buscar con efecto visual ocultar al hacer click #buscar y visualizar el div de busqueda #buscar2!-->
                    <div class="btn-catalogo" id="buscar" onclick="$('#buscar').fadeOut('slow');$('#buscar2').fadeIn('slow');">
                        <a href="#"><img src="imagenes/buscar.png" width="35" height="35" alt="Imprimir"/><p>buscar</p></a>
                    </div>
                </td>
                
            </tr>
             
        </table>
       
        <div id="buscar2" style="display: none;width: 100%">
            
            <table border="0" widht="100%">
                <tr><td width="20px"></td>
                    <td width="200px"><p>Introduce Núm. solicitud:</p></td>
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
            <tr><th width="5%">Núm. Solicitud</th><th width="8%">Ingreso</th><th width="15%">Subsecretaría</th><th width="25%">Trámite</th><th width="4%">Dias Resolución</th>
                    <th width="3%">Días Restantes</th><th width="20%">Solicitante</th><th  width="3%">Estatus</th><th width="17%">Acciones</th></tr>
            </thead>
            <tbody>
                <c:forEach var="solicitudes" items="${requestScope.solicitudes}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td width="5%"><span class="badge"><c:out value="${solicitudes.id_solicitud}"/></span></td> 
                        <td width="8%"><c:out value="${solicitudes.fecha_ingreso}"/></td> 
                        <td width="15%"><c:out value="${solicitudes.unidadadministrativa}" /></td> 
                        <td width="25%"><c:out value="${solicitudes.tramite}" /></td>
                        <td width="4%"> <span class="badge"><c:out value="${solicitudes.dias_resolucion}" /></span></td>
                        <td width="3%" style="text-align: right">
                            <c:set var="dias_restantes" value="${solicitudes.dias_resolucion-solicitudes.dias_diferencia}"/>

                            <c:if test="${dias_restantes>5}">
                                <div style="font-size: 16px"> 
                                    <span class="label label-info label-as-badge"><c:out value="${dias_restantes}" /></span>
                               </div> 
                            </c:if>
                            
                            <c:if test="${dias_restantes>=1 && dias_restantes<=5}">
                               <div style="font-size: 16px"> 
                                    <span class="label label-warning label-as-badge"><c:out value="${dias_restantes}" /></span>
                               </div> 
                            </c:if>
                            
                            <c:if test="${dias_restantes<=0}">
                               <div style="font-size: 16px"> 
                                    <span class="label label-danger label-as-badge"><c:out value="${dias_restantes}" /></span>
                               </div> 
                            </c:if>

                        
                        </td> 
                        <td width="20%"><c:out value="${solicitudes.solicitante}" /></td>
                        <c:choose>
                                <c:when test="${solicitudes.status=='TURNADO'}">
                                    <!--<td width="8%" style="font-size: 8px"><div class="statusTurnado"></div><div class="circulo"></div><div class="circulo"></div><c:out value="${solicitudes.status}"/></td>-->
                                    <td width="3%" style="font-size: 8px; text-align: center; color:#FF0000;"><div class="circulo turnado"></div><c:out value="${solicitudes.status}"/></td>
                                </c:when>
                                <c:when test="${solicitudes.status=='TRAMITE'}">
                                    <!--<td width="8%"style="font-size: 8px"><div class="circulo"></div><div class="statusTramite"></div><div class="circulo"></div><c:out value="${solicitudes.status}"/></td>-->
                                    <td width="3%" style="font-size: 8px; text-align: center; color: #FFBF00;"><div class="circulo tramite"></div><c:out value="${solicitudes.status}"/></td>
                                </c:when>
                                <c:when test="${solicitudes.status=='CONCLUIDO'}">
                                    <!--<td width="8%"style="font-size: 8px"><div class="circulo"></div><div class="circulo"></div><div class="statusConcluido"></div><c:out value="${solicitudes.status}"/></td>-->
                                    <td width="3%" style="font-size: 8px; text-align: center; color: #00FF00;"><div class="circulo concluido"></div><c:out value="${solicitudes.status}"/></td>
                                </c:when>
                                    
                                <c:when test="${solicitudes.status=='INCONCLUSO'}">
                                    <!--<td width="8%"style="font-size: 8px"><div class="circulo"></div><div class="circulo"></div><div class="statusConcluido"></div><c:out value="${solicitudes.status}"/></td>-->
                                    <td width="3%" style="font-size: 8px; text-align: center; color:#2E9AFE;"><div class="circulo inconcluso"></div><c:out value="${solicitudes.status}"/></td>
                                </c:when>      
                                <c:when test="${solicitudes.status=='REVERTIDO'}">
                                    <!--<td width="8%"style="font-size: 8px"><div class="circulo"></div><div class="circulo"></div><div class="statusConcluido"></div><c:out value="${solicitudes.status}"/></td>-->
                                    <td width="3%" style="font-size: 8px; text-align: center; color:#8258FA;"><div class="circulo revertido"></div><c:out value="${solicitudes.status}"/></td>
                                </c:when>      
                                    
                                <c:otherwise>
                                    <td width="3%" style="font-size: 8px"><c:out value="${solicitudes.status}"/></td>
                                </c:otherwise>
                            </c:choose>
                        
                       
                        <td width="17%">
                                
                            <button value="controladorseguimiento?operacion=capturar&id_solicitud=${solicitudes.id_solicitud}" id="agregar">
                                <img src="imagenes/agregar.png" class="btn-tabla" alt="Agregar" onClick="return confirm('Va a agregar un registro')" title="Agregar un seguimiento" />
                            </button>
                            
                            <button value="controladorseguimiento?operacion=listar&id_solicitud=${solicitudes.id_solicitud}" id="listar">
                                <img src="imagenes/listar.png" class="btn-tabla"  alt="Listar" title="listar seguimientos de la solicitud"/>
                            </button>
                        </td>
                    </tr>

                </c:forEach>
           </tbody>
        </table>

    </center>
    </body>
</html>
