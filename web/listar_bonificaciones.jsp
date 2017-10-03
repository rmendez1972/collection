<%-- 
    Document   : listar_bonificaciones
    Created on : 07/06/2017, 01:16:34 PM
    Author     : Rafael Méndez
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script>

        function editarBonificacion(id){
            var params=new Object();
            params.id=id;
            $.post("controladorbonificacion?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarBonificacion(id){
            
            confirma("", "Eliminar Bonificación", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorbonificacion?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#bonificacionlist').DataTable();
        });
        
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-handshake-o" style="color: #fff"></span> Catálogo de Bonificaciones
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo"  onclick="cargar('controladorbonificacion?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" alt="Nuevo" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorbonificacion?operacion=reporte" target="_blank" >
                    <img src="imagenes/reportesb.png" alt="Imprimir"/>
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="bonificacionlist">
            <thead>
                <tr style="font-size: 12px;font-stretch: condensed;">
                    <th>Clave de Bonificación</th>
                    <th>Descripcion</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bonificacion" items="${requestScope.bonificaciones}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}" style="font-size: 12px;font-stretch: condensed;">
                        <th> <c:out value="${bonificacion.clave_bonific}" /></th>
                        <th> <c:out value="${bonificacion.descripcion}" /></th>
                        <th><img src="imagenes/editar.png" class="btn-tabla" title="Editar Bonificacion" onclick="editarBonificacion(${bonificacion.id_bonific});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Bonificacion" onclick="eliminarBonificacion(${bonificacion.id_bonific});" /></th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
            
        </div>    
        
    </body>
</html>