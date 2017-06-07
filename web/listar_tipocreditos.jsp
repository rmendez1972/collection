<%-- 
    Document   : listar_usuarios
    Created on : 18/05/2017, 01:16:34 PM
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

        function editarTipocredito(id){
            var params=new Object();
            params.id=id;
            $.post("controladortipocredito?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarTipocredito(id){
            
            confirma("", "Eliminar Tipo de Crédito", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladortipocredito?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#tipocreditolist').DataTable();
        });
        
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-credit-card-alt" style="color: #fff"></span> Catálogo de Tipos de Crédito
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo"  onclick="cargar('controladortipocredito?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" alt="Nuevo" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladortipocredito?operacion=reporte" target="_blank" >
                    <img src="imagenes/reportesb.png" alt="Imprimir"/>
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="tipocreditolist">
            <thead>
                <tr>
                    <th>Descripcion</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="tipocredito" items="${requestScope.tipocreditos}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <th> <c:out value="${tipocredito.descripcion}" /></th>
                        <th><img src="imagenes/editar.png" class="btn-tabla" title="Editar CPP" onclick="editarTipocredito(${tipocredito.id_tipocredito});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Tipo de Crédito" onclick="eliminarTipocredito(${tipocredito.id_tipocredito});" /></th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
            
        </div>    
        
    </body>
</html>