<%-- 
    Document   : frm_unidadAdministrativa
    Created on : 24/10/2016, 04:28:08 PM
    Author     : rafael
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
                params.nombre=$("#nombre").val();
                params.unidadAdministrativa=$("#unidadAdministrativa").val();
                $.post("controladordirecciones?operacion=guardarNuevo", params, function(datos){
                    
                    $('#admin').html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        <h1>Nueva Dirección</h1>
        <form id="form_DIR" onsubmit="return registrar()">
            <table border="0" align="center">
                <tr>
                    <td>Nombre</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" id="nombre" pattern="([a-zA-ZñÑçÇáéíóúüÁÉÍÓÚÜ ]{15,100})"  placeholder="Mínimo 15 caracteres" required style="width: 500px; font-size: 14px" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Unidad Administrativa</td>
                    
                </tr>
                <tr>
                    <td><select id="unidadAdministrativa" required style="width: 400px; font-size: 14px">
                            <option value="">Seleccione una</option>
                            <c:forEach  var="ua" items="${requestScope.ua}">
                                <OPTION VALUE="${ua.id_unidadAdministrativa}">${ua.nombre}</OPTION>
                              </c:forEach>
                        </select>
                    </td>
                        
                </tr>
                <br<br>
                <tr>
                    <td colspan="2"><input type="submit" value="Aceptar" class="frm-btn" /> <input type="reset" value="Cancelar" class="frm-btn" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
