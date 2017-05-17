/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Grupo;
import javabeans.Modulo;
/**
 *
 * @author arturo
 */
public class GestionGrupo {
    public boolean registroGrupo(Grupo grupo){
        Object params[]={grupo.getNombre()};
        return Conexion.ejecutar("insert into grupo (nombre) values(?)", params);
    }
    
    public Grupo obtenerPorId(int id_grupo){
        Grupo grupo=null;
        Object params[]={id_grupo};
        ResultSet res=Conexion.ejecutarConsulta("select * from grupo where id_grupo=?", params);
        try{
            if(res.next())
                grupo=new Grupo(res.getInt("id_grupo"), res.getString("nombre"));
            res.close();
        }catch(Exception e){}
        return grupo;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList grupos=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from grupo order by nombre asc", null);
        try{
            while(res.next()){
                Grupo g=new Grupo(res.getInt("id_grupo"), res.getString("nombre"));
                grupos.add(g);
            }
            res.close();
        }catch(Exception e){}
        return grupos;
    }
    
    public ArrayList obtenerPermisos(int id_grupo){
        ArrayList perm=new ArrayList();
        Object params[]={id_grupo};
        ResultSet res=Conexion.ejecutarConsulta("select M.id_modulo, M.nombre, M.vista from permisos P inner join modulo M on P.id_modulo=M.id_modulo where P.id_grupo=? order by M.nombre asc", params);
        try{
            while(res.next()){
                Modulo mod=new Modulo(res.getInt("id_modulo"), res.getString("nombre"), res.getString("vista"));
                perm.add(mod);
            }
            res.close();
        }catch(Exception e){}
        return perm;
    }
}
