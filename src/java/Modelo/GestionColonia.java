/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Colonia;
import javabeans.Delegacion;


/**
 *
 * @Rafael Méndez
 */
public class GestionColonia {
    public boolean registroColonia(Colonia colonia){
        boolean res=false;
        //Seguimiento seguimiento;
        //Solicitud solicitud;
        Integer id_delegacion=colonia.getId_delegacion();
        String descripcion=colonia.getDescripcion();
          
        Object params[]={descripcion,id_delegacion};
        res=Conexion.ejecutar("insert into colonias (descripcion, id_delegacion) values (?,?)", params);
        
        return res;
    }
    
    public Colonia obtenerPorId(int id_colonia){
        Object params[]={id_colonia};
        Colonia colonia=null;
        ResultSet res=Conexion.ejecutarConsulta("select * from colonias where id_colonia=?", params);
        try{
            if(res.next()){
                colonia=new Colonia(res.getInt("id_colonia"), res.getString("descripcion"),res.getInt("id_delegacion"));
            }
            res.close();
        }catch(Exception e){}
        return colonia;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select C.*, D.descripcion as delegacion from colonias C inner join delegaciones D on C.id_delegacion=D.id_delegacion order by C.id_colonia asc", null);
        try{
            while(res.next()){
                Colonia colonia=new Colonia(res.getInt("id_colonia"), res.getString("descripcion"),res.getInt("id_delegacion"));
                colonia.setDelegacion(res.getString("delegacion"));
                lista.add(colonia);
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
    
       
    public boolean actualizarColonia(Colonia colonia){
        String descripcion=colonia.getDescripcion();
        Integer mid_delegacion=colonia.getId_delegacion();
        String id_delegacion=mid_delegacion.toString();
        Integer mid_colonia=colonia.getId_colonia();
        String id_colonia= mid_colonia.toString();
        Object params[]={descripcion, id_delegacion, id_colonia};
        return Conexion.ejecutar("update colonias set descripcion=?, id_delegacion=? where id_colonia=?", params);
    }
    
    public boolean eliminarPorId(int id_colonia){
        Object params[]={id_colonia};
        return Conexion.ejecutar("delete from colonias where id_colonia=?", params);
    }
    
   
}
