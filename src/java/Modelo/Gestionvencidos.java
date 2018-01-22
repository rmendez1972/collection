/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Rafael Mendez
 */

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Types;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javabeans.Colonia;
import javabeans.vencidos;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.sql.DataSource;


public class Gestionvencidos 
{

    public Gestionvencidos () {
        super();
    }
        //método común para la obtención
    //de conexiones
    public Connection getConnection() throws ServletException, SQLException
    {
        
        
        DataSource pool;
        
        try 
        {
            Context env = (Context) new InitialContext().lookup("java:comp/env");
            pool = (DataSource) env.lookup("jdbc/cobranza");
            if (pool == null) 
            {
                throw new ServletException("No se encontró el DataSource");
            }
        }
        catch (NamingException ne) 
        {
            throw new ServletException(ne.getMessage());
        }
        
        Connection cn = pool.getConnection();
        return cn;
    }
    
    
    /*
    public ArrayList listarColonias()
    {
         
        ArrayList coloniass=null;
        Statement st;
        ResultSet rs;
        
        
        try
        {
            Connection cn=getConnection();
            st=cn.createStatement();
            String tsql;
            tsql="select c.id_colonia,c.id_delegacion,d.descripcion as delegacion,c.descripcion as colonia from colonias c left outer join delegaciones d on c.id_delegacion=d.id_delegacion order by c.id_delegacion,c.descripcion ";
            //tsql="select * from colonias order by id_delegacion,descripcion";
            rs=st.executeQuery(tsql);
            coloniass=new ArrayList();
            //para cada mensaje encontrado crea un objeto
            //Mensaje y lo añade a la colección ArrayList
            while(rs.next())
            {
                 
                Colonias mcolonias=new Colonias(rs.getInt("id_colonia"),rs.getString("delegacion"),rs.getString("colonia"));
                //Colonias mcolonias=new Colonias(rs.getInt("id_colonia"),rs.getInt("id_delegacion"),rs.getString("descripcion"));
                coloniass.add(mcolonias);
            }
            st.close();
            cn.close();
           
        }
        catch(Exception e){ e.printStackTrace();}
        return(coloniass);
    }
    */
    public ArrayList listarVencidosparaJson(String clave_b)
    {
         
        ArrayList vencidoss=null;
        Statement st;
        ResultSet rs;
        
        
        try
        {
            Connection cn=getConnection();
            st=cn.createStatement();
            String tsql;
            tsql="select capital,interes,admon from mov_edoscta where clave_b='"+clave_b+"' order by clave_mov ";
            
            rs=st.executeQuery(tsql);
            vencidoss=new ArrayList();
            
            
            
            while(rs.next())
            {
                
                vencidoss.add(rs.getString("capital"));
                vencidoss.add(rs.getString("interes"));
                vencidoss.add(rs.getString("admon"));
            }
            st.close();
            cn.close();
           
        }
        catch(Exception e){ e.printStackTrace();}
        return(vencidoss);
    }
    
    
    public ArrayList localizaFechasparaJson(String clave_b, Date fecha_corte)
    {
         
        ArrayList fechas=null;
        Statement st,st2,st3;
        ResultSet rs,rs2,rs3;
        Date fecha_ip=null;
        Integer mecanica=null;
        Integer dias_gracia=null;
        Boolean mora=null;
        Integer plazo=null;
        cal_29 cal = new cal_29();
        
        try
        {
            Connection cn=getConnection();
            st=cn.createStatement();
            st2=cn.createStatement();
            st3=cn.createStatement();
            fechas=new ArrayList();
            String tsql;
            tsql="select *  from benef  where clave_b='"+clave_b+"'";
            rs=st.executeQuery(tsql);
            fechas=new ArrayList();
            
            //SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
            if (rs.next())
            {    
                String clave_elect = rs.getString("clave_elect");
                fecha_ip = rs.getDate("fecha_ip");
                plazo= rs.getInt("plazo");
                
            }
            
            
            
           
            if ((fecha_corte.compareTo(fecha_ip)<0) || (fecha_corte.compareTo(fecha_ip)==0))
                
            {
                 
                fechas.add("Fecha de corte  ");
                fechas.add("menor o igual que fehca de Ip :");
                fechas.add(fecha_ip);
                fechas.add("");
                fechas.add("");
                fechas.add("");
                fechas.add("");
                fechas.add("");
                fechas.add("");
                fechas.add("");
            }else
            {
                //st2=cn.createStatement();
                String tsql2;
                String clave=clave_b.substring(0,6);
                tsql2="select *  from cat_prog  where clave='"+ clave +"'";
                rs2=st2.executeQuery(tsql2);
                
                if (rs2.next())
                {    
                    
                    mecanica = rs2.getInt("mecanica");
                    dias_gracia = rs2.getInt("dias_gracia");
                    mora = rs2.getBoolean("mora");
                    //plazo= rs2.getInt("plazo");
                }
                
                Calendar fechacorte = Calendar.getInstance();
                fechacorte.setTime(fecha_corte);


                int año_cor = fechacorte.get(Calendar.YEAR);
                int mes_cor = fechacorte.get(Calendar.MONTH)+1;
                int dia_cor = fechacorte.get(Calendar.DAY_OF_MONTH);
                
                Calendar fechaip = Calendar.getInstance();
                fechaip.setTime((Date)fecha_ip);


                int año_ip = fechaip.get(Calendar.YEAR);
                int mes_ip = fechaip.get(Calendar.MONTH)+1;
                int dia_ip = fechaip.get(Calendar.DAY_OF_MONTH);
                
                
                // calculando los letras que ya deberia tener cubiertas a la fecha de corte
                
                int año_d = año_cor - año_ip;
                año_d = año_d *12; 
                int mes_d = mes_cor - mes_ip;
                int pagos = año_d + mes_d;
                int dia_d = dia_cor - dia_ip;
                if (dia_d > 0)
                {
                    pagos=pagos+1;  // numero de letras vencidas totales
                }    
                
                if ((pagos > plazo) && (plazo != 0))
                {
                    pagos=plazo;
                
                }
                // en los vectores x y z grabo las letras que ya deberia llevar el benef
                
                ArrayList<String> x= new ArrayList<String>();
                ArrayList<String> z= new ArrayList<String>();
                Integer c=1;
                
                while (c <= pagos)
                {
                    if (c<10)
                    {
                        x.add("00"+c.toString());
                        z.add("00"+c.toString());
                    }
                    if (c>9 && c<100)
                    {
                        x.add("0"+c.toString());
                        z.add("0"+c.toString());
                    }
                    if (c>99)
                    {
                        x.add(c.toString());
                        z.add(c.toString());
                    }
                    c++;
                }
                
                // busco cuantas letras ya tiene cubiertas el benef. en mov_edoscta que no esten canceladas
                String tsql3;
                tsql3="select *  from mov_edoscta  where clave_b='"+clave_b+"' and estatus<>'"+"B"+"' and clave_mov > 0";
                rs3=st3.executeQuery(tsql3);
                
                Integer pagapl=0;
                while(rs3.next())
                {
                
                    x.set(pagapl,"000");
                    pagapl++;
                }
                
                Integer vencidos=0;
                c=0;
                String cm2=null;
                BigDecimal Tcapital= new BigDecimal(0.00);
                BigDecimal Tinteres=new BigDecimal(0.00);
                BigDecimal Tadmon=new BigDecimal(0.00);
                BigDecimal Tseguro=new BigDecimal(0.00);
                BigDecimal Toseg=new BigDecimal(0.00);
                BigDecimal Tcomisiones=new BigDecimal(0.00);
                BigDecimal Ttit=new BigDecimal(0.00);
                BigDecimal Tmora=new BigDecimal(0.00);
                
                NumberFormat format = new DecimalFormat("#,###,###.##");
                
                while (c < pagos)
                {
                    if ( x.get(c).equals("000") )
                    {
                        c++;
                    }
                    else
                    {
                        cm2= x.get(c);
                        vencidos++;
                        c++;
                        BigDecimal cero = new BigDecimal(0.00);
                        
                        Integer mletra = Integer.parseInt(cm2);
                        vencidos mvencidos = cal.calculavencidos(clave_b, mletra, plazo,c,z,fecha_corte);
                        
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        
                        fechas.add(sdf.format(mvencidos.getX0()));
                        fechas.add(mvencidos.getX1().toString());
                        fechas.add(format.format(mvencidos.getX4()));
                        fechas.add(format.format(mvencidos.getX5()));
                        fechas.add(format.format(mvencidos.getX6()));
                        fechas.add(format.format(mvencidos.getX6A()));
                        fechas.add(format.format(cero));
                        fechas.add(format.format(cero));
                        fechas.add(format.format(cero));
                        //calculando los moratorios
                        int_mor calmor = new int_mor();
                        BigDecimal morat = calmor.calculamoratorios(mvencidos.getX0(), mvencidos.getX4(), mvencidos.getX5(), mvencidos.getX6(), mvencidos.getX6A(), fecha_corte, dias_gracia, mecanica, mvencidos.getX7());
                        fechas.add(format.format(morat));
                        Tcapital=Tcapital.add(mvencidos.getX4());
                        Tinteres=Tinteres.add(mvencidos.getX5());
                        Tadmon=Tadmon.add(mvencidos.getX6());
                        Tseguro=Tseguro.add(mvencidos.getX6A());
                        Toseg=Toseg.add(cero);
                        Tcomisiones=Tcomisiones.add(cero);
                        Ttit=Ttit.add(cero);
                        Tmora=Tmora.add(morat);
                    }
                
                }
                // insertando en arraylist los totales
                fechas.add("Totales:");
                fechas.add("");
                fechas.add(format.format(Tcapital));
                fechas.add(format.format(Tinteres));
                fechas.add(format.format(Tadmon));
                fechas.add(format.format(Tseguro));
                fechas.add(format.format(Toseg));
                fechas.add(format.format(Tcomisiones));
                fechas.add(format.format(Ttit));
                fechas.add(format.format(Tmora));
                
            }
            
            
            st.close();
            cn.close();
           
        }
        catch(Exception e){e.printStackTrace();}
        return(fechas);
    }
    
    
    
    public ArrayList localizaMovCanparaJson(String clave_b)
    {
         
        ArrayList movss=null;
        Statement st;
        ResultSet rs;
        String descripcion=null;
        
        try
        {
            Connection cn=getConnection();
            st=cn.createStatement();
            movss=new ArrayList();
            
            
            
            CallableStatement proc = cn.prepareCall(" CALL sp_localizaMovCanparaJson(?,?) ");
            //se cargan los parametros de entrada
            proc.setString("clave_b", clave_b);//Tipo String
            
            // parametros de salida
            proc.registerOutParameter("descripcion", Types.VARCHAR);//Tipo decimal
            // Se ejecuta el procedimiento almacenado
            proc.execute();            
            // devuelve el valor del parametro de salida del procedimiento
            descripcion = proc.getString("descripcion");
            if (descripcion != null)
            {
                movss.add(clave_b);
                movss.add("esta");
                movss.add(descripcion);
                movss.add("");
                movss.add("");
                movss.add("");
                movss.add("");
                movss.add("");
                movss.add("");
                movss.add("");
            }
            
            st.close();
            cn.close();
           
        }
        catch(Exception e){e.printStackTrace();}
        return(movss);
    }
    
    
    public ArrayList localizaMovJurparaJson(String clave_b)
    {
         
        ArrayList jurs=null;
        Statement st;
        ResultSet rs;
        String descripcion=null;
        
        try
        {
            Connection cn=getConnection();
            st=cn.createStatement();
            jurs=new ArrayList();
            
            
            CallableStatement proc = cn.prepareCall(" CALL sp_localizaMovJurparaJson(?,?) ");
            //se cargan los parametros de entrada
            proc.setString("clave_b", clave_b);//Tipo String
            
            // parametros de salida
            proc.registerOutParameter("descripcion", Types.VARCHAR);//Tipo decimal
            // Se ejecuta el procedimiento almacenado
            proc.execute();            
            // devuelve el valor del parametro de salida del procedimiento
            descripcion = proc.getString("descripcion");
            if (descripcion != null)
            {
                jurs.add(clave_b);
                jurs.add("esta");
                jurs.add(descripcion);
                jurs.add("");
                jurs.add("");
                jurs.add("");
                jurs.add("");
                jurs.add("");
                jurs.add("");
                jurs.add("");
            }
            
            st.close();
            cn.close();
           
        }
        catch(Exception e){e.printStackTrace();}
        return(jurs);
    }
    
   
    
}
