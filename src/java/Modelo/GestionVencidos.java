/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Marlon
 */
public class GestionVencidos {
    
    /*
    public ArrayList obtenerVencidos(Integer id_benef, Date fecha_corte){
        //arraylist de la fecha
        ArrayList fechas = null;
        Date fecha_ip = null;
        Integer mecanica = null;
        Integer plazo = null;
        Integer id_catprog = null;
        
        try{
            //obtenemos los valores de fecha inicio de pago y plazo
            Object params[] = {id_benef};
            ResultSet res=Conexion.ejecutarConsulta("select * from benef where id_benef=?",params);
            fecha_ip = res.getDate("fecha_ip");
            plazo = res.getInt("plazo");
            id_catprog = res.getInt("id_catprog");
            
            
            //comparamos la fecha de corte es menor o igual al inicio de pago
            if((fecha_corte.compareTo(fecha_ip)<0)|| (fecha_corte.compareTo(fecha_ip)==0)){
                
                
                
            }else{
                /*
                Object params2[] = {id_catprog};
                ResultSet res2 = Conexion.ejecutarConsulta("Select * from cat_prog where id_catprog", params2);
                
                mecanica = res2.getInt("mecanica");
                
                Calendar fechacorte = Calendar.getInstance();
                fechacorte.setTime(fecha_corte);
                
                int ano_cor = fechacorte.get(Calendar.YEAR);
                int mes_cor = fechacorte.get(Calendar.MONTH);
                int dia_cor = fechacorte.get(Calendar.DAY_OF_MONTH);
                
                Calendar fechainicio = Calendar.getInstance();
                fechainicio.setTime(fecha_ip);
                
                int ano_in = fechainicio.get(Calendar.YEAR);
                int mes_in = fechainicio.get(Calendar.MONTH);
                int dia_in = fechainicio.get(Calendar.DAY_OF_MONTH);
                
                
                
            
            }
            
            
        
        }catch(Exception e){}
        
        
    
    }*/
    
}
