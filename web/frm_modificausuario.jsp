<%-- 
    Document   : frm_modificausuario
    Created on : 13/12/2013, 04:21:38 PM
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
                params.id_usuario=$("#id_usuario").val();
                params.usuario=$("#usuario").val();
                params.nombre=$("#nombre").val();
                params.apellido_paterno=$("#paterno").val();
                params.apellido_materno=$("#materno").val();
                params.id_unidadadministrativa=$("#unidadAdministrativa").val();
                params.id_direccion=$("#direccion").val();
                params.id_grupo=$("#grupo").val();
                
                if(params.id_unidadadministrativa == 0){
                    alert("Seleccione una unidad administrativa");
                    return false;
                }
                if(params.id_grupo == 0){
                    alert("Seleccione un grupo");
                    return false;
                }
                
                
                
                $.post("controladorusuario?operacion=editarGuardar", params, function(datos){
                    $("#admin").html(datos);
                },"html");
                
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
        <form id="form_UA" onsubmit="return registrar()">
            <input type="hidden" name="id_usuario" id="id_usuario" value="${usr.id_usuario}" />
            <h1>Modificar usuario.</h1>
            <table border="0" align="center">
                <tr>
                    <td>Usuario:</td>
                    <td>Contraseña:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" id="usuario" required autofocus required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{5,12})" maxlength="12" placeholder="Mín.5 Máx. 12 caracteres" value="${usr.usuario}" /></td>
                    <td><input type="password" id="password" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{5,12})" maxlength="12" disabled="false" placeholder="Mín.5 Máx. 12 caracteres"value="******" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td>Apellido paterno:</td>
                    <td>Apellido materno:</td>
                </tr>
                <tr>
                    <td><input type="text" id="nombre" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ ]{4,15})" placeholder="Mín.4 Máx.15 caracteres"value="${usr.nombre}" /></td>
                    <td><input type="text" id="paterno" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ ]{2,15})" placeholder="Mín.2 Máx.15 caracteres" value="${usr.apellido_paterno}" /></td>
                    <td><input type="text" id="materno" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ ]{4,15})" placeholder="Mín.4 Máx.15 caracteres" value="${usr.apellido_materno}" /></td>
                </tr>
                <tr>
                    <td>Unidad administrativa:</td>
                    <td>Dirección:</td>
                    <td>Grupo:</td>
                    <td></td>
                </tr>
                <tr>
                    <td><select id="unidadAdministrativa" required style="width: 300" onChange="actualizaDir(this.value)">
                            <option value="">Seleccione una</option>
                            <c:forEach  var="ua" items="${requestScope.ua}">
                                <OPTION VALUE="${ua.id_unidadAdministrativa}" ${ua.id_unidadAdministrativa == usr.id_unidadadministrativa ? 'selected':''}>${ua.nombre}</OPTION>
                            </c:forEach>
                        </select>
                    </td>
                   
                    <td>
                        <div id="id_direccion">
                            <select id="direccion" required style="width: 300">
                                <option value="">Seleccione una Dirección</option>
                                <c:forEach  var="dir" items="${requestScope.dir}">
                                    <OPTION VALUE="${dir.id_direccion}" ${dir.id_direccion == usr.id_direccion ? 'selected':''}>${dir.nombre}</OPTION>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                    
                    <td><select id="grupo" required >
                            <option value="">Seleccione uno</option>
                            <c:forEach  var="grupo" items="${requestScope.grupo}">
                                <OPTION VALUE="${grupo.id_grupo}" ${grupo.id_grupo == usr.id_grupo ? 'selected':''}>${grupo.nombre}</OPTION>
                              </c:forEach>
                        </select>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Aceptar" class="frm-btn" /></td>
                    <td><input type="reset" value="Cancelar" class="frm-btn" /></td>
                    <td></td>
                </tr>
            </table>
        </form>
    </body>
</html>
