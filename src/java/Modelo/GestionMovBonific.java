/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.MovBonific;


/**
 *
 * @author Marlon
 */
public class GestionMovBonific {
    
    public ArrayList obtenerPorId(int id_movbonific){
        ArrayList bon=new ArrayList();
        
        Object params[]={id_movbonific};
        ResultSet res=Conexion.ejecutarConsulta("Select BO.*, BE.nombre as nombrebenef, CB.clave_bonific as clavebonific, U.nombre as usuario, MD.descripcion as movdiversos, CP.descripcion as catprograma from bonific BO inner join benef BE on BO.id_benef=BE.id_benef inner join cat_bonific CB on BO.id_catbonific=CB.id_bonific inner join usuarios U on BO.id_usuario=U.id_usuario inner join mov_diversos MD on BO.id_movdiversos=MD.id_movdiversos inner join cat_prog CP on BO.id_catprog=CP.id_catprog where BO.id_movedoscta=?", params);
        try{
            while(res.next()){
                MovBonific bonific=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"));            
                bonific.setNombrebenef(res.getString("nombrebenef"));
                bonific.setClavebonific(res.getString("clavebonific"));
                bonific.setUsuario(res.getString("usuario"));
                bonific.setMovdiversos(res.getString("movdiversos"));
                bonific.setCatprograma(res.getString("catprograma"));
                bon.add(bonific);
            }
            res.close();
        }catch(Exception e){}
        return bon;
    }
    
    
    public boolean registroMovBonific(MovBonific mov){
        
        String id_movedoscta = mov.getId_movedoscta().toString();
        String id_benef = mov.getId_benef().toString();
        String imp_cap = mov.getImp_cap().toString();
        String imp_int = mov.getImp_int().toString();
        String imp_adm = mov.getImp_adm().toString();
        String imp_seg = mov.getImp_seg().toString();
        String imp_osg = mov.getImp_osg().toString();
        String id_catbonific = mov.getId_catbonific().toString();
        String estatus = mov.getEstatus();
        String id_usuario = mov.getId_usuario().toString();
        String clave_b = mov.getClave_b();
        String recibo = mov.getRecibo().toString();
        String serie = mov.getSerie();
        String id_movdiversos = mov.getId_movdiversos().toString();
        String numcontrato = mov.getNumcontrato();
        String id_catprog = mov.getId_catprog().toString();
        
        Object params[]={id_movedoscta, id_benef, imp_cap, imp_int, imp_adm, imp_seg, imp_osg, id_catbonific, estatus, id_usuario, clave_b, recibo, serie, id_movdiversos, numcontrato, id_catprog};
        return Conexion.ejecutar("insert into bonific (id_movedoscta, id_benef, imp_cap, imp_int, imp_adm, imp_seg, imp_osg, id_catbonific, estatus, id_usuario, clave_b, recibo, serie, id_movdiversos, numcontrato, id_catprog) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", params);
        
    }
    
    public MovBonific obtenerPorIdEdit(int id){
        MovBonific mb=null;
        Object params[]={id};
        ResultSet res=Conexion.ejecutarConsulta("select * from bonific where id_movedoscta=?", params);
        try{
            if(res.next())
                mb=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"));
            res.close();
        }catch(Exception e){}
        return mb;
        
    }
    
    public boolean actualizarMovBonific(MovBonific mov){
        String id_bonificacion = mov.getId_bonificacion().toString();
        String id_movedoscta = mov.getId_movedoscta().toString();
        String id_benef = mov.getId_benef().toString();
        String imp_cap = mov.getImp_cap().toString();
        String imp_int = mov.getImp_int().toString();
        String imp_adm = mov.getImp_adm().toString();
        String imp_seg = mov.getImp_seg().toString();
        String imp_osg = mov.getImp_osg().toString();
        String id_catbonific = mov.getId_catbonific().toString();
        String estatus = mov.getEstatus();
        String id_usuario = mov.getId_usuario().toString();
        String clave_b = mov.getClave_b();
        String recibo = mov.getRecibo().toString();
        String serie = mov.getSerie();
        String id_movdiversos = mov.getId_movdiversos().toString();
        String numcontrato = mov.getNumcontrato();
        String id_catprog = mov.getId_catprog().toString();
        
        Object params[]={id_movedoscta, id_benef, imp_cap, imp_int, imp_adm, imp_seg, imp_osg, id_catbonific, estatus, id_usuario, clave_b, recibo, serie, id_movdiversos, numcontrato, id_catprog, id_bonificacion};
        return Conexion.ejecutar("update bonific set id_movedoscta=?, id_benef=?, imp_cap=?, imp_int=?, imp_adm=?, imp_seg=?, imp_osg=?, id_catbonific=?, estatus=?, id_usuario=?, clave_b=?, recibo=?, serie=?, id_movdiversos=?, numcontrato=?, id_catprog=? where id_bonificacion=? ", params);
    }
    
    public boolean eliminarPorId(int id){
        Object params[]={id};
        return Conexion.ejecutar("delete from bonific where id_bonificacion=?", params);
    
    }
    
}
