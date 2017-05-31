<%-- 
    Document   : frm_tramite
    Created on : 2/12/2013, 12:32:40 PM
    Author     : arturo
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javabeans.Direcciones"%>
<%@page import="javabeans.UnidadAdministrativa"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function registrar(){
                var params=new Object();
                params.nombre=$("#nombre").val();
                params.dias_resolucion=$("#dias_resolucion").val();
                params.costo=$("#costo").val();
                params.id_unidadAdministrativa=$("#unidadAdministrativa").val();
                params.id_direccion=$("#direccion").val();
                
                if(params.id_unidadAdministrativa!=0){
                    $.post("controladortramite?operacion=nuevoGuardar", params, function(datos){
                        $("#admin").html(datos);
                    },"html");
                }
                
                return false;
            }
            
            //function directv(){
                //document.getElementById('direccion').style.display = 'block';
          
                //var lista= document.getElementById('unidadAdministrativa').value;
                //a = lista.toString()
                //alert('El id es el '+lista+' multiplicado por 3 ='+lista*3);
                //          <c:set var="a" value= "1"></c:set>
                //   alert(value="${a}");
                               
            //}
            
            function actualizaDir(id){
                document.getElementById('direccion').style.display = 'block';
                
                var params=new Object();
                params.id_unidadadministrativa=id;
                                
                $.post("controladordirecciones?operacion=listarPorunidad", params, function(datos){
                    
                    $("#direccion").find('option').remove();
                    $("#direccion").append('<option value="">'+'Selecciona una Dirección'+'</option>');
                    $.each(datos, function(i,v){
                        $("#direccion").append('<option value="'+v.id_direccion+'">'+v.nombre+'</option>');
                    });
                },"json");
                
                return false;
            }
            
            
                                   
        </script>
    </head>
    <body>
        <h1>Nuevo trámite</h1>
        <form id="form_UA" onsubmit="return registrar()">
            <table border="0" align="center">
                <tr>
                    <td>Nombre:</td>
                    <td>Dias para resolución:</td>
                </tr>
               <tr>
                    <td><input type="text" id="nombre" required style="width:600;font-size: 25px" pattern="({15,800})" placeholder="Escriba el nombre de un trámite (Mín.15 Máx.800 caracteres)" /></td>
                    <td><input type="number" id="dias_resolucion" required min="1" scroll="none" max="30" placeholder="de 1 a 30" style="width: 300px; font-size: 25px" /></td>
                </tr>
               <!--<tr>
                    <td>Días para resolución:</td>
                    <td></td>
                </tr>
                <tr> -->
                    <!--<td><input type="text" id="dias_resolucion" required pattern="[0-9]{1,2}" placeholder="íMn.5 Máx.12 caracteres" style="width: 100px; font-size: 25px" /></td>!-->
                    <!--<td><input type="number" id="dias_resolucion" required min="1" scroll="none" max="30" placeholder="de 1 a 30" style="width: 300px; font-size: 25px" /></td>
                    <td></td>-->
                </tr>
                <tr>
                    <td>Unidad administrativa:</td> <td>Dirección:</td>
                </tr>
                <tr>
                    <td>
                        <select id="unidadAdministrativa" required style="width: 400px" onchange="actualizaDir(this.value)">
                            <option value="">Seleccione una Unidad</option>
                            <c:forEach var="ua" items="${requestScope.ua}">
                                <option value="${ua.id_unidadAdministrativa}">${ua.nombre}</option>
                            </c:forEach>
                        </select>
                    </td>
                    
                    <td>
                        <select id="direccion" required style="width: 300px;">
                            <option value="">Seleccione una Dirección</option>
                               
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Costo: </td>
                    <td> </td>
                </tr>
                <tr>
                    <td><input type="text" id="costo" required style="width:600;font-size: 25px" pattern="({1,800})" placeholder="Escriba las reglas de operación para calcular el costo" /></td>
                    <td>&nbsp;</td>
                </tr>
               
                <tr>
                    <td colspan="2"><input type="submit" value="Aceptar" class="frm-btn" /> <input type="reset" value="Cancelar" class="frm-btn" /></td>
                </tr>
            </table>
        </form>
       
    </body>
</html>
