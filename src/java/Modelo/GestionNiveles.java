/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Nivel;
/**
 *
 * @author arturo
 */
public class GestionNiveles {
    
    
    public boolean registroNivel(Nivel nivel){
        Object params[]={nivel.getDescripcion(), nivel.getPrivilegios()};
        return Conexion.ejecutar("insert into niveles (descripcion, privilegios) values(UPPER(?), UPPER(?))", params);
    }
    
    public boolean actualizar(Nivel nivel){
        Object params[]={nivel.getDescripcion(), nivel.getPrivilegios(), nivel.getId_nivel()};
        return Conexion.ejecutar("update niveles set descripcion=UPPER(?), privilegios=UPPER(?) where id_nivel=?", params);
    }
    
    public Nivel obtenerPorId(int id_nivel){
        //UnidadAdministrativa ua=null;
        Object params[]={id_nivel};
        Nivel niv = null;
        ResultSet res=Conexion.ejecutarConsulta("select * from niveles where id_nivel=?", params);
        try{
            while(res.next()){
                niv=new Nivel(res.getInt("id_nivel"),res.getString("descripcion"), res.getString("privilegios"));
            }
            res.close();
        }catch(Exception e){}
        return niv;
    }
    
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
    
    public boolean eliminarPorId(int id_nivel){
        Object params[]={id_nivel};
        return Conexion.ejecutar("delete from niveles where id_nivel=?", params);
    }
    
}
