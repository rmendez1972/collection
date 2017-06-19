<%-- 
    Document   : listar_candidatos
    Created on : 16/06/2017, 01:16:34 PM
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

        function editarCpp(id){
            var params=new Object();
            params.id=id;
            $.post("controladorcpp?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarCpp(id){
            
            confirma("", "Eliminar CPP", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorcpp?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#usuarioslist').DataTable();
        });
        
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-dollar" style="color: #fff"></span> Catálogo de Beneficiarios Contratados
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo"  onclick="cargar('controladorcandidato?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" alt="Nuevo" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorcandidato?operacion=reporte" target="_blank" >
                    <img src="imagenes/reportesb.png" alt="Imprimir"/>
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="usuarioslist">
            <thead>
                <tr>
                    <th>Programa</th>
                    <th>Num. Contrato</th>
                    <th>Clave Elector</th>
                    <th>Curp</th>
                    <th>RFC</th>
                    <th>Nombre</th>
                    <th>Conyuge</th>
                    <th>Fecha Contrato</th>
                    <th>Manzana</th>
                    <th>Lote</th>
                    <th>Area</th>
                    <th>Domicilio</th>
                    <th>Clave Catastral</th>
                    <th>Fecha Inicio Pagos</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="candidato" items="${requestScope.candidatos}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <th> <c:out value="$${candidato.numcontrato}" /></th>
                        <th> <c:out value="$${candidato.clave_elect}" /></th>
                        <th> <c:out value="$${candidato.curp}" /></th>
                        <th> <c:out value="$${candidato.rfc}" /></th>
                        <th> <c:out value="$${candidato.nombre}" /></th>
                        <th> <c:out value="$${candidato.conyuge}" /></th>
                        <th> <c:out value="$${candidato.fecha_con}" /></th>
                        <th> <c:out value="$${candidato.mza}" /></th>
                        <th> <c:out value="$${candidato.lte}" /></th>
                        <th> <c:out value="$${candidato.area}" /></th>
                        <th> <c:out value="$${candidato.domicilio}" /></th>
                        <th> <c:out value="$${candidato.clave_cat}" /></th>
                        <th> <c:out value="$${candidato.fecha_ip}" /></th>
                        <th><img src="imagenes/editar.png" class="btn-tabla" title="Editar CPP" onclick="editarCpp(${cpp.id_cpp});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar CPP" onclick="eliminarCpp(${cpp.id_cpp});" /></th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
            
        </div>    
        
    </body>
</html>