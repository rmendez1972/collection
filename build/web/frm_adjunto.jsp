<%-- 
    Document   : frm_seguimiento
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
        <title>frm_adjunto</title>
        
        <script type="text/javascript">
            $(function()
            {
                
                $("form#adjunto").submit(function()
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
            //document.getElementById('fecha_t').value=fechaActual(); //Obtener la fecha actual(valor por default) y asignarla a fecha_t(fecha tramite
            //alert(fecha);
        </script>
        
    </head>
    
       
        
    <body>

        <h1><img src="imagenes/reporte_adjuntos.png" width="42" height="42"/>Adjuntos a Seguimientos</h1>       
<!--<div id="frm_titulo">Datos del solicitante</div>-->
<form name="adjunto" id="adjunto" action="controladoradjunto?operacion=grabar"  method="post" >
    
   
 <table width="920" border="0" align="center" style="background-color: rgba(255, 255,0,.3)">  
     <tr>
        <td width="20"></td>
        <td width="300">Selecciona el Archivo a Adjuntar: </td>
        <td width="300">&nbsp;</td>
        <td width="300">&nbsp;</td>
     </tr>
     <tr>
        <td width="20"></td>
     
        <td><div class="uploadx"><input  name="adjunto" type="file"></div><input name="id_seguimiento" id="id_seguimiento" type="hidden" value="${seguimiento.id_seguimiento}" ></td>
     
        <td>&nbsp; </td>
        <td width="300"><input   type="submit" name="enviaradjunto" class="botona" value="Agregar Adjunto"></td>
        
     </tr>
</table>
       
<p>&nbsp;</p>

</form>
        
    </body>
</html>
