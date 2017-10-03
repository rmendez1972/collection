/*Función para personalizar los alert
 * ismael*/

function alertTramite(mensaje){
    var dgcTiempo=500;
    var ventanaCS='<div class="dgcAlert"><div class="dgcVentana"><div class="dgcCerrar"></div><div class="dgcMensaje">'+mensaje+'<br><div class="dgcAceptar">Aceptar</div></div></div></div></div>';
    $("body").append(ventanaCS);
    var alVentana=$('.dgcVentana').height();
    var alNav=$(window).height();
    var supNav=$(window).scrollTop();
    $('.dgcAlert').css('height',$(document).height());
    //$('.dgcVentana').css('top',((alNav-alVentana)/2+supNav-100)+'px');
    $('.dgcAlert').css('display','block');
    $('.dgcAlert').animate({opacity:1},dgcTiempo);
    $('.dgcCerrar,.dgcAceptar').click(function(e) {
        $('.dgcAlert').animate({opacity:0},dgcTiempo);
        setTimeout("$('.dgcAlert').remove()",dgcTiempo);
    });
    
}
//Fin de la función alertTramite

/*Script para asiganar a windows.alert de javaScript la función de alertTramite
 * ismael*/
window.alert = function (message) {
    alertTramite(message);
};
//Fin del sript
    



/*Función confirma para personalizar los confirm tradicionales */
function confirma(url, titulo,mensaje,logo,funcionsi){
    
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
}//Fin de la funcion confirma




/*Función para obtener la fecha actual formato simple para input type date
 * ismael*/
function fechaActual(){
    f=new Date();    var mes=(f.getMonth() +1);    var dia=(f.getDate());
    
    if ((f.getMonth() +1)<10){ //Si el mes es menor a 2 digitos, antemoner un cero al mes
        mes="0"+(f.getMonth() +1);
    }
    if (f.getDate()<10){ //Si el dia es menor a 2 digitos, antemoner un cero al dia
        dia="0"+(f.getDate());
    }
   var fecha=(f.getFullYear()+ "-"+ mes+ "-" +dia); //Concatenar los valores para formar una fecha simple
   return fecha; //Devolver el valor de fecha simple
   //document.getElementById('fecha_r').value=fecha;
}//Fin de la funcion fechaActual

/* Función lock para deshabilitar elementos cuando el status sea concluido
 * ismael*/
function lock(){
   if (document.getElementById("id_status").value==3){
        obj = document.getElementById('modifica');
        for (i=0; ele = obj.getElementsByTagName('*')[i]; i++)
        ele.disabled=true;
        alert('Estatatus CONCLUIDO.\n Este seguimiento no puede ser modificado\n'+'<img src="imagenes/stop.png">');
    }     
}//Fin de la función lock


