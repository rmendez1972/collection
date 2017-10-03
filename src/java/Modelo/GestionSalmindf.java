/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javabeans.Salmindf;

/**
 *
 * @author Ismael
 */

public class GestionSalmindf {
    
    public boolean registroSalmindf(Salmindf salmindf){
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha=sdf.format(salmindf.getFecha());
        String importe=salmindf.getImporte().toString();
        Object params[]={fecha, importe};
        return Conexion.ejecutar("insert into salmindf (fecha, importe) values (?,?)", params);
    }
    
    public Salmindf obtenerPorId(int id_salmindf){
    Salmindf salmindf=null;
    Object params[]={id_salmindf};
    ResultSet res=Conexion.ejecutarConsulta("select * from salmindf where id_salmindf=?", params);
    try{
        if(res.next())
        //  salmindf =new Salmindf(res.getDate("fecha"), res.getBigDecimal("importe"), res.getInt("id_salmindf"));
            salmindf= new Salmindf(res.getInt("id_salmindf"), res.getDate("fecha"), res.getBigDecimal("importe"));
        res.close();
    }catch(Exception e){}
    return salmindf;
    }

    public ArrayList obtenerSalmindf(){        
        ArrayList lista=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from salmindf order by fecha asc", null);
        try{
            while(res.next()){
                Salmindf st=new Salmindf(res.getInt("id_salmindf"), res.getDate("fecha"), res.getBigDecimal("importe"));
                lista.add(st);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
  
   
    public boolean actualizarSalmindf(Salmindf salmindf){
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha=sdf.format(salmindf.getFecha());
        String importe=salmindf.getImporte().toString();
        String id_salmindf= salmindf.getId_salmindf().toString();
        Object params[]={fecha, importe,id_salmindf};
        //hjhfdsh
        return Conexion.ejecutar("update salmindf set fecha=?, importe=? where id_salmindf=?", params);
    }
  
    public boolean eliminarPorId(int id_salmindf){
        Object params[]={id_salmindf};
        return Conexion.ejecutar("delete from salmindf where id_salmindf=?", params);
    }

}
