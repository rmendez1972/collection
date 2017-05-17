<%-- 
    Document   : frm_registra
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- framework jquery
        <script type="text/javascript" language="JavaScript" src="js/jquery-1.10.2.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/estilos.css"/> -->
        <title>frm_registra</title>
        
        <script type="text/javascript">
            $(function()
            {
                
                var $select2 = $('.select2').select2({
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
        
         <script> //obtener la fecha actual y asignarla al elemento fecha_r(date) 
            f=new Date();
            var mes="";
            var dia="";
            mes=(f.getMonth() +1);
            dia=(f.getDate());
            if ((f.getMonth() +1)<10){
                mes="0"+(f.getMonth() +1);
                
            }
             if (f.getDate()<10){
                 dia="0"+(f.getDate());
             }
             
                //if (f.getDate()<10){
                  //  var fecha=(f.getFullYear()+ "-"+ (f.getMonth() +1) + "-0" +f.getDate());
               // }
                //else{
                  //  var fecha=(f.getFullYear()+ "-"+ (f.getMonth() +1) + "-" +f.getDate());
                //}
                var fecha=(f.getFullYear()+ "-"+ mes+ "-" +dia);
           //alert(fecha);    
           
           document.getElementById('fecha_r').value=fecha;
        </script>


        
        
        
    </head>
    
       
        
    <body>
      

       
<!--<div id="frm_titulo">Datos del solicitante</div>-->

<form name="registra" id="registra" action="controladorregistro?operacion=grabar"  method="post">
    <h1>Datos del solicitante</h1>

  
<table width="920" border="0" align="center">
      <tr>
        <td width="150">Nombre:</td>
        <td width="151">Apellido paterno:</td>
        <td width="153">Apellido materno:</td>
        <td width="448">Domicilio:</td>
      </tr>
      
      <tr>
        <td><input name="nombre" id="nombre"  type="text" size="20" maxlength="30" autofocus required  placeholder="Mínimo 3 caracteres"></td>
        <td><input name="apellido_p" id="apellido_p" type="text" size="20"  maxlength="15" required placeholder="Mínimo 2, max. 15 letras"></td>
        <td><input name="apellido_m" id="apellido_m" type="text" size="20" maxlength="15" placeholder="Mínimo 2, max. 15 letras"></td>
        <td><textarea type="text" name="domicilio" id="domicilio" rows="4" maxlength="200"required  placeholder="Solo letras" title="No es una dirección válida"></textarea></td>
       
      </tr>
     
      <tr height="5">
        <td colspan="4"></td>
      </tr>
      
      <tr>
        <td>RFC:</td>
        <td>Teléfono:</td>
        <td>Email:</td>
        <td>Sexo:</td>
      </tr>
      
      <tr>
        <td><input name="rfc" id="rfc" type="text" size="20" pattern="^[a-zA-Z]{3,4}(\d{6})((\D|\d){3})?$" maxlength="13" placeholder="XXX?AAMMDD???" title="ejemplo: GAHI691125PQ9"></td>
        <td><input name="telefono" id="telefono" type="tel" size="20" pattern="([0-9]{10})" maxlength="10" placeholder="Escriba 10 dígitos"></td>
        <td><input name="email" id="email" type="email" size="20" pattern="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$" maxlength="60" placeholder="ejemplo@ejemplo.com"></td>
        <td>
            <select name="sexo" id="sexo" required >
              <!--<option value="0" selected="selected">Selecciona una opción.</option>!-->
              <option value="">Seleccione una opción.</option>
              <option value="M">MUJER</option>
              <option value="H">HOMBRE</option>
            </select></td>
        
      </tr>
      
      <tr>
        <td>PASSWORD:</td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      
      <tr>
        <td><input name="password" id="password" type="text" size="20" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{8,15})" maxlength="15" placeholder="Password para api" title="Password para api"></td>
        <td></td>
        <td></td>
        <td></td>
        
      </tr>
    </table>
 
<p>
<br><h3>Datos del trámite</h3></p>



<table width="920" border="0" align="center">
  <tr>
    <td width="404">Subsecretaría:</td>
    <td width="502" colspan="2">Trámite:</td>
    </tr>
  <tr>
    <td><select name="unidadadtva" id="unidadadtva" required class="select2 narrow wrap">
      <option value="" selected="selected" >Selecciona una opción del catálogo...</option>
      <c:forEach  var="ua" items="${requestScope.ua}">
        <option  required value="${ua.id_unidadAdministrativa}">${ua.nombre}</option>
      </c:forEach>
    </select></td>
    <td colspan="2"><select name="tramites" id="tramites" required class="select2 narrow wrap">
      <option value="" selected="selected">Selecciona una opción del catálogo...</option>
    </select>    
    </tr>
  <tr>
      <td>&nbsp;</td>
    <td colspan="2">    
  </tr>
  <tr>
    <td>Fecha de registro:</td>
    <td colspan="2" valign="middle">
        <div id="envio"><input type="submit" name="enviarrequisitos" class="botona" value="Enviar solicitud"></div>
    </td>
    </tr>
  <tr>
      
      <td><input type="date" name="fecha_r" id="fecha_r" required value="fecha()"></td>
      
    <td colspan="2">    
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"></tr>
  </table>
<p>&nbsp;</p>


</form>
        
    </body>
</html>
