/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Rafael Mendez
 */

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javabeans.Aperturaedoscta;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.sql.DataSource;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import javabeans.vencidos;


public class cal_29 
{
    
     public cal_29 () {
        //super();
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
    
    
    
    public vencidos calculavencidos(String clave_b,Integer letra,Integer Plazo, Integer c, ArrayList z,Date fecha_corte)
    {
         
        vencidos mvencidos=null;
        Statement st,st2;
        ResultSet rs,rs2;
        Integer contador=1;
        
        try
        {
            Connection cn=getConnection();
            st=cn.createStatement();
            st2=cn.createStatement();
            String tsql;
            tsql="select * from benef where clave_b='"+clave_b+"'";
            rs=st.executeQuery(tsql);
            mvencidos=new vencidos();
            //para cada mensaje encontrado crea un objeto
            
            String nombre=null; 
            String domicilio=null;
            Date fecha_ip=null;
            Date fecha_if=null;
            Date fcon=null;
            BigDecimal pagant=null;
            BigDecimal costo_m2=null;
            BigDecimal area=null;
            String mza=null;
            String lte=null;
            BigDecimal sub_ini=null;
            Integer plazo=null;
            
            if (rs.next())
            {
                nombre=rs.getString("nombre"); 
                domicilio=rs.getString("domicilio");
                fecha_ip=rs.getDate("fecha_ip");
                fecha_if=rs.getDate("fecha_if");
                fcon=fecha_if;
                pagant=rs.getBigDecimal("pagant");
                costo_m2=rs.getBigDecimal("costo_m2");
                area=rs.getBigDecimal("area");
                mza=rs.getString("mza");
                lte=rs.getString("lte");
                sub_ini=rs.getBigDecimal("sub_inic");
                plazo=rs.getInt("plazo");
            }
            
            String tsql2;
            String clavep=clave_b.substring(0, 6);
            tsql2="select * from cat_prog where clave='"+clavep +"'";
            rs2=st2.executeQuery(tsql2);
            
            String clave=null; 
            String descripcion=null;
            
            BigDecimal interes=null;
            BigDecimal por_ga=null;
            BigDecimal por_sv=null;
            BigDecimal por_eng=null;
            BigDecimal por_os=null;
            //Integer plazo=null;
            
            
            
            
            if (rs2.next())
            {
                clave=rs2.getString("clave"); 
                descripcion=rs2.getString("descripcion");
                
                interes=rs2.getBigDecimal("interes");
                por_ga=rs2.getBigDecimal("por_ga");
                por_sv=rs2.getBigDecimal("por_sv");
                por_eng=rs2.getBigDecimal("por_eng");
                por_os=rs2.getBigDecimal("por_os");
                //plazo=rs2.getInt("plazo");
                
            }
            
            BigDecimal w1= area.multiply(costo_m2);
            BigDecimal w2=pagant;
            
            BigDecimal w2a=((w1.subtract(sub_ini)).multiply(por_eng.divide(new BigDecimal(100))));
            BigDecimal w3= (w1.subtract(w2)).subtract(w2a);
            
            Integer x1=1;   //numero de pago
            Calendar fechaip = Calendar.getInstance();
            fechaip.setTime(fecha_ip);

            int x1a = fechaip.get(Calendar.MONTH)+1; //mes de inicio
            int x2 =  fechaip.get(Calendar.YEAR);   //año de inicio
            
            BigDecimal x3 = w3.subtract(sub_ini);     // saldo insoluto inicial
            int dias=0;
            Date bus_sal;
            
            if (letra==1)
            {
                String pago=  (String) z.get(c-1);
                fecha_v fecha_venc= new fecha_v();
                bus_sal = fecha_venc.calculafecha(fecha_corte,fecha_ip,pago);
                         
                //fecha inicio
 
                Calendar venc_actual = new GregorianCalendar();

                venc_actual.setTime(bus_sal);   //tipo date

                //fecha fin
                
                  

                Calendar fecha_vencant = new GregorianCalendar();

                fecha_vencant.setTime(fecha_if); //tipo date

                if (venc_actual.get(Calendar.YEAR) == fecha_vencant.get(Calendar.YEAR)) 
                {
                   
                    dias = venc_actual.get(Calendar.DAY_OF_YEAR) - fecha_vencant.get(Calendar.DAY_OF_YEAR);
                }
                
            }
            else
            {
            
                String pago=(String) z.get(c-1);
                fecha_v fecha_venc= new fecha_v();
                bus_sal = fecha_venc.calculafecha(fecha_corte,fecha_ip,pago);
                Date venc_act = bus_sal;    //fecha de vencimiento actual
                
                Calendar bussal = Calendar.getInstance();
                bussal.setTime((java.util.Date)bus_sal);


                int año = bussal.get(Calendar.YEAR);
                int mes = bussal.get(Calendar.MONTH)+1;
                int dia = bussal.get(Calendar.DAY_OF_MONTH);
                
                
                
                Integer mesant=null;
                Integer añoant=null;
                
                if (mes == 1)
                {
                    mesant=12;
                    añoant=año-1;
                
                }
                else
                {
                    mesant=mes-1;
                    añoant=año;
                }
                
                
                pago = (String) z.get(c-1);
                bus_sal = fecha_venc.calculafecha(fecha_corte,fecha_ip,pago);
                
                
 
                //fecha inicio
 
                Calendar venc_actual = new GregorianCalendar();

                venc_actual.setTime(venc_act);   //tipo gregoriancalendar

                //fecha fin
                
                String strFecha=String.valueOf(añoant)+"-"+String.valueOf(mesant)+"-"+String.valueOf(dia);
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                Date feven_an =df.parse(strFecha);   

                Calendar fecha_vencant = new GregorianCalendar();

                fecha_vencant.setTime(feven_an); //tipo gregoriancalendar

                if (venc_actual.get(Calendar.YEAR) == fecha_vencant.get(Calendar.YEAR)) 
                {
                   
                    dias = venc_actual.get(Calendar.DAY_OF_YEAR) - fecha_vencant.get(Calendar.DAY_OF_YEAR);
                }
                else 
                {
                    /* SI ESTAMOS EN DISTINTO AÑO COMPROBAMOS QUE EL AÑO DEL fecha_vencant NO SEA BISIESTO
                    * SI ES BISIESTO SON 366 DIAS EL AÑO, SINO SON 365
                    */
                    
                    GregorianCalendar fvenant =(GregorianCalendar) GregorianCalendar.getInstance();
                    fvenant.set(añoant,mesant,dia);
                    int diasAnyo = fvenant.isLeapYear(fvenant.get(GregorianCalendar.YEAR)) ? 366 : 365;
                    
                    GregorianCalendar fvenact =(GregorianCalendar) GregorianCalendar.getInstance();

                    fvenact.set(año,mes,dia);   //tipo gregoriancalendar
                    
                   /* CALCULAMOS EL RANGO DE AÑOS */
                    int a =fvenant.get(Calendar.YEAR);
                    int b=fvenact.get(Calendar.YEAR);
                    int rangoAnyos= b - a;
                    
                    /* CALCULAMOS EL RANGO DE DIAS QUE HAY */
                    int  diaañoact = fvenact.get(GregorianCalendar.DAY_OF_YEAR)  ;
                    int  diaañoant = fvenant.get(GregorianCalendar.DAY_OF_YEAR)  ;
                    int r = diaañoact - diaañoant;
                    dias = (rangoAnyos * diasAnyo)+r;
                    int x=0;
                }
            }
            
            BigDecimal d = BigDecimal.valueOf(dias);
            BigDecimal diasano = new BigDecimal(360);
            
            BigDecimal mplazo = new BigDecimal(plazo);
            BigDecimal pc=x3.divide(mplazo,BigDecimal.ROUND_FLOOR);
            
            BigDecimal x4= round(pc,2,true);  //pago a capital
            BigDecimal ULT=x4;
            BigDecimal x5 = round((((x3.multiply(interes.divide(new BigDecimal(100))))).divide(diasano,BigDecimal.ROUND_FLOOR)).multiply(d),2,true);   //pago a interes
            BigDecimal x6 = round((x3.multiply(por_sv.divide(new BigDecimal(100)))).divide(new BigDecimal(12)),2,true);   //pago a seguro de vida
            BigDecimal x6a= round((((x4.add(x5)).add(x6)).multiply(por_ga.divide(new BigDecimal(100)))),2,true); //pago a gastos. admon.
            BigDecimal x7= round((((x4.add(x5)).add(x6)).add(x6a)),2,true); // total mensual
            
            if (letra == x1)
            {
                mvencidos.setX0(bus_sal);
                mvencidos.setX1(x1);
                mvencidos.setX1A(x1a);
                mvencidos.setX2(x2);
                mvencidos.setX3(x3);
                mvencidos.setX3(x3);
                mvencidos.setX4(x4);
                mvencidos.setX5(x5);
                mvencidos.setX6(x6);
                mvencidos.setX6A(x6a);
                mvencidos.setX7(x7);
            
            }
            
            
            String salir="N";
            while (salir.equals("N"))
            {
                contador++;
                x1++;
                x1a++;
                if (x1a >12)
                {
                    x1a=1;
                    x2++;
                }    
                x3=round((x3.subtract(x4)),2,true); // resto saldo insoluto - pago a capital
                x5 = round((((x3.multiply(interes.divide(new BigDecimal(100))))).divide(diasano,BigDecimal.ROUND_FLOOR)).multiply(d),2,true);   //pago a interes
                
                if (x1==plazo)
                {
                    x4=ULT;
                    x5 = round((((x3.multiply(interes.divide(new BigDecimal(100))))).divide(diasano,BigDecimal.ROUND_FLOOR)).multiply(d),2,true);   //pago a interes
                    x6 = round((x3.multiply(por_sv.divide(new BigDecimal(100)))).divide(new BigDecimal(12)),2,true);   //pago a seguro de vida
                    x6a= round((((x4.add(x5)).add(x6)).multiply(por_ga.divide(new BigDecimal(100)))),2,true); //pago a gastos. admon.
                    x7= round((((x4.add(x5)).add(x6)).add(x6a)),2,true); // total mensual
                    
                    salir="S";
                    if (letra==x1)
                    {
                        mvencidos.setX0(bus_sal);
                        mvencidos.setX1(x1);   //numero de pago o letra
                        mvencidos.setX1A(x1a);  //mes
                        mvencidos.setX2(x2);    //año
                        mvencidos.setX3(x3);    //saldo insoluto
                        mvencidos.setX4(x4);    //pago a capital
                        mvencidos.setX5(x5);    //pago a interes
                        mvencidos.setX6(x6);    //pago a seguro de vida
                        mvencidos.setX6A(x6a);  //pago a gtos. de admon.
                        mvencidos.setX7(x7);    //total mensual
                        salir="S";
                    
                    }
                   
                }
                
                x5 = round((((x3.multiply(interes.divide(new BigDecimal(100))))).divide(diasano,BigDecimal.ROUND_FLOOR)).multiply(d),2,true);   //pago a interes
                x6 = round((x3.multiply(por_sv.divide(new BigDecimal(100)))).divide(new BigDecimal(12)),2,true);   //pago a seguro de vida
                x6a= round((((x4.add(x5)).add(x6)).multiply(por_ga.divide(new BigDecimal(100)))),2,true); //pago a gastos. admon.
                x7= round((((x4.add(x5)).add(x6)).add(x6a)),2,true); // total mensual
                if (letra==x1)
                {
                    mvencidos.setX0(bus_sal);
                    mvencidos.setX1(x1);   //numero de pago o letra
                    mvencidos.setX1A(x1a);  //mes
                    mvencidos.setX2(x2);    //año
                    mvencidos.setX3(x3);    //saldo insoluto
                    mvencidos.setX4(x4);    //pago a capital
                    mvencidos.setX5(x5);    //pago a interes
                    mvencidos.setX6(x6);    //pago a seguro de vida
                    mvencidos.setX6A(x6a);  //pago a gtos. de admon.
                    mvencidos.setX7(x7);    //total mensual
                    salir="S";
                }
                
            }
            
            st.close();
            cn.close();
           
        }
        catch(Exception e)
        { 
             e.printStackTrace();
        }
        return(mvencidos);
    }
    
    
    
    /*
    public Aperturaedoscta localizaAperturaedoscta(Integer mid_candidato)
    {
         
        Aperturaedoscta maperturaedoscta=null;
        Statement st;
        ResultSet rs;
        
        
        try
        {
            Connection cn=getConnection();
            st=cn.createStatement();
            String tsql;
            tsql="select c.id_candidato,c.id_catprog,c.numcontrato,c.clave_elect,c.curp,c.rfc,c.nombre,c.conyuge,c.fecha_cont,p.descripcion,c.mza,c.lte,c.area,c.domicilio,c.clave_cat,c.fecha_ip,c.capital,c.sub_inic,c.enganche,c.interes,c.admon,c.o_seg,c.sub_inf,c.por_eng,c.seguro,c.pagant,c.plazo,c.pago_mes,c.adm_seg,c.costo_m2,c.engacubrir,c.fecha_if,poliza,fecha_pol,clave_b from candidatos c left outer join cat_prog p on c.id_catprog=p.id_catprog where c.id_candidato="+mid_candidato.toString();
            rs=st.executeQuery(tsql);
            //clavemovs=new ArrayList();
            //para cada mensaje encontrado crea un objeto
            //Mensaje y lo añade a la colección ArrayList
            if(rs.next())
            {
                 
                maperturaedoscta=new Aperturaedoscta(rs.getInt("id_candidato"),rs.getInt("id_catprog"),rs.getString("numcontrato"),rs.getString("clave_elect"),rs.getString("curp"),rs.getString("rfc"),rs.getString("nombre"),rs.getString("conyuge"),rs.getDate("fecha_cont"),rs.getString("descripcion"),rs.getString("mza"),rs.getString("lte"),rs.getBigDecimal("area"),rs.getString("domicilio"),rs.getString("clave_cat"),rs.getDate("fecha_ip"),rs.getBigDecimal("capital"),rs.getBigDecimal("sub_inic"),rs.getBigDecimal("enganche"),rs.getBigDecimal("interes"),rs.getBigDecimal("admon"),rs.getBigDecimal("o_seg"),rs.getBigDecimal("sub_inf"),rs.getBigDecimal("por_eng"),rs.getBigDecimal("seguro"),rs.getBigDecimal("pagant"),rs.getInt("plazo"),rs.getBigDecimal("pago_mes"),rs.getBigDecimal("adm_seg"),rs.getBigDecimal("costo_m2"),rs.getBigDecimal("engacubrir"),rs.getDate("fecha_if"),rs.getString("poliza"),rs.getDate("fecha_pol"),rs.getString("clave_b"));
                //clavemovs.add(mclavemov);
            }
            st.close();
            cn.close();
           
        }
        catch(Exception e){}
        return(maperturaedoscta);
    }
    
    */
    
    public static BigDecimal round(BigDecimal d, int scale, boolean roundUp) 
    {
        int mode = (roundUp) ? BigDecimal.ROUND_UP : BigDecimal.ROUND_DOWN;
        return d.setScale(scale, mode);
    }
     
    
}
