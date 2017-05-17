<%-- 
    Document   : frm_seguimiento
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
        <!-- framework jquery 
        <script type="text/javascript" language="JavaScript" src="js/jquery-1.10.2.min.js"></script>
        
        <!--<script type="text/javascript" language="JavaScript" src="js/fechaActual.js"></script>
        
        <link rel="stylesheet" type="text/css" href="css/estilos.css"/>!-->
        <title>frm_registra</title>
        
        <script type="text/javascript">
            $(function()
            {
                
                $("form#seguimiento").submit(function()
                {
                
                    var formData = new FormData($(this)[0]);
                    $.ajax(
                    {
                    
                        url: $(this).attr('action'),
                        type: 'POST',
                        data: formData,
                        async: false,
                        success: function (resultado) 
                        {
                        
                            $('#contenido').html(resultado);  
                        },
                        cache: false,
                        contentType: false,
                        processData: false
                    });

                    return false;
                });
                            
            });
            
            
            //document.getElementById('fecha_t').value=fecha;
            document.getElementById('fecha_t').value=fechaActual(); //Obtener la fecha actual(valor por default) y asignarla a fecha_t(fecha tramite
            //alert(fecha);
        </script>
        
    </head>
    
       
        
    <body>

        <h1>Seguimiento a Solcitudes</h1>       
<!--<div id="frm_titulo">Datos del solicitante</div>-->
<form name="seguimiento" id="seguimiento" action="controladorseguimiento?operacion=grabar"  method="post" >
    <h3>Datos del solicitante:</h3>
  
<table id="generales" width="920">
      <tr>
        <td width="150"style="color: #FFF;background-color: rgba(23,34,56,.1">Nombre:</td><td width="3"></td>
        <td width="151"style="color: #FFF;background-color: rgba(23,34,56,.1">Apellido paterno:</td><td width="3"></td>
        <td width="160"style="color: #FFF;background-color: rgba(23,34,56,.1">Apellido materno:</td><td width="3"></td>
        <td width="450"style="color: #FFF;background-color: rgba(23,34,56,.1">Domicilio:</td>
      </tr>
      
      <tr style="font-size: 14px">
        <!--<td><input name="nombre" id="nombre" type="text" size="20" maxlength="15" value="${solicitante.nombre}" readonly="readonly"><input name="id_solicitante" id="id_solicitante" type="hidden" size="20" maxlength="15" value="${solicitante.id_solicitante}" ></td>
        <td><input name="apellido_p" id="apellido_p" type="text" size="20" maxlength="15" value="${solicitante.apellido_paterno}" readonly="readonly"></td>
        <td><input name="apellido_m" id="apellido_m" type="text" size="20" maxlength="15" value="${solicitante.apellido_materno}" readonly="readonly"></td>
        <td><input name="domicilio" id="domicilio" type="text" size="50" maxlength="50" value="${solicitante.direccion}" readonly="readonly"></td>!-->
        
        
        <td>${solicitante.nombre}</td><td width="3"></td>
        <td>${solicitante.apellido_paterno}</td><td width="3"></td>
        <td>${solicitante.apellido_materno}</td><td width="3"></td>
        <td>${solicitante.direccion}</td>
        
      </tr>
     
      <tr height="5">
        <td colspan="4"></td>
      </tr>
      
      <tr>
        <td style="color: #FFF;background-color: rgba(23,34,56,.1">RFC:</td><td width="3"></td>
        <td style="color: #FFF;background-color: rgba(23,34,56,.1">Teléfono:</td><td width="3"></td>
        <td style="color: #FFF;background-color: rgba(23,34,56,.1">Email:</td><td width="3"></td>
        <td style="color: #FFF;background-color: rgba(23,34,56,.1">Sexo:</td>
      </tr>
      
      <tr style="font-size: 14px">
        <!--<td><input name="rfc" id="rfc" type="text" size="20" maxlength="15" value="${solicitante.rfc}" readonly="readonly"></td>
        <td><input name="telefono" id="telefono" type="text" size="20" maxlength="15" value="${solicitante.telefono}" readonly="readonly"></td>
        <td><input name="email" id="email" type="email" size="20" maxlength="15" value="${solicitante.email}" readonly="readonly"></td>!-->
        
        <td>${solicitante.rfc}</td><td width="3"></td>
        <td>${solicitante.telefono}</td><td width="3"></td>
        <td>${solicitante.email}</td><td width="3"></td>
        
        <td>
            ${solicitante.sexo}
            <!--<select name="sexo" id="sexo" >
                <c:forEach  var="sexo" items="${requestScope.sexo}">
                <OPTION VALUE="${sexo.clave}" ${solicitante.sexo == sexo.clave ? 'selected' : ''}>${sexo.descripcion}</OPTION>
              </c:forEach>
            </select>!-->
            </td>
        
      </tr>
    </table>
 
<h3>Datos del trámite:<span style="color:#000;font-size:14px;font-weight:normal;">    Costo: ${solicitante.costo}</span></h3>

<table width="920" border="2" align="center" >
  <tr>
    <td width="320"style="color: #FFF;background-color: rgba(23,34,56,.1">Unidad Administrativa:</td><td width="3"></td>
    <td width="500"style="color: #FFF;background-color: rgba(23,34,56,.1">Trámite:</td><td width="3"></td>
    <td width="94"style="color: #FFF;background-color: rgba(23,34,56,.1">F. registro:</td>
    </tr>
  <tr style="font-size: 14px">
    <td>${uatramite.nombre}</td><td width="3"></td>
    <td>${tramite.nombre}</td><td width="3"></td>
    <td>${solicitud.fecha_ingreso}<input name="id_solicitud" id="id_solicitud" type="hidden" value="${solicitud.id_solicitud}" ></td>
    
  </tr>
  
  </table>
   <h3 >Agregar seguimiento:</h3> 
   <table width="920" border="0" align="center" style="background-color: rgba(255, 255,0,.3)">
   <tr>
        <td width="20">&nbsp;</td>
        <td width="300">Fecha de Seguimiento:</td>
        <td width="300">Observaciones:</td>
        <td width="300">Estatus del Trámite:</td>
        <td width="300">Costo Trámite:</td>
        
   </tr>
  <tr>
    <td width="20">&nbsp;</td>
    <td><input type="date" name="fecha_t" id="fecha_t" required /> </td>
    <td><textarea name="observaciones" id="observaciones"   col="10" rows="4" pattern="([a-zA-Z ]{10,400})" required maxlength="400" placeholder="ingresa tus observaciones..." ></textarea></td>
    <td><select name="id_status" id="id_status">
      <c:forEach  var="status" items="${requestScope.status}">
        <OPTION VALUE="${status.id_status}">${status.nombre}</OPTION>
      </c:forEach>
    </select>
    </td>
    <td><input type="number" step="0.01" name="costo_t" id="costo_t" value="${solicitante.costo}"/> </td>
    
  </tr>
  
 </table>
   
 <table width="920" border="0" align="center" style="background-color: rgba(255, 255,0,.3)">  
     <tr>
        <td width="20"></td>
        <!--<td width="300">Adjuntar Archivo: </td>-->
        <td width="300">&nbsp;</td>
        <td width="300">&nbsp;</td>
     </tr>
     <tr>
        <td width="20"></td>
     
        <!--<td><div class="uploadx"><input  name="adjunto" type="file"></div></td>-->
     
        <td>&nbsp; </td>
        <td width="300"><input   type="submit" name="enviarrequisitos" class="botona" value="Agregar seguimiento"></td>
        
     </tr>
</table>
       
<p>&nbsp;</p>

</form>
        
    </body>
</html>
