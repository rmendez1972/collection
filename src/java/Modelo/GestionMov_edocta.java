/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javabeans.Mov_edocta;

/**
 *
 * @author Ing. Rafael Méndez
 */

public class GestionMov_edocta
{
   /*    
    public boolean registroBeneficiario(Beneficiario beneficiario){
        Integer id_catprog=beneficiario.getId_catprog();
        String numcontrato=beneficiario.getNumcontrato();
        String clave_elect=beneficiario.getClave_elect();
        String curp=beneficiario.getCurp();
        String rfc=beneficiario.getRfc();
        String nombre=beneficiario.getNombre();
        String conyuge=beneficiario.getConyuge();
                
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha_con=sdf.format(beneficiario.getFecha_con());
        String mza=beneficiario.getMza();
        String lte=beneficiario.getLte();
        
        String area=beneficiario.getArea().toString();
        String domicilio=beneficiario.getDomicilio();
        String clave_cat=beneficiario.getClave_cat();
        Integer id_tipocredito=beneficiario.getId_tipocredito();
        Integer id_usuario=beneficiario.getId_usuario();
        String poliza=beneficiario.getPoliza();
        String fecha_pol=sdf.format(beneficiario.getFecha_pol());
        String clave_b=beneficiario.getClave_b();
        String fecha_ip=sdf.format(beneficiario.getFecha_ip());
        
        Object params[]={id_catprog, numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_con,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario,poliza,fecha_pol,clave_b,fecha_ip};
        return Conexion.ejecutar("insert into benef (id_catprog, numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_cont,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario,poliza,fecha_pol,clave_b,fecha_ip) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", params);
    }
    */
    
    public Mov_edocta obtenerPorId(int id_movedocta){
        Mov_edocta movimiento=null;
        Object params[]={id_movedocta};
        ResultSet res=Conexion.ejecutarConsulta("select * from mov_edoscta where id_movedoscta=?", params);
        try{
            if(res.next())

                //beneficiario=new Beneficiario(res.getInt("id_benef"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"),res.getDate("fecha_pol"),res.getString("poliza"), res.getString("clave_b"), res.getBigDecimal("capital"),res.getBigDecimal("enganche"), res.getBoolean("aperturado"));

                movimiento=new Mov_edocta(res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("capital"),res.getBigDecimal("interes"),res.getBigDecimal("admon"),res.getBigDecimal("seguro"),res.getString("clave_mov"),res.getString("poliza"),res.getDate("fecha_mov"),res.getInt("recibo"),res.getBigDecimal("o_seg"),res.getBigDecimal("moratorios"), res.getString("estatus"),res.getDate("fecha_pol"),res.getInt("id_usuario"),res.getString("prepago"),res.getInt("id_bonific"),res.getBigDecimal("comisiones"),res.getString("serie"),res.getBoolean("puntual"),res.getString("clave_b"),res.getBigDecimal("tit"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getInt("id_caja"),res.getBoolean("bonific"));

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
        ResultSet res=Conexion.ejecutarConsulta("select M.*, B.nombre as nombrebenef, U.usuario as usuario from mov_edoscta M inner join Benef B on M.id_benef=B.id_benef inner join Usuarios U on M.id_usuario=U.id_usuario  order by M.clave_b,M.id_movedoscta", null);
        try{
            while(res.next()){
                Mov_edocta movimiento=new Mov_edocta(res.getInt("id_movedoscta"),res.getInt("id_benef"),res.getBigDecimal("capital"),res.getBigDecimal("interes"),res.getBigDecimal("admon"),res.getBigDecimal("seguro"),res.getString("clave_mov"),res.getString("poliza"),res.getDate("fecha_mov"),res.getInt("recibo"),res.getBigDecimal("o_seg"),res.getBigDecimal("moratorios"), res.getString("estatus"),res.getDate("fecha_pol"),res.getInt("id_usuario"),res.getString("prepago"),res.getInt("id_bonific"),res.getBigDecimal("comisiones"),res.getString("serie"),res.getBoolean("puntual"),res.getString("clave_b"),res.getBigDecimal("tit"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getInt("id_caja"),res.getBoolean("bonific"));
                movimiento.setNombrebenef(res.getString("nombrebenef"));
                movimiento.setNombreusuario(res.getString("usuario"));
                
                movimientos.add(movimiento);
            }
            res.close();
        }catch(Exception e){}
        return movimientos;
    }
    
    
    public boolean actualizarMov_edocta(Mov_edocta movimiento){
        Integer id_movedoscta=movimiento.getId_movedoscta();
        Integer id_benef=movimiento.getId_benef();
        String clave_b=movimiento.getClave_b();
        String clave_mov=movimiento.getClave_mov();
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha_mov=sdf.format(movimiento.getFecha_mov());
        String poliza=movimiento.getPoliza();
        String fecha_pol=sdf.format(movimiento.getFecha_pol());
        String capital=movimiento.getCapital().toString();
        String admon=movimiento.getAdmon().toString();
        String seguro=movimiento.getSeguro().toString();
        String o_seguro=movimiento.getO_seguro().toString();
        String comisiones=movimiento.getComisiones().toString();
        String tit=movimiento.getTit().toString();
        String interes=movimiento.getInteres().toString();
        Integer id_usuario=movimiento.getId_usuario();
        
        Object params[]={id_benef,clave_b,clave_mov,fecha_mov,poliza,fecha_pol,capital,admon,seguro,o_seguro,comisiones,tit,interes,id_usuario,id_movedoscta};
        return Conexion.ejecutar("update mov_edoscta set id_benef=?, clave_b=?, clave_mov=?, fecha_mov=?, poliza=?, fecha_pol=?, capital=?, admon=?, seguro=?, o_seg=?, comisiones=?, tit=?, interes=?, id_usuario=? where id_movedoscta=?", params);
    }
    
    /*
    public boolean actualizarBeneficiarioAperturado(Beneficiario beneficiario){
        Boolean bolaperturado=beneficiario.getAperturado();
        Integer intaperturado = (bolaperturado) ? 1 : 0;
        String aperturado = intaperturado.toString();
        Integer id_beneficiario=beneficiario.getId_beneficiario();
        Object params[]={aperturado,id_beneficiario};
        return Conexion.ejecutar("update benef set aperturado=? where id_benef=?", params);
    }
    
    */
    
    public boolean eliminarPorId(int id_movedoscta){
        Mov_edocta movimiento = obtenerPorId(id_movedoscta);
        Boolean bonific=movimiento.getBonific();
        if (!bonific){
            Object params[]={id_movedoscta};
            return Conexion.ejecutar("delete from mov_edoscta where id_movedoscta=?", params);
        }else{
            return false;
        }
            
    }
    
}


