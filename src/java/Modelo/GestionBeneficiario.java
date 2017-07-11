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
        
        Object params[]={id_catprog, numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_con,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario,poliza,fecha_pol,clave_b};
        return Conexion.ejecutar("insert into benef (id_catprog, numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_cont,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario,poliza,fecha_pol,clave_b) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", params);
    }
    
    public Beneficiario obtenerPorId(int id_beneficiario){
        Beneficiario beneficiario=null;
        Object params[]={id_beneficiario};
        ResultSet res=Conexion.ejecutarConsulta("select * from benef where id_benef=?", params);
        try{
            if(res.next())
                beneficiario=new Beneficiario(res.getInt("id_benef"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"),res.getDate("fecha_pol"),res.getString("poliza"), res.getString("clave_b"), res.getBigDecimal("capital"),res.getBigDecimal("enganche"));
            res.close();
        }catch(Exception e){}
        return beneficiario;
    }
    
    public boolean aperturarPorId(int mecanica,int id_beneficiario,String sql, ParametrosApertura par_aper){
        boolean resultado=false;
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        switch (mecanica){
            case 29:
                
                Object params[]={par_aper.getId_beneficiario(),par_aper.getImp_capital(),par_aper.getImp_enganche(),par_aper.getPoliza(),sdf.format(par_aper.getFecha_pol()),par_aper.getClave_b()};
                resultado=Conexion.llamar(sql, params);
                break;
            
            case 20:
                Object params20[]={par_aper.getId_beneficiario(),par_aper.getImp_capital(),par_aper.getImp_enganche(),par_aper.getPoliza(),sdf.format(par_aper.getFecha_pol()),par_aper.getClave_b()};
                resultado=Conexion.llamar(sql, params20);
                break;
        }
        
        return resultado;
    }
    
    public ArrayList obtenerBeneficiarios(){
        ArrayList beneficiarios=new ArrayList();
        ResultSet res=Conexion.ejecutarConsulta("select B.*, P.descripcion as desprograma, T.descripcion as descredito, U.usuario as usuario from benef B inner join cat_prog P on B.id_catprog=P.id_catprog inner join tipo_credito T on B.id_tipocredito=T.id_tipocredito inner join usuarios U on B.id_usuario=U.id_usuario order by B.fecha_cont", null);
        try{
            while(res.next()){
                Beneficiario beneficiario=new Beneficiario(res.getInt("id_benef"),res.getInt("id_catprog"),res.getString("numcontrato"),res.getString("clave_elect"),res.getString("curp"),res.getString("rfc"),res.getString("nombre"),res.getString("conyuge"),res.getDate("fecha_cont"),res.getString("mza"),res.getString("lte"),res.getBigDecimal("area"),res.getString("domicilio"),res.getString("clave_cat"),res.getInt("id_tipocredito"),res.getDate("fecha_pol"),res.getString("clave_b"));
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
        Object params[]={id_catprog,numcontrato,clave_elect,curp,rfc,nombre,conyuge,fecha_con,mza,lte,area,domicilio,clave_cat,id_tipocredito,id_usuario,id_beneficiario};
        return Conexion.ejecutar("update beneficiario set id_catprog=?, numcontrato=?, clave_elect=?, curp=?, rfc=?, nombre=?, conyuge=?, fecha_cont=?, mza=?, lte=?, area=?, domicilio=?, clave_cat=?, id_tipocredito=?, id_usuario=? where id_beneficiario=?", params);
    }
    
    
    
    public boolean eliminarPorId(int id_beneficiario){
        Object params[]={id_beneficiario};
        return Conexion.ejecutar("delete from beneficiario where id_beneficiario=?", params);
    }
    
}


