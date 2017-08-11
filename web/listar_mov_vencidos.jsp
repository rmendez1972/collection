<%-- 
    Document   : listar_mov_vencidos
    Created on : 10/08/2017, 11:47:48 AM
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
                
        $(document).ready(function(){
            
            $('#candidatoslist').DataTable();
            $('#candidatoslist2').DataTable();
        });
        
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
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
                <tbody>
                    <c:forEach var="movvencidos" items="${requestScope.movvencidos}" varStatus="loop"> 
                        <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}" style="font-size: 12px;font-stretch: condensed;color:#000;">
                            <c:set var="estatus" value="${movvencidos.status}"/>
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.nombrebenef}" /></th>
                            <c:if test="${estatus=='B'}">
                                <th ><span class="label label-warning label-as-badge"><c:out value="${estatus}" /></span></th>
                            </c:if>
                            <c:if test="${estatus!='B'}">
                                <th><span class="label label-info label-as-badge"><c:out value="${estatus}" /></span></th>
                            </c:if>
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.clave_b}" /></th>
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.clave_mov}" /></th>
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.fecha_mov}" /></th>
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.poliza}" /></th>
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.capital}" /></th>                        
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.interes}" /></th>                        
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.admon}" /></th>
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.seguro}" /></th>
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.o_seguro}" /></th>
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.comisiones}" /></th>                        
                            <th style="font-weight: normal; width: 30%"> <c:out value="${movvencidos.tit}" /></th>
                        </tr>
                    </c:forEach>
                        
                </tbody>
            </table>
        </div>
    </body>
</html>
