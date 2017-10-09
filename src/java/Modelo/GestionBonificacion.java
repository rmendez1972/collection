/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Bonificacion;

/**
 *
 * @author Rafael Méndez
 */
public class GestionBonificacion {
    public boolean registroBonificacion(Bonificacion bonificacion){
        Object params[]={bonificacion.getClave_bonific(),bonificacion.getDescripcion()};
        return Conexion.ejecutar("insert into cat_bonific (clave_bonific,descripcion) values (?,?)", params);
    }
    
    public Bonificacion obtenerPorId(int id_bonific){
        Object params[]={id_bonific};
        Bonificacion bonificacion=null;
        ResultSet res=Conexion.ejecutarConsulta("select * from cat_bonific where id_bonific=?", params);
        try{
            if(res.next()){
                bonificacion=new Bonificacion(res.getInt("id_bonific"),res.getString("clave_bonific"), res.getString("descripcion"));
            }
            res.close();
        }catch(Exception e){}
        return bonificacion;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from cat_bonific order by id_bonific asc", null);
        try{
            while(res.next()){
                Bonificacion bonificacion=new Bonificacion(res.getInt("id_bonific"), res.getString("clave_bonific"), res.getString("descripcion"));
                lista.add(bonificacion);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean eliminarPorId(int id_bonific){
        Object params[]={id_bonific};
        return Conexion.ejecutar("delete from cat_bonific where id_bonific=?", params);
    }
    
    public boolean actualizar(Bonificacion bonificacion){
        Object params[]={bonificacion.getClave_bonific(), bonificacion.getDescripcion(), bonificacion.getId_bonific()};
        return Conexion.ejecutar("update cat_bonific  set clave_bonific=?, descripcion=? where id_bonific=?", params);
    }
}
