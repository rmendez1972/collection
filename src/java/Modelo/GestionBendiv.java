/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.BeneficiarioDiv;
import javabeans.Usuario;
//import javabeans.CatProgramas;


/**
 *
 * @Ismael
 */
public class GestionBendiv {
    
    public boolean registroBendiv(BeneficiarioDiv bendiv){
        boolean res=false;
        String clave_elect=bendiv.getClave_elect();
        String curp=bendiv.getCurp();
        String clave_b=bendiv.getClave_b();
        String nombre=bendiv.getNombre();
        //Integer id_catprog=bendiv.getId_catprog();
        Integer id_catprog=1;
        Integer id_usuario=bendiv.getId_usuario();
        
        //
        //Integer id_delegacion=autoriza.getId_delegacion();
        //String nombre=autoriza.getNombre();
        //String cargo=autoriza.getCargo();
          
        Object params[]={clave_elect, curp, clave_b, nombre, id_catprog, id_usuario};
        res=Conexion.ejecutar("insert into benef_div (clave_elect, curp, clave_b,nombre,id_catprog,id_usuario) values (?,?,?,?,?,?)", params);
        
        return res;
    }
   
    public BeneficiarioDiv obtenerPorId(int id_bendiv){
        Object params[]={id_bendiv};
        BeneficiarioDiv bendiv=null;
        ResultSet res=Conexion.ejecutarConsulta("select * from benef_div where id_bendiv=?", params);
        try{
            if(res.next()){
                bendiv=new BeneficiarioDiv(res.getInt("id_bendiv"), res.getString("clave_elect"), res.getString("curp"), res.getString("clave_b"), res.getString("nombre"), res.getInt("id_catprog"),res.getInt("id_usuario"));
            }
            res.close();
        }catch(Exception e){}
        return bendiv;
    }
    
   
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        //ResultSet res=Conexion.ejecutarConsulta("select * from benef_div order by nombre asc", null);
        //ResultSet res=Conexion.ejecutarConsulta("select U.*, N.descripcion as nivel, D.descripcion as delegacion from usuarios U inner join niveles N on U.id_nivel = N.id_nivel inner join delegaciones D on U.id_del = D.id_delegacion order by U.nombre asc", null);
        
        ResultSet res=Conexion.ejecutarConsulta("select B.*, P.descripcion as catprog, U.usuario as usuario from benef_div B inner join cat_prog P on B.id_catprog=P.id_catprog inner join usuarios U on B.id_usuario=U.id_usuario order by B.nombre asc", null);
        
        try{
            while(res.next()){
                BeneficiarioDiv bendiv=new BeneficiarioDiv(res.getInt("id_bendiv"), res.getString("clave_elect"), res.getString("curp"), res.getString("clave_b"), res.getString("nombre"), res.getInt("id_catprog"),res.getInt("id_usuario"));
                bendiv.setCatprog(res.getString("catprog"));
                bendiv.setUsuario(res.getString("usuario"));
                lista.add(bendiv);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
  
       
    public boolean actualizarBendiv(BeneficiarioDiv bendiv){
        Integer mid_bendiv=bendiv.getId_bendiv();
        String id_bendiv=mid_bendiv.toString();
        
        String clave_elect=bendiv.getClave_elect();
        String curp=bendiv.getCurp();
        String clave_b=bendiv.getClave_b();
        String nombre=bendiv.getNombre();
        Integer mid_catprog=bendiv.getId_catprog();
        String id_catprog=mid_catprog.toString();
        
        Integer mid_usuario=bendiv.getId_usuario();
        String id_usuario=mid_usuario.toString();
        
        Object params[]={id_bendiv, clave_elect, curp, clave_b, nombre, id_catprog, id_usuario};
        return Conexion.ejecutar("update benef_div set clave_elect=?, curp=?, clave_b=?, nombre=?, id_catprog=?, id_usuario=? where id_bendiv=?", params);
        
    }
     
    public boolean eliminarPorId(int id_bendiv){
        Object params[]={id_bendiv};
        return Conexion.ejecutar("delete from benef_div where id_bendiv=?", params);
    }
    
  
}
