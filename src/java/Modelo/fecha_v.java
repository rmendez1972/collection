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
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import javabeans.vencidos;


public class fecha_v 
{
    
     public fecha_v () {
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
    
    
    
    public Date calculafecha(Date fecha_corte, Date fecha_ip, String pago) throws ParseException
    {
         
        Calendar fechaip = Calendar.getInstance();
        fechaip.setTime((java.util.Date)fecha_ip);


        int año_i = fechaip.get(Calendar.YEAR);
        int mes_i = fechaip.get(Calendar.MONTH)+1;
        int dia_i = fechaip.get(Calendar.DAY_OF_MONTH);
        
        Calendar fechacor = Calendar.getInstance();
        fechacor.setTime((java.util.Date)fecha_corte);


        int año_f = fechacor.get(Calendar.YEAR);
        int mes_f = fechacor.get(Calendar.MONTH)+1;
        int dia_F = fechacor.get(Calendar.DAY_OF_MONTH);
        
        Integer cm=Integer.parseInt(pago);
        cm=(mes_i+cm)-1;
        Integer ca=año_i;
        Boolean bandera=true;
        
        while (bandera==true)
        {
            cm=cm-12;
            if (cm <=0)
            {
                cm=cm+12;
                break;
            }
            ca=ca+1;
        }
        
        String Parte1 = String.valueOf(dia_i);
        if (dia_i < 10)
        {
            Parte1="0"+String.valueOf(dia_i);
        }
        
        String Parte2 = String.valueOf(cm);
        if (cm < 10)
        {
            Parte2="0"+String.valueOf(cm);
        }
        
        if ((Parte2.equals("04") || Parte2.equals("06") || Parte2.equals("09") || Parte2.equals("11")) && Parte1.equals("31"))
        {
           Parte1="30";
        }
        
        if (Parte2.equals("02") && Integer.parseInt(Parte1) > 28 && ca!=2000 && ca!=2004 && ca!=2008 && ca!=2012 && ca!=2016 && ca!=2020)
        {
           Parte1="28";
        }
        
        if (Parte2.equals("02") && Integer.parseInt(Parte1) > 29 && ca==2000 && ca==2004 && ca==2008 && ca==2012 && ca==2016 && ca==2020)
        {
           Parte1="29";
        }
        
        String strFecha=String.valueOf(ca)+"-"+Parte2+"-"+Parte1;
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date bus_sal =df.parse(strFecha);
        
        return(bus_sal);
    }
    
    
}
