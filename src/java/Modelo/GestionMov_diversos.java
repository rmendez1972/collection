/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javabeans.MovDiversos;

/**
 *
 * @author igh
 */

public class GestionMov_diversos
{
       
    public boolean registroMov_diverso(MovDiversos movimiento){
        Integer id_bendiv=movimiento.getId_bendiv();
        String clave_div=movimiento.getClave_div();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String fecha_div=df.format(movimiento.getFecha_div());
        String poliza=movimiento.getPoliza();
        Integer recibo=movimiento.getRecibo();
        String cargo=movimiento.getCargo().toString();
        String abono=movimiento.getAbono().toString();
        String moratorios=movimiento.getMoratorios().toString();
        String otros=movimiento.getOtros().toString();
        //String fecha_pol=df.format(movimiento.getFecha_pol());
        String estatus=movimiento.getEstatus();
        
        Boolean bolaplicado = movimiento.isAplicado();
        Integer intaplicado = (bolaplicado) ? 1 : 0;
        String aplicado = intaplicado.toString();
        
        String descripcion=movimiento.getDescripcion();
        Integer id_catprog=movimiento.getId_catprog();
        String bonificacion=movimiento.getBonificacion().toString();
        String serie=movimiento.getSerie();
        String poliza_apli=movimiento.getPoliza_apli();
        String fecha_apli=df.format(movimiento.getFecha_apli());
        String interes=movimiento.getInteres().toString();
        String seguro=movimiento.getSeguro().toString();
        Integer id_emisor=movimiento.getId_emisor();
        String clave_b=movimiento.getClave_b();
        String numcontrato=movimiento.getNumcontrato();
        
        Boolean bolbonific = movimiento.isBonific();
        Integer intbonific = (bolbonific) ? 1 : 0;
        String bonific = intbonific.toString();
        
        Integer id_caja=movimiento.getId_caja();
        Integer id_usuario=movimiento.getId_usuario();
        
        Object params[]={id_bendiv, clave_div, fecha_div, poliza, 
            recibo, cargo, abono, moratorios, otros, 
            estatus, aplicado, descripcion, id_catprog, bonificacion, serie, 
            poliza_apli, fecha_apli, interes, seguro, id_emisor, clave_b, 
            numcontrato, bonific, id_caja, id_usuario};
        
        //Object params[]={id_catprog, numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_con,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario,poliza,fecha_pol,clave_b,fecha_ip};
        //return Conexion.ejecutar("insert into benef (id_catprog, numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_cont,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario,poliza,fecha_pol,clave_b,fecha_ip) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", params);
        return Conexion.ejecutar("insert into mov_diversos (id_bendiv, clave_div, fecha_div, poliza,recibo, cargo, abono, moratorios, otros,estatus, aplicado, descripcion, id_catprog, bonificacion, serie,poliza_apli, fecha_apli, interes, seguro, id_emisor, clave_b,numcontrato, bonific, id_caja, id_usuario) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", params);
    }   
    
    
    public MovDiversos obtenerPorId(int id_movdiversos){
        MovDiversos movimiento=null;
        Object params[]={id_movdiversos};
        //ResultSet res=Conexion.ejecutarConsulta("select * from mov_diversos where id_movdiversos=?", params);
        ResultSet res=Conexion.ejecutarConsulta("select M.*, B.nombre as nombrebenef, U.usuario as usuario from mov_diversos M inner join Benef_div B on M.id_bendiv=B.id_bendiv inner join Usuarios U on M.id_usuario=U.id_usuario where id_movdiversos=? order by M.clave_b,M.id_movdiversos", params);
        try{
            if(res.next())
                //movimiento=new MovDiversos(res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("capital"),res.getBigDecimal("interes"),res.getBigDecimal("admon"),res.getBigDecimal("seguro"),res.getString("clave_mov"),res.getString("poliza"),res.getDate("fecha_mov"),res.getInt("recibo"),res.getBigDecimal("o_seg"),res.getBigDecimal("moratorios"), res.getString("estatus"),res.getDate("fecha_pol"),res.getInt("id_usuario"),res.getString("prepago"),res.getInt("id_bonific"),res.getBigDecimal("comisiones"),res.getString("serie"),res.getBoolean("puntual"),res.getString("clave_b"),res.getBigDecimal("tit"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getInt("id_caja"),res.getBoolean("bonific"));
                
                movimiento=new MovDiversos(res.getInt("id_movdiversos"), 
                        res.getInt("id_bendiv"),    res.getString("clave_div"), 
                        res.getDate("fecha_div"),   res.getString("poliza"), 
                        res.getInt("recibo"),       res.getBigDecimal("cargo"), 
                        res.getBigDecimal("abono"), res.getBigDecimal("moratorios"), 
                        res.getBigDecimal("otros"), res.getDate("fecha_pol"), 
                        res.getString("estatus"),    res.getInt("id_usuario"), 
                        res.getBoolean("aplicado"), res.getString("descripcion"), 
                        res.getInt("id_catprog"),   res.getBigDecimal("bonificacion"), 
                        res.getString("serie"),     res.getString("poliza_apli"), 
                        res.getDate("fecha_apli"),  res.getBigDecimal("interes"), 
                        res.getBigDecimal("seguro"), res.getInt("id_emisor"), 
                        res.getString("clave_b"),   res.getString("numcontrato"), 
                        res.getInt("id_caja"),      res.getBoolean("bonific")
                        
                    );
                movimiento.setNombreusuario(res.getString("usuario"));
                
            res.close();
        }catch(Exception e){}
        return movimiento;
    }
    
    
    /*
    public boolean aperturarPorId(int mecanica,int id_beneficiario,String sql, ParametrosApertura par_aper){
        boolean resultado=false;
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        switch (mecanica){
            case 29:
                
                Object params[]={par_aper.getId_beneficiario(),par_aper.getImp_capital(),par_aper.getImp_enganche(),par_aper.getPoliza(),sdf.format(par_aper.getFecha_pol()),par_aper.getClave_b(),par_aper.getId_usuario()};
                resultado=Conexion.llamar(sql, params);
                break;
                
            case 10:
                
                Object params10[]={par_aper.getId_beneficiario(),par_aper.getImp_capital(),par_aper.getImp_enganche(),par_aper.getPoliza(),sdf.format(par_aper.getFecha_pol()),par_aper.getClave_b(),
                par_aper.getIntereses(), par_aper.getGastos_admon(), par_aper.getSeguro_vida(), par_aper.getPagos_anticipados(), par_aper.getSub_inic(), par_aper.getId_usuario()};
                resultado=Conexion.llamar(sql, params10);
                break;
            
            case 36:
                
                Object params36[]={par_aper.getId_beneficiario(),par_aper.getImp_capital(),par_aper.getImp_enganche(),par_aper.getPoliza(),sdf.format(par_aper.getFecha_pol()),par_aper.getClave_b(),
                par_aper.getPagos_anticipados(), par_aper.getSub_inic(), par_aper.getId_usuario()};
                resultado=Conexion.llamar(sql, params36);
                break;     
            
            case 20:
                Object params20[]={par_aper.getId_beneficiario(),par_aper.getImp_capital(),par_aper.getImp_enganche(),par_aper.getPoliza(),sdf.format(par_aper.getFecha_pol()),par_aper.getClave_b(),par_aper.getId_usuario()};
                resultado=Conexion.llamar(sql, params20);
                break;
                
            case 38:
                Object params38[]={par_aper.getId_beneficiario(), par_aper.getClave_b(), sdf.format(par_aper.getFecha_pol()), par_aper.getPoliza(), par_aper.getImp_capital(), par_aper.getImp_enganche(), par_aper.getPagos_anticipados(),  par_aper.getSub_inic(), par_aper.getGastos_admon(), par_aper.getComision(), par_aper.getId_usuario()};
                resultado=Conexion.llamar(sql, params38);
                break;
        }
        
        return resultado;
    }
    */
    
    public ArrayList obtenerMovimientos(){
        ArrayList movimientos=new ArrayList();
        //ResultSet res=Conexion.ejecutarConsulta("select M.*, B.nombre as nombrebenef, U.usuario as usuario from mov_edoscta M inner join Benef B on M.id_benef=B.id_benef inner join Usuarios U on M.id_usuario=U.id_usuario  order by M.clave_b,M.id_movedoscta", null);
        ResultSet res=Conexion.ejecutarConsulta("select M.*, B.nombre as nombrebenef, U.usuario as usuario from mov_diversos M inner join Benef_div B on M.id_bendiv=B.id_bendiv inner join Usuarios U on M.id_usuario=U.id_usuario  order by M.clave_b,M.id_movdiversos", null);
        try{
            while(res.next()){
                //MovDiversos movimiento=new MovDiversos(res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("capital"),res.getBigDecimal("interes"),res.getBigDecimal("admon"),res.getBigDecimal("seguro"),res.getString("clave_mov"),res.getString("poliza"),res.getDate("fecha_mov"),res.getInt("recibo"),res.getBigDecimal("o_seg"),res.getBigDecimal("moratorios"), res.getString("estatus"),res.getDate("fecha_pol"),res.getInt("id_usuario"),res.getString("prepago"),res.getInt("id_bonific"),res.getBigDecimal("comisiones"),res.getString("serie"),res.getBoolean("puntual"),res.getString("clave_b"),res.getBigDecimal("tit"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getInt("id_caja"),res.getBoolean("bonific"));
                MovDiversos movimiento=new MovDiversos(res.getInt("id_movdiversos"), 
                        res.getInt("id_bendiv"),    res.getString("clave_div"), 
                        res.getDate("fecha_div"),   res.getString("poliza"), 
                        res.getInt("recibo"),       res.getBigDecimal("cargo"), 
                        res.getBigDecimal("abono"), res.getBigDecimal("moratorios"), 
                        res.getBigDecimal("otros"), res.getDate("fecha_pol"), 
                        res.getString("estatus"),    res.getInt("id_usuario"), 
                        res.getBoolean("aplicado"), res.getString("descripcion"), 
                        res.getInt("id_catprog"),   res.getBigDecimal("bonificacion"), 
                        res.getString("serie"),     res.getString("poliza_apli"), 
                        res.getDate("fecha_apli"),  res.getBigDecimal("interes"), 
                        res.getBigDecimal("seguro"), res.getInt("id_emisor"), 
                        res.getString("clave_b"),   res.getString("numcontrato"), 
                        res.getInt("id_caja"),      res.getBoolean("bonific")
                );
                movimiento.setNombrebenef(res.getString("nombrebenef"));
                movimiento.setNombreusuario(res.getString("usuario"));
                
                movimientos.add(movimiento);
            }
            res.close();
        }catch(Exception e){}
        return movimientos;
    }
    
    public ArrayList obtenerMovimientosporID(int id_bendiv){
        //MovDiversos movimiento=null;
        Object params[]={id_bendiv};
        ArrayList movimientos=new ArrayList();
        //ResultSet res=Conexion.ejecutarConsulta("select M.*, B.nombre as nombrebenef, U.usuario as usuario from mov_edoscta M inner join Benef B on M.id_benef=B.id_benef inner join Usuarios U on M.id_usuario=U.id_usuario  order by M.clave_b,M.id_movedoscta", null);
        ResultSet res=Conexion.ejecutarConsulta("select M.*, B.nombre as nombrebenef, U.usuario as usuario from mov_diversos M inner join Benef_div B on M.id_bendiv=B.id_bendiv inner join Usuarios U on M.id_usuario=U.id_usuario  where M.id_bendiv= ? order by M.clave_b,M.id_movdiversos", params);
        try{
            while(res.next()){
                //MovDiversos movimiento=new MovDiversos(res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("capital"),res.getBigDecimal("interes"),res.getBigDecimal("admon"),res.getBigDecimal("seguro"),res.getString("clave_mov"),res.getString("poliza"),res.getDate("fecha_mov"),res.getInt("recibo"),res.getBigDecimal("o_seg"),res.getBigDecimal("moratorios"), res.getString("estatus"),res.getDate("fecha_pol"),res.getInt("id_usuario"),res.getString("prepago"),res.getInt("id_bonific"),res.getBigDecimal("comisiones"),res.getString("serie"),res.getBoolean("puntual"),res.getString("clave_b"),res.getBigDecimal("tit"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getInt("id_caja"),res.getBoolean("bonific"));
                MovDiversos movimiento=new MovDiversos(res.getInt("id_movdiversos"), 
                        res.getInt("id_bendiv"),    res.getString("clave_div"), 
                        res.getDate("fecha_div"),   res.getString("poliza"), 
                        res.getInt("recibo"),       res.getBigDecimal("cargo"), 
                        res.getBigDecimal("abono"), res.getBigDecimal("moratorios"), 
                        res.getBigDecimal("otros"), res.getDate("fecha_pol"), 
                        res.getString("estatus"),    res.getInt("id_usuario"), 
                        res.getBoolean("aplicado"), res.getString("descripcion"), 
                        res.getInt("id_catprog"),   res.getBigDecimal("bonificacion"), 
                        res.getString("serie"),     res.getString("poliza_apli"), 
                        res.getDate("fecha_apli"),  res.getBigDecimal("interes"), 
                        res.getBigDecimal("seguro"), res.getInt("id_emisor"), 
                        res.getString("clave_b"),   res.getString("numcontrato"), 
                        res.getInt("id_caja"),      res.getBoolean("bonific")
                );
                movimiento.setNombrebenef(res.getString("nombrebenef"));
                movimiento.setNombreusuario(res.getString("usuario"));
                
                movimientos.add(movimiento);
            }
            res.close();
        }catch(Exception e){}
        return movimientos;
    }
    
    
    public boolean actualizarMov_diversos(MovDiversos movimiento){
        Integer id_movdiversos=movimiento.getId_movdiversos();
        Integer id_bendiv=movimiento.getId_bendiv();
        
        String clave_div=movimiento.getClave_div();
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha_div=sdf.format(movimiento.getFecha_div());
        String poliza=movimiento.getPoliza();
        Integer recibo=movimiento.getRecibo();
        String cargo=movimiento.getCargo().toString();
        String abono=movimiento.getAbono().toString();
        String moratorios=movimiento.getMoratorios().toString();
        String otros=movimiento.getOtros().toString();
        //String fecha_pol=sdf.format(movimiento.getFecha_pol());
        String estatus=movimiento.getEstatus();
        
        Boolean bolaplicado = movimiento.isAplicado();
        Integer intaplicado = (bolaplicado) ? 1 : 0;
        String aplicado = intaplicado.toString();
        
        String descripcion=movimiento.getDescripcion();
        Integer id_catprog=movimiento.getId_catprog();
        String bonificacion=movimiento.getBonificacion().toString();
        String serie=movimiento.getSerie();
        String poliza_apli=movimiento.getPoliza_apli();
        String fecha_apli=sdf.format(movimiento.getFecha_apli());
        String interes=movimiento.getInteres().toString();
        String seguro=movimiento.getSeguro().toString();
        Integer id_emisor=movimiento.getId_emisor();
        String clave_b=movimiento.getClave_b();
        String numcontrato=movimiento.getNumcontrato();
        
        Boolean bolbonific = movimiento.isBonific();
        Integer intbonific = (bolbonific) ? 1 : 0;
        String bonific = intbonific.toString();
        
        Integer id_caja=movimiento.getId_caja();
        Integer id_usuario=movimiento.getId_usuario();
        
        
        
        Object params[]={id_bendiv, clave_div, fecha_div, poliza, 
            recibo, cargo, abono, moratorios, otros, 
            estatus, aplicado, descripcion, id_catprog, bonificacion, serie, 
            poliza_apli, fecha_apli, interes, seguro, id_emisor, clave_b, 
            numcontrato, bonific, id_caja, id_usuario, id_movdiversos};
        
        return Conexion.ejecutar("update mov_diversos set id_bendiv=?, clave_div=?, fecha_div=?, poliza=?, recibo=?, cargo=?, abono=?, moratorios=?, otros=?, estatus=?, aplicado=?, descripcion=?, id_catprog=?, bonificacion=?, serie=?, poliza_apli=?, fecha_apli=?, interes=?, seguro=?, id_emisor=?, clave_b=?, numcontrato=?, bonific=?, id_caja=?, id_usuario=? where id_movdiversos=?", params);
    }
    
    
    
    public boolean eliminarPorId(int id_movdiversos){
        MovDiversos movimiento = obtenerPorId(id_movdiversos);
        Boolean bonific=movimiento.isBonific();

        if (!bonific){
            Object params[]={id_movdiversos};
            return Conexion.ejecutar("delete from mov_diversos where id_movdiversos=?", params);
        }else{
            return false;
        }
            
    }
    
    public boolean cambiarBonificTrue(int id_movdiversos){
        Object params[]={id_movdiversos};
        return Conexion.ejecutar("update mov_diversos set bonific='1' where id_movdiversos=?", params);
    
    }
    
    public boolean cambiarBonificFalse(int id_movdiversos){
        Object params[]={id_movdiversos};
        return Conexion.ejecutar("update mov_diversos set bonific='0' where id_movdiversos=?", params);
    
    }
    /*
    public ArrayList obtenerMovimientosPorBenefId(int id){
        Object params[]={id};
        ArrayList movimientos=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select M.*, B.nombre as nombrebenef, U.usuario as usuario from mov_edoscta M inner join Benef B on M.id_benef=B.id_benef inner join Usuarios U on M.id_usuario=U.id_usuario where M.id_benef=? order by M.clave_b,M.id_movedoscta", params);
        try{
            while(res.next()){
                MovDiversos movimiento=new MovDiversos(res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("capital"),res.getBigDecimal("interes"),res.getBigDecimal("admon"),res.getBigDecimal("seguro"),res.getString("clave_mov"),res.getString("poliza"),res.getDate("fecha_mov"),res.getInt("recibo"),res.getBigDecimal("o_seg"),res.getBigDecimal("moratorios"), res.getString("estatus"),res.getDate("fecha_pol"),res.getInt("id_usuario"),res.getString("prepago"),res.getInt("id_bonific"),res.getBigDecimal("comisiones"),res.getString("serie"),res.getBoolean("puntual"),res.getString("clave_b"),res.getBigDecimal("tit"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getInt("id_caja"),res.getBoolean("bonific"));
                movimiento.setNombrebenef(res.getString("nombrebenef"));
                movimiento.setNombreusuario(res.getString("usuario"));
                
                movimientos.add(movimiento);
            }
            res.close();
        }catch(Exception e){}
        return movimientos;
    }*/
    
    public int appregistroMov_diverso(MovDiversos movimiento, String sql, int mbonific){
        Integer id_bendiv=movimiento.getId_bendiv();
        String clave_div=movimiento.getClave_div();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String fecha_div=df.format(movimiento.getFecha_div());
        String poliza=movimiento.getPoliza();
        Integer recibo=movimiento.getRecibo();
        //String cargo=movimiento.getCargo().toString();
        String abono=movimiento.getAbono().toString();
        String moratorios=movimiento.getMoratorios().toString();
        String otros=movimiento.getOtros().toString();
        //String fecha_pol=df.format(movimiento.getFecha_pol());
        String estatus=movimiento.getEstatus();
        
        /*Boolean bolaplicado = movimiento.isAplicado();
        Integer intaplicado = (bolaplicado) ? 1 : 0;
        String aplicado = intaplicado.toString();*/
        
        String descripcion=movimiento.getDescripcion();
        Integer id_catprog=movimiento.getId_catprog();
        //String bonificacion=movimiento.getBonificacion().toString();
        String serie=movimiento.getSerie();
        /*String poliza_apli=movimiento.getPoliza_apli();
        String fecha_apli=df.format(movimiento.getFecha_apli());
        String interes=movimiento.getInteres().toString();
        String seguro=movimiento.getSeguro().toString();
        Integer id_emisor=movimiento.getId_emisor();*/
        String clave_b=movimiento.getClave_b();
        String numcontrato=movimiento.getNumcontrato();
        
        Boolean bolbonific = movimiento.isBonific();
        Integer intbonific = (bolbonific) ? 1 : 0;
        String bonific = intbonific.toString();
        
        Integer id_caja=movimiento.getId_caja();
        Integer id_usuario=movimiento.getId_usuario();
        
        Object params[]={id_bendiv, clave_div, fecha_div, poliza, 
            recibo, abono, moratorios, otros, 
            estatus, descripcion, id_catprog, serie, clave_b, 
            numcontrato, mbonific, id_caja, id_usuario,-1};
        
        //Object params[]={id_catprog, numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_con,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario,poliza,fecha_pol,clave_b,fecha_ip};
        //return Conexion.ejecutar("insert into benef (id_catprog, numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_cont,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario,poliza,fecha_pol,clave_b,fecha_ip) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", params);
        return Conexion.llamarconsalida(sql, params);
    }
    
    public boolean insertarId_bonificacion(MovDiversos movimiento){
        Integer id_movdiversos=movimiento.getId_movdiversos();
        Integer id_bonificacion=movimiento.getId_bonificacion();
        
        Object params[]={id_bonificacion, id_movdiversos};
        return Conexion.ejecutar("update mov_diversos set id_bonificacion=? where id_movdiversos=?", params);
    
    }
    
    
}


