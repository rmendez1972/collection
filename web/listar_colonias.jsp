<%-- 
    Document   : listar_colonias
    Created on : 08/06/2017, 01:16:34 PM
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

        function editarColonia(id){
            var params=new Object();
            params.id=id;
            $.post("controladorcolonia?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarColonia(id){
            
            confirma("", "Eliminar Colonia", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorcolonia?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#coloniaslist').DataTable();
        });
        
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-building" style="color: #fff; padding: 5px"></span> Catálogo de Colonias por Delegación Municipal
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo"  onclick="cargar('controladorcolonia?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" alt="Nuevo" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorcolonia?operacion=reporte" target="_blank" >
                    <img src="imagenes/reportesb.png" alt="Imprimir"/>
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="coloniaslist">
            <thead>
                <tr>
                    <th>Descripción</th>
                    <th>Delegación Municipal</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="colonia" items="${requestScope.colonias}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <th> <c:out value="${colonia.descripcion}" /></th>
                        <th> <c:out value="${colonia.delegacion}" /></th>
                        <th><img src="imagenes/editar.png" class="btn-tabla" title="Editar Colonia" onclick="editarColonia(${colonia.id_colonia});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Colonia" onclick="eliminarColonia(${colonia.id_colonia});" /></th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
            
        </div>    
        
    </body>
</html>