/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Requisito;

/**
 *
 * @author arturo
 */
public class GestionRequisito {
    
    public boolean actualizar(Requisito req){
        Object params[]={req.getNombre(), req.getId_requisito()};
        return Conexion.ejecutar("update requisito set nombre=? where id_requisito=?", params);
    }
    
    public boolean registroRequisito(Requisito req){
        Object params[]={req.getNombre()};
        return Conexion.ejecutar("insert into requisito (nombre) values (?)", params);
    }
    
    public Requisito obtenerPorId(int id_requisito){
        Requisito req=null;
        Object params[]={id_requisito};
        ResultSet res=Conexion.ejecutarConsulta("select * from requisito where id_requisito=?", params);
        try{
            while(res.next()){
                req=new Requisito(res.getInt("id_requisito"), res.getString("nombre"));
            }
            res.close();
        }catch(Exception e){}
        return req;
    }
    
    public ArrayList obtenerPorTramite(int id_tramite){
        ArrayList requisitos=new ArrayList();
        Object params[]={id_tramite};
        ResultSet res=Conexion.ejecutarConsulta("select R.id_requisito,R.nombre from requisito R inner join tramite_requisito TR on R.id_requisito=TR.id_requisito where TR.id_tramite=? order by R.nombre asc", params);
        try{
            while(res.next()){
                Requisito req=new Requisito(res.getInt("id_requisito"), res.getString("nombre"));
                requisitos.add(req);
            }
            res.close();
        }catch(Exception e){}
        return requisitos;
    }
    
    public ArrayList obtenerSinTramite(int id_tramite){
        ArrayList requisitos=new ArrayList();
        Object params[]={id_tramite};
        ResultSet res=Conexion.ejecutarConsulta("select * from requisito R where (select count(*) from tramite_requisito where id_requisito=R.id_requisito and id_tramite=?) = 0 order by nombre asc", params);
        try{
            while(res.next()){
                Requisito req=new Requisito(res.getInt("id_requisito"), res.getString("nombre"));
                requisitos.add(req);
            }
            res.close();
        }catch(Exception e){}   
        return requisitos;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList requisitos=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from requisito order by nombre asc", null);
        try{
            while(res.next()){
                Requisito req=new Requisito(res.getInt("id_requisito"), res.getString("nombre"));
                requisitos.add(req);
            }
            res.close();
        }catch(Exception e){}
        return requisitos;
    }
    
    public boolean eliminarPorId(int id_requisito){
        Object params[]={id_requisito};
        return Conexion.ejecutar("delete from requisito where id_requisito=?", params);
    }
}
