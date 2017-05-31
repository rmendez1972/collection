/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javabeans.Cpp;
/**
 *
 * @author Ing. Rafael Méndez
 */

public class GestionCpp 
{
       
    public boolean registroCpp(Cpp cpp){
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha=sdf.format(cpp.getFecha());
        String importe=cpp.getImporte().toString();
        Object params[]={fecha, importe};
        return Conexion.ejecutar("insert into cpp (fecha, importe) values (?,?)", params);
    }
    
    public Cpp obtenerPorId(int id_cpp){
        Cpp cpp=null;
        Object params[]={id_cpp};
        ResultSet res=Conexion.ejecutarConsulta("select * from cpp where id_cpp=?", params);
        try{
            if(res.next())
                cpp=new Cpp(res.getDate("fecha"), res.getBigDecimal("importe"), res.getInt("id_cpp"));
            res.close();
        }catch(Exception e){}
        return cpp;
    }
    /*
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
    */
    public ArrayList obtenerCpp(){
        ArrayList cpps=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from cpp  order by fecha desc", null);
        try{
            while(res.next()){
                Cpp cpp=new Cpp(res.getDate("fecha"),res.getBigDecimal("importe"),res.getInt("id_cpp"));
                cpps.add(cpp);
            }
            res.close();
        }catch(Exception e){}
        return cpps;
    }
    
    public boolean actualizarCpp(Cpp cpp){
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha=sdf.format(cpp.getFecha());
        String importe=cpp.getImporte().toString();
        String id_cpp= cpp.getId_cpp().toString();
        Object params[]={fecha, importe, id_cpp};
        return Conexion.ejecutar("update cpp set fecha=?, importe=? where id_cpp=?", params);
    }
    /*
    public ArrayList obtenerPermisos(int id_usuario){
        Usuario usr=this.obtenerPorId(id_usuario);
        GestionGrupo grp=new GestionGrupo();
        return grp.obtenerPermisos(usr.getId_grupo());
    }
    */
    public boolean eliminarPorId(int id_cpp){
        Object params[]={id_cpp};
        return Conexion.ejecutar("delete from cpp where id_cpp=?", params);
    }
    
}


