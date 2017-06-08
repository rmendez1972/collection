/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.CatEmisores;

/**
 *
 * @author Marlon
 */
public class GestionCatBonific {
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from cat_emisores order by descripcion asc", null);
        try{
            while(res.next()){
                CatEmisores cb=new CatEmisores(res.getInt("id_emisor"), res.getString("descripcion"));
                lista.add(cb);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean registroCatboni(CatEmisores cb){
        Object params[]={cb.getDescripcion()};
        return Conexion.ejecutar("insert into cat_emisores(descripcion) values (UPPER(?))", params);
    }
    
    public CatEmisores obtenerPorId(int id_bonific){
        Object params[]={id_bonific};
        CatEmisores cb = null;
        ResultSet res=Conexion.ejecutarConsulta("select * from cat_emisores where id_emisor=?", params);
        try{
            while(res.next()){
                cb=new CatEmisores(res.getInt("id_emisor"), res.getString("descripcion"));
            }
            res.close();
        }catch(Exception e){}
        return cb;
    }
    
    public boolean eliminarPorId(int id_bonific){
        Object params[]={id_bonific};
        return Conexion.ejecutar("delete from cat_emisores where id_emisor=?", params);
    }
    
    public boolean actualizar(CatEmisores cb){
        Object params[]={cb.getDescripcion(), cb.getId_bonific()};
        return Conexion.ejecutar("update cat_emisores set descripcion=? where id_emisor=?", params);
    }
    
}
