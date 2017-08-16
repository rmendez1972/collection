/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javabeans.Beneficiario;
import javabeans.BeneficiarioDiv;
import javabeans.Usuario;
import javabeans.CatProgramas;
import javabeans.MovDiversos;

/**
 *
 * @Ismael
 */
public class GestionBendiv {
    
    public boolean registroBendiv(BeneficiarioDiv bendiv){
        boolean res=false;
        String clave_elect=bendiv.getClave_elect();
        String curp=bendiv.getCurp();
        String clave_b=bendiv.getClave_b();
        String nombre=bendiv.getNombre();
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha_con=sdf.format(bendiv.getFecha_con());
        String capital=bendiv.getCapital().toString();
        String sub_inic=bendiv.getSub_inic().toString();
        String enganche=bendiv.getEnganche().toString();
        String interes=bendiv.getInteres().toString();
        String admon=bendiv.getAdmon().toString();
        String seguro=bendiv.getSeguro().toString();
        String o_seg=bendiv.getO_seg().toString();
        Integer plazo=bendiv.getPlazo();
        String pago_mes=bendiv.getPago_mes().toString();
        String sal_con=bendiv.getSal_con().toString();
        String juridico=bendiv.getJuridico();
        String referencia_jur=bendiv.getReferencia_jur();
        String fecha_jur=sdf.format(bendiv.getFecha_jur());
        Integer id_catprog=bendiv.getId_catprog();
        Integer id_usuario=bendiv.getId_usuario();
        String mza=bendiv.getMza();
        String lte=bendiv.getLte();
        String conyuge=bendiv.getConyuge();
        String fecha=sdf.format(bendiv.getFecha());
        String numcontrato=bendiv.getNumcontrato();
        
        /*Boolean bolaperturado=bendiv.isAperturado();
        Integer intaperturado =(bolaperturado) ?1 :0;
        String aperturado =intaperturado.toString();*/
        
        //
        //Integer id_delegacion=autoriza.getId_delegacion();
        //String nombre=autoriza.getNombre();
        //String cargo=autoriza.getCargo();
          
        Object params[]={clave_elect,curp,clave_b,nombre,fecha_con,capital,
        sub_inic,enganche,interes,admon,seguro,o_seg,plazo,pago_mes,sal_con,juridico,
        referencia_jur,fecha_jur,id_usuario,id_catprog,mza,lte,conyuge,fecha,numcontrato};
        res=Conexion.ejecutar("insert into benef_div (clave_elect,curp,clave_b,nombre,fecha_con,capital,sub_inic,enganche,interes,admon,seguro,o_seg,plazo,pago_mes,sal_con,juridico,referencia_jur,fecha_jur,id_usuario,id_catprog,mza,lte,conyuge,fecha,numcontrato) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", params);
        
        return res;
    }
   
    public BeneficiarioDiv obtenerPorId(int id_bendiv){
        Object params[]={id_bendiv};
        BeneficiarioDiv bendiv=null;
        ResultSet res=Conexion.ejecutarConsulta("select * from benef_div where id_bendiv=?", params);
        try{
            if(res.next()){
                bendiv=new BeneficiarioDiv(res.getInt("id_bendiv"), res.getString("clave_elect"), 
                        res.getString("curp"), res.getString("clave_b"), res.getString("nombre"), 
                        res.getDate("fecha_con"), res.getBigDecimal("capital"), res.getBigDecimal("sub_inic"),
                        res.getBigDecimal("enganche"),res.getBigDecimal("interes"),res.getBigDecimal("admon"),
                        res.getBigDecimal("seguro"),res.getBigDecimal("o_seg"), res.getInt("plazo"),
                        res.getBigDecimal("pago_mes"),res.getBigDecimal("sal_con"),res.getString("juridico"),
                        res.getString("referencia_jur"),res.getDate("fecha_jur"),res.getInt("id_usuario"),
                        res.getInt("id_catprog"),res.getString("mza"),res.getString("lte"),
                        res.getString("conyuge"), res.getDate("fecha"),res.getBoolean("aperturado"),res.getString("numcontrato"));
            }
            res.close();
        }catch(Exception e){}
        return bendiv;
    }
    
   
    
    public ArrayList obtenerTodos(){
        ArrayList lista=new ArrayList();
        //ResultSet res=Conexion.ejecutarConsulta("select * from benef_div order by nombre asc", null);
        //ResultSet res=Conexion.ejecutarConsulta("select U.*, N.descripcion as nivel, D.descripcion as delegacion from usuarios U inner join niveles N on U.id_nivel = N.id_nivel inner join delegaciones D on U.id_del = D.id_delegacion order by U.nombre asc", null);
        
        ResultSet res=Conexion.ejecutarConsulta("select B.*, P.descripcion as catprog, U.usuario as usuario from benef_div B inner join cat_prog P on B.id_catprog=P.id_catprog inner join usuarios U on B.id_usuario=U.id_usuario order by B.nombre asc", null);
        
        try{
            while(res.next()){
                BeneficiarioDiv bendiv=new BeneficiarioDiv(res.getInt("id_bendiv"), 
                        res.getString("clave_elect"), res.getString("curp"), res.getString("clave_b"), 
                        res.getString("nombre"), res.getDate("fecha_con"), res.getBigDecimal("capital"),
                        res.getBigDecimal("sub_inic"),res.getBigDecimal("enganche"), res.getBigDecimal("interes"),
                        res.getBigDecimal("admon"), res.getBigDecimal("seguro"), res.getBigDecimal("o_seg"),
                        res.getInt("plazo"), res.getBigDecimal("pago_mes"), res.getBigDecimal("sal_con"),
                        res.getString("juridico"), res.getString("referencia_jur"), res.getDate("fecha_jur"),
                        res.getInt("id_catprog"),res.getInt("id_usuario"), res.getString("mza"),
                        res.getString("lte"), res.getString("conyuge"),res.getDate("fecha"),
                        res.getBoolean("aperturado"), res.getString("numcontrato"));
                
                bendiv.setCatprog(res.getString("catprog"));
                bendiv.setUsuario(res.getString("usuario"));
                lista.add(bendiv);
            }
            res.close();
        }catch(Exception e){}
        return lista;
    }
    
  
       
    public boolean actualizarBendiv(BeneficiarioDiv bendiv){
        Integer id_bendiv=bendiv.getId_bendiv();
        String clave_elect=bendiv.getClave_elect();
        String curp=bendiv.getCurp();
        String clave_b=bendiv.getClave_b();
        String nombre=bendiv.getNombre();
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        String fecha_con=sdf.format(bendiv.getFecha_con());
        String capital=bendiv.getCapital().toString();
        String sub_inic=bendiv.getSub_inic().toString();
        String enganche=bendiv.getEnganche().toString();
        String interes=bendiv.getInteres().toString();
        String admon=bendiv.getAdmon().toString();
        String seguro=bendiv.getSeguro().toString();
        String o_seg=bendiv.getO_seg().toString();
        Integer plazo=bendiv.getPlazo();
        String pago_mes=bendiv.getPago_mes().toString();
        String sal_con=bendiv.getSal_con().toString();
        String juridico=bendiv.getJuridico();
        String referencia_jur=bendiv.getReferencia_jur();
        String fecha_jur=sdf.format(bendiv.getFecha_jur());
        Integer id_catprog=bendiv.getId_catprog();
        Integer id_usuario=bendiv.getId_usuario();
        String mza=bendiv.getMza();
        String lte=bendiv.getLte();
        String conyuge=bendiv.getConyuge();
        String fecha=sdf.format(bendiv.getFecha());
        String numcontrato=bendiv.getNumcontrato();
        
        
        Object params[]={clave_elect,curp,clave_b,nombre,fecha_con,capital,
        sub_inic,enganche,interes,admon,seguro,o_seg,plazo,pago_mes,sal_con,juridico,
        referencia_jur,fecha_jur,id_usuario,id_catprog,mza,lte,conyuge,fecha,numcontrato,id_bendiv};
        return Conexion.ejecutar("update benef_div set clave_elect=?, curp=?, clave_b=?, nombre=?, fecha_con=?, capital=? ,sub_inic=? ,enganche=?, interes=?, admon=?, seguro=?, o_seg=?, plazo=?, pago_mes=?, sal_con=?, juridico=?, referencia_jur=?, fecha_jur=?, id_usuario=?, id_catprog=?, mza=?, lte=?, conyuge=?, fecha=?, numcontrato=? where id_bendiv=?", params);
        //return Conexion.ejecutar("update benef_div set clave_elect=?, curp=?, clave_b=?, nombre=?, id_catprog=?, id_usuario=? where id_bendiv=?", params);
        
    }
     
    public boolean eliminarPorId(int id_bendiv){
      
        BeneficiarioDiv benef = obtenerPorId(id_bendiv);
         Boolean bolaperturado=benef.isAperturado();
        //Integer intaperturado =(bolaperturado) ?1 :0;
        //String aperturado =intaperturado.toString();

        
        if (!bolaperturado){
            Object params[]={id_bendiv};
            return Conexion.ejecutar("delete from benef_div where id_bendiv=?", params);
            }else{
            return false;
        }
        
    }
    
    
    /*
    public boolean eliminarPorId(int id_beneficiario){
        Beneficiario benef = obtenerPorId(id_beneficiario);
        Boolean aperturado=benef.getAperturado();
        if (!aperturado){
            Object params[]={id_beneficiario};
            return Conexion.ejecutar("delete from beneficiario where id_beneficiario=?", params);
        }else{
            return false;
        }
            
    }*/
    
    public boolean cambiarAperturadoTrue(int id_bendiv){
    Object params[]={id_bendiv};
    return Conexion.ejecutar("update benef_div set aperturado='1' where id_bendiv=?", params);
    
    }
    
    public boolean cambiarAperturadoFalse(int id_bendiv){
    Object params[]={id_bendiv};
    return Conexion.ejecutar("update benef_div set aperturado='0' where id_bendiv=?", params);
    
    }
}
