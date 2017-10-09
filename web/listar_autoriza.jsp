<%-- 
    Document   : listar_autoriza
    Created on : 14/06/2017, 02:16:34 PM
    Author     : Ismael
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script>

        function editarAutoriza(id){
            var params=new Object();
            params.id=id;
            $.post("controladorautoriza?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarAutoriza(id){
            
            confirma("", "Eliminar Autoriza", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorautoriza?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#autorizalist').DataTable();
        });
        
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-pencil-square-o" style="color: #fff; padding: 5px"></span> Catálogo de Personas que autorizan
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo"  onclick="cargar('controladorautoriza?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" alt="Nuevo" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorautoriza?operacion=reporte" target="_blank" >
                    <img src="imagenes/reportesb.png" alt="Imprimir"/>
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="autorizalist">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Cargo</th>
                    <th>Delegación Municipal</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="autoriza" items="${requestScope.autorizas}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <th> <c:out value="${autoriza.nombre}" /></th>
                        <th> <c:out value="${autoriza.cargo}" /></th>
                        <th> <c:out value="${autoriza.delegacion}" /></th>
                        <th>
                            <img src="imagenes/editar.png" class="btn-tabla" title="Editar Registro"     onclick="editarAutoriza(${autoriza.id_autoriza});" />
                            <img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" onclick="eliminarAutoriza(${autoriza.id_autoriza});" />
                        </th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
            
        </div>    
        
    </body>
</html>