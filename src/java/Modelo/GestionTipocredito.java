/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Tipocredito;

/**
 *
 * @author arturo
 */
public class GestionTipocredito {
    public boolean registroTipocredito(Tipocredito tipocredito){
        Object params[]={tipocredito.getDescripcion()};
        return Conexion.ejecutar("insert into tipo_credito (descripcion) values (?)", params);
    }
    
    public Tipocredito obtenerPorId(int id_tipocredito){
        Object params[]={id_tipocredito};
        Tipocredito tipocredito=null;
        ResultSet res=Conexion.ejecutarConsulta("select * from tipo_credito where id_tipocredito=?", params);
        try{
            if(res.next()){
                tipocredito=new Tipocredito(res.getInt("id_tipocredito"), res.getString("descripcion"));
            }
            res.close();
        }catch(Exception e){}
        return tipocredito;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from tipo_credito order by id_tipocredito asc", null);
        try{
            while(res.next()){
                Tipocredito tipocredito=new Tipocredito(res.getInt("id_tipocredito"), res.getString("descripcion"));
                lista.add(tipocredito);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean eliminarPorId(int id_tipocredito){
        Object params[]={id_tipocredito};
        return Conexion.ejecutar("delete from tipo_credito where id_tipocredito=?", params);
    }
    
    public boolean actualizar(Tipocredito tipocredito){
        Object params[]={tipocredito.getDescripcion(), tipocredito.getId_tipocredito()};
        return Conexion.ejecutar("update tipo_credito set descripcion=? where id_tipocredito=?", params);
    }
}
