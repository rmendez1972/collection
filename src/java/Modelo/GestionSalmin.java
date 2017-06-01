/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Salmin;
//import javabeans.Status;


/**
 *
 * @author Marlon
 */
public class GestionSalmin {
    
    public ArrayList obtenerTodos(){
        ArrayList lista = new ArrayList();
        ResultSet res = Conexion.ejecutarConsulta("select * from salmin order by Fecha asc", null);
        try{
            while(res.next()){
                //Status st=new Status(res.getInt("id_status"), res.getString("nombre"));
                Salmin sal=new Salmin(res.getInt("id_salmin"), res.getDate("fecha"), res.getBigDecimal("importe"));
                lista.add(sal);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean registroSalmin(Salmin sal){
        Object params[]={sal.getFecha()};
        return Conexion.ejecutar("insert into salmin (fecha) values (?)", params);
    }
    
}
