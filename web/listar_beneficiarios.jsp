<%-- 
    Document   : listar_beneficiarios
    Created on : 28/06/2017, 01:16:34 PM
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

        function editarBeneficiario(id){
            var params=new Object();
            params.id=id;
            $.post("controladorbeneficiario?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }
        
        function verEdoCta(id){
            var params=new Object();
            params.id=id;
            $.post("controladormov_edocta?operacion=listarPorBenefId", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        
        function aperturarBeneficiario(id,id_catprog){
            var params=new Object();
            params.id=id;
            params.id_catprog=id_catprog
            $.post("controladorbeneficiario?operacion=aperturar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        
        function eliminarBeneficiario(id){
            
            confirma("", "Eliminar Beneficiario", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorbeneficiario?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        
        
        $(document).ready(function(){
            
            $('#beneficiarioslist').DataTable();
        });
        
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-file-text-o" style="color: #fff"></span> Catálogo de Beneficiarios (dentro de la CxC)
        </h3>
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo">    
                <a href="controladorbeneficiario?operacion=reporte" target="_blank" >
                    <img src="imagenes/reportesb.png" alt="Imprimir"/>
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="beneficiarioslist">
            <thead>
                <tr style="font-size: 13px;font-stretch: condensed;">
                    <th style="font-weight: normal; width: 30%">Acciones</th>
                    <th>Programa</th>
                    <th>Tipo de Crédito</th>
                    <th>Num. Contrato</th>
                    <th>Clave SEDUVI</th>
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
                    <th>Usuario</th>
                    <th>Aperturado?</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="beneficiario" items="${requestScope.beneficiarios}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}" style="font-size: 12px;font-stretch: condensed;color:#000;">
                        <th style="font-weight: normal; width: 30%"><img src="imagenes/editar.png" class="btn-tabla" title="Editar Beneficiario" onclick="editarBeneficiario(${beneficiario.id_beneficiario});" /><img src="imagenes/acuse.png" class="btn-tabla" title="Apertura Edo. de Cuenta" onclick="aperturarBeneficiario(${beneficiario.id_beneficiario},${beneficiario.id_catprog});" /><img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Beneficiario" onclick="eliminarBeneficiario(${beneficiario.id_beneficiario});" /><img src="imagenes/agregar.png" class="btn-tabla" title="Movimientos del Estado de Cuenta" onclick="verEdoCta(${beneficiario.id_beneficiario});" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.catprog}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.tipocredito}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.numcontrato}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.clave_b}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.clave_elect}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.curp}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.rfc}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.nombre}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.conyuge}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.fecha_con}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.mza}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.lte}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.area}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.domicilio}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.clave_cat}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.fecha_ip}" /></th>
                        <th style="font-weight: normal"> <c:out value="${beneficiario.usuario}" /></th>
                        <c:choose>
                            <c:when test="${beneficiario.aperturado==true}">
                                <th style="text-align: center"><span class="fa fa-check" title="beneficiario con edo. de cuenta aperturado"></span></th>
                            </c:when>
                                    
                            <c:when test="${beneficiario.aperturado==false}">
                                <th style="text-align: center"><span class="fa fa-close" title="beneficiario sin edo. de cuenta"></span></th>
                            </c:when>
                        </c:choose>
                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
            
        </div>    
        
    </body>
</html>