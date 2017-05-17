<%-- 
    Document   : frm_unidadAdministrativaEditar
    Created on : 2/12/2013, 10:11:56 AM
    Author     : arturo
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="javabeans.Direcciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function registrar(){
                var params=new Object();
                params.id_direccion=$("#id_direccion").val();
                params.nombre=$("#nombre").val();
                params.id_unidadadministrativa=$("#id_unidadadministrativa").val();
                
                $.post("controladordirecciones?operacion=modificarGuardar", params, function(datos){
                    $("#admin").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
        
        <form id="form_DIR" onsubmit="return registrar()">
            <h1>Editar Dirección</h1>
            <input type="hidden" id="id_direccion" value="${di.id_direccion}" />
            <table border="0" align="center">
                <tr>
                    <td>Nombre:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" id="nombre" pattern="([a-zA-ZñÑçÇáéíóúüÁÉÍÓÚÜ ]{10,100})"  placeholder="Mínimo 10 caracteres" required style=" width: 500px; font-size: 14px" value="${di.nombre}" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Unidad Administrativa:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><select id="id_unidadadministrativa" required style="width: 300">
                            <option value="">Seleccione una unidad administrativa</option>
                            <c:forEach  var="ua" items="${requestScope.ua}">
                                <OPTION VALUE="${ua.id_unidadAdministrativa}" ${ua.id_unidadAdministrativa == di.id_unidadadministrativa ? 'selected':''}>${ua.nombre}</OPTION>
                              </c:forEach>
                        </select></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Aceptar" class="frm-btn" /> <input type="reset" value="Cancelar" class="frm-btn" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
