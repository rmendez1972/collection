<%-- 
    Document   : frm_modificausuario
    Created on : 26/05/2017, 01:33:00 PM
    Author     : marlon
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
                params.direccion=$("#direccion").val();
                params.cargo=$("#cargo").val();
                params.serie=$("#serie").val();
                params.id_nivel=$("#id_nivel").val();
                params.id_delegacion=$("#id_delegacion").val();
                
                if(params.id_nivel == 0){
                    alert("Seleccione un nivel");
                    return false;
                }
                if(params.id_delegacion == 0){
                    alert("Seleccione una delegacion");
                    return false;
                }
                
                
                
                $.post("controladorusuario?operacion=editarGuardar", params, function(datos){
                    $("#show").html(datos);
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
                    <td><input type="text" id="usuario" required autofocus required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{5,8})" maxlength="8" placeholder="Mín.5 Máx. 8 caracteres" value="${usr.usuario}" /></td>
                    <td><input type="password" id="password" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{5,12})" maxlength="12" disabled="false" placeholder="Mín.5 Máx. 12 caracteres"value="******" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Nombre Completo:</td>
                    <td>Direccion:</td>
                    <td>Cargo:</td>
                    <td>Serie</td>
                </tr>
                <tr>
                    <td><input type="text" id="nombre" required placeholder="Mín.4 Máx.15 caracteres"value="${usr.nombre}" /></td>
                    <td><input type="text" id="direccion" required  placeholder="Mín.2 Máx.15 caracteres" value="${usr.direccion}" /></td>
                    <td><input type="text" id="cargo" required  placeholder="Mín.4 Máx.15 caracteres" value="${usr.cargo}" /></td>
                    <td><input type="text" id="serie" required  placeholder="Mín.4 Máx.15 caracteres" value="${usr.serie}" /></td>
                </tr>
                <tr>
                    <td>Nivel:</td>
                    <td>Delegacion:</td>                   
                </tr>
                <tr>
                    <td><select id="id_nivel" required style="width: 300" onChange="actualizaDir(this.value)">
                            <option value="">Seleccione una</option>
                            <c:forEach  var="ua" items="${requestScope.ua}">
                                <OPTION VALUE="${ua.id_nivel}" ${ua.id_nivel == usr.id_nivel ? 'selected':''}>${ua.descripcion}</OPTION>
                            </c:forEach>
                        </select>
                    </td>
                                     
                    <td><select id="id_delegacion" required >
                            <option value="">Seleccione uno</option>
                            <c:forEach  var="grupo" items="${requestScope.grupo}">
                                <OPTION VALUE="${grupo.id_delegacion}" ${grupo.id_delegacion == usr.id_del ? 'selected':''}>${grupo.descripcion}</OPTION>
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
