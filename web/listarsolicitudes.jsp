<%-- 
    Document   : listarsolicitudes
    Created on : 21/11/2013, 02:32:54 PM
    Author     : Rafael Mendez
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE>
<html>
    <head>
        <!-- framework jquery -->
        <script type="text/javascript" language="JavaScript" src="js/jquery-1.7.2.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/jquery.tablesorter.js"></script>
        <script src="js/jquery.confirm.js"></script>
        
        <!-- Librerias javaScript de la aplicacion tramites -->
        <script type="text/javascript" language="JavaScript" src="js/script_tramites.js"></script>
        
        <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Listado de Solicitudes</title>
        

      <script language="javascript">
             /* 
		function doSearch()
		{
			var tableReg = document.getElementById('solicitudes');
                        alert(tableReg);
                        
			//var searchText = document.getElementById('searchTerm').value.toLowerCase();
                        var searchText = "22";
			var cellsOfRow="";
			var found=false;
			var compareWith="";
			
			// Recorremos todas las filas con contenido de la tabla
			for (var i = 1; i < tableReg.rows.length; i++)
			{
				cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
				found = false;
				// Recorremos todas las celdas
				for (var j = 0; j < cellsOfRow.length && !found; j++)
				{
					compareWith = cellsOfRow[j].innerHTML.toLowerCase();
					// Buscamos el texto en el contenido de la celda
					if (searchText.length == 0 || (compareWith.indexOf(searchText) > -1))
					{
						found = true;
                                                //cellsOfRow[j].style.backgroundColor="red";
                                                cellsOfRow[j].style.color="red";
					}
				}
				if(found)
				{
					//tableReg.rows[i].style.display = ''; //backgroundColor="red"
                                        //tableReg.rows[i].style.Color="red"; //backgroundColor="red"
				} else {
					// si no ha encontrado ninguna coincidencia, esconde la
					// fila de la tabla
					tableReg.rows[i].style.display = 'none';
				}
			}
		} */
	</script>
        
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        <script>
            /*variable que trae la bandera de exito o fracaso del modelo*/
            var mensaje='${requestScope.mensaje}';
            if (mensaje!=null )
            {
                alert (mensaje);
            }
            
            function cambia_color(celda,st){//Estatus concluido
              if (st=="CONCLUIDO"){
                   //alert(st+'xx');
                //celda.style.backgroundColor="red";
               }
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
                        localiza=('controladorregistro?operacion=localizar&id_solicitud='+msolicitud);
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

                $("#editar,#eliminar,#listar,#requisitos,#mail, #acuse,#notificacion").click(function(event) //Al oprimir un boton

                { 
                   event.preventDefault();
                   titulo=$(this,"button").attr("titulo");//Se obtiene el id del botón para presentarlo como titulo del confirm
                   logo=$(this,"button").attr("id");
                   mensaje=$(this,"button").attr("mensaje");
                   //document.getElementById("buscar").value='controladorregistro?operacion=localizar&id_solicitud='+document.getElementById("mns").value;
                   var rp=(document.getElementById("buscar").value);
                   var url=(document.getElementById("buscar").value);
                   //alert(rp);  
                   //alert ($(this).attr('value'));
                  var url = $(this).attr('value'); //Obteniendo la opcion que ejecutará el controlador.
                  //alert(url);
              
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
        <table id="menuListarSolicitudes" border=0 width="100%"> <!--Tabla que contendrá el menú de listar solicitudes!-->
            <tr>
                <td width="80%" align="right"><h1>Listado de Solicitudes</h1></td>
                <td width="20%" align="right">
                    <div class="btn-catalogo"> <!--Icono para imprimir!-->
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
                <tr>
                    <th width="5%">Núm. Solicitud</th>
                    <th width="8%">Ingreso</th>
                    <th width="10%">Subsecretaría</th>
                    <th width="15%">Trámite</th>
                    <th width="4%">Dias Resolución</th>
                    <th width="3%">Días Restantes</th>
                    <th width="10%">Solicitante</th>
                    <th width="3%">Estatus</th>
                    
                    <th width="42%">Acciones</th>
                </tr>
            </thead>
            
            <tbody>
                <c:forEach var="solicitudes" items="${requestScope.solicitudes}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td width="5%"><span class="badge"><c:out value="${solicitudes.id_solicitud}"/></span></td> 
                        <td width="8%"><c:out value="${solicitudes.fecha_ingreso}"/></td> 
                        <td width="10%"><c:out value="${solicitudes.unidadadministrativa}" /></td> 
                        <td width="15%"><c:out value="${solicitudes.tramite}" /></td>
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
                        <td width="10%"><a href="#"><c:out value="${solicitudes.solicitante}" /></a></td>
                        
                            <c:choose>
                                <c:when test="${solicitudes.status=='TURNADO'}">

                                    <td width="8%" style="font-size: 8px;text-align: center; color:#FF0000;">
                                        <div class="colorturnado circulo turnado"></div>
                                        <c:out value="${solicitudes.status}"/>
                                    </td>
                                </c:when>
                                <c:when test="${solicitudes.status=='TRAMITE'}">
                                    <td width="8%"style="font-size: 8px;text-align: center; color:#FFBF00;">
                                        <div class="circulo tramite"></div>
                                        <c:out value="${solicitudes.status}"/>
                                    </td>
                                </c:when>
                                <c:when test="${solicitudes.status=='CONCLUIDO'}">
                                    <td width="8%"style="font-size: 8px;text-align: center; color:#00FF00;">
                                        <div class="circulo concluido"></div>
                                        <c:out value="${solicitudes.status}"/>
                                    </td>
                                </c:when> 
                                <c:when test="${solicitudes.status=='INCONCLUSO'}">
                                    <td width="8%"style="font-size: 8px;text-align: center; color:#2E9AFE;">
                                        <div class="circulo inconcluso"></div>
                                        <c:out value="${solicitudes.status}"/>
                                    </td>
                                </c:when> 
                                <c:when test="${solicitudes.status=='REVERTIDO'}">
                                    <td width="8%"style="font-size: 8px;text-align: center; color:#8258FA;">
                                        <div class="circulo revertido"></div>
                                        <c:out value="${solicitudes.status}"/>
                                    </td>
                                </c:when>         
                                <c:otherwise>
                                    <td width="3%" ><c:out value="${solicitudes.status}"/></td>
                                </c:otherwise>
                            </c:choose>
                        
                        <td width="42%">
                            <button value="controladorregistro?operacion=localizar&id_solicitud=${solicitudes.id_solicitud}" id="editar" 
                                    titulo="Confirme la edición." mensaje="Está Ud. seguro de editar esta solicitud!">
                                    <img src="imagenes/editar.png" class="btn-tabla" alt="edicion" title="Editar solicitud"/>
                            </button>
                                                          
                            <button value="controladorregistro?operacion=borrar&id_solicitud=${solicitudes.id_solicitud}" id="eliminar"
                                    titulo="Confirme la eliminación." mensaje="Está Ud. seguro de borrar esta solicitud!">
                                <img src="imagenes/eliminar.png" class="btn-tabla" alt="eliminacion"  title="Eliminar solicitud"/>
                            </button>
                                    
                            <button value="controladorregistro?operacion=enviarcorreosubsec&id_solicitud=${solicitudes.id_solicitud}" id="notificacion"
                                    titulo="Confirme el envío de notificación" mensaje="Está Ud. seguro de enviar la notificación por email!">
                                <img src="imagenes/notificacion.png"  class="btn-tabla" width="24" height="24" alt="Enviar notificación por correo"  title="Enviar notificación por correo"/> 
                            </button> 
                                    
                            <button value="controladorseguimiento?operacion=listar&id_solicitud=${solicitudes.id_solicitud}" id="listar" 
                                    titulo="Confirme listado de seguimiento." mensaje="Está Ud. seguro de listar los seguimientos de esta solicitud!">
                                <img src="imagenes/listar.png" class="btn-tabla" alt="lista" title="Listar seguimientos de la solicitud"/>
                            </button>
                                    
                           <button value="controladorregistro?operacion=verRequisitos&id=${solicitudes.id_tramite}" id="requisitos" 
                                    titulo="Confirme listado de Requisitos." mensaje="Está Ud. seguro de listar los requisitos de esta solicitud!">
                                <img src="imagenes/requisitos.png" class="btn-tabla" alt="requisitos" title="Listar Requisitos de la solicitud"/>
                            </button>
                            
                                      
                            <button value="controladorregistro?operacion=enviarcorreo&id_solicitud=${solicitudes.id_solicitud}" id="mail"
                                    titulo="Confirme el envió." mensaje="Está Ud. seguro de enviar los requisitos por email!">
                                <img src="imagenes/mail.png"  class="btn-tabla" width="24" height="24" alt="Enviar requisitos por correo"  title="Enviar requisitos por correo"/> 
                            </button>
                            
                            <!--<button value="controladorregistro?operacion=acuse&id_solicitud=${solicitudes.id_solicitud}" id="acuse"
                                    titulo="Confirme el envió." mensaje="Está Ud. seguro de imprimir el acuse de la solicitud?">
                                <img src="imagenes/acuse.png"  class="btn-tabla" width="24" height="24" alt="Imprimir acuse de la solicitud"  title="Imprimir acuse de la solicitud"/> 
                            </button>-->
                            <a href="controladorregistro?operacion=acuse&id_solicitud=${solicitudes.id_solicitud}" target="new">
                                <img src="imagenes/acuse.png" class="btn-tabla" width="24" height="24" alt="Imprimir acuse de la solicitud"  title="Imprimir acuse de la solicitud"></a>
                        </td>
                             
                    </tr>
                                             
                </c:forEach>
           </tbody>
        </table>

    </center>
        <script>
                //doSearch();
        </script>
 </body>
</html>
