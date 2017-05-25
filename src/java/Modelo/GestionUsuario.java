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
        Object params[]={usr.getUsuario(), usr.getPassword(), usr.getNombre(), usr.getApellido_paterno(), usr.getApellido_materno(), usr.getId_unidadadministrativa(), usr.getId_grupo(), usr.getId_direccion()};
        return Conexion.ejecutar("insert into usuario (usuario, password, nombre, apellido_paterno, apellido_materno, id_unidadAdministrativa, id_grupo, id_direccion) values (UPPER(?),md5(?),UPPER(?),UPPER(?),UPPER(?),?,?,?)", params);
    }
    
    public Usuario obtenerPorId(int id_usuario){
        Usuario usr=null;
        Object params[]={id_usuario};
        ResultSet res=Conexion.ejecutarConsulta("select * from usuario where id_usuario=?", params);
        try{
            if(res.next())
                usr=new Usuario(res.getInt("id_usuario"), res.getString("usuario"), res.getString("password"), res.getString("nombre"), res.getString("apellido_paterno"), res.getString("apellido_materno"), res.getInt("id_unidadadministrativa"), res.getInt("id_grupo"), res.getInt("id_direccion"));
            res.close();
        }catch(Exception e){}
        return usr;
    }
    
    public Usuario login(Usuario usuario){
        Usuario usr=null;
        Object params[]={usuario.getUsuario(),usuario.getPassword(),usuario.getId_grupo()};
        ResultSet res=Conexion.ejecutarConsulta("select * from usuarios where usuario=? and password=md5(?)", params);
        try{
            if(res.next())
                usr=new Usuario(res.getInt("id_usuario"), res.getString("usuario"), res.getString("password"), res.getString("nombre"), res.getString("apellido_paterno"), res.getString("apellido_materno"), res.getInt("id_unidadadministrativa"), res.getInt("id_grupo"), res.getInt("id_direccion"));
            res.close();
        }catch(Exception e){}
        return usr;
    }
    
    public ArrayList obtenerUsuarios(){
        ArrayList users=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select U.*, UA.nombre as unidadAdministrativa, G.nombre as grupo, D.nombre as direccion from usuario U inner join unidadadministrativa UA on U.id_unidadadministrativa=UA.id_unidadadministrativa inner join grupo G on U.id_grupo=G.id_grupo  inner join direcciones D on U.id_direccion=D.id_direccion order by concat(U.nombre,' ',U.apellido_paterno,' ',U.apellido_materno) asc", null);
        try{
            while(res.next()){
                Usuario usr=new Usuario(res.getInt("id_usuario"), res.getString("usuario"), res.getString("password"), res.getString("nombre"), res.getString("apellido_paterno"), res.getString("apellido_materno"), res.getInt("id_unidadadministrativa"), res.getInt("id_grupo"), res.getInt("id_direccion"));
                usr.setUnidadAdministrativa(res.getString("unidadAdministrativa"));
                usr.setGrupo(res.getString("grupo"));
                usr.setDireccion(res.getString("direccion"));
                users.add(usr);
            }
            res.close();
        }catch(Exception e){}
        return users;
    }
    
    public boolean actualizarUsuario(Usuario usr){
        Object params[]={usr.getUsuario(), usr.getNombre(), usr.getApellido_paterno(), usr.getApellido_materno(), usr.getId_unidadadministrativa(), usr.getId_grupo(), usr.getId_direccion(), usr.getId_usuario()};
        return Conexion.ejecutar("update usuario set usuario=?, nombre=UPPER(?), apellido_paterno=UPPER(?), apellido_materno=UPPER(?), id_unidadadministrativa=?, id_grupo=?, id_direccion=? where id_usuario=?", params);
    }
    
    public ArrayList obtenerPermisos(int id_usuario){
        Usuario usr=this.obtenerPorId(id_usuario);
        GestionGrupo grp=new GestionGrupo();
        return grp.obtenerPermisos(usr.getId_grupo());
    }
    
    public boolean eliminarPorId(int id_usuario){
        Object params[]={id_usuario};
        return Conexion.ejecutar("delete from usuario where id_usuario=?", params);
    }
}
