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
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import javabeans.Cpp;
import javabeans.vencidos;


public class int_mor 
{
    
     public int_mor () {
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
    
    
    
    public BigDecimal calculamoratorios(Date bus_sal,BigDecimal x4, BigDecimal x3, BigDecimal x6a, BigDecimal x6, Date fecha_cor, Integer dias_gracia, Integer mecanica, BigDecimal totalmensual)
    {         
        BigDecimal morat= new BigDecimal(0);
        ArrayList cpps=null;
        Statement st;
        ResultSet rs;
        
        try
        {
            Connection cn=getConnection();
            st=cn.createStatement();
            String tsql;
            tsql="select * from cpp order by fecha ";
            rs=st.executeQuery(tsql);
            cpps=new ArrayList();
            //para cada mensaje encontrado crea un objeto
            //Mensaje y lo añade a la colección ArrayList
            while(rs.next())
            {
                 
                Cpp mcpp=new Cpp(rs.getDate("fecha"),rs.getBigDecimal("importe"),rs.getInt("id_cpp"));
                cpps.add(mcpp);
            }
            
            
           // Collections.sort(cpps,Collections.reverseOrder());
            
            Date fecha=null;
            BigDecimal importe=null;
            Iterator<Cpp> iterator = cpps.iterator();
            while(iterator.hasNext())
            {
                Cpp cpp=iterator.next();
                fecha=cpp.getFecha();
                
                
                if(bus_sal.compareTo(fecha)>0)
                {
                    importe = (BigDecimal)cpp.getImporte();
                }
                else
                {
                    break;
                }
                
            }
            
            
            Calendar c =new GregorianCalendar();
            c.setTime(bus_sal);
            c.add(Calendar.DATE, dias_gracia);
            Date d=c.getTime();
            
            if (d.compareTo(fecha_cor)>0 || d.compareTo(fecha_cor)==0)
            {
                morat=morat;
            }
            else
            {
                if (mecanica!=35)  //cuando es una anualidad
                {
                    if(mecanica == 17)
                    {
                        // aqui va cuando es una 
                    }
                    else
                    {
                        /*
                        final long MILLSECS_PER_DAY = 24 * 60 * 60 * 1000;
                        long dias=( fecha_cor.getTime() - bus_sal.getTime() )/ MILLSECS_PER_DAY;
                        BigDecimal diastrans = new BigDecimal(dias);*/
                        
                        
                        int dias=0;
                        //fecha inicio
 
                        Calendar venc_actual = new GregorianCalendar();

                        venc_actual.setTime(fecha_cor);   //tipo gregoriancalendar
                        int año = venc_actual.get(Calendar.YEAR);
                        int mes = venc_actual.get(Calendar.MONTH)+1;
                        int dia = venc_actual.get(Calendar.DAY_OF_MONTH);

                        //fecha fin

                        //String strFecha=String.valueOf(añoant)+"-"+String.valueOf(mesant)+"-"+String.valueOf(dia);
                        //DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                        //Date feven_an =df.parse(strFecha);   

                        Calendar fecha_vencant = new GregorianCalendar();

                        fecha_vencant.setTime(bus_sal); //tipo gregoriancalendar
                        int añoant = fecha_vencant.get(Calendar.YEAR);
                        int mesant = fecha_vencant.get(Calendar.MONTH)+1;
                        int diaant = fecha_vencant.get(Calendar.DAY_OF_MONTH);

                        if (venc_actual.get(Calendar.YEAR) == fecha_vencant.get(Calendar.YEAR)) 
                        {

                            dias = venc_actual.get(Calendar.DAY_OF_YEAR) - fecha_vencant.get(Calendar.DAY_OF_YEAR);
                            BigDecimal diastrans = new BigDecimal(dias);
                            
                            //morat = round((((((diastrans.multiply(importe)).divide(new BigDecimal(360),BigDecimal.ROUND_FLOOR)).divide(new BigDecimal(100),BigDecimal.ROUND_FLOOR)).multiply(totalmensual)).multiply(new BigDecimal(1.1))),2,true);
                            BigDecimal r1= (new BigDecimal(1.1).multiply(importe)).divide(new BigDecimal(100),BigDecimal.ROUND_FLOOR);
                            BigDecimal r2 =r1.multiply(totalmensual);
                            BigDecimal r3 = r2.divide(new BigDecimal(360),BigDecimal.ROUND_FLOOR);
                            BigDecimal r4=r3.multiply(diastrans);
                            morat = round(r4,2,true);
                        }
                        else 
                        {
                            /* SI ESTAMOS EN DISTINTO AÑO COMPROBAMOS QUE EL AÑO DEL fecha_vencant NO SEA BISIESTO
                            * SI ES BISIESTO SON 366 DIAS EL AÑO, SINO SON 365
                            */

                            GregorianCalendar fvenant =(GregorianCalendar) GregorianCalendar.getInstance();
                            fvenant.set(añoant,mesant,diaant);
                            int diasAnyo = fvenant.isLeapYear(fecha_vencant.get(GregorianCalendar.YEAR)) ? 366 : 365;

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
                            
                            BigDecimal diastrans = new BigDecimal(dias);
                            //morat = round((((((diastrans.multiply(importe)).divide(new BigDecimal(360),BigDecimal.ROUND_FLOOR)).divide(new BigDecimal(100),BigDecimal.ROUND_FLOOR)).multiply(totalmensual)).multiply(new BigDecimal(1.1))),2,true);
                            
                            BigDecimal r1= (new BigDecimal(1.1).multiply(importe)).divide(new BigDecimal(100),BigDecimal.ROUND_FLOOR);
                            BigDecimal r2 =r1.multiply(totalmensual);
                            BigDecimal r3 = r2.divide(new BigDecimal(360),BigDecimal.ROUND_FLOOR);
                            BigDecimal r4=r3.multiply(diastrans);
                            morat = round(r4,2,true);
                        }
                        
                        
                        
                    
                    }
                    
                    
                }
                else
                {
                
                
                }
            }
            
        
        }
        catch(Exception e)
        { 
             e.printStackTrace();
        }
        return(morat);
    }
    
    
    
        
    public static BigDecimal round(BigDecimal d, int scale, boolean roundUp) 
    {
        int mode = (roundUp) ? BigDecimal.ROUND_UP : BigDecimal.ROUND_DOWN;
        return d.setScale(scale, mode);
    }
     
    
}
