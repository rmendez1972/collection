<%-- 
    Document   : listar_salmin
    Created on : 31/05/2017, 10:17:24 AM
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

        function editarSalmin(id){
            var params=new Object();
            params.id=id;
            $.post("controladorsalmin?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarSalmin(id){
            
            confirma("", "Eliminar Usuario", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorsalmin?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#salminlist').DataTable();
        });
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-dollar" style="color: #fff"></span> Catálogo de Salario Minimo
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladorsalmin?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorsalmin?operacion=reporte" target="_blank">
                    <img src="imagenes/reportesb.png" />
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="salminlist">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Importe</th>
                    <th >Acciones</th>


                </tr>
            </thead>
            <tbody>
                <c:forEach var="sal" items="${requestScope.salmin}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}"> 
                        <th><c:out value="${sal.fecha}" /></th>
                        <th><c:out value="$${sal.importe}" /></th>
                        <th><img src="imagenes/editar.png" class="btn-tabla" title="Editar Registro" onclick="editarSalmin(${sal.id_salmin})" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" onclick="eliminarSalmin(${sal.id_salmin})" /></th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>    
      
    </body>
</html>