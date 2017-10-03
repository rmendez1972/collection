<%-- 
    Document   : frmmoidifca_registra
    Created on : 12/11/2013, 03:08:25 PM
    Author     : Ismael García Hernández (igh1@hotmail.com)
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="javabeans.UnidadAdministrativa"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javabeans.Solicitante"%>
<%@page import="javabeans.Solicitud"%>
<%@page import="javabeans.Tramite"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- framework jquery -->
        <script type="text/javascript" language="JavaScript" src="js/jquery-1.10.2.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/estilos.css"/>
        <link rel="stylesheet" href="css/select2.min.css">
   
        
        
        <!-- framework jquery -->
      
        <script type="text/javascript" language="JavaScript" src="js/jquery-1.7.2.js"></script>
        <script type="text/javascript" language="JavaScript" src="js/jquery.tablesorter.js"></script>
        <script src="js/jquery.confirm.js"></script>
        
        <!-- Librerias javaScript de la aplicacion tramites -->
        <script type="text/javascript" language="JavaScript" src="js/script_tramites.js"></script>
        <script src="js/select2.full.min.js"></script>
    
        
        
        <title>frm_registra</title>
        
        <script type="text/javascript">
            
            function semaforo(){
              
            }
               /* if (${solicitud.id_status}==1){
                    document.getElementById("semaforo").style.backgroundPosition="0px -195px";
            }
            
            if (${solicitud.id_status}==2){
                    document.getElementById("semaforo").style.backgroundPosition="0px -95px";
            }
            
            if (${solicitud.id_status}==3){
                    document.getElementById("semaforo").style.backgroundPosition="0px 0px";
            }*/
            
            
            $(function()
            {
                
                var $select3 = $('.select2').select2({
                    containerCssClass: "wrap"
                })
        
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
                        $("#tramites").html(" ");
                        $.each(data.Tramites, function(i,item){
                            $("#tramites").append("<option value='"+item.id_tramite+"'>"+item.nombre+"</option>");
                        });
                    });
                });
                
                
                $('#registra').submit(function(event) 
                {  
                    event.preventDefault();  
                    var url = $(this).attr('action');  
                    var datos = $(this).serialize();  
                    $.post(url, datos, function(resultado) 
                    {  
                        $('#contenido').html(resultado);  
                    });  
                });  
                            
            });
        </script>
        
    </head>
    
       
        
    <body>

       
<div id="numSolic" style="float: left;height: 20px;width: 200px;margin-left: 10px">
    <button class="btn btn-primary" type="button">
        Solicitud Núm: <span class="badge">${solicitud.id_solicitud}</span>
    </button>
    
</div>
    

<div style="float: right">
    <div id="preview" style="float:right">
        <button value="controladorregistro?operacion=borrar&id_solicitud=${solicitud.id_solicitud}" id="eliminar"
            titulo="Confirme la eliminación." mensaje="Está Ud. seguro de borrar esta solicitud!" 
            onclick="$.post(document.getElementById('eliminar').value,function(resultado) {$('#contenido').html(resultado);},'html');">
            <img src="imagenes/eliminar.png" class="btn-tabla" alt="eliminacion"  title="Eliminar solicitud"/>
        </button>

        <button value="controladorseguimiento?operacion=listar&id_solicitud=${solicitud.id_solicitud}" id="listar" 
            titulo="Confirme listado de seguimiento." mensaje="Está Ud. seguro de listar los seguimientos de esta solicitud!"
            onclick="$.post(document.getElementById('listar').value,function(resultado) {$('#contenido').html(resultado);},'html');">
            <img src="imagenes/listar.png" class="btn-tabla" alt="lista" title="Listar seguimientos de la solicitud"/>
        </button>

        <button value="controladorregistro?operacion=verRequisitos&id=${solicitud.id_solicitud}" id="requisitos" 
                 titulo="Confirme listado de Requisitos." mensaje="Está Ud. seguro de listar los requisitos de esta solicitud!"

               onclick="$.post('controladorregistro?operacion=verRequisitos&id='+document.getElementById('tramites').value,function(resultado) {$('#contenido').html(resultado);},'html');">
                <!--onclick="alert(document.getElementById('tramites').value);">!-->

             <img src="imagenes/requisitos.png" class="btn-tabla" alt="requisitos" title="Listar Requisitos de la solicitud"/>
        </button>

        <button value="controladorregistro?operacion=enviarcorreo&id_solicitud=${solicitud.id_solicitud}" id="mail"
                 titulo="Confirme el envió." mensaje="Está Ud. seguro de enviar los requisitos por email!"
                 onclick="$.post(document.getElementById('mail').value,function(resultado) {$('#contenido').html(resultado);},'html');">
             <img src="imagenes/mail.png"  class="btn-tabla" width="24" height="24" alt="Enviar requisitos por correo"  title="Enviar requisitos por correo"/> 
        </button>  


    </div>
</div>



<div style="float: left;width:100%"><h1>Datos del solicitante</h1></div>
<form name="registra" id="registra" action="controladorregistro?operacion=modificar"  method="post">
    
    
<table width="920" border="0" align="center">
      <tr>
        <td width="150">Nombre:</td>
        <td width="151">Apellido paterno:</td>
        <td width="153">Apellido materno:</td>
        <td width="448">Domicilio:</td>
      </tr>
      
      <tr>
        <td><input name="nombre" id="nombre" type="text" size="20" maxlength="15" autofocus required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ ]{3,15})" placeholder="Mínimo 3 caracteres" value="${solicitante.nombre}" ><input name="id_solicitante" id="id_solicitante" type="hidden" size="20" maxlength="15" value="${solicitante.id_solicitante}" ></td>
        <td><input name="apellido_p" id="apellido_p" type="text" size="20" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ ]{2,15})" maxlength="15" required placeholder="Mínimo 2, max. 15 letras" value="${solicitante.apellido_paterno}"></td>
        <td><input name="apellido_m" id="apellido_m" type="text" size="20" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ ]{2,15})"  maxlength="15" placeholder="Mínimo 2, max. 15 letras" value="${solicitante.apellido_materno}"></td>
        <td><textarea name="domicilio" id="domicilio"  rows="4" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ ]{20,150})" required maxlength="150" placeholder="Escriba una dirección válida" title="No es una dirección válida" >${solicitante.direccion}</textarea></td>
      </tr>
     
      <tr height="5">
        <td colspan="4"></td>
      </tr>
      
      <tr>
        <td>RFC:</td>
        <td>Teléfono</td>
        <td>Email</td>
        <td>Sexo.</td>
      </tr>
      
      <tr>
        <td><input name="rfc" id="rfc" type="text" size="20" pattern="^[a-zA-Z]{3,4}(\d{6})((\D|\d){3})?$" maxlength="13" placeholder="XXX?AAMMDD???" title="ejemplo: GAHI691125PQ9"value="${solicitante.rfc}" ></td>
        <td><input name="telefono" id="telefono" type="tel" size="20" pattern="([0-9]{10})" maxlength="10" placeholder="Escriba 10 dígitos" value="${solicitante.telefono}"></td>
        <td><input name="email" id="email" type="email" size="20" pattern="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" maxlength="60" placeholder="ejemplo@ejemplo.com"value="${solicitante.email}"></td>
        <td>
            <select name="sexo" id="sexo">
                <c:forEach  var="sexo" items="${requestScope.sexo}">
                <OPTION VALUE="${sexo.clave}" ${solicitante.sexo == sexo.clave ? 'selected' : ''}>${sexo.descripcion}</OPTION>
              </c:forEach>
            </select></td>
        
      </tr>
      
      <tr>
        <td>PASSWORD:</td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      
      <tr>
        <td><input name="password" id="password" type="text" size="20" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{8,15})" maxlength="15" placeholder="Password para api. 8 caracteres" title="password" value="${solicitante.password}" ></td>
        <td></td>
        <td></td>
        <td></td>
        
      </tr>
      
      
    </table>
 
    <h1>Datos del trámite </h1> <!--<p>Estatus: ${solicitud.id_status}</p>!-->



<table width="920" border="0" align="center">
  <tr>
    <td width="398">Subsecretaría:</td>
    <td colspan="2">Trámite:</td>
    </tr>
  <tr>
    <td><select name="unidadadtva" id="unidadadtva" class="select2 narrow wrap">
      <c:forEach  var="ua" items="${requestScope.ua}">
        <OPTION VALUE="${ua.id_unidadAdministrativa}" ${tramite.id_unidadadministrativa == ua.id_unidadAdministrativa ? 'selected' : ''}>${ua.nombre}</OPTION>
      </c:forEach>
    </select></td>
    <td colspan="2"><select name="tramites" id="tramites" class="select2 narrow wrap">
      <c:forEach  var="tm" items="${requestScope.tm}">
        <OPTION VALUE="${tm.id_tramite}" ${tramite.id_tramite == tm.id_tramite ? 'selected' : ''} >${tm.nombre}</OPTION>
      </c:forEach>
    </select>    
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2">    
  </tr>
  <tr>
    <td>Fecha de registro:</td>
    <!--<td width="230" colspan="1"></td>
    <td width="278">Estatus:</td> -->
    <td style="text-align: center">Estatus</td>
    <td></td>
  </tr>
  <tr>
    <td><label>
      <input type="date" name="fecha_r" id="fecha_r" value="${solicitud.fecha_ingreso}" required>
      <input name="id_solicitud" id="id_solicitud" type="hidden" size="20" maxlength="15" value="${solicitud.id_solicitud}" >
      <input name="id_status" id="id_status" type="hidden"  value="${solicitud.id_status}" >
    </label></td>
    
          

        <div> 
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
       </div>
  
    
    <td style="text-align: center">
        <input type="submit" name="enviarrequisitos" id="enviarrequisitos" value="Modificar solicitud" class="botona" style="margin-left: 20%">
    </td>
      
  </tr>

</table>


</form>
    
</body>
</html>
