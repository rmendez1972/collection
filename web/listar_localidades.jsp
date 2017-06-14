<%-- 
    Document   : listar_localidades
    Created on : 13/06/2017, 01:16:34 PM
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

        function editarLocalidad(id){
            var params=new Object();
            params.id=id;
            $.post("controladorlocalidad?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarLocalidad(id){
            
            confirma("", "Eliminar Localidad", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorlocalidad?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#localidadeslist').DataTable();
        });
        
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-map-marker" style="color: #fff; padding: 5px"></span> Catálogo de Localidades
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo"  onclick="cargar('controladorlocalidad?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" alt="Nuevo" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorlocalidad?operacion=reporte" target="_blank" >
                    <img src="imagenes/reportesb.png" alt="Imprimir"/>
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="localidadeslist">
            <thead>
                <tr>
                    <th>Descripción</th>
                    <th>Delegación Municipal</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="localidad" items="${requestScope.localidades}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <th> <c:out value="${localidad.descripcion}" /></th>
                        <th> <c:out value="${localidad.delegacion}" /></th>
                        <th><img src="imagenes/editar.png" class="btn-tabla" title="Editar Localidad" onclick="editarLocalidad(${localidad.id_localidad});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Localidad" onclick="eliminarLocalidad(${localidad.id_localidad});" /></th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
            
        </div>    
        
    </body>
</html>