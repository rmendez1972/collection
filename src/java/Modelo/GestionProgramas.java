/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.util.ArrayList;
import javabeans.CatProgramas;

/**
 *
 * @author Marlon
 */
public class GestionProgramas {
    
    public ArrayList obtenerTodos(){
        ArrayList lista = new ArrayList();
        ResultSet res = Conexion.ejecutarConsulta("select P.*, TC.descripcion as tipocredito, C.descripcion as colonia, D.descripcion as delegacion, M.descripcion as modulo  from cat_prog P inner join tipo_credito TC on P.id_tipocred = TC.id_tipocredito inner join colonias C on P.id_colonia = C.id_colonia inner join delegaciones D on P.id_delegacion = D.id_delegacion inner join modulos_recaudacion M on P.id_modulo = M.id_modulo", null);
        try{
            while(res.next()){
                CatProgramas cp=new CatProgramas(res.getInt("id_catprog"), res.getString("clave"), res.getString("descripcion"), res.getBigDecimal("sub_ini"), res.getBigDecimal("eng_fon"), res.getBigDecimal("eng_inv"), res.getBigDecimal("interes"), res.getBigDecimal("admon"), res.getBigDecimal("seguro"), res.getBigDecimal("costo_m2"), res.getBigDecimal("por_sub"), res.getBigDecimal("por_admon"), res.getBigDecimal("por_sv"), res.getBigDecimal("por_os"), res.getBigDecimal("sal_min"), res.getBigDecimal("pago_mes"), res.getBigDecimal("por_eng"), res.getBigDecimal("anual"), res.getInt("plazo"), res.getBigDecimal("por_cap"), res.getBoolean("status"), res.getInt("mecanica"), res.getInt("id_tipocred"), res.getBigDecimal("mensual"), res.getBigDecimal("sub_bp"), res.getBigDecimal("apor_fij"), res.getBigDecimal("por_pm"), res.getBigDecimal("por_pf"), res.getString("clave_ant"), res.getInt("id_colonia"), res.getInt("dias_gracia"), res.getBoolean("mora"), res.getBigDecimal("por_ga"), res.getString("cuenta_cont"), res.getInt("id_delegacion"), res.getInt("id_modulo"), res.getBoolean("condicion_fija"), res.getInt("id_usuario"));
                cp.setTipocredito(res.getString("tipocredito"));
                cp.setColonia(res.getString("colonia"));
                cp.setDelegacion(res.getString("delegacion"));
                cp.setModulo(res.getString("modulo"));
                lista.add(cp);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
    public boolean registroPrograma(CatProgramas pro){
        
        String clave = pro.getClave();
        String descripcion = pro.getDescripcion();
        String sub_ini = pro.getSub_ini().toString();
        String eng_fon = pro.getEng_fon().toString();
        String eng_inv = pro.getEng_inv().toString();
        String interes = pro.getInteres().toString();
        String admon = pro.getAdmon().toString();
        String seguro = pro.getSeguro().toString();
        String costo_m2 = pro.getCosto_m2().toString();
        String por_sub = pro.getPor_sub().toString();
        String por_admon = pro.getPor_admon().toString();
        String por_sv = pro.getPor_sv().toString();
        String por_os = pro.getPor_os().toString();
        String sal_min = pro.getSal_min().toString();
        String pago_mes = pro.getPago_mes().toString();
        String por_eng = pro.getPor_eng().toString();
        String anual = pro.getAnual().toString();
        String plazo = pro.getPlazo().toString();
        String por_cap = pro.getPor_cap().toString();
        
        Boolean bolstatus = pro.isStatus();
        Integer intstatus = (bolstatus) ? 1 : 0;
        String status = intstatus.toString();
                
        String mecanica = pro.getMecanica().toString();
        String id_tipocred = pro.getId_tipocred().toString();
        String mensual = pro.getMensual().toString();
        String sub_bp = pro.getSub_bp().toString();
        String apor_fij = pro.getApor_fij().toString();
        String por_pm = pro.getPor_pm().toString();
        String por_pf = pro.getPor_pf().toString();
        String clave_ant = pro.getClave_ant();
        String id_colonia = pro.getId_colonia().toString();
        String dias_gracia = pro.getDias_gracia().toString();
        
        Boolean bolmora = pro.isMora();
        Integer intmora = (bolmora) ? 1 : 0;
        String mora = intmora.toString();
        
        String por_ga = pro.getPor_ga().toString();
        String cuenta_cont = pro.getCuenta_cont();
        String id_delegacion = pro.getId_delegacion().toString();
        String id_modulo = pro.getId_modulo().toString();
        
        Boolean bolcondicion_fija = pro.isCondicion_fija();
        Integer intcondicion_fija = (bolcondicion_fija) ? 1 : 0;
        String condicion_fija = intcondicion_fija.toString();
        
        String id_usuario = pro.getId_usuario().toString();
        
        Object params[]={clave, descripcion, sub_ini, eng_fon, eng_inv, interes, admon, seguro, costo_m2, por_sub, por_admon, por_sv, por_os, sal_min, pago_mes, por_eng, anual, plazo, por_cap, status, mecanica, id_tipocred, mensual, sub_bp, apor_fij, por_pm, por_pf, clave_ant, id_colonia, dias_gracia, mora, por_ga, cuenta_cont, id_delegacion, id_modulo, condicion_fija, id_usuario};
        return Conexion.ejecutar("insert into cat_prog (clave, descripcion, sub_ini, eng_fon, eng_inv, interes, admon, seguro, costo_m2, por_sub, por_admon, por_sv, por_os, sal_min, pago_mes, por_eng, anual, plazo, por_cap, status, mecanica, id_tipocred, mensual, sub_bp, apor_fij, por_pm, por_pf, clave_ant, id_colonia, dias_gracia, mora, por_ga, cuenta_cont, id_delegacion, id_modulo, condicion_fija, id_usuario) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", params);    
        //Object params[] = {status};
        //return Conexion.ejecutar("insert into cat_prog (status) values (?)", params);
        
        
    }
    
    public boolean eliminarPorId(int id_catprog){
        Object params[]={id_catprog};
        return Conexion.ejecutar("delete from cat_prog where id_catprog=?", params);
    }
    
    public CatProgramas obtenerPorId(int id_catprog){
        CatProgramas cp=null;
        Object params[]={id_catprog};
        ResultSet res=Conexion.ejecutarConsulta("select * from cat_prog where id_catprog=?", params);
        try{
            if(res.next())
                cp=new CatProgramas(res.getInt("id_catprog"), res.getString("clave"), res.getString("descripcion"), res.getBigDecimal("sub_ini"), res.getBigDecimal("eng_fon"), res.getBigDecimal("eng_inv"), res.getBigDecimal("interes"), res.getBigDecimal("admon"), res.getBigDecimal("seguro"), res.getBigDecimal("costo_m2"), res.getBigDecimal("por_sub"), res.getBigDecimal("por_admon"), res.getBigDecimal("por_sv"), res.getBigDecimal("por_os"), res.getBigDecimal("sal_min"), res.getBigDecimal("pago_mes"), res.getBigDecimal("por_eng"), res.getBigDecimal("anual"), res.getInt("plazo"), res.getBigDecimal("por_cap"), res.getBoolean("status"), res.getInt("mecanica"), res.getInt("id_tipocred"), res.getBigDecimal("mensual"), res.getBigDecimal("sub_bp"), res.getBigDecimal("apor_fij"), res.getBigDecimal("por_pm"), res.getBigDecimal("por_pf"), res.getString("clave_ant"), res.getInt("id_colonia"), res.getInt("dias_gracia"), res.getBoolean("mora"), res.getBigDecimal("por_ga"), res.getString("cuenta_cont"), res.getInt("id_delegacion"), res.getInt("id_modulo"), res.getBoolean("condicion_fija"), res.getInt("id_usuario"));
            res.close();
        }catch(Exception e){}
        return cp;
    }
    
    public boolean actualizarPrograma(CatProgramas pro){
        
        String id_catprog = pro.getId_catprog().toString();
        String clave = pro.getClave();
        String descripcion = pro.getDescripcion();
        String sub_ini = pro.getSub_ini().toString();
        String eng_fon = pro.getEng_fon().toString();
        String eng_inv = pro.getEng_inv().toString();
        String interes = pro.getInteres().toString();
        String admon = pro.getAdmon().toString();
        String seguro = pro.getSeguro().toString();
        String costo_m2 = pro.getCosto_m2().toString();
        String por_sub = pro.getPor_sub().toString();
        String por_admon = pro.getPor_admon().toString();
        String por_sv = pro.getPor_sv().toString();
        String por_os = pro.getPor_os().toString();
        String sal_min = pro.getSal_min().toString();
        String pago_mes = pro.getPago_mes().toString();
        String por_eng = pro.getPor_eng().toString();
        String anual = pro.getAnual().toString();
        String plazo = pro.getPlazo().toString();
        String por_cap = pro.getPor_cap().toString();
        
        Boolean bolstatus = pro.isStatus();
        Integer intstatus = (bolstatus) ? 1 : 0;
        String status = intstatus.toString();
                
        String mecanica = pro.getMecanica().toString();
        String id_tipocred = pro.getId_tipocred().toString();
        String mensual = pro.getMensual().toString();
        String sub_bp = pro.getSub_bp().toString();
        String apor_fij = pro.getApor_fij().toString();
        String por_pm = pro.getPor_pm().toString();
        String por_pf = pro.getPor_pf().toString();
        String clave_ant = pro.getClave_ant();
        String id_colonia = pro.getId_colonia().toString();
        String dias_gracia = pro.getDias_gracia().toString();
        
        Boolean bolmora = pro.isMora();
        Integer intmora = (bolmora) ? 1 : 0;
        String mora = intmora.toString();
        
        String por_ga = pro.getPor_ga().toString();
        String cuenta_cont = pro.getCuenta_cont();
        String id_delegacion = pro.getId_delegacion().toString();
        String id_modulo = pro.getId_modulo().toString();
        
        Boolean bolcondicion_fija = pro.isCondicion_fija();
        Integer intcondicion_fija = (bolcondicion_fija) ? 1 : 0;
        String condicion_fija = intcondicion_fija.toString();
        
        String id_usuario = pro.getId_usuario().toString();
        
        Object params[]={clave, descripcion, sub_ini, eng_fon, eng_inv, interes, admon, seguro, costo_m2, por_sub, por_admon, por_sv, por_os, sal_min, pago_mes, por_eng, anual, plazo, por_cap, status, mecanica, id_tipocred, mensual, sub_bp, apor_fij, por_pm, por_pf, clave_ant, id_colonia, dias_gracia, mora, por_ga, cuenta_cont, id_delegacion, id_modulo, condicion_fija, id_usuario, id_catprog};
        return Conexion.ejecutar("update cat_prog set clave=?, descripcion=?, sub_ini=?, eng_fon=?, eng_inv=?, interes=?, admon=?, seguro=?, costo_m2=?, por_sub=?, por_admon=?, por_sv=?, por_os=?, sal_min=?, pago_mes=?, por_eng=?, anual=?, plazo=?, por_cap=?, status=?, mecanica=?, id_tipocred=?, mensual=?, sub_bp=?, apor_fij=?, por_pm=?, por_pf=?, clave_ant=?, id_colonia=?, dias_gracia=?, mora=?, por_ga=?, cuenta_cont=?, id_delegacion=?, id_modulo=?, condicion_fija=?, id_usuario=? where id_catprog=?", params);
    
    }
    
}
