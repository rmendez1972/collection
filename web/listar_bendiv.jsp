<%-- 
    Document   : listar_bendiv
    Created on : 21/06/2017, 11:16:34 AM
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

        function editarBendiv(id){
            var params=new Object();
            params.id=id;
            $.post("controladorbendiv?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }
        
        function listarMovBendiv(id){
            
            var params=new Object();
            params.id=id;
            $.post("controladormov_diversos?operacion=listarMovBendivId", params, function(datos){
                $("#show").html(datos);
            },"html");
        }
        
        function eliminarBendiv(id){
            
            confirma("", "Eliminar beneficiario diverso", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                $.post("controladorbendiv?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        $(document).ready(function(){
            
            $('#bendivlist').DataTable();
        });
        
        
        <c:if test="${msg != null}">
            alert('${msg}');
        </c:if>
        </script>
    </head>
    <body>
        <h3 class="bg-primary encabezado">
            <span class="fa fa-id-badge" style="color: #fff; padding: 5px"></span>
            Beneficiarios diversos
        </h3>
        
        
      
        <div class="container-fluid navbar-right">
            <div class="btn-catalogo"  onclick="cargar('controladorbendiv?operacion=nuevo','#show')">
                <img src="imagenes/agregar.png" alt="Nuevo" />
            </div>
            <div class="btn-catalogo">    
                <a href="controladorbendiv?operacion=reporte" target="_blank" >
                    <img src="imagenes/reportesb.png" alt="Imprimir"/>
                </a>
            </div>
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="bendivlist">
            <thead>
                <tr style="font-size: 12px;font-stretch: condensed;">
                    <th>Acciones</th>
                    <th>Clave benef.</th>
                    <th>Programa</th>
                    <th>Fecha</th>
                    <th>Nombre</th>
                    <th>Clave de elector</th>
                    <th>CURP</th>
                    <th>Juri.</th>
                    <th>Conyuge</th>
                    <th>Mza.</th>
                    <th>Lte.</th>
                    <th>Aperturado</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bendiv" items="${requestScope.bendivs}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}" style="font-size: 14px;font-stretch: condensed;color:#000;">
                        
                        <th>
                            <img src="imagenes/editar.png" 
                                 class="btn-tabla" title="Editar Registro"     
                                 onclick="editarBendiv(${bendiv.id_bendiv});"/>
                            <img src="imagenes/listar.png" class="btn-tabla" title="Lista los registro de este beneficiaro" 
                                 onclick="listarMovBendiv(${bendiv.id_bendiv});"/>
                            <img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Registro" 
                                 onclick="eliminarBendiv(${bendiv.id_bendiv});"/>
                        </th>
                        
                        <th style="font-weight: normal"> <c:out value="${bendiv.clave_b}" /></th>
                        <th style="font-weight: normal"> <c:out value="${bendiv.catprog}" /></th>
                        <th style="font-weight: normal"> <c:out value="${bendiv.fecha_con}" /></th>
                        <th style="font-weight: normal"> <c:out value="${bendiv.nombre}" /></th>
                        <th style="font-weight: normal"> <c:out value="${bendiv.clave_elect}" /></th>
                        <th style="font-weight: normal"> <c:out value="${bendiv.curp}" /></th>
                        <th style="font-weight: normal"> <c:out value="${bendiv.juridico}" /></th>
                        <th style="font-weight: normal"> <c:out value="${bendiv.conyuge}" /></th>
                        <th style="font-weight: normal"> <c:out value="${bendiv.mza}" /></th>
                        <th style="font-weight: normal"> <c:out value="${bendiv.lte}" /></th>
                        
                        <c:choose>
                            <c:when test="${bendiv.aperturado==true}">
                                <th style="text-align: center">
                                    <span class="fa fa-check" title="movimiento con bonificación"></span></th>
                            </c:when>
                                    
                            <c:when test="${bendiv.aperturado==false}">
                                <th style="text-align: center"><span class="fa fa-close" title="movimiento sin bonificación"></span></th>
                            </c:when>
                        </c:choose>
                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
            
        </div>    
        
    </body>
</html>