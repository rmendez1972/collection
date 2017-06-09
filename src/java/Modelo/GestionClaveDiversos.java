/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.ClaveDiversos;

/**
 *
 * @author Marlon
 */
public class GestionClaveDiversos {
    
    public ArrayList obtenerTodos(){
        ArrayList lista = new ArrayList();
        ResultSet res = Conexion.ejecutarConsulta("select * from clave_div order by clave_div", null);
        try{
            while(res.next()){
                ClaveDiversos caja=new ClaveDiversos(res.getInt("id_clave_div"), res.getString("clave_div"), res.getString("descripcion"), res.getBigDecimal("importe"), res.getString("cuenta_cont"));
                lista.add(caja);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean registroClvdiv(ClaveDiversos cd){
        String importe = cd.getImporte().toString();
        
        Object params[] = {cd.getClave_div(), cd.getDescripcion(), importe, cd.getCuenta_cont()};
        return Conexion.ejecutar("insert into clave_div (clave_div, descripcion, importe, cuenta_cont) values (UPPER(?),UPPER(?),?,UPPER(?))", params);
    }
    
    public ClaveDiversos obtenerPorId(int id_clave_div){
        ClaveDiversos cd=null;
        Object params[]={id_clave_div};
        ResultSet res=Conexion.ejecutarConsulta("select * from clave_div where id_clave_div=?", params);
        try{
            if(res.next())
                cd=new ClaveDiversos(res.getInt("id_clave_div"), res.getString("clave_div"), res.getString("descripcion"), res.getBigDecimal("importe"), res.getString("cuenta_cont"));
            res.close();
        }catch(Exception e){}
        return cd;
    }
    
    public boolean actualizarClvdiv(ClaveDiversos cd){
        String importe = cd.getImporte().toString();
        Object params[]={cd.getClave_div(), cd.getDescripcion(), importe, cd.getCuenta_cont(), cd.getId_clave_div()};
        return Conexion.ejecutar("update clave_div set clave_div=UPPER(?), descripcion=UPPER(?), importe=?, cuenta_cont=UPPER(?) where id_clave_div=?", params);
    }
    
    public boolean eliminarPorId(int id_clave_div){
        Object params[]={id_clave_div};
        return Conexion.ejecutar("delete from clave_div where id_clave_div=?", params);
    }
    
}
