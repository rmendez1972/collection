/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Sexo;
import javabeans.Solicitud;
/**
 *
 * @author arturo
 */
public class GestionSexo {
    public ArrayList obtenerTodos(){
        ArrayList sx=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select * from sexo", null);
        try{
            while(res.next()){
                Sexo s=new Sexo(res.getString("clave"), res.getString("descripcion"));
                sx.add(s);
            }
            res.close();
        }catch(Exception e){}
        return sx;
    }
    
    public Sexo obtenerPorId(String clave){
        Sexo sx=null;
        Object params[]={clave};
        ResultSet res=Conexion.ejecutarConsulta("select * from sexo where clave=?", params);
        try{
            if(res.next()){
                sx=new Sexo(res.getString("clave"), res.getString("descripcion"));
            }
            res.close();
        }catch(Exception e){}
        return sx;
    }
}
