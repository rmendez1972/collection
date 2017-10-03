/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Clavemov;
/**
 *
 * @author Rafael Méndez
 */
public class GestionClavemov {
    
    
    public boolean registroClavemov(Clavemov clavemov){
        Object params[]={clavemov.getClave_mov(), clavemov.getDescripcion()};
        return Conexion.ejecutar("insert into clave_mov (clave_mov, descripcion) values(UPPER(?), UPPER(?))", params);
    }
    
    public boolean actualizar(Clavemov clavemov){
        Object params[]={clavemov.getClave_mov(), clavemov.getDescripcion(), clavemov.getId_clave_mov()};
        return Conexion.ejecutar("update clave_mov set clave_mov=UPPER(?), descripcion=UPPER(?) where id_clave_mov=?", params);
    }
    
    public Clavemov obtenerPorId(int id_clave_mov){
        //UnidadAdministrativa ua=null;
        Object params[]={id_clave_mov};
        Clavemov clavemov = null;
        ResultSet res=Conexion.ejecutarConsulta("select * from clave_mov where id_clave_mov=?", params);
        try{
            while(res.next()){
                clavemov=new Clavemov(res.getInt("id_clave_mov"),res.getString("clave_mov"), res.getString("descripcion"));
            }
            res.close();
        }catch(Exception e){}
        return clavemov;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList cm=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from clave_mov order by clave_mov asc", null);
        try{
            while(res.next()){
                //UnidadAdministrativa unidad=new UnidadAdministrativa(res.getInt("id_unidadadministrativa"), res.getString("nombre"), res.getString("email"));
                Clavemov clavemov=new Clavemov(res.getInt("id_clave_mov"), res.getString("clave_mov"), res.getString("descripcion"));
                cm.add(clavemov);
            }
            res.close();
        }catch(Exception e){}
        return cm;
    }
    
    public boolean eliminarPorId(int id_clave_mov){
        Object params[]={id_clave_mov};
        return Conexion.ejecutar("delete from clave_mov where id_clave_mov=?", params);
    }
    
}
