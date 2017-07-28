<%-- 
    Document   : listar_mov_edoscta
    Created on : 24/07/2017, 01:16:34 PM
    Author     : ismael
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
            $.post("controladormov_diversos?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarMovimiento(id){
            
            confirma("", "Eliminar Movimiento", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladormov_diversos?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
                
        $(document).ready(function(){
            
            $('#diversoslist').DataTable();
        });
        
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-folder" style="color: #fff; padding: 5px;"></span>
            Mantenimiento a Estados de Cuenta de Diversos
        </h3>
        <!--
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo"  onclick="cargar('controladormov_diversos?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" alt="Nuevo" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladormov_diversos?operacion=reporte" target="_blank" >
                    <img src="imagenes/reportesb.png" alt="Imprimir"/>
                </a>
            </div>
        </div>
        -->
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="diversoslist">
            <thead>
                <tr>
                    <th>Acciones</th>
                    <th>Nombre Beneficiario</th>
                    <th>Clave SEDUVI</th>
                    <th>Clave Movimiento</th>
                    <th>Fecha Movimiento</th>
                    <th>Póliza</th>
                    <th>Fecha Póliza</th>
                    <th>Cargo</th>
                    <th>Abono</th>
                    <th>Moratorios</th>
                    <th>otros</th>
                    <th>Interés</th>
                    <th>Seguro</th>
                    <th>Descripcion</th>
                    <th>Bonific</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="mov" items="${requestScope.movimientos}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                        <th><img src="imagenes/editar.png" class="btn-tabla" title="Editar Movimiento" 
                                 onclick="editarMovimiento(${mov.id_movdiversos});" />
                            <img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Movimiento" 
                                 onclick="eliminarMovimiento(${mov.id_movdiversos});" />
                        </th>
                        <th> <c:out value="${mov.nombrebenef}" /></th>
                        <th> <c:out value="${mov.clave_b}" /></th>
                        <th> <c:out value="${mov.clave_div}" /></th>
                        <th> <c:out value="${mov.fecha_div}" /></th>
                        <th> <c:out value="${mov.poliza}" /></th>
                        <th> <c:out value="${mov.fecha_pol}" /></th>
                        <th> <c:out value="${mov.cargo}" /></th>                        
                        <th> <c:out value="${mov.abono}" /></th>                        
                        <th> <c:out value="${mov.moratorios}" /></th>
                        <th> <c:out value="${mov.otros}" /></th>
                        <th> <c:out value="${mov.interes}" /></th>
                        <th> <c:out value="${mov.seguro}" /></th>                        
                        <th> <c:out value="${mov.descripcion}" /></th>
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