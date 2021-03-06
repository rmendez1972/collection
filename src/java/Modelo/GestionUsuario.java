/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Usuario;
/**
 *
 * @author arturo
 */

public class GestionUsuario {
    
    public boolean registroUsuario(Usuario usr){
        Object params[]={usr.getNombre(), usr.getId_nivel(), usr.getDireccion(), usr.getCargo(), usr.getId_del(), usr.getSerie(), usr.getUsuario().toUpperCase(), usr.getPassword().toUpperCase()};
        return Conexion.ejecutar("insert into usuarios (nombre, id_nivel, direccion, cargo, id_del, serie, usuario, password) values (UPPER(?),?,UPPER(?),UPPER(?),?,UPPER(?),?, md5(?))", params);
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

    public Usuario login(Usuario usuario){
        Usuario usr=null;
        Object params[]={usuario.getUsuario().toUpperCase(), usuario.getPassword().toUpperCase()};
        //ResultSet res=Conexion.ejecutarConsulta("select * from usuarios where usuario=? and password=md5(?)", params);
        ResultSet res=Conexion.ejecutarConsulta("select * from usuarios where usuario=(?) and password=md5(?)", params);
       
        try{
            if(res.next())
                usr=new Usuario(res.getInt("id_usuario"), res.getString("usuario"), res.getString("password"), res.getInt("id_nivel"), res.getInt("id_del"), res.getString("serie"), res.getString("nombre"), res.getString("cargo"), res.getString("direccion"));
                //usr=new Usuario(res.getString("usuario"), res.getString("password"));
            res.close();
        }catch(Exception e){}
        return usr;
    }

    public ArrayList obtenerUsuarios(){
        ArrayList users=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select U.*, N.descripcion as nivel, D.descripcion as delegacion from usuarios U inner join niveles N on U.id_nivel = N.id_nivel inner join delegaciones D on U.id_del = D.id_delegacion order by U.nombre asc", null);
        try{
            while(res.next()){
                Usuario usr=new Usuario(res.getInt("id_usuario"), res.getString("usuario"), res.getString("password"), res.getInt("id_nivel"), res.getInt("id_del"), res.getString("serie"), res.getString("nombre"), res.getString("cargo"), res.getString("direccion"));
                usr.setDelegacion(res.getString("delegacion"));
                usr.setNivel(res.getString("nivel"));
                users.add(usr);
            }
            res.close();
        }catch(Exception e){}
        return users;
    }
    
    public boolean actualizarUsuario(Usuario usr){
        Object params[]={usr.getNombre(), usr.getId_nivel(), usr.getDireccion(), usr.getCargo(), usr.getId_del(), usr.getSerie(), usr.getUsuario().toUpperCase(), usr.getPassword().toUpperCase(), usr.getId_usuario()};
        return Conexion.ejecutar("update usuarios set nombre=UPPER(?), id_nivel=?, direccion=UPPER(?), cargo=UPPER(?), id_del=?, serie=UPPER(?), usuario=?, password=md5(?) where id_usuario=?", params);
    }
    public Usuario obtenerPorEmailPassword(String email, String password){
        Usuario usua=null;
        Object[] params={email,password};
        ResultSet res=Conexion.ejecutarConsulta("select * from usuarios  where usuario=? and password=MD5(?)", params);
        try {
            if(res.next()){
                usua=fromResultSet(res);
            }
            res.close();
        } catch (Exception ex) {}
        
        return usua;
    }
    
    private Usuario fromResultSet(ResultSet res){
        Usuario usuario=new Usuario();
        try{
            
            usuario.setCargo(res.getString("cargo"));
            usuario.setDireccion(res.getString("direccion"));
            usuario.setId_del(res.getInt("id_del"));
            usuario.setId_nivel(res.getInt("id_del"));
            usuario.setId_usuario(res.getInt("id_usuario"));
            usuario.setNombre(res.getString("nombre"));
            usuario.setPassword(res.getString("password"));
            usuario.setUsuario(res.getString("usuario"));
            usuario.setSerie(res.getString("serie"));
            
        }catch(Exception e){}
        return usuario;
    }
    
    public boolean eliminarPorId(int id_usuario){
        Object params[]={id_usuario};
        return Conexion.ejecutar("delete from usuarios where id_usuario=?", params);
    }
    
}
