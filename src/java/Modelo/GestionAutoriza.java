/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Autoriza;
import javabeans.Delegacion;


/**
 *
 * @Ismael
 */
public class GestionAutoriza {
    
    public boolean registroAutoriza(Autoriza autoriza){
        boolean res=false;
        Integer id_delegacion=autoriza.getId_delegacion();
        String nombre=autoriza.getNombre();
        String cargo=autoriza.getCargo();
          
        Object params[]={nombre,cargo,id_delegacion};
        res=Conexion.ejecutar("insert into autoriza (nombre, cargo, id_delegacion) values (?,?,?)", params);
        
        return res;
    }
   
    public Autoriza obtenerPorId(int id_autoriza){
        Object params[]={id_autoriza};
        Autoriza autoriza=null;
        ResultSet res=Conexion.ejecutarConsulta("select * from autoriza where id_autoriza=?", params);
        try{
            if(res.next()){
                autoriza=new Autoriza(res.getInt("id_autoriza"), res.getString("nombre"),res.getString("cargo"),res.getInt("id_delegacion"));
            }
            res.close();
        }catch(Exception e){}
        return autoriza;
    }
    
   
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select A.*, D.descripcion as delegacion from autoriza A inner join delegaciones D on A.id_delegacion=D.id_delegacion order by A.id_autoriza asc", null);
        //ResultSet res=Conexion.ejecutarConsulta("select * from autoriza", null);
        try{
            while(res.next()){
                Autoriza autoriza=new Autoriza(res.getInt("id_autoriza"), res.getString("nombre"), res.getString("cargo"), res.getInt("id_delegacion"));
                autoriza.setDelegacion(res.getString("delegacion"));
                lista.add(autoriza);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    /*
    public ArrayList obtenerPorSeguimiento(int id_seguimiento){
        ArrayList ad=new ArrayList();
        Object params[]={id_seguimiento};
        ResultSet res=Conexion.ejecutarConsulta("select AD.id_adjunto as id_adjunto, AD.nombre as nombre , AD.id_seguimiento as id_seguimiento, AD.id_usuario as id_usuario, U.nombre as nombreusuario  from adjunto AD inner join usuario U on AD.id_usuario=U.id_usuario  where AD.id_seguimiento=? order by id_adjunto desc", params);
        try{
            while(res.next()){
                Colonia adjunto=new Colonia(res.getInt("id_adjunto"), res.getString("nombre"), res.getInt("id_seguimiento"), res.getInt("id_usuario"));
                adjunto.setNombreusuario(res.getString("nombreusuario"));
                ad.add(adjunto);
            }
            res.close();
        }catch(Exception e){}
        return ad;
    }
    */
    
       
    public boolean actualizarAutoriza(Autoriza autoriza){
        String nombre=autoriza.getNombre();
        String cargo=autoriza.getCargo();
        Integer mid_delegacion=autoriza.getId_delegacion();
        String id_delegacion=mid_delegacion.toString();
        Integer mid_autoriza=autoriza.getId_autoriza();
        String id_autoriza= mid_autoriza.toString();
        Object params[]={nombre,cargo, id_delegacion, id_autoriza};
        return Conexion.ejecutar("update autoriza set nombre=?, cargo=?, id_delegacion=? where id_autoriza=?", params);
    }
     
    public boolean eliminarPorId(int id_autoriza){
        Object params[]={id_autoriza};
        return Conexion.ejecutar("delete from autoriza where id_autoriza=?", params);
    }
    
  
}
