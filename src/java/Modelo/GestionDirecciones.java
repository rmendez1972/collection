/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.UnidadAdministrativa;
import javabeans.Direcciones;
/**
 *
 * @author rafael
 */
public class GestionDirecciones {
    
    public boolean registroDireccion(Direcciones direccion){
        Object params[]={direccion.getNombre(), direccion.getId_unidadadministrativa()};
        return Conexion.ejecutar("insert into direcciones (nombre, id_unidadadministrativa) values(?, ?)", params);
    }
    
    public boolean actualizar(Direcciones direccion){
        Object params[]={direccion.getNombre(), direccion.getId_unidadadministrativa(), direccion.getId_direccion()};
        return Conexion.ejecutar("update direcciones set nombre=?, id_unidadadministrativa=? where id_direccion=?", params);
    }
    
    public Direcciones obtenerPorId(int id_direccion){
        //UnidadAdministrativa ua=null;
        Direcciones dir=null;
        Object params[]={id_direccion};
        ResultSet res=Conexion.ejecutarConsulta("select * from direcciones where id_direccion=?", params);
        try{
            while(res.next()){
                dir=new Direcciones(res.getInt("id_direccion"),res.getString("nombre"), res.getInt("id_unidadadministrativa"));
            }
            res.close();
        }catch(Exception e){}
        return dir;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList dir=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select D.*, UA.nombre as unidadadministrativa from direcciones D inner join unidadadministrativa UA on D.id_unidadadministrativa=UA.id_unidadadministrativa order by D.nombre asc", null);
        try{
            while(res.next()){
                Direcciones di=new Direcciones(res.getInt("id_direccion"), res.getString("nombre"), res.getInt("id_unidadadministrativa"));
                di.setUnidadadministrativa(res.getString("unidadadministrativa"));
                dir.add(di);
            }
            res.close();
        }catch(Exception e){}
        return dir;
    }
    
    
    public ArrayList obtenerTodosPorunidad(int id_unidadadministrativa){
        Object params[]={id_unidadadministrativa};
        ArrayList dir=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from direcciones where id_unidadadministrativa=? ", params);
        try{
            while(res.next()){
                Direcciones di=new Direcciones(res.getInt("id_direccion"), res.getString("nombre"), res.getInt("id_unidadadministrativa"));
                
                dir.add(di);
            }
            res.close();
        }catch(Exception e){}
        return dir;
    }
    
    public boolean eliminarPorId(int id_direccion){
        Object params[]={id_direccion};
        return Conexion.ejecutar("delete from direcciones where id_direccion=?", params);
    }
}
