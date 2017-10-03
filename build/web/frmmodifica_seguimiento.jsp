<%-- 
    Document   : frmmodifca_seguimiento
    Created on : 12/11/2013, 03:08:25 PM
    Author     : Rafael Méndez
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
        <title>frm_registra</title>
        
        <script type="text/javascript">
            $(function()
            {
                
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
                
                
                $('#seguimiento').submit(function(event) 
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
            //document.getElementById('fecha_t').value=fechaActual();
            bloquea=lock();
        </script>
    </head>
        
    <body>

       
<!--<div id="frm_titulo">Datos del solicitante</div>-->
<form name="seguimiento" id="seguimiento" action="controladorseguimiento?operacion=modificar"  method="post">

    <h3>Datos del solicitante:</h3>  
<table width="920" border="0" align="center">
      <tr>
        <td width="150"style="color: #FFF;background-color: rgba(23,34,56,.1">Nombre:</td><td width="3"></td>
        <td width="151"style="color: #FFF;background-color: rgba(23,34,56,.1">Apellido paterno:</td><td width="3"></td>
        <td width="160"style="color: #FFF;background-color: rgba(23,34,56,.1">Apellido materno:</td><td width="3"></td>
        <td width="450"style="color: #FFF;background-color: rgba(23,34,56,.1">Domicilio:</td>
      </tr>
      
      <tr style="font-size: 14px">
        
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
        <!--<td><input name="rfc" id="rfc" type="text" size="20" maxlength="15" value="${solicitante.rfc}" readonly="readonly"></td>!-->
        <td>${solicitante.rfc}</td><td width="3"></td>
        <!--<td><input name="telefono" id="telefono" type="text" size="20" maxlength="15" value="${solicitante.telefono}" readonly="readonly"></td>!-->
        <td>${solicitante.telefono}</td><td width="3"></td>
        <!--<td><input name="email" id="email" type="email" size="20" maxlength="15" value="${solicitante.email}" readonly="readonly"></td>!-->
        <td>${solicitante.email}</td><td width="3"></td>
        <td><c:out value="${sexosolicitante.descripcion}"> </c:out></td>
        
      </tr>
    </table>
 
    <h3>Datos del Trámite: <span style="color:#000; font-size: 16px;">   Costo: ${solicitante.costo}</span></h3></p>

<table width="920" border="0" align="center">
  <tr>
    <td width="320"style="color: #FFF;background-color: rgba(23,34,56,.1">Subsecretaría:</td><td width="3"></td>
    <td width="500"style="color: #FFF;background-color: rgba(23,34,56,.1">Trámite:</td><td width="3"></td>
    <td width="94"style="color: #FFF;background-color: rgba(23,34,56,.1">F. registro:</td>
  </tr>
 <tr style="font-size: 14px">
    <td>${uatramite.nombre}</td><td width="3"></td>
    <td>${tramite.nombre}</td><td width="3"></td>
    <td>${solicitud.fecha_ingreso}<input name="id_solicitud" id="id_solicitud" type="hidden" value="${solicitud.id_solicitud}" ></td>
    
 </tr>
  
 </table>
 
 <h3>Modificar seguimiento:</h3>
 <div id="modifica">
 <table  width="920" border="1" align="center" style="background-color: rgba(255, 255,0,.3)">
    <tr>
        <td width="20"></td>
        <td width="300">Fecha de Reporte:</td>
        <td width="300">Observaciones:</td>
        <td width="300">Estatus del Trámite:</td>
        
   </tr>
   <tr>
       <td width="20">&nbsp;</td> 
       <td><input type="date" name="fecha_t" id="fecha_t" value="${seguimiento.fecha}" /><input name="id_seguimiento" id="id_seguimiento" type="hidden" value="${seguimiento.id_seguimiento}" > </td>
        <td><textarea name="observaciones" id="observaciones"  cols="30" rows="5" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9 ]{10,400})" required maxlength="400"  >${seguimiento.observaciones}</textarea></td>
        <td><select name="id_status" id="id_status">
            <c:forEach  var="status" items="${requestScope.status}">
                <OPTION VALUE="${status.id_status}" ${seguimiento.id_status == status.id_status ? 'selected' : ''}>${status.nombre}</OPTION>
            </c:forEach>
            </select>
        </td>
  </tr>
  
 </table>

 <table width="920" border="0" align="center" style="background-color: rgba(255, 255,0,.3)">  
     <tr>
        <td width="20"></td>
        <!--<td width="300">Archivo Adjunto actual: </td>
        <td width="300">Nuevo archivo Adjunto:</td>-->
        <td width="300">&nbsp;</td>
     </tr>
     <tr>
        <td width="20"></td>
        <!--<td style="font-size: 14px;color: blue"> ${seguimiento.adjunto}<input name="adjunto" id="adjunto" type="hidden" value="${seguimiento.adjunto}" > </td>
        <td><input  name="adjuntonuevo" type="file" id="adjuntonuevo"/> </td>-->
        <td width="300"><input type="submit" name="enviarrequisitos" class="botona" value="Modificar Seguimiento" id="hazlo"></td>
        
     </tr>
</table>
 </div>     
        
<p>&nbsp;</p>
</form>
        
</body>
</html>
