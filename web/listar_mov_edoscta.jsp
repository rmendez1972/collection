<%-- 
    Document   : listar_mov_edoscta
    Created on : 19/07/2017, 01:16:34 PM
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

        function editarMovimiento(id){
            var params=new Object();
            params.id=id;
            $.post("controladormov_edocta?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarMovimiento(id){
            
            confirma("", "Eliminar Movimiento", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladormov_edocta?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        function editarBonificacion(id){
            var params=new Object();
            params.id=id;
            $.post("controladormovbonific?operacion=listarbonific", params, function(datos){
                $("#show").html(datos);
            },"html");
        }
                
        $(document).ready(function(){
            
            $('#candidatoslist').DataTable();
        });
        
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-money" style="color: #fff; padding: 5px;"></span> Mantenimiento a Estados de Cuenta de Programas
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
        <table class="table table-condensed table-hover" id="candidatoslist">
            <thead>
                <tr>
                    <th>Acciones</th>
                    <th>Nombre Beneficiario</th>
                    <th>Estatus</th>
                    <th>Clave SEDUVI</th>
                    <th>Clave Movimiento</th>
                    <th>Fecha Movimiento</th>
                    <th>Póliza</th>
                    <th>Capital</th>
                    <th>Interes</th>
                    <th>Admon</th>
                    <th>Seguro</th>
                    <th>Otros Seguros</th>
                    <th>Comisión</th>
                    <th>Titulación</th>
                    <th>Bonific</th>
                    
                    
                    
                    
                </tr>
            </thead>
            <tbody>
                
                
                <c:forEach var="mov" items="${requestScope.movimientos}" varStatus="loop"> 
                    
                    
                    
                        <th><img src="imagenes/editar.png" class="btn-tabla" title="Editar Movimiento" onclick="editarMovimiento(${mov.id_movedoscta});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Movimiento" onclick="eliminarMovimiento(${mov.id_movedoscta});" /><img src="imagenes/reporte_solicitudes.png" class="btn-tabla" title="Agregar Bonificacion" onclick="editarBonificacion(${mov.id_movedoscta});" /></th>
                        <th> <c:out value="${mov.nombrebenef}" /></th>
                        <c:if test="${estatus=='B'}">
                            <th><span class="label label-warning label-as-badge"><c:out value="${estatus}" /></span></th>
                        </c:if>
                        <c:if test="${estatus!='B'}">
                            <th><span class="label label-info label-as-badge"><c:out value="${estatus}" /></span></th>
                        </c:if>
                        <th> <c:out value="${mov.clave_b}" /></th>
                        <th> <c:out value="${mov.clave_mov}" /></th>
                        <th> <c:out value="${mov.fecha_mov}" /></th>
                        <th> <c:out value="${mov.poliza}" /></th>
                        <th> <c:out value="${mov.capital}" /></th>                        
                        <th> <c:out value="${mov.interes}" /></th>                        
                        <th> <c:out value="${mov.admon}" /></th>
                        <th> <c:out value="${mov.seguro}" /></th>
                        <th> <c:out value="${mov.o_seguro}" /></th>
                        <th> <c:out value="${mov.comisiones}" /></th>                        
                        <th> <c:out value="${mov.tit}" /></th>
                        <c:choose>
                            <c:when test="${mov.bonific==true}">
                                <th><img src="assets/img/ok.png"    title="movimiento con bonificación"/></th>
                            </c:when>
                                    
                            <c:when test="${mov.bonific==false}">
                                <th><img src="assets/img/mal.png"   title="movimiento sin bonificación"/></td>
                            </c:when>
                        </c:choose>
                                    
                        
                                                
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
            
        </div>    
        
    </body>
</html>