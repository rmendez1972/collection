/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javabeans.Candidatos;
/**
 *
 * @author Ing. Rafael Méndez
 */

public class GestionCandidatos
{
       
    public boolean registroCandidatos(Candidatos candidatos){
        Integer id_catprog=candidatos.getId_catprog();
        String numcontrato=candidatos.getNumcontrato();
        String clave_elect=candidatos.getClave_elect();
        String curp=candidatos.getCurp();
        String rfc=candidatos.getRfc();
        String nombre=candidatos.getNombre();
        String conyuge=candidatos.getConyuge();
                
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha_con=sdf.format(candidatos.getFecha_con());
        String mza=candidatos.getMza();
        String lte=candidatos.getLte();
        
        String area=candidatos.getArea().toString();
        String domicilio=candidatos.getDomicilio();
        String clave_cat=candidatos.getClave_cat();
        Integer id_tipocredito=candidatos.getId_tipocredito();
        Integer id_usuario=candidatos.getId_usuario();
        //String fecha_ip=sdf.format(candidatos.getFecha_ip());
        Object params[]={id_catprog, numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_con,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario};
        return Conexion.ejecutar("insert into candidatos (id_catprog, numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_cont,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", params);
    }
    
    public Candidatos obtenerPorId(int id_candidato){
        Candidatos candidatos=null;
        Object params[]={id_candidato};
        ResultSet res=Conexion.ejecutarConsulta("select * from candidatos where id_candidato=?", params);
        try{
            if(res.next())
                candidatos=new Candidatos(res.getInt("id_candidato"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"));
            res.close();
        }catch(Exception e){}
        return candidatos;
    }
    
    public ArrayList obtenerCandidatos(){
        ArrayList candidatos=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select C.*, P.descripcion as desprograma, T.descripcion as descredito, U.usuario as usuario from candidatos C inner join cat_prog P on C.id_catprog=P.id_catprog inner join tipo_credito T on C.id_tipocredito=T.id_tipocredito inner join usuarios U on C.id_usuario=U.id_usuario order by C.fecha_cont", null);
        try{
            while(res.next()){
                Candidatos candidato=new Candidatos(res.getInt("id_candidato"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"));
                candidato.setCatprog(res.getString("desprograma"));
                candidato.setTipocredito(res.getString("descredito"));
                candidato.setUsuario(res.getString("usuario"));
                candidatos.add(candidato);
            }
            res.close();
        }catch(Exception e){}
        return candidatos;
    }
    
    public boolean actualizarCandidatos(Candidatos candidatos){
        Integer id_catprog=candidatos.getId_catprog();
        String numcontrato=candidatos.getNumcontrato();
        String clave_elect=candidatos.getClave_elect();
        String curp=candidatos.getCurp();
        String rfc=candidatos.getRfc();
        String nombre=candidatos.getNombre();
        String conyuge=candidatos.getConyuge();
                
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha_con=sdf.format(candidatos.getFecha_con());
        String mza=candidatos.getMza();
        String lte=candidatos.getLte();
        
        String area=candidatos.getArea().toString();
        String domicilio=candidatos.getDomicilio();
        String clave_cat=candidatos.getClave_cat();
        Integer id_tipocredito=candidatos.getId_tipocredito();
        //String fecha_ip=sdf.format(candidatos.getFecha_ip());
        Integer id_candidato=candidatos.getId_candidato();
        Integer id_usuario=candidatos.getId_usuario();
        Object params[]={id_catprog,numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_con,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario,id_candidato};
        return Conexion.ejecutar("update candidatos set id_catprog=?, numcontrato=?, clave_elect=?, curp=?, rfc=?, nombre=?, conyuge=?, fecha_cont=?, mza=?, lte=?, area=?, domicilio=?, clave_cat=?, id_tipocredito=?, id_usuario=? where id_candidato=?", params);
    }
    
    public boolean actualizaraperturaCandidatos(Candidatos candidatos){
        Integer id_catprog=candidatos.getId_catprog();
        String numcontrato=candidatos.getNumcontrato();
        String clave_elect=candidatos.getClave_elect();
        String curp=candidatos.getCurp();
        String rfc=candidatos.getRfc();
        String nombre=candidatos.getNombre();
        String conyuge=candidatos.getConyuge();
                
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha_con=sdf.format(candidatos.getFecha_con());
        String mza=candidatos.getMza();
        String lte=candidatos.getLte();
        
        String area=candidatos.getArea().toString();
        String domicilio=candidatos.getDomicilio();
        String clave_cat=candidatos.getClave_cat();
        Integer id_tipocredito=candidatos.getId_tipocredito();
        String poliza=candidatos.getPoliza();
        String fecha_pol=sdf.format(candidatos.getFecha_pol());
        //String fecha_ip=sdf.format(candidatos.getFecha_ip());
        Integer id_candidato=candidatos.getId_candidato();
        Integer id_usuario=candidatos.getId_usuario();
        Object params[]={poliza,fecha_pol,id_usuario,id_candidato};
        return Conexion.ejecutar("update candidatos set poliza=?, fecha_pol=?, id_usuario=? where id_candidato=?", params);
    }
    
    
    public boolean eliminarPorId(int id_candidato){
        Object params[]={id_candidato};
        return Conexion.ejecutar("delete from candidatos where id_candidato=?", params);
    }
    
}


