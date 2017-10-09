/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Localidad;
import javabeans.Delegacion;


/**
 *
 * @Rafael Méndez
 */
public class GestionLocalidad {
    public boolean registroLocalidad(Localidad localidad){
        boolean res=false;
        
        Integer id_delegacion=localidad.getId_delegacion();
        String descripcion=localidad.getDescripcion();
          
        Object params[]={descripcion,id_delegacion};
        res=Conexion.ejecutar("insert into localidades (descripcion, id_delegacion) values (?,?)", params);
        
        return res;
    }
    
    public Localidad obtenerPorId(int id_localidad){
        Object params[]={id_localidad};
        Localidad localidad=null;
        ResultSet res=Conexion.ejecutarConsulta("select * from localidades where id_localidad=?", params);
        try{
            if(res.next()){
                localidad=new Localidad(res.getInt("id_localidad"), res.getString("descripcion"),res.getInt("id_delegacion"));
            }
            res.close();
        }catch(Exception e){}
        return localidad;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select L.*, D.descripcion as delegacion from localidades L inner join delegaciones D on L.id_delegacion=D.id_delegacion order by L.id_localidad asc", null);
        try{
            while(res.next()){
                Localidad localidad=new Localidad(res.getInt("id_localidad"), res.getString("descripcion"),res.getInt("id_delegacion"));
                localidad.setDelegacion(res.getString("delegacion"));
                lista.add(localidad);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
       
    public boolean actualizarLocalidad(Localidad localidad){
        String descripcion=localidad.getDescripcion();
        Integer mid_delegacion=localidad.getId_delegacion();
        String id_delegacion=mid_delegacion.toString();
        Integer mid_localidad=localidad.getId_localidad();
        String id_localidad= mid_localidad.toString();
        Object params[]={descripcion, id_delegacion, id_localidad};
        return Conexion.ejecutar("update localidades set descripcion=?, id_delegacion=? where id_localidad=?", params);
    }
    
    public boolean eliminarPorId(int id_localidad){
        Object params[]={id_localidad};
        return Conexion.ejecutar("delete from localidades where id_localidad=?", params);
    }
    
   
}
