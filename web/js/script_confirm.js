$(document).ready(function(){
	
       
        
        
        $(":button").click(function(event) //Al oprimir un boton
                { 
                   event.preventDefault();
                   titulo=$(this,"button").attr("titulo");//Se obtiene el id del botón para presentarlo como titulo del confirm
                   logo=$(this,"button").attr("id");
                   mensaje=$(this,"button").attr("mensaje");
                     

                   var url = $(this).attr('value'); //Obteniendo la opcion que ejecutará el controlador.
                   
                   //Invocamos al confirm personalizado pasandole parametros
                   confirma(url, titulo,mensaje,logo,
                                function(url)
                                {
                                    $.post(url,function(resultado) 
                                    {  
                                        $('#contenido').html(resultado);  
                                    });
                                    return true;
                                });
                   

                });
        
        
        
        
        
          
});

function confirma(url, titulo,mensaje,logo,funcionsi){
		
		//var elem = $(this).closest('.item');
		
		$.confirm({
			'title'		: titulo,//'Confirme la '+titulo+'.',//'Confirme la eliminación.',
			'message'	: mensaje+' Continuar?',//'Está Ud. seguro de proceder a la '+mensaje+'. Contiuar?',//'Está Ud. seguro de eliminar este registro?. <br />No se podrá recuperar más tarde!  Continuar?',
                        'image'         : 'imagenes/'+logo+'.png',//editar.png',
			'buttons'	: {
				'Sí'	: {
					'class'	: 'blue',
					'action': function(){
                                            funcionsi(url);

					}
				},
				'No'	: {
					'class'	: 'gray',
					'action': function(){
                                            //confirma=false;
                                            //return false;
                                        }	
                                        
				}
			}
		});
		
	}
	