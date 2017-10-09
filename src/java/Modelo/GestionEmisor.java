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
public class GestionEmisor {
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from cat_emisores order by descripcion asc", null);
        try{
            while(res.next()){
                CatEmisores ce=new CatEmisores(res.getInt("id_emisor"), res.getString("descripcion"));
                lista.add(ce);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean registroEmisor(CatEmisores ce){
        Object params[]={ce.getDescripcion()};
        return Conexion.ejecutar("insert into cat_emisores(descripcion) values (UPPER(?))", params);
    }
    
    public CatEmisores obtenerPorId(int id_emisor){
        Object params[]={id_emisor};
        CatEmisores ce = null;
        ResultSet res=Conexion.ejecutarConsulta("select * from cat_emisores where id_emisor=?", params);
        try{
            while(res.next()){
                ce=new CatEmisores(res.getInt("id_emisor"), res.getString("descripcion"));
            }
            res.close();
        }catch(Exception e){}
        return ce;
    }
    
    public boolean eliminarPorId(int id_emisor){
        Object params[]={id_emisor};
        return Conexion.ejecutar("delete from cat_emisores where id_emisor=?", params);
    }
    
    
    public boolean actualizar(CatEmisores ce){
        Object params[]={ce.getDescripcion(), ce.getId_emisor()};
        return Conexion.ejecutar("update cat_emisores set descripcion=UPPER(?) where id_emisor=?", params);
    }
    
}
