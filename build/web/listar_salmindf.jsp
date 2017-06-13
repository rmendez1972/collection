<%-- 
    Document   : listar_usuarios
    Created on : 31/05/2017, 01:16:34 PM
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

        function editarSalmindf(id){
            var params=new Object();
            params.id=id;
            $.post("controladorsalmindf?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarSalmindf(id){
            
            confirma("", "Eliminar el registro", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorsalmindf?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#salmindflist').DataTable();
        });
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-money" style="color: #fff"></span> Catálogo Salarios mínimos DF
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo" onclick="cargar('controladorsalmindf?operacion=nuevo','#show')" title="Agregar registro">
                <img src="imagenes/agregar.png" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorsalmindf?operacion=reporte" target="_blank" title="Generar reporte">
                    <img src="imagenes/reportesb.png" />
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="salmindflist">
            <thead>
                <tr>
                    <th>Id_SalminDF</th>
                    <th>Fecha</th>
                    <th>Importe</th>
                    <th >Acciones</th>
                </tr>
            </thead>
            <tbody>
                <!-- arrar smdf=Salario mínimo df-->
                <c:forEach var="smdf" items="${requestScope.salmindf}" varStatus="loop">     
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <td> <c:out value="${smdf.id_salmindf}" /></td>
                        <td> <c:out value="${smdf.fecha}" /></td>
                        <td><c:out value="$${smdf.importe}" /></td>
                        <td>
                            <img src="imagenes/editar.png"   class="btn-tabla" title="Editar registro"   onclick="editarSalmindf  (${smdf.id_salmindf});" />
                            <img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar registro" onclick="eliminarSalmindf(${smdf.id_salmindf});"/>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>    
      
    </body>
</html>