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
            $('#candidatoslist2').DataTable();
        });
        
        
        function aperturarVencidos(){
                var params=new Object();
                params.fecha_corte=$("#fecha_corte").val();
                params.id_benef=$("#id_benef").val();
                
                $.post("controladorvencidos?operacion=listar", params, function(datos){
                    $("#vencidos").find('table').remove();
                    $("#vencidos").html(datos);
                },"html");
               
              
                
                return false;
            }
        
        
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
            <div class="btn-catalogo"  onclick="cargar('controladormov_edocta?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" alt="Nuevo" />
            </div>
            
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="candidatoslist">
            <thead>
                <tr style="font-size: 13px;font-stretch: condensed;">
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
                    <th>Bonificacion?</th>    
                </tr>
            </thead>
            <tbody>
                
                <c:forEach var="mov" items="${requestScope.movimientos}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}" style="font-size: 12px;font-stretch: condensed;color:#000;">
                        <c:set var="estatus" value="${mov.status}"/>

                    
                        <th style="font-weight: normal; width: 30%"> <img src="imagenes/editar.png" class="btn-tabla" title="Editar Movimiento" onclick="editarMovimiento(${mov.id_movedoscta});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Movimiento" onclick="eliminarMovimiento(${mov.id_movedoscta});" /><img src="imagenes/reporte_solicitudes.png" class="btn-tabla" title="Agregar Bonificacion" onclick="editarBonificacion(${mov.id_movedoscta});" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.nombrebenef}" /></th>
                        <c:if test="${estatus=='B'}">
                            <th ><span class="label label-warning label-as-badge"><c:out value="${estatus}" /></span></th>
                        </c:if>
                        <c:if test="${estatus!='B'}">
                            <th><span class="label label-info label-as-badge"><c:out value="${estatus}" /></span></th>
                        </c:if>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.clave_b}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.clave_mov}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.fecha_mov}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.poliza}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.capital}" /></th>                        
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.interes}" /></th>                        
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.admon}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.seguro}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.o_seguro}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.comisiones}" /></th>                        
                        <th style="font-weight: normal; width: 30%"> <c:out value="${mov.tit}" /></th>
                        <c:choose>
                            <c:when test="${mov.bonific==true}">
                                <th style="text-align: center"><span class="fa fa-check" title="Movimiento con Bonificación"></span></th>
                            </c:when>
                                    
                            <c:when test="${mov.bonific==false}">
                                <th style="text-align: center"><span class="fa fa-close" title="Movimmientto sin Bonificación"></span></th>
                            </c:when>
                        </c:choose>
                                                       
                    </tr>
                </c:forEach>
                    
                <c:forEach var="sumamov" items="${requestScope.sumamov}" varStatus="loop">    
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}" style="font-size: 12px;font-stretch: condensed;color:#000;">
                        <th style="font-weight: normal; width: 30%">SUMA</th>
                        <th style="font-weight: normal; width: 30%"></th>
                        <th style="font-weight: normal; width: 30%"></th>
                        <th style="font-weight: normal; width: 30%"></th>
                        <th style="font-weight: normal; width: 30%"></th>
                        <th style="font-weight: normal; width: 30%"></th>
                        <th style="font-weight: normal; width: 30%"></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${sumamov.sumcapital}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${sumamov.suminteres}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${sumamov.sumadmon}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${sumamov.sumseguro}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${sumamov.sumoseg}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${sumamov.sumcomisiones}" /></th>
                        <th style="font-weight: normal; width: 30%"> <c:out value="${sumamov.sumtitulacion}" /></th>
                        <th style="font-weight: normal; width: 30%"></th>
                    </tr>
                </c:forEach>                    
            </tbody>
        </table>
            
        </div>
        <c:set var="id_benef" value="${requestScope.id_benef}"/>
         <c:if test="${id_benef!=null}">
            <form id="form_UA" onsubmit="return aperturarVencidos()"  class="form-horizontal">
                    <label for="imp_cap" class="col-xs-12 col-md-2 control-label">Fecha de Corte:</label>
                    <input type="date" id="fecha_corte" required>
                    <input type="hidden" id="id_benef" value="${requestScope.id_benef}">
                    <input type="submit" value="Aceptar" class="btn btn-primary" />
            </form>
        </c:if>
        
         
        <div class="vencidos" id="vencidos" >
            <div class="table-responsive listado">
                <table class="table table-condensed table-hover" id="candidatoslist2">
                    <thead>
                        <tr style="font-size: 13px;font-stretch: condensed;">
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
                        </tr>
                    </thead>
                </table>
            </div>       
        </div>
         
    </body>
</html>