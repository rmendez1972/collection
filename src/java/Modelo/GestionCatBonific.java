/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.CatBonificacion;

/**
 *
 * @author Marlon
 */
public class GestionCatBonific {
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from cat_bonific order by clave_bonific asc", null);
        try{
            while(res.next()){
                CatBonificacion cb=new CatBonificacion(res.getInt("id_bonific"), res.getString("clave_bonific"), res.getString("descripcion"));
                lista.add(cb);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean registroCatboni(CatBonificacion cb){
        Object params[]={cb.getClave_bonific(), cb.getDescripcion()};
        return Conexion.ejecutar("insert into cat_bonific(clave_bonific, descripcion) values (UPPER(?),UPPER(?))", params);
    }
    
    public CatBonificacion obtenerPorId(int id_bonific){
        Object params[]={id_bonific};
        CatBonificacion cb = null;
        ResultSet res=Conexion.ejecutarConsulta("select * from cat_bonific where id_bonific=?", params);
        try{
            while(res.next()){
                cb=new CatBonificacion(res.getInt("id_bonific"),res.getString("clave_bonific"), res.getString("descripcion"));
            }
            res.close();
        }catch(Exception e){}
        return cb;
    }
    
    public boolean eliminarPorId(int id_bonific){
        Object params[]={id_bonific};
        return Conexion.ejecutar("delete from cat_bonific where id_bonific=?", params);
    }
    
    public boolean actualizar(CatBonificacion cb){
        Object params[]={cb.getClave_bonific(), cb.getDescripcion(), cb.getId_bonific()};
        return Conexion.ejecutar("update cat_bonific set clave_bonific=?, descripcion=? where id_bonific=?", params);
    }
    
}
