/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javabeans.Beneficiario;
import javabeans.ParametrosApertura;
/**
 *
 * @author Ing. Rafael Méndez
 */

public class GestionBeneficiario
{
       
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
    
    public Beneficiario obtenerPorId(int id_beneficiario){
        Beneficiario beneficiario=null;
        Object params[]={id_beneficiario};
        ResultSet res=Conexion.ejecutarConsulta("select * from benef where id_benef=?", params);
        try{
            if(res.next())

                //beneficiario=new Beneficiario(res.getInt("id_benef"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"),res.getDate("fecha_pol"),res.getString("poliza"), res.getString("clave_b"), res.getBigDecimal("capital"),res.getBigDecimal("enganche"), res.getBoolean("aperturado"));

                beneficiario=new Beneficiario(res.getInt("id_benef"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"),res.getDate("fecha_pol"),res.getString("poliza"), res.getString("clave_b"), res.getBigDecimal("capital"),res.getBigDecimal("enganche"), res.getBigDecimal("pagant"),res.getBigDecimal("sub_inic"), res.getBigDecimal("admon"),res.getBigDecimal("interes"),res.getBigDecimal("seguro"),res.getBigDecimal("comision"), res.getBoolean("aperturado"), res.getDate("fecha_ip"),res.getBigDecimal("sub_inf"),res.getBigDecimal("titulacion"), res.getBigDecimal("o_seg"), res.getInt("plazo"));

            res.close();
        }catch(Exception e){}
        return beneficiario;
    }
    
    public boolean aperturarPorId(int mecanica,int id_beneficiario,String sql, ParametrosApertura par_aper){
        boolean resultado=false;
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        switch (mecanica){
            case 29:
                
                Object params[]={par_aper.getId_beneficiario(),par_aper.getImp_capital(),par_aper.getImp_enganche(),par_aper.getPoliza(),sdf.format(par_aper.getFecha_pol()),par_aper.getClave_b(),par_aper.getId_usuario()};
                resultado=Conexion.llamar(sql, params);
                break;
                
            case 10: //igh
                
                Object params10[]={par_aper.getId_beneficiario(),par_aper.getImp_capital(),par_aper.getImp_enganche(),par_aper.getPoliza(),sdf.format(par_aper.getFecha_pol()),par_aper.getClave_b(),
                par_aper.getIntereses(), par_aper.getGastos_admon(), par_aper.getSeguro_vida(), par_aper.getPagos_anticipados(), par_aper.getSub_inic(), par_aper.getId_usuario(),
                par_aper.getId_catprog(), par_aper.getNumcontrato()};
                resultado=Conexion.llamar(sql, params10);
                break;
            
            case 36: //igh
                
                Object params36[]={par_aper.getId_beneficiario(),par_aper.getImp_capital(),par_aper.getImp_enganche(),par_aper.getPoliza(),sdf.format(par_aper.getFecha_pol()),par_aper.getClave_b(),
                par_aper.getPagos_anticipados(), par_aper.getSub_inic(), par_aper.getId_usuario(),
                par_aper.getId_catprog(), par_aper.getNumcontrato()};
                resultado=Conexion.llamar(sql, params36);
                break;     
            
            case 26: //igh
                
                Object params26[]={par_aper.getId_beneficiario(),par_aper.getImp_capital(),par_aper.getImp_enganche(),par_aper.getPoliza(),sdf.format(par_aper.getFecha_pol()),par_aper.getClave_b(),
                par_aper.getPagos_anticipados(), par_aper.getSub_inic(), par_aper.getId_usuario(),
                par_aper.getId_catprog(), par_aper.getNumcontrato()};
                resultado=Conexion.llamar(sql, params26);
                break;    
                
            case 20:
                Object params20[]={par_aper.getId_beneficiario(),par_aper.getImp_capital(),par_aper.getImp_enganche(),par_aper.getPoliza(),sdf.format(par_aper.getFecha_pol()),par_aper.getClave_b(),par_aper.getId_usuario(), par_aper.getId_catprog(), par_aper.getNumcontrato()};
                resultado=Conexion.llamar(sql, params20);
                break;
                
            case 38:
                Object params38[]={par_aper.getId_beneficiario(), par_aper.getClave_b(), sdf.format(par_aper.getFecha_pol()), par_aper.getPoliza(), par_aper.getImp_capital(), par_aper.getImp_enganche(), par_aper.getPagos_anticipados(),  par_aper.getSub_inic(), par_aper.getGastos_admon(), par_aper.getComision(), par_aper.getId_usuario(), par_aper.getId_catprog(), par_aper.getNumcontrato()};
                resultado=Conexion.llamar(sql, params38);
                break;
                
            case 8:
                Object params8[]={par_aper.getId_beneficiario(), par_aper.getClave_b(), sdf.format(par_aper.getFecha_pol()), par_aper.getPoliza(), par_aper.getImp_capital(), par_aper.getImp_enganche(), par_aper.getPagos_anticipados(),  par_aper.getSub_inic(), par_aper.getId_usuario(), par_aper.getId_catprog(), par_aper.getNumcontrato()};
                resultado=Conexion.llamar(sql, params8);
                break;
                
            case 48:
                Object params48[]={par_aper.getId_beneficiario(),par_aper.getPoliza(), par_aper.getClave_b(),par_aper.getId_usuario(),par_aper.getId_catprog(), par_aper.getNumcontrato(),sdf.format(par_aper.getFecha_pol()),par_aper.getImp_capital(),par_aper.getIntereses(),par_aper.getSeguro_vida(),par_aper.getGastos_admon(),par_aper.getTitulacion(),par_aper.getImp_enganche(),par_aper.getSub_inic(),par_aper.getSub_inf(),par_aper.getPagos_anticipados()};
                resultado=Conexion.llamar(sql, params48);
                break;
                
            case 40:
                Object params40[]={par_aper.getId_beneficiario(), par_aper.getId_usuario(), par_aper.getId_catprog(), par_aper.getImp_capital(), par_aper.getImp_enganche(), par_aper.getSub_inic(), par_aper.getPagos_anticipados(), par_aper.getIntereses(), par_aper.getGastos_admon(), par_aper.getSeguro_vida(), par_aper.getOtros_seg(), par_aper.getPoliza(), sdf.format(par_aper.getFecha_pol()), par_aper.getClave_b(), par_aper.getNumcontrato()};
                resultado=Conexion.llamar(sql, params40);
                break;
            
        }
        
        return resultado;
    }
    
    public boolean verificarMovimientosPorId(ParametrosApertura par_aper){
        boolean resultado=false;
        Integer valor=0;
     
       Object params[]={par_aper.getId_beneficiario(),par_aper.getClave_b()};
       ResultSet res=Conexion.ejecutarConsulta("SELECT COUNT(*) AS valor FROM mov_edoscta WHERE id_benef=? AND clave_b=?", params);
       
       try{
            while(res.next()){
                valor=res.getInt("valor");
            }
            res.close();
        }catch(Exception e){}
       
       if(valor == 0){
           resultado = false;
       }else{
           resultado = true;
       }
       
        return resultado;
    }
    
    public ArrayList obtenerBeneficiarios(){
        ArrayList beneficiarios=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select B.*, P.descripcion as desprograma, T.descripcion as descredito, U.usuario as usuario from benef B inner join cat_prog P on B.id_catprog=P.id_catprog inner join tipo_credito T on B.id_tipocredito=T.id_tipocredito inner join usuarios U on B.id_usuario=U.id_usuario order by B.fecha_cont", null);
        try{
            while(res.next()){
                Boolean aperturado=res.getBoolean("aperturado");
                               
                Beneficiario beneficiario=new Beneficiario(res.getInt("id_benef"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"),res.getDate("fecha_pol"),res.getString("clave_b"), res.getDate("fecha_ip"),aperturado);
                beneficiario.setCatprog(res.getString("desprograma"));
                beneficiario.setTipocredito(res.getString("descredito"));
                beneficiario.setUsuario(res.getString("usuario"));
                beneficiarios.add(beneficiario);
            }
            res.close();
        }catch(Exception e){}
        return beneficiarios;
    }
    
    public boolean actualizarBeneficiario(Beneficiario beneficiario){
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
        //String fecha_ip=sdf.format(beneficiario.getFecha_ip());
        Integer id_beneficiario=beneficiario.getId_beneficiario();
        Integer id_usuario=beneficiario.getId_usuario();
        String capital=beneficiario.getCapital().toString();
        String sub_inic=beneficiario.getSub_inic().toString();
        String enganche=beneficiario.getEnganche().toString();
        String pagant=beneficiario.getPagant().toString();
        String admon=beneficiario.getAdmon().toString();
        String comision=beneficiario.getComision().toString();
        String interes=beneficiario.getInteres().toString();
        String seguro=beneficiario.getSeguro().toString();
        String sub_inf=beneficiario.getSub_inf().toString();
        String titulacion=beneficiario.getTitulacion().toString();
        String o_seg=beneficiario.getO_seg().toString();
        Object params[]={id_catprog,numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_con,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario,capital,sub_inic,enganche,pagant,admon,comision,interes,seguro,sub_inf, titulacion, o_seg, id_beneficiario};
        return Conexion.ejecutar("update benef set id_catprog=?, numcontrato=?, clave_elect=?, curp=?, rfc=?, nombre=?, conyuge=?, fecha_cont=?, mza=?, lte=?, area=?, domicilio=?, clave_cat=?, id_tipocredito=?, id_usuario=?, capital=?, sub_inic=?, enganche=?, pagant=?, admon=?, comision=?, interes=?, seguro=?, sub_inf=?, titulacion=?, o_seg=? where id_benef=?", params);
    }
    
    public boolean actualizarBeneficiarioAperturado(Beneficiario beneficiario){
        Boolean bolaperturado=beneficiario.getAperturado();
        Integer intaperturado = (bolaperturado) ? 1 : 0;
        String aperturado = intaperturado.toString();
        Integer id_beneficiario=beneficiario.getId_beneficiario();
        Object params[]={aperturado,id_beneficiario};
        return Conexion.ejecutar("update benef set aperturado=? where id_benef=?", params);
    }
    
    
    
    public boolean eliminarPorId(int id_beneficiario){
        Beneficiario benef = obtenerPorId(id_beneficiario);
        Boolean aperturado=benef.getAperturado();
        if (!aperturado){
            Object params[]={id_beneficiario};
            return Conexion.ejecutar("delete from beneficiario where id_beneficiario=?", params);
        }else{
            return false;
        }
            
    }
    
    public Beneficiario obtenerPorClave_b(String clave_b){
        Beneficiario beneficiario=null;
        Object params[]={clave_b};
        ResultSet res=Conexion.ejecutarConsulta("select * from benef where clave_b=?", params);
        try{
            if(res.next())

                //beneficiario=new Beneficiario(res.getInt("id_benef"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"),res.getDate("fecha_pol"),res.getString("poliza"), res.getString("clave_b"), res.getBigDecimal("capital"),res.getBigDecimal("enganche"), res.getBoolean("aperturado"));

                beneficiario=new Beneficiario(res.getInt("id_benef"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"),res.getDate("fecha_pol"),res.getString("poliza"), res.getString("clave_b"), res.getBigDecimal("capital"),res.getBigDecimal("enganche"), res.getBigDecimal("pagant"),res.getBigDecimal("sub_inic"), res.getBigDecimal("admon"),res.getBigDecimal("interes"),res.getBigDecimal("seguro"),res.getBigDecimal("comision"), res.getBoolean("aperturado"), res.getDate("fecha_ip"), res.getBigDecimal("sub_inf"),res.getBigDecimal("titulacion"), res.getBigDecimal("o_seg"),res.getInt("plazo"));

            res.close();
        }catch(Exception e){}
        return beneficiario;
    }
    
    public Beneficiario obtenerGenerico(String generico){
        Beneficiario beneficiario=null;
        Object params[]={generico};
        ResultSet res=Conexion.ejecutarConsulta("select * from benef where clave_b like'"+generico+"'||id_benef like'"+generico+"'||nombre like'"+generico+"'", params);
        try{
            if(res.next())

                //beneficiario=new Beneficiario(res.getInt("id_benef"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"),res.getDate("fecha_pol"),res.getString("poliza"), res.getString("clave_b"), res.getBigDecimal("capital"),res.getBigDecimal("enganche"), res.getBoolean("aperturado"));

                beneficiario=new Beneficiario(res.getInt("id_benef"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"),res.getDate("fecha_pol"),res.getString("poliza"), res.getString("clave_b"), res.getBigDecimal("capital"),res.getBigDecimal("enganche"), res.getBigDecimal("pagant"),res.getBigDecimal("sub_inic"), res.getBigDecimal("admon"),res.getBigDecimal("interes"),res.getBigDecimal("seguro"),res.getBigDecimal("comision"), res.getBoolean("aperturado"), res.getDate("fecha_ip"), res.getBigDecimal("sub_inf"),res.getBigDecimal("titulacion"), res.getBigDecimal("o_seg"), res.getInt("plazo"));

            res.close();
        }catch(Exception e){}
        return beneficiario;
    }
    
    //obtener beneficiario por nombre
    public Beneficiario obtenerPorNombre(String valorcriterio){
        Beneficiario benef = null;
        //valorcriterio = valorcriterio+"%";
        Object params[]={valorcriterio};
        ResultSet res=Conexion.ejecutarConsulta("select * from benef where nombre=?", params);
        try{
            while(res.next()){
                benef=new Beneficiario(res.getInt("id_benef"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"),res.getDate("fecha_pol"),res.getString("poliza"), res.getString("clave_b"), res.getBigDecimal("capital"),res.getBigDecimal("enganche"), res.getBigDecimal("pagant"),res.getBigDecimal("sub_inic"), res.getBigDecimal("admon"),res.getBigDecimal("interes"),res.getBigDecimal("seguro"),res.getBigDecimal("comision"), res.getBoolean("aperturado"), res.getDate("fecha_ip"), res.getBigDecimal("sub_inf"),res.getBigDecimal("titulacion"), res.getBigDecimal("o_seg"), res.getInt("plazo"));
                
            }
            res.close();
        }catch(Exception e){}
        return benef;
    }
    
}


