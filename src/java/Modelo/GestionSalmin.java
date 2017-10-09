/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Salmin;
import java.text.SimpleDateFormat;


/**
 *
 * @author Marlon
 */
public class GestionSalmin {
    
    public boolean registroSalmin(Salmin sal){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String fecha=sdf.format(sal.getFecha());
        String importe = sal.getImporte().toString();
               
        Object params[]={fecha, importe};
        return Conexion.ejecutar("insert into salmin (fecha, importe) values (?,?)", params);
    }
    
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
    
    public Salmin obtenerPorId(int id_salmin){
        Salmin salmin = null;
        Object params[]={id_salmin};
        ResultSet res=Conexion.ejecutarConsulta("select * from salmin where id_salmin=?", params);
        try{
            if(res.next())
                salmin=new Salmin(res.getInt("id_salmin"), res.getDate("fecha"), res.getBigDecimal("importe"));
            res.close();
        }catch(Exception e){}
        return salmin;
    }
    
    public boolean actualizarSalmin(Salmin salmin){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String fecha = sdf.format(salmin.getFecha());
        String importe = salmin.getImporte().toString();
        String id_salmin = salmin.getId_salmin().toString();
        
        Object params[]={fecha, importe, id_salmin};
        return Conexion.ejecutar("update salmin set fecha=?, importe=? where id_salmin=?", params);
    }
    
    public boolean eliminarPorId(int id_salmin){
        Object params[]={id_salmin};
        return Conexion.ejecutar("delete from salmin where id_salmin=?", params);
    }
      
}
