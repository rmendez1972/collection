<%-- 
    Document   : frm_firmantes
    Created on : 13/06/2017, 10:17:27 AM
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
          /*  function registrar(){
                var params=new Object();
                params.nombre=$("#nombre").val();
                params.cargo=$("#cargo").val();
                params.firma=$("#firma").val();
                                                          
                $.post("controladorfirmantes?operacion=nuevoGuardar", params, function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }*/
            $("form#form_FR").submit(function()
                {
                
                    var formData = new FormData($(this)[0]);
                    $.ajax(
                    {
                    
                        url: $(this).attr('action'),
                        type: 'POST',
                        data: formData,
                        async: false,
                        success: function (resultado) 
                        {
                        
                            $('#show').html(resultado);  
                        },
                        cache: false,
                        contentType: false,
                        processData: false
                    });

                    return false;
                });
            
            function listar(){
                               
                $.post("controladorfirmantes?operacion=listar", function(datos){
                    $("#show").html(datos);
                },"html");
                
                return false;
            }
        </script>
    </head>
    <body>
            <div class="panel panel-primary" style="margin-top: 60px">
            <div class="panel-heading"><h4><span class="fa fa-pencil-square-o" style="color: #fff"></span> Nuevo Firmante</h4></div>
                <div class="panel-body transparent">
                    <form id="form_FR" action="controladorfirmantes?operacion=nuevoGuardar" method="post"   class="form-horizontal">
                        <!--<form id="form_FR" onsubmit="return registrar()"   class="form-horizontal">-->
                        <div class="form-group">
                            <label for="nombre" class="col-xs-12 col-md-2 control-label col-md-offset-3">Nombre:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="nombre" class="form-control" id="nombre" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9\0-9]{5,50})"  placeholder="Max 50 caracteres" required style="text-transform:uppercase; width: 300px; font-size: 25px"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="cargo" class="col-xs-12 col-md-2 control-label col-md-offset-3">Cargo:</label>
                            <div class="col-xs-12 col-md-2">
                                <input type="text" name="cargo" class="form-control" id="cargo" pattern="([a-zA-ZñÑáéíóúÁÉÍÓÚ\0-9\0-9]{5,50})"  placeholder="Max 50 caracteres" required style="text-transform:uppercase; width: 300px; font-size: 25px"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="firma" class="col-xs-12 col-md-2 control-label col-md-offset-3">Firma:</label>
                            <div class="col-xs-12 col-md-2">
                                <input  name="firma" id="firma" type="file">
                            </div>
                        </div>

                        <div class="form-group" style="text-align:center">
                            <input type="submit" value="Aceptar" class="btn btn-primary" />
                            <input type="reset" value="Cancelar" onclick="return listar()" class="btn btn-default" />
                        </div>


                    </form>
                </div>
        </div>
    </body>
</html>
