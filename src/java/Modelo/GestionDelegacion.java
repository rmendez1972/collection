/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Delegacion;

/**
 *
 * @author arturo
 */
public class GestionDelegacion { 
    public boolean registroDelegacion(Delegacion del){
        Object params[]={del.getDescripcion(), del.getDireccion()};
        return Conexion.ejecutar("insert into delegaciones (descripcion, direccion) values(UPPER(?),UPPER(?))", params);
    }
    
    public Delegacion obtenerPorId(int id_delegacion){
        Delegacion del=null;
        Object params[]={id_delegacion};
        ResultSet res=Conexion.ejecutarConsulta("select * from delegaciones where id_delegacion=?", params);
        try{
            if(res.next())
                del=new Delegacion(res.getInt("id_delegacion"), res.getString("descripcion"), res.getString("direccion"));
            res.close();
        }catch(Exception e){}
        return del;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from delegaciones order by descripcion asc", null);
        try{
            while(res.next()){
                //Grupo g=new Grupo(res.getInt("id_grupo"), res.getString("nombre"));
                Delegacion del=new Delegacion(res.getInt("id_delegacion"), res.getString("descripcion"), res.getString("direccion"));
                lista.add(del);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean actualizar(Delegacion del){
        Object params[]={del.getDescripcion(), del.getDireccion(), del.getId_delegacion()};
        return Conexion.ejecutar("update delegaciones set descripcion=UPPER(?), direccion=UPPER(?) where id_delegacion=?", params);
    }
    
    public boolean eliminarPorId(int id_del){
        Object params[]={id_del};
        return Conexion.ejecutar("delete from delegaciones where id_delegacion=?", params);
    }

}
