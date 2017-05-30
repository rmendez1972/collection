/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.UnidadAdministrativa;
import javabeans.Nivel;
/**
 *
 * @author arturo
 */
public class GestionUnidadAdministrativa {
    
    /*
    public boolean registroUnidadAdministrativa(UnidadAdministrativa unidad){
        Object params[]={unidad.getNombre(), unidad.getEmail()};
        return Conexion.ejecutar("insert into unidadadministrativa (nombre, email) values(?, ?)", params);
    }
    
    public boolean actualizar(UnidadAdministrativa unidad){
        Object params[]={unidad.getNombre(), unidad.getEmail(), unidad.getId_unidadAdministrativa()};
        return Conexion.ejecutar("update unidadadministrativa set nombre=?, email=? where id_unidadAdministrativa=?", params);
    }
    
    public UnidadAdministrativa obtenerPorId(int id_unidadAdministrativa){
        UnidadAdministrativa ua=null;
        Object params[]={id_unidadAdministrativa};
        ResultSet res=Conexion.ejecutarConsulta("select * from unidadadministrativa where id_unidadadministrativa=?", params);
        try{
            while(res.next()){
                ua=new UnidadAdministrativa(res.getInt("id_unidadadministrativa"),res.getString("nombre"), res.getString("email"));
            }
            res.close();
        }catch(Exception e){}
        return ua;
    }
    */
    public ArrayList obtenerTodos(){
        ArrayList ua=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from niveles order by descripcion asc", null);
        try{
            while(res.next()){
                //UnidadAdministrativa unidad=new UnidadAdministrativa(res.getInt("id_unidadadministrativa"), res.getString("nombre"), res.getString("email"));
                Nivel unidad=new Nivel(res.getInt("id_nivel"), res.getString("descripcion"), res.getString("privilegios"));
                ua.add(unidad);
            }
            res.close();
        }catch(Exception e){}
        return ua;
    }
    /*
    public boolean eliminarPorId(int id_unidadAdministrativa){
        Object params[]={id_unidadAdministrativa};
        return Conexion.ejecutar("delete from unidadadministrativa where id_unidadAdministrativa=?", params);
    }
    */
}
