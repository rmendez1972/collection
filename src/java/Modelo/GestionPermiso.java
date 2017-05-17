/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Permiso;
/**
 *
 * @author arturo
 */
public class GestionPermiso {
    public boolean registroPermiso(Permiso p){
        Object params[]={p.getId_grupo(), p.getId_modulo()};
        return Conexion.ejecutar("insert into permisos values (?,?)", params);
    }
    
    public boolean actualizar(Permiso p){
        Object params[]={p.getValor(), p.getId_grupo(), p.getId_modulo()};
        return Conexion.ejecutar("update permisos set valor=? where id_grupo=? and id_modulo=?", params);
    }
    
    public ArrayList obtenerPorGrupo(int id_grupo){
        ArrayList permisos=new ArrayList();
        Object params[]={id_grupo};
        String sql="select P.id_grupo, P.id_modulo, G.nombre as grupo, M.nombre as modulo, P.valor from permisos P inner join grupo G on P.id_grupo=G.id_grupo inner join modulo M on P.id_modulo=M.id_modulo where P.id_grupo=?";
        ResultSet res=Conexion.ejecutarConsulta(sql, params);
        try{
            while(res.next()){
                Permiso p=new Permiso();
                p.setId_grupo(res.getInt("id_grupo"));
                p.setId_modulo(res.getInt("id_modulo"));
                p.setGrupo(res.getString("grupo"));
                p.setModulo(res.getString("modulo"));
                p.setValor(res.getInt("valor"));
                
                permisos.add(p);
            }
            res.close();
        }catch(Exception e){}
        return permisos;
    }
}
