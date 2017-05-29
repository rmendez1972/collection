<%-- 
    Document   : frm_usuario
    Created on : 26/05/2017, 10:29:00 AM
    Author     : Marlon
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="javabeans.UnidadAdministrativa"%>
<%@page import="javabeans.Grupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <a href="../src/java/controladores/ControladorUsuario.java"></a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" type="text/css" href="css/estilos.css"/>-->
        <title>frm_usuario</title>
        <script>
            function registrar(){
                var params=new Object();
                params.usuario=$("#usuario").val();
                params.password=$("#password").val();
                params.repass=$("#password_rep").val();
                params.nombre=$("#nombre").val();
                params.direccion=$("#direccion").val();
                params.cargo=$("#cargo").val();
                params.serie=$("#serie").val();
                params.id_nivel=$("#id_nivel").val();
                params.id_delegacion=$("#id_delegacion").val();
                
                if(params.password != params.repass){
                    alert("Las contraseñas no coinciden");
                    return false;
                }
                /*
                if(params.id_unidadadministrativa == 0){
                    alert("Seleccione una unidad administrativa");
                    return false;
                }
                */
                if(params.id_nivel == 0){
                    alert("Seleccione un nivel");
                    return false;
                }
                if(params.id_delegacion == 0){
                    alert("Seleccione una delegacion");
                    return false;
                }
                
                $.post("controladorusuario?operacion=nuevoGuardar", params, function(datos){
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
       
        <h3 class="bg-primary encabezado"><span class="fa fa-address-book-o" style="color: #fff"></span> Registro de usuarios.</h3>
   
        <form id="form_UA" onsubmit="return registrar()">
            
            <table border="0" align="center">
                <tr>
                    <td>Usuario:</td>
                    <td>Contraseña:</td>
                    <td>Repetir contraseña:</td>
                </tr>
                <tr>
                    <td><input type="text" id="usuario" required autofocus required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9]{5,8})" maxlength="8" placeholder="Mín.5 Máx. 8 caracteres" /></td>
                    <td><input type="password" id="password" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9\0-9]{5,12})" placeholder="Mín.5 Máx. 12 caracteres"maxlength="12"/></td>
                    <td><input type="password" id="password_rep" required pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9\0-9]{5,12})" placeholder="Repita su password"maxlength="12"/></td>
                </tr>
                <tr>
                    <td>Nombre Completo:</td>
                    <td>Direccion:</td>
                    <td>Cargo:</td>
                    <td>Serie:</td>
                    
                </tr>
                <tr>
                    <td><input type="text" id="nombre" required placeholder="Mín.4 Máx.15 caracteres" maxlength="15"/></td>
                    <td><input type="text" id="direccion" required  placeholder="Mín.4 Máx.15 caracteres" maxlength="15"/></td>
                    <td><input type="text" id="cargo" required  placeholder="Mín.4 Máx.15 caracteres" maxlength="15"/></td>
                    <td><input type="text" id="serie" required placeholder="Mín.4 Máx.15 caracteres" maxlength="15"/></td>
                    
                </tr>
                <tr>
                    <td>Nivel:</td>
                    <td>Delegacion:</td>
                </tr>
                <tr>
                    <td><select id="id_nivel" required  onChange="actualizaDir(this.value)"> 
                            <option value="">Seleccione una</option>
                            <c:forEach  var="ua" items="${requestScope.ua}">
                                <OPTION VALUE="${ua.id_nivel}">${ua.descripcion}</OPTION>
                              </c:forEach>
                        </select>
                    </td>
                    <td><select id="id_delegacion" required>
                            <option value="">Seleccione uno</option>
                            <c:forEach  var="grupo" items="${requestScope.grupo}">
                                <OPTION VALUE="${grupo.id_delegacion}">${grupo.descripcion}</OPTION>
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
