/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import javabeans.ModulosRecaudacion;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Marlon
 */
public class GestionModRec {
    
    public ArrayList obtenerTodos(){
        ArrayList lista = new ArrayList();
        ResultSet res = Conexion.ejecutarConsulta("select M.*, D.descripcion as delegacion from modulos_recaudacion M inner join delegaciones D on M.id_delegacion = D.id_delegacion order by M.descripcion asc", null);
        try{
            while(res.next()){
               ModulosRecaudacion md =new ModulosRecaudacion(res.getInt("id_modulo"), res.getString("descripcion"), res.getString("direccion"), res.getInt("id_delegacion"));
               md.setDelegacion(res.getString("delegacion"));
               lista.add(md);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean registroModRec(ModulosRecaudacion mr){
        Object params[] = {mr.getDescripcion(), mr.getDireccion(), mr.getId_delegacion()};
        return Conexion.ejecutar("insert into modulos_recaudacion (descripcion, direccion, id_delegacion) values (UPPER(?), UPPER(?), ?)", params);
    }
    
    public ModulosRecaudacion obtenerPorId(int id_modulo){
        ModulosRecaudacion mr=null;
        Object params[]={id_modulo};
        ResultSet res=Conexion.ejecutarConsulta("select * from modulos_recaudacion where id_modulo=?", params);
        try{
            if(res.next())
                mr=new ModulosRecaudacion(res.getInt("id_modulo"), res.getString("descripcion"), res.getString("direccion"), res.getInt("id_delegacion"));
            res.close();
        }catch(Exception e){}
        return mr;
    }
    
    public boolean actualizarModRec(ModulosRecaudacion mr){
        Object params[]={mr.getDescripcion(), mr.getDireccion(), mr.getId_delegacion(), mr.getId_modulo()};
        return Conexion.ejecutar("update modulos_recaudacion set descripcion=UPPER(?), direccion=UPPER(?), id_delegacion=? where id_modulo =?", params);
    }
    
    public boolean eliminarPorId(int id_modulo){
        Object params[]={id_modulo};
        return Conexion.ejecutar("delete from modulos_recaudacion where id_modulo=?", params);
    }
    
    
}
