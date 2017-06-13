/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Salmindf;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Ismael
 */

public class GestionSalmindf {
    /*
    public boolean registroUsuario(Usuario usr){
        Object params[]={usr.getNombre(), usr.getId_nivel(), usr.getDireccion(), usr.getCargo(), usr.getId_del(), usr.getSerie(), usr.getUsuario(), usr.getPassword()};
        return Conexion.ejecutar("insert into usuarios (nombre, id_nivel, direccion, cargo, id_del, serie, usuario, password) values (UPPER(?),?,UPPER(?),UPPER(?),?,UPPER(?),UPPER(?),UPPER(?))", params);
    }
    
    public Usuario obtenerPorId(int id_usuario){
        Usuario usr=null;
        Object params[]={id_usuario};
        ResultSet res=Conexion.ejecutarConsulta("select * from usuarios where id_usuario=?", params);
        try{
            if(res.next())
                usr=new Usuario(res.getInt("id_usuario"), res.getString("usuario"),  res.getString("password"), res.getInt("id_nivel"), res.getInt("id_del"), res.getString("serie"),res.getString("nombre"), res.getString("cargo"), res.getString("direccion"));
            res.close();
        }catch(Exception e){}
        return usr;
    }
*/
    public ArrayList obtenerSalmindf(){        
        ArrayList lista=new ArrayList();
       
        ResultSet res=Conexion.ejecutarConsulta("select * from salmindf order by id_salmindf asc", null);
        try{
            while(res.next()){
            
                //Date fecha = new Date(res.getTimestamp("fecha").getTime());
                
                Salmindf st=new Salmindf(res.getInt("id_salmindf"), res.getTimestamp("fecha"), res.getBigDecimal("importe"));
                lista.add(st);
                

            }
            res.close();
        }catch(Exception e){}
        return lista;
    }

    
    /*
    public boolean actualizarUsuario(Usuario usr){
        Object params[]={usr.getNombre(), usr.getId_nivel(), usr.getDireccion(), usr.getCargo(), usr.getId_del(), usr.getSerie(), usr.getUsuario(), usr.getId_usuario()};
        return Conexion.ejecutar("update usuarios set nombre=UPPER(?), id_nivel=?, direccion=UPPER(?), cargo=UPPER(?), id_del=?, serie=UPPER(?), usuario=? where id_usuario=?", params);
    }
    */
    public boolean eliminarPorId(int id_salmindf){
        Object params[]={id_salmindf};
        return Conexion.ejecutar("delete from salmindf where id_salmindf=?", params);
    }

}
