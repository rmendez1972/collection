<%-- 
    Document   : frm_modificatramite
    Created on : 17/12/2013, 10:30:57 AM
    Author     : arturo
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function registrar(){
                var params=new Object();
                params.id_tramite=$("#id_tramite").val();
                params.nombre=$("#nombre").val();
                params.dias_resolucion=$("#dias_resolucion").val();
                params.costo=$("#costo").val();
                params.id_unidadAdministrativa=$("#unidadAdministrativa").val();
                params.id_direccion=$("#direccion").val();
                
                if(params.id_unidadAdministrativa!=0){
                    $.post("controladortramite?operacion=editarGuardar", params, function(datos){
                         
                        $("#admin").html(datos);
                    },"html");
                }
                
                return false;
            }
            function actualizaDir(id){
                
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
        <h1>Editar trámite</h1>
        <form id="form_UA" onsubmit="return registrar()">
            <input type="hidden" id="id_tramite" name="id_tramite" value="${tramite.id_tramite}" />
            <table border="0" align="center">
                <tr>
                    <td>Nombre:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" id="nombre" required style="width: 600px; font-size: 14px"pattern="({15,800})" placeholder="Escriba el nombre de un trámite (Mín.15 Máx.800 caracteres)" value="${tramite.nombre}" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Días para resolución:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" id="dias_resolucion" required pattern="[0-9]+" style="text-transform:none; width: 100px; font-size: 14px" value="${tramite.dias_resolucion}" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan='2'>Unidad administrativa responsable:</td>
                    <td colspan='2'>Direccion:</td>
                </tr>
                <tr>
                    <td colspan='2'>
                        <select id="unidadAdministrativa" required style="width: 500px; font-size: 14px"  onChange="actualizaDir(this.value)">
                            <option value="">Seleccione una opción</option>
                            <c:forEach var="ua" items="${requestScope.ua}"> 
                                <option value="${ua.id_unidadAdministrativa}" ${ua.id_unidadAdministrativa == tramite.id_unidadadministrativa ? "selected":""}>${ua.nombre}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td colspan='2'>
                        <select id="direccion" required style="width: 300px; font-size: 14px">
                            <option value="">Seleccione una opción</option>
                            <c:forEach var="dir" items="${requestScope.dir}"> 
                                <option value="${dir.id_direccion}" ${dir.id_direccion == tramite.id_direccion ? "selected":""}>${dir.nombre}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan='2'>Costo:</td>
                    <td colspan='2'>&nbsp;</td>
                </tr>
                <tr>
                    <td><input type="text" id="costo" required style="width: 600px; font-size: 14px"pattern="({1,800})" placeholder="Escriba la regla de operación para calcular el costo" value="${tramite.costo}" /></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Aceptar" class="frm-btn" /> <input type="reset" value="Cancelar" class="frm-btn" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
