/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Banco;

/**
 *
 * @author Rafael Méndez
 */
public class GestionBanco {
    public boolean registroBanco(Banco banco){
        Object params[]={banco.getDescripcion()};
        return Conexion.ejecutar("insert into bancos (descripcion) values (?)", params);
    }
    
    public Banco obtenerPorId(int id_banco){
        Object params[]={id_banco};
        Banco banco=null;
        ResultSet res=Conexion.ejecutarConsulta("select * from bancos where id_banco=?", params);
        try{
            if(res.next()){
                banco=new Banco(res.getInt("id_banco"), res.getString("descripcion"));
            }
            res.close();
        }catch(Exception e){}
        return banco;
    }
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from bancos order by id_banco asc", null);
        try{
            while(res.next()){
                Banco banco=new Banco(res.getInt("id_banco"), res.getString("descripcion"));
                lista.add(banco);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean eliminarPorId(int id_banco){
        Object params[]={id_banco};
        return Conexion.ejecutar("delete from bancos where id_banco=?", params);
    }
    
    public boolean actualizar(Banco banco){
        Object params[]={banco.getDescripcion(), banco.getId_banco()};
        return Conexion.ejecutar("update bancos set descripcion=? where id_banco=?", params);
    }
}
