/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Tramite;

/**
 *
 * @author arturo
 */
public class GestionTramite {
    
    public boolean registroTramite(Tramite t){
        Object params[]={t.getNombre(), t.getDias_resolucion(), t.getId_unidadadministrativa(), t.getId_direccion(), t.getCosto()};
        return Conexion.ejecutar("insert into tramite (nombre, dias_resolucion, id_unidadAdministrativa,id_direccion,costo) values (?,?,?,?,?)", params);
    }
    
    public Tramite obtenerPorId(int id_tramite){
        Tramite t=null;
        Object params[]={id_tramite};
        ResultSet res=Conexion.ejecutarConsulta("select T.*, U.nombre as unidadadministrativa, D.nombre as direccion from tramite T inner join unidadadministrativa U on T.id_unidadadministrativa=U.id_unidadadministrativa  inner join direcciones D on T.id_direccion=D.id_direccion where T.id_tramite=?", params);
        //ResultSet res=Conexion.ejecutarConsulta("select * from tramite where id_tramite=?", params);
        
        try{
            while(res.next()){
                t=new Tramite(res.getInt("id_tramite"), res.getInt("dias_resolucion"), res.getInt("id_unidadadministrativa"), res.getInt("id_direccion"),res.getString("nombre"),res.getString("costo"));
                t.setUnidadAdministrativa(res.getString("unidadadministrativa"));
                t.setDireccion(res.getString("direccion"));
            }
            
            
            res.close();
        }catch(Exception e){}
        return t;
    }
    
    public ArrayList obtenerPorUnidadAdministrativa(int id_unidadadministrativa){
        ArrayList tramites=new ArrayList();
        Object params[]={id_unidadadministrativa};
        ResultSet res=Conexion.ejecutarConsulta("select * from tramite where id_unidadadministrativa=? order by nombre asc", params);
        try{
            while(res.next()){
                Tramite t=new Tramite(res.getInt("id_tramite"), res.getInt("dias_resolucion"), res.getInt("id_unidadadministrativa"), res.getInt("id_unidadadministrativa"),res.getString("nombre"),res.getString("costo"));
                tramites.add(t);
            }
            res.close();
        }catch(Exception e){}
        return tramites;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList tramites=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select T.*, UA.nombre as unidadAdministrativa, D.nombre as direccion from tramite T inner join unidadadministrativa UA on T.id_unidadadministrativa=UA.id_unidadadministrativa inner join direcciones D on T.id_direccion=D.id_direccion order by unidadAdministrativa,T.nombre asc",null);
        //ResultSet res=Conexion.ejecutarConsulta("select T.id_tramite, T.dias_resolucion, T.id_unidadadministrativa, T.id_direccion, T.nombre, UA.nombreU as unidadAdministrativa from tramite T inner join unidadadministrativa U on T.id_unidadadministrativa=U.id_unidadadministrativa inner join direcciones D on U.id_direccion=D.id_direccion order by nombre asc", null);
       // ResultSet res=Conexion.ejecutarConsulta("select T.id_tramite, T.dias_resolucion, T.id_unidadadministrativa, T.id_direccion, T.nombre, UA.nombreU as unidadAdministrativa from tramite T inner join unidadadministrativa U on T.id_unidadadministrativa=U.id_unidadadministrativa order by nombre asc", null);
        try{
            while(res.next()){
                Tramite t=new Tramite(res.getInt("id_tramite"), res.getInt("dias_resolucion"), res.getInt("id_unidadadministrativa"), res.getInt("id_direccion"),res.getString("nombre"),res.getString("costo"));
                t.setUnidadAdministrativa(res.getString("unidadAdministrativa"));
                t.setDireccion(res.getString("direccion"));
                tramites.add(t);
            }
            res.close();
        }catch(Exception e){}
        return tramites;
    }
    
    public boolean eliminarPorId(int id_tramite){
        Object params[]={id_tramite};
        Conexion.ejecutar("delete from tramite_requisito where id_tramite=?", params);
        return Conexion.ejecutar("delete from tramite where id_tramite=?", params);
    }
    
    public boolean actualizar(Tramite t){

        Object params[]={t.getNombre(), t.getDias_resolucion(), t.getId_unidadadministrativa(),t.getId_direccion(),t.getCosto(), t.getId_tramite()};

        return Conexion.ejecutar("update tramite set nombre=?, dias_resolucion=?, id_unidadadministrativa=?, id_direccion=?, costo=? where id_tramite=?", params);
    }
    
    public boolean agregarRequisito(int id_tramite, int id_requisito){
        Object params[]={id_tramite, id_requisito};
        return Conexion.ejecutar("insert into tramite_requisito values (?,?)", params);
    }
    
    public boolean eliminarRequisito(int id_tramite, int id_requisito){
        Object params[]={id_requisito, id_tramite};
        return Conexion.ejecutar("delete from tramite_requisito where id_requisito=? and id_tramite=?", params);
    }
}
