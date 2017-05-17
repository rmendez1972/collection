/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Modulo;
/**
 *
 * @author arturo
 */
public class GestionModulo {
    public boolean registroModulo(Modulo mod){
        Object params[]={mod.getNombre(), mod.getVista()};
        return Conexion.ejecutar("insert into modulo (nombre, vista) values (?,?)", params);
    }
    
    public Modulo obtenerPorId(int id_modulo){
        Modulo mod=null;
        Object params[]={id_modulo};
        ResultSet res=Conexion.ejecutarConsulta("select * from modulo where id_modulo=?", params);
        try{
            if(res.next())
                mod=new Modulo(res.getInt("id_modulo"), res.getString("nombre"), res.getString("vista"));
            res.close();
        }catch(Exception e){}
        return mod;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList mods=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from modulo order by nombre asc", null);
        try{
            while(res.next()){
                Modulo mod=new Modulo(res.getInt("id_modulo"), res.getString("nombre"), res.getString("vista"));
                mods.add(mod);
            }
            res.close();
        }catch(Exception e){}
        return mods;
    }
}
