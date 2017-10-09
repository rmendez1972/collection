/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function fechaActual()
{
    f=new Date();
    //var dia="";
    var mes=(f.getMonth() +1);
    var dia=(f.getDate());
   
    
    if ((f.getMonth() +1)<10){ //Si el mes es menor a 2 digitos, antemoner un cero al mes
        mes="0"+(f.getMonth() +1);

    }
    if (f.getDate()<10){ //Si el dia es menor a 2 digitos, antemoner un cero al dia
        dia="0"+(f.getDate());
    }
   var fecha=(f.getFullYear()+ "-"+ mes+ "-"+dia); //Concatenar los valores para formar una fecha simple
   return fecha; //Devolver el valor de fecha simple
   //document.getElementById('fecha_r').value=fecha;
}

function lock(){

   if (document.getElementById("id_status").value==3){
    
    //alert ('Registro reportado como concluido\n No se puede modificar')
    
 
    //document.getElementById("id_status").disabled=true;
    //document.getElementById("fecha_t").disabled=true;
    
        //document.getElementById("modifica").style.display="none";
    
    //document.getElementById("observaciones").disabled=true;
    //document.getElementById("adjuntonuevo").disabled=true;
    //document.getElementById("hazlo").disabled=true;
    //document.getElementById("hazlo").contenteditable="false";
    
        obj = document.getElementById('modifica');
        for (i=0; ele = obj.getElementsByTagName('*')[i]; i++)
        ele.disabled=true;
      
        alert('Estatatus CONCLUIDO.\n Este seguimiento no puede ser modificado\n'+'<img src="imagenes/stop.png">');
    }     
}

