/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.Beneficiario;
import javabeans.MovBonific;


/**
 *
 * @author Marlon
 */
public class GestionMovBonific {
    
    public ArrayList obtenerPorId(int id_movbonific){
        ArrayList bon=new ArrayList();
        
        Object params[]={id_movbonific};
        ResultSet res=Conexion.ejecutarConsulta("Select BO.*, BE.nombre as nombrebenef, CB.clave_bonific as clavebonific, U.nombre as usuario, CP.descripcion as catprograma, A.nombre as nombreautoriza from bonific BO inner join benef BE on BO.id_benef=BE.id_benef inner join cat_bonific CB on BO.id_catbonific=CB.id_bonific inner join usuarios U on BO.id_usuario=U.id_usuario inner join cat_prog CP on BO.id_catprog=CP.id_catprog inner join autoriza A on BO.id_autoriza=A.id_autoriza where BO.id_movedoscta=?", params);
        try{
            while(res.next()){
                MovBonific bonific=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"), res.getBigDecimal("imp_com"), res.getBigDecimal("imp_mor"), res.getBigDecimal("imp_tit"));            
                bonific.setNombrebenef(res.getString("nombrebenef"));
                bonific.setClavebonific(res.getString("clavebonific"));
                bonific.setUsuario(res.getString("usuario"));
                bonific.setCatprograma(res.getString("catprograma"));
                bonific.setNombreautoriza(res.getString("nombreautoriza"));
                bon.add(bonific);
            }
            res.close();
        }catch(Exception e){}
        return bon;
    }
    
    
    public ArrayList obtenerPorReciboSerie(String recibo, String serie){
        ArrayList bon=new ArrayList();
        
        Object params[]={recibo,serie};
        ResultSet res=Conexion.ejecutarConsulta("Select BO.* from bonific BO where BO.recibo=? and BO.serie=?", params);
        try{
            while(res.next()){
                MovBonific bonific=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"), res.getBigDecimal("imp_com"), res.getBigDecimal("imp_mor"), res.getBigDecimal("imp_tit"));            
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
        String imp_com = mov.getImp_com().toString();
        String imp_mor = mov.getImp_mor().toString();
        String imp_tit = mov.getImp_tit().toString();
        String id_catbonific = mov.getId_catbonific().toString();
        String estatus = mov.getEstatus();
        String id_usuario = mov.getId_usuario().toString();
        String clave_b = mov.getClave_b();
        String recibo = mov.getRecibo().toString();
        String serie = mov.getSerie();
        String numcontrato = mov.getNumcontrato();
        String id_catprog = mov.getId_catprog().toString();
        String id_autoriza = mov.getId_autoriza().toString();
        
        Object params[]={id_movedoscta, id_benef, imp_cap, imp_int, imp_adm, imp_seg, imp_osg, id_catbonific, estatus, id_usuario, clave_b, recibo, serie, numcontrato, id_catprog, id_autoriza, imp_com, imp_mor, imp_tit};
        return Conexion.ejecutar("insert into bonific (id_movedoscta, id_benef, imp_cap, imp_int, imp_adm, imp_seg, imp_osg, id_catbonific, estatus, id_usuario, clave_b, recibo, serie, numcontrato, id_catprog, id_autoriza, imp_com, imp_mor, imp_tit) values (?,?,?*-1,?,?,?,?,?,UPPER(?),?,?,?,UPPER(?),?,?,?,?,?,?)", params);
        
    }
    
    
    public boolean actualizaMovBonific(MovBonific mov){
        
        String id_movedoscta = mov.getId_movedoscta().toString();
        String id_benef = mov.getId_benef().toString();
        String imp_cap = mov.getImp_cap().toString();
        String imp_int = mov.getImp_int().toString();
        String imp_adm = mov.getImp_adm().toString();
        String imp_seg = mov.getImp_seg().toString();
        String imp_osg = mov.getImp_osg().toString();
        String imp_com = mov.getImp_com().toString();
        String imp_mor = mov.getImp_mor().toString();
        String imp_tit = mov.getImp_tit().toString();
        String id_catbonific = mov.getId_catbonific().toString();
        String estatus = mov.getEstatus();
        String id_usuario = mov.getId_usuario().toString();
        String clave_b = mov.getClave_b();
        String recibo = mov.getRecibo().toString();
        String serie = mov.getSerie();
        String numcontrato = mov.getNumcontrato();
        String id_catprog = mov.getId_catprog().toString();
        String id_autoriza = mov.getId_autoriza().toString();
        
        Object params[]={id_movedoscta, id_benef, imp_cap, imp_int, imp_adm, imp_seg, imp_osg, id_catbonific, estatus, id_usuario, clave_b, recibo, serie, numcontrato, id_catprog, id_autoriza, imp_com, imp_mor, imp_tit};
        return Conexion.ejecutar("update bonific set id_movedoscta values (?,?,?*-1,?,?,?,?,?,UPPER(?),?,?,?,UPPER(?),?,?,?,?,?,?)", params);
        
    }
    
    
    
    public MovBonific obtenerPorIdEdit(int id){
        MovBonific mb=null;
        Object params[]={id};
        ResultSet res=Conexion.ejecutarConsulta("select * from bonific where id_movedoscta=?", params);
        try{
            if(res.next())
                mb=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"), res.getBigDecimal("imp_com"), res.getBigDecimal("imp_mor"), res.getBigDecimal("imp_tit"));
            res.close();
        }catch(Exception e){}
        return mb;
        
    }
    
    public boolean actualizarMovBonific(MovBonific mov){
        
        String id_movedoscta = mov.getId_movedoscta().toString();
        String id_benef = mov.getId_benef().toString();
        String imp_cap = mov.getImp_cap().toString();
        String imp_int = mov.getImp_int().toString();
        String imp_adm = mov.getImp_adm().toString();
        String imp_seg = mov.getImp_seg().toString();
        String imp_osg = mov.getImp_osg().toString();
        String imp_com = mov.getImp_com().toString();
        String imp_mor = mov.getImp_mor().toString();
        String imp_tit = mov.getImp_tit().toString();
        String id_catbonific = mov.getId_catbonific().toString();
        String estatus = mov.getEstatus();
        String id_usuario = mov.getId_usuario().toString();
        String clave_b = mov.getClave_b();
        String recibo = mov.getRecibo().toString();
        String serie = mov.getSerie();
        String numcontrato = mov.getNumcontrato();
        String id_catprog = mov.getId_catprog().toString();
        String id_autoriza = mov.getId_autoriza().toString();
        
        Object params[]={id_movedoscta, recibo, serie, clave_b};
        return Conexion.ejecutar("update bonific set id_movedoscta=? where recibo=? and serie=? and clave_b=? ", params);
    }
    
    public boolean eliminarPorId(int id){
        Object params[]={id};
        return Conexion.ejecutar("delete from bonific where id_bonificacion=?", params);
    
    }
    
    public ArrayList obtenerPorIdDiv(int id_movdiversos){
        ArrayList bon=new ArrayList();
        
        Object params[]={id_movdiversos};
        ResultSet res=Conexion.ejecutarConsulta("Select BO.*, BE.nombre as nombrebenef, CB.clave_bonific as clavebonific, U.nombre as usuario, CP.descripcion as catprograma, A.nombre as nombreautoriza from bonific BO inner join benef_div BE on BO.id_benef=BE.id_bendiv inner join cat_bonific CB on BO.id_catbonific=CB.id_bonific inner join usuarios U on BO.id_usuario=U.id_usuario inner join cat_prog CP on BO.id_catprog=CP.id_catprog inner join autoriza A on BO.id_autoriza=A.id_autoriza where BO.id_movdiversos=?", params);
        try{
            while(res.next()){
                MovBonific bonific=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"), res.getBigDecimal("imp_com"),  res.getBigDecimal("imp_mor"), res.getBigDecimal("imp_tit"));            
                bonific.setNombrebenef(res.getString("nombrebenef"));
                bonific.setClavebonific(res.getString("clavebonific"));
                bonific.setUsuario(res.getString("usuario"));
                bonific.setCatprograma(res.getString("catprograma"));
                bonific.setNombreautoriza(res.getString("nombreautoriza"));
                bon.add(bonific);
            }
            res.close();
        }catch(Exception e){}
        return bon;
    }
    
    public MovBonific obtenerPorIddivEdit(int iddiv){
        MovBonific mb=null;
        Object params[]={iddiv};
        ResultSet res=Conexion.ejecutarConsulta("select * from bonific where id_movdiversos=?", params);
        try{
            if(res.next())
                mb=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"), res.getBigDecimal("imp_com"), res.getBigDecimal("imp_mor"), res.getBigDecimal("imp_tit"));
            res.close();
        }catch(Exception e){}
        return mb;
        
    }
    
    public boolean registroMovBonificDiv(MovBonific mov){
        
        //String id_movedoscta = mov.getId_movedoscta().toString();
        String id_movdiversos = mov.getId_movdiversos().toString();
        String id_benef = mov.getId_benef().toString();
        String imp_cap = mov.getImp_cap().toString();
        String imp_int = mov.getImp_int().toString();
        String imp_adm = mov.getImp_adm().toString();
        String imp_seg = mov.getImp_seg().toString();
        String imp_osg = mov.getImp_osg().toString();
        String imp_com = mov.getImp_com().toString();
        String imp_mor = mov.getImp_mor().toString();
        String imp_tit = mov.getImp_tit().toString();
        String id_catbonific = mov.getId_catbonific().toString();
        String estatus = mov.getEstatus();
        String id_usuario = mov.getId_usuario().toString();
        String clave_b = mov.getClave_b();
        String recibo = mov.getRecibo().toString();
        String serie = mov.getSerie();
        String numcontrato = mov.getNumcontrato();
        String id_catprog = mov.getId_catprog().toString();
        String id_autoriza = mov.getId_autoriza().toString();
        
        Object params[]={id_movdiversos, id_benef, imp_cap, imp_int, imp_adm, imp_seg, imp_osg, id_catbonific, estatus, id_usuario, clave_b, recibo, serie, numcontrato, id_catprog, id_autoriza, imp_com, imp_mor, imp_tit};
        return Conexion.ejecutar("insert into bonific (id_movdiversos, id_benef, imp_cap, imp_int, imp_adm, imp_seg, imp_osg, id_catbonific, estatus, id_usuario, clave_b, recibo, serie, numcontrato, id_catprog, id_autoriza, imp_com, imp_mor, imp_tit) values (?,?,?,?,?,?,?,?,UPPER(?),?,?,?,UPPER(?),?,?,?,?,?,?)", params);
        
    }
    
    public boolean actualizarMovBonificDiv(MovBonific mov){
        
        String id_bonificacion = mov.getId_bonificacion().toString();
        //String id_movedoscta = mov.getId_movedoscta().toString();
        String id_movdiversos = mov.getId_movdiversos().toString();
        String id_benef = mov.getId_benef().toString();
        String imp_cap = mov.getImp_cap().toString();
        String imp_int = mov.getImp_int().toString();
        String imp_adm = mov.getImp_adm().toString();
        String imp_seg = mov.getImp_seg().toString();
        String imp_osg = mov.getImp_osg().toString();
        String imp_com = mov.getImp_com().toString();
        String imp_mor = mov.getImp_mor().toString();
        String imp_tit = mov.getImp_tit().toString();
        String id_catbonific = mov.getId_catbonific().toString();
        String estatus = mov.getEstatus();
        String id_usuario = mov.getId_usuario().toString();
        String clave_b = mov.getClave_b();
        String recibo = mov.getRecibo().toString();
        String serie = mov.getSerie();
        String numcontrato = mov.getNumcontrato();
        String id_catprog = mov.getId_catprog().toString();
        String id_autoriza = mov.getId_autoriza().toString();
        
        Object params[]={id_movdiversos, id_benef, imp_cap, imp_int, imp_adm, imp_seg, imp_osg, id_catbonific, estatus, id_usuario, clave_b, recibo, serie, numcontrato, id_catprog, id_autoriza, imp_com, imp_mor, imp_tit, id_bonificacion};
        return Conexion.ejecutar("update bonific set id_movdiversos=?, id_benef=?, imp_cap=?, imp_int=?, imp_adm=?, imp_seg=?, imp_osg=?, id_catbonific=?, estatus=UPPER(?), id_usuario=?, clave_b=?, recibo=?, serie=UPPER(?), numcontrato=?, id_catprog=?, id_autoriza=?, imp_com=?, imp_mor=?, imp_tit=? where id_bonificacion=? ", params);
    }
    
    public ArrayList obtenerPorIdReporte(int id_bonificacion){
        ArrayList bon=new ArrayList();
        
        Object params[]={id_bonificacion};
        ResultSet res=Conexion.ejecutarConsulta("Select BO.*, BE.nombre as nombrebenef, CB.clave_bonific as clavebonific, U.nombre as usuario, CP.descripcion as catprograma, A.nombre as nombreautoriza from bonific BO inner join benef BE on BO.id_benef=BE.id_benef inner join cat_bonific CB on BO.id_catbonific=CB.id_bonific inner join usuarios U on BO.id_usuario=U.id_usuario inner join cat_prog CP on BO.id_catprog=CP.id_catprog inner join autoriza A on BO.id_autoriza=A.id_autoriza where BO.id_bonificacion=?", params);
        try{
            while(res.next()){
                MovBonific bonific=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"), res.getBigDecimal("imp_com"), res.getBigDecimal("imp_mor"), res.getBigDecimal("imp_tit"));            
                bonific.setNombrebenef(res.getString("nombrebenef"));
                bonific.setClavebonific(res.getString("clavebonific"));
                bonific.setUsuario(res.getString("usuario"));
                bonific.setCatprograma(res.getString("catprograma"));
                bonific.setNombreautoriza(res.getString("nombreautoriza"));
                bon.add(bonific);
            }
            res.close();
        }catch(Exception e){}
        return bon;
    }
    
    public ArrayList obtenerPorIdDivReporte(int id_bonificacion){
        ArrayList bon=new ArrayList();
        
        Object params[]={id_bonificacion};
        ResultSet res=Conexion.ejecutarConsulta("Select BO.*, BE.nombre as nombrebenef, CB.clave_bonific as clavebonific, U.nombre as usuario, CP.descripcion as catprograma, A.nombre as nombreautoriza from bonific BO inner join benef_div BE on BO.id_benef=BE.id_bendiv inner join cat_bonific CB on BO.id_catbonific=CB.id_bonific inner join usuarios U on BO.id_usuario=U.id_usuario inner join cat_prog CP on BO.id_catprog=CP.id_catprog inner join autoriza A on BO.id_autoriza=A.id_autoriza where BO.id_bonificacion=?", params);
        try{
            while(res.next()){
                MovBonific bonific=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"), res.getBigDecimal("imp_com"), res.getBigDecimal("imp_mor"), res.getBigDecimal("imp_tit"));            
                bonific.setNombrebenef(res.getString("nombrebenef"));
                bonific.setClavebonific(res.getString("clavebonific"));
                bonific.setUsuario(res.getString("usuario"));
                bonific.setCatprograma(res.getString("catprograma"));
                bonific.setNombreautoriza(res.getString("nombreautoriza"));
                bon.add(bonific);
            }
            res.close();
        }catch(Exception e){}
        return bon;
    }
    
    
    public ArrayList obtenerPorBenefId(int id_benef){
        ArrayList bon=new ArrayList();
        
        Object params[]={id_benef};
        ResultSet res=Conexion.ejecutarConsulta("Select BO.*, BE.nombre as nombrebenef, CB.clave_bonific as clavebonific, U.nombre as usuario, CP.descripcion as catprograma, A.nombre as nombreautoriza from bonific BO inner join benef BE on BO.id_benef=BE.id_benef inner join cat_bonific CB on BO.id_catbonific=CB.id_bonific inner join usuarios U on BO.id_usuario=U.id_usuario inner join cat_prog CP on BO.id_catprog=CP.id_catprog inner join autoriza A on BO.id_autoriza=A.id_autoriza where BO.id_benef=?", params);
        try{
            while(res.next()){
                MovBonific bonific=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"), res.getBigDecimal("imp_com"), res.getBigDecimal("imp_mor"), res.getBigDecimal("imp_tit"));            
                bonific.setNombrebenef(res.getString("nombrebenef"));
                bonific.setClavebonific(res.getString("clavebonific"));
                bonific.setUsuario(res.getString("usuario"));
                bonific.setCatprograma(res.getString("catprograma"));
                bonific.setNombreautoriza(res.getString("nombreautoriza"));
                bon.add(bonific);
            }
            res.close();
        }catch(Exception e){}
        return bon;
    }
    
    public ArrayList obtenerPorClave_b(String valorcriterio){
        ArrayList bon=new ArrayList();
        
        Object params[]={valorcriterio};
        ResultSet res=Conexion.ejecutarConsulta("Select BO.*, BE.nombre as nombrebenef, CB.clave_bonific as clavebonific, U.nombre as usuario, CP.descripcion as catprograma, A.nombre as nombreautoriza from bonific BO inner join benef BE on BO.id_benef=BE.id_benef inner join cat_bonific CB on BO.id_catbonific=CB.id_bonific inner join usuarios U on BO.id_usuario=U.id_usuario inner join cat_prog CP on BO.id_catprog=CP.id_catprog inner join autoriza A on BO.id_autoriza=A.id_autoriza where BO.clave_b=?", params);
        try{
            while(res.next()){
                MovBonific bonific=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"), res.getBigDecimal("imp_com"),  res.getBigDecimal("imp_mor"), res.getBigDecimal("imp_tit"));            
                bonific.setNombrebenef(res.getString("nombrebenef"));
                bonific.setClavebonific(res.getString("clavebonific"));
                bonific.setUsuario(res.getString("usuario"));
                bonific.setCatprograma(res.getString("catprograma"));
                bonific.setNombreautoriza(res.getString("nombreautoriza"));
                bon.add(bonific);
            }
            res.close();
        }catch(Exception e){}
        return bon;
    }
    /*
    public ArrayList obtenerPorClave_b(int id_bonificacion){
        ArrayList bon=new ArrayList();
        
        Object params[]={id_bonificacion};
        ResultSet res=Conexion.ejecutarConsulta("Select BO.*, BE.nombre as nombrebenef, CB.clave_bonific as clavebonific, U.nombre as usuario, CP.descripcion as catprograma, A.nombre as nombreautoriza from bonific BO inner join benef BE on BO.id_benef=BE.id_benef inner join cat_bonific CB on BO.id_catbonific=CB.id_bonific inner join usuarios U on BO.id_usuario=U.id_usuario inner join cat_prog CP on BO.id_catprog=CP.id_catprog inner join autoriza A on BO.id_autoriza=A.id_autoriza where BO.id_bonificacion=?", params);
        try{
            while(res.next()){
                MovBonific bonific=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"));            
                bonific.setNombrebenef(res.getString("nombrebenef"));
                bonific.setClavebonific(res.getString("clavebonific"));
                bonific.setUsuario(res.getString("usuario"));
                bonific.setCatprograma(res.getString("catprograma"));
                bonific.setNombreautoriza(res.getString("nombreautoriza"));
                bon.add(bonific);
            }
            res.close();
        }catch(Exception e){}
        return bon;
    }*/
    //By Ismael. Modelo que devuelve las bonificaciones de un contrato de diversos (valorcriterio)
    public ArrayList obtenerPorClave_bdiv(String valorcriterio){
        ArrayList bon=new ArrayList();
        
        Object params[]={valorcriterio};
        //ResultSet res=Conexion.ejecutarConsulta("Select BO.*, BE.nombre as nombrebenef, CB.clave_bonific as clavebonific, U.nombre as usuario, CP.descripcion as catprograma, A.nombre as nombreautoriza from bonific BO inner join benef_div BE on BO.id_benef=BE.id_bendiv inner join cat_bonific CB on BO.id_catbonific=CB.id_bonific inner join usuarios U on BO.id_usuario=U.id_usuario inner join cat_prog CP on BO.id_catprog=CP.id_catprog inner join autoriza A on BO.id_autoriza=A.id_autoriza where BO.id_movdiversos=?", params);
        ResultSet res=Conexion.ejecutarConsulta("Select BO.*, BE.nombre as nombrebenef, CB.clave_bonific as clavebonific, U.nombre as usuario, CP.descripcion as catprograma, A.nombre as nombreautoriza from bonific BO inner join benef_div BE on BO.id_benef=BE.id_bendiv inner join cat_bonific CB on BO.id_catbonific=CB.id_bonific inner join usuarios U on BO.id_usuario=U.id_usuario inner join cat_prog CP on BO.id_catprog=CP.id_catprog inner join autoriza A on BO.id_autoriza=A.id_autoriza where BO.clave_b=?", params);
        try{
            while(res.next()){
                MovBonific bonific=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"), res.getBigDecimal("imp_com"), res.getBigDecimal("imp_mor"), res.getBigDecimal("imp_tit"));            
                bonific.setNombrebenef(res.getString("nombrebenef"));
                bonific.setClavebonific(res.getString("clavebonific"));
                bonific.setUsuario(res.getString("usuario"));
                bonific.setCatprograma(res.getString("catprograma"));
                bonific.setNombreautoriza(res.getString("nombreautoriza"));
                bon.add(bonific);
            }
            res.close();
        }catch(Exception e){}
        return bon;
    }
    
    
    public ArrayList obtenerPorIdBenef(int id_benef){
        ArrayList bon=new ArrayList();
        
        Object params[]={id_benef};
        ResultSet res=Conexion.ejecutarConsulta("Select BO.*, BE.nombre as nombrebenef, CB.clave_bonific as clavebonific, U.nombre as usuario, CP.descripcion as catprograma, A.nombre as nombreautoriza from bonific BO inner join benef BE on BO.id_benef=BE.id_benef inner join cat_bonific CB on BO.id_catbonific=CB.id_bonific inner join usuarios U on BO.id_usuario=U.id_usuario inner join cat_prog CP on BO.id_catprog=CP.id_catprog inner join autoriza A on BO.id_autoriza=A.id_autoriza where BO.id_benef=?", params);
        try{
            while(res.next()){
                MovBonific bonific=new MovBonific(res.getInt("id_bonificacion"),res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("imp_cap"),res.getBigDecimal("imp_int"),res.getBigDecimal("imp_adm"),res.getBigDecimal("imp_seg"),res.getBigDecimal("imp_osg"),res.getInt("id_catbonific"),res.getString("estatus"),res.getInt("id_usuario"),res.getInt("id_autoriza"),res.getString("clave_b"),res.getInt("recibo"),res.getString("serie"),res.getInt("id_movdiversos"),res.getString("numcontrato"),res.getInt("id_catprog"), res.getBigDecimal("imp_com"), res.getBigDecimal("imp_mor"), res.getBigDecimal("imp_tit"));            
                bonific.setNombrebenef(res.getString("nombrebenef"));
                bonific.setClavebonific(res.getString("clavebonific"));
                bonific.setUsuario(res.getString("usuario"));
                bonific.setCatprograma(res.getString("catprograma"));
                bonific.setNombreautoriza(res.getString("nombreautoriza"));
                bon.add(bonific);
            }
            res.close();
        }catch(Exception e){}
        return bon;
    }
    
    
    
}
