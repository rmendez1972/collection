<%-- 
    Document   : listar_mov_bonific
    Created on : 24/07/2017, 10:49:19 AM
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

        function editarBonificEdocta(id){
            var params=new Object();
            params.id=id;
            $.post("controladormovbonific?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }   
        function eliminarBonificEdocta(id,id_movedoscta){
            
            confirma("", "Eliminar Movimiento", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.id=id;
                params.id_movedoscta=id_movedoscta;
                $.post("controladormovbonific?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        function nuevaBonificEdocta(id){
            var params=new Object();
            params.id=id;
            $.post("controladormovbonific?operacion=nuevo", params, function(datos){
                $("#show").html(datos);
            },"html");
        }
        
        
        function nuevaBonificDiv(iddiv){
            var params=new Object();
            params.iddiv=iddiv;
            $.post("controladormovbonific?operacion=nuevo", params, function(datos){
                $("#show").html(datos);
            },"html");
        }
        
        function editarBonificDiv(iddiv){
            var params=new Object();
            params.iddiv=iddiv;
            $.post("controladormovbonific?operacion=editar", params, function(datos){
                $("#show").html(datos);
            },"html");
        }
        
        function eliminarBonificDiv(iddiv,id_movdiversos){
            
            confirma("", "Eliminar Movimiento", "Confirmar eliminación", "eliminar", function(){
                var params=new Object();
                params.iddiv=iddiv;
                params.id_movdiversos=id_movdiversos;
                $.post("controladormovbonific?operacion=eliminar", params, function(datos){
                    $("#show").html(datos);
                },"html");
            });
        }
        
        
        function reporte(id_bonificacion){
            var params=new Object();
            params.id_bonificacion=id_bonificacion;
            $.post("controladormovbonific?operacion=reporte", params, function(datos){
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
            <span class="fa fa-money" style="color: #fff; padding: 5px;"></span> Mantenimiento de Movimientos de bonificación
        </h3>
        
         
         <div class="container-fluid navbar-right">
         
            <c:set var="id_movedoscta" value="${requestScope.id}"/>
            <c:set var="id_movdiversos" value="${requestScope.iddiv}"/>
            <c:if test="${id_movedoscta!=null}">
               <div class="btn-catalogo"  onclick="nuevaBonificEdocta(${requestScope.id});">
                   <img src="imagenes/agregar.png" alt="Nuevo" />
               </div>
            </c:if>
            <c:if test="${id_movdiversos!=null}">
               <div class="btn-catalogo"  onclick="nuevaBonificDiv(${requestScope.iddiv});">
                   <img src="imagenes/agregar.png" alt="Nuevo" />
               </div>
            </c:if>
            
            <c:if test="${id_movedoscta!=null}">
                <div class="btn-catalogo">
                    <a href="controladormovbonific?operacion=reporte&id_bonificacion=${requestScope.id_bonificacion}" target="_blank">
                        <img src="imagenes/reportesb.png" alt="Imprimir"/>
                    </a>
                </div>
            </c:if>
            <c:if test="${id_movdiversos!=null}">
                <div class="btn-catalogo">
                    <a href="controladormovbonific?operacion=reportediv&id_bonificacion=${requestScope.id_bonificacion}" target="_blank">
                        <img src="imagenes/reportesb.png" alt="Imprimir"/>
                    </a>
                </div>
            </c:if>
            
        </div>
        
        <div class="table-responsive listado">
        <table class="table table-condensed table-hover" id="candidatoslist">
            <thead>
                <tr>
                    <th>Acciones</th>
                    <th>Nombre Beneficiario</th>
                    <th>Imp Capital</th>
                    <th>Imp Interes</th>
                    <th>Imp Adm</th>
                    <th>Imp Seg</th>
                    <th>Imp Osg</th>
                    <th>Clave Bonificacion</th>
                    <th>Estatus</th>
                    <th>Usuario</th>
                    <th>Clave B</th>
                    <th>Recibo</th>
                    <th>Serie</th>
                    <th>Numero Contrato</th>
                    <th>Programa</th>
                    <th>Autoriza</th>
                    
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="mov" items="${requestScope.movbonific}" varStatus="loop"> 
                    <tr class="${loop.index % 2 == 0 ? 'odd' : 'impar'}">
                         <c:set var="id_movedoscta" value="${mov.id_movedoscta}"/>
                         <c:set var="id_movdiversos" value="${mov.id_movdiversos}"/>
                         
                        <c:if test="${id_movedoscta!=0}">
                        <th><img src="imagenes/editar.png" class="btn-tabla" title="Editar Movimiento" onclick="editarBonificEdocta(${mov.id_movedoscta});" />
                            <img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Movimiento" onclick="eliminarBonificEdocta(${mov.id_bonificacion},${mov.id_movedoscta});" />
                        </th>
                        </c:if>
                        <c:if test="${id_movdiversos!=0}">
                        <th><img src="imagenes/editar.png" class="btn-tabla" title="Editar Movimiento" onclick="editarBonificDiv(${mov.id_movdiversos});" />
                            <img src="imagenes/eliminar.png" class="btn-tabla" title="Eliminar Movimiento" onclick="eliminarBonificDiv(${mov.id_bonificacion},${mov.id_movdiversos});" />
                        </th>
                        </c:if>
          
                        <th> <c:out value="${mov.nombrebenef}" /></th>
                        <th> <c:out value="${mov.imp_cap}" /></th>
                        <th> <c:out value="${mov.imp_int}" /></th>
                        <th> <c:out value="${mov.imp_adm}" /></th>
                        <th> <c:out value="${mov.imp_seg}" /></th>
                        <th> <c:out value="${mov.imp_osg}" /></th>
                        <th> <c:out value="${mov.clavebonific}" /></th>
                        <th> <c:out value="${mov.estatus}" /></th>
                        <th> <c:out value="${mov.usuario}" /></th>
                        <th> <c:out value="${mov.clave_b}" /></th>
                        <th> <c:out value="${mov.recibo}" /></th>
                        <th> <c:out value="${mov.serie}" /></th>
                        <th> <c:out value="${mov.numcontrato}" /></th>
                        <th> <c:out value="${mov.catprograma}" /></th>
                        <th> <c:out value="${mov.nombreautoriza}" /></th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
            
            
                      
            
                      
            
        </div>    
    </body>
</html>
