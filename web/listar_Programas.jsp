<%-- 
    Document   : listar_Programas
    Created on : 19/06/2017, 10:46:16 AM
    Author     : Marlon
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>

        function editarProg(id){
            var params=new Object();
            params.id=id;
            $.post("controladorprogramas?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarProg(id){
            
            confirma("", "Eliminar Usuario", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorprogramas?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#programalist').DataTable();
        });
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-folder" style="color: #fff"></span> Catálogo de Programas
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladorprogramas?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorprogramas?operacion=reporte" target="_blank">
                    <img src="imagenes/reportesb.png" />
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="programalist">
            <thead>
                <tr>
                    <th>Clave</th>
                    <th>Descripcion</th>
                    <th>Sub ini</th>
                    <th>Eng fon</th>
                    <th>Eng inv</th>
                    <th>Interes</th>
                    <th>Admon</th>
                    <th>Seguro</th>
                    <th>Costo m2</th>
                    <th>Por sub</th>
                    <th>Por admon</th>
                    <th>Por sv</th>
                    <th>Por os</th>
                    <th>Sal min</th>
                    <th>Pago mes</th>
                    <th>Por eng</th>
                    <th>Anual</th>
                    <th>Plazo</th>
                    <th>Por cap</th>
                    <th>Status</th>
                    <th>Mecanica</th>
                    <th>Tipo Credito</th>
                    <th>Mensual</th>
                    <th>Sub bp</th>
                    <th>Apor fij</th>
                    <th>Por pm</th>
                    <th>Por pf</th>
                    <th>Clave ant</th>
                    <th>Colonia</th>
                    <th>Dias Gracia</th>
                    <th>Mora</th>
                    <th>Por ga</th>
                    <th>Cuenta cont</th>
                    <th>Delegacion</th>
                    <th>Modulo</th>
                    <th>Condicion Fija</th>
                    <th>Acciones</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach var="pr" items="${requestScope.pr}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td> <c:out value="${pr.clave}" /></td>
                        <td> <c:out value="${pr.descripcion}" /></td>
                        <td> <c:out value="${pr.sub_ini}" /></td>
                        <td> <c:out value="${pr.eng_fon}" /></td>
                        <td> <c:out value="${pr.eng_inv}" /></td>
                        <td> <c:out value="${pr.interes}" /></td>
                        <td> <c:out value="${pr.admon}" /></td>
                        <td> <c:out value="${pr.seguro}" /></td>
                        <td> <c:out value="${pr.costo_m2}" /></td>
                        <td> <c:out value="${pr.por_sub}" /></td>
                        <td> <c:out value="${pr.por_admon}" /></td>
                        <td> <c:out value="${pr.por_sv}" /></td>
                        <td> <c:out value="${pr.por_os}" /></td>
                        <td> <c:out value="${pr.sal_min}" /></td>
                        <td> <c:out value="${pr.pago_mes}" /></td>
                        <td> <c:out value="${pr.por_eng}" /></td>
                        <td> <c:out value="${pr.anual}" /></td>
                        <td> <c:out value="${pr.plazo}" /></td>
                        <td> <c:out value="${pr.por_cap}" /></td>
                        <td> <c:out value="${pr.status}" /></td>
                        <td> <c:out value="${pr.mecanica}" /></td>
                        <td> <c:out value="${pr.tipocredito}" /></td>
                        <td> <c:out value="${pr.mensual}" /></td>
                        <td> <c:out value="${pr.sub_bp}" /></td>
                        <td> <c:out value="${pr.apor_fij}" /></td>
                        <td> <c:out value="${pr.por_pm}" /></td>
                        <td> <c:out value="${pr.por_pf}" /></td>
                        <td> <c:out value="${pr.clave_ant}" /></td>
                        <td> <c:out value="${pr.colonia}" /></td>
                        <td> <c:out value="${pr.dias_gracia}" /></td>
                        <td> <c:out value="${pr.mora}" /></td>
                        <td> <c:out value="${pr.por_ga}" /></td>
                        <td> <c:out value="${pr.cuenta_cont}" /></td>
                        <td> <c:out value="${pr.delegacion}" /></td>
                        <td> <c:out value="${pr.modulo}" /></td>
                        <td> <c:out value="${pr.condicion_fija}" /></td>
                        <td><img src="imagenes/editar.png" class="btn-tabla" title="Editar Registro" onclick="editarProg(${pr.id_catprog});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" onclick="eliminarProg(${pr.id_catprog});" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
    </body>
</html>
