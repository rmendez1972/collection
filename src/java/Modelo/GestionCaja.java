/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import javabeans.Caja;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Marlon
 */
public class GestionCaja {
    
    public ArrayList obtenerTodos(){
        ArrayList lista = new ArrayList();
        ResultSet res = Conexion.ejecutarConsulta("select C.*, U.usuario as usuario from cajas C inner join usuarios U on C.id_usuario = U.id_usuario order by C.fecha asc", null);
        try{
            while(res.next()){
                //Status st=new Status(res.getInt("id_status"), res.getString("nombre"));
                Caja caja=new Caja(res.getInt("id_caja"), res.getDate("fecha"), res.getInt("folio_inicial"), res.getInt("folio_final"), res.getString("poliza"), res.getBigDecimal("monto_inicial"), res.getInt("id_usuario"));
                caja.setUsuario(res.getString("usuario"));
                lista.add(caja);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean registroCaja(Caja caja){
       //conversion de variables de fecha y monto inicial
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       String fecha=sdf.format(caja.getFecha()); 
       String monto_inicial = caja.getMonto_inicial().toString();
       
       Object params[]={fecha, caja.getFolio_inicial(), caja.getFolio_final(), caja.getPoliza(), monto_inicial, caja.getId_usuario()};
       return Conexion.ejecutar("insert into cajas (fecha, folio_inicial, folio_final, poliza, monto_inicial, id_usuario) values (?,?,?,UPPER(?),?,?)", params);
    }
    
    public Caja obtenerPorId(int id_caja){
        Caja caja=null;
        Object params[]={id_caja};
        ResultSet res=Conexion.ejecutarConsulta("select * from cajas where id_caja=?", params);
        try{
            if(res.next())
                caja=new Caja(res.getInt("id_caja"), res.getDate("fecha"), res.getInt("folio_inicial"), res.getInt("folio_final"), res.getString("poliza"), res.getBigDecimal("monto_inicial"), res.getInt("id_usuario"));
            res.close();
        }catch(Exception e){}
        return caja;
    }
    
    public boolean actualizarCaja(Caja caja){
       String id_caja = caja.getId_caja().toString();
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       String fecha=sdf.format(caja.getFecha());
       String folio_inicial = caja.getFolio_inicial().toString();
       String folio_final = caja.getFolio_final().toString();
       String poliza = caja.getPoliza();
       String monto_inicial = caja.getMonto_inicial().toString();
       String id_usuario = caja.getId_usuario().toString();
       
       Object params[]={fecha, folio_inicial, folio_final, poliza, monto_inicial, id_usuario, id_caja};
       return Conexion.ejecutar("update cajas set fecha=?, folio_inicial=?, folio_final=?, poliza=?, monto_inicial=?, id_usuario=? where id_caja=?", params);
       
    }
    
    public boolean eliminarPorId(int id_caja){
        Object params[]={id_caja};
        return Conexion.ejecutar("delete from cajas where id_caja=?", params);
    }
    
}
