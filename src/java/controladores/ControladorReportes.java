/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionRequisito;
import Modelo.GestionGrupo;
import Modelo.GestionSeguimiento;
import Modelo.GestionSexo;
import Modelo.GestionSolicitante;
import Modelo.GestionSolicitud;
import Modelo.GestionStatus;
import Modelo.GestionTramite;
import Modelo.GestionUnidadAdministrativa;
import Modelo.conectaMysql;
import Modelo.mail;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.Map;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javabeans.Requisito;
import javabeans.Seguimiento;
import javabeans.Sexo;
import javabeans.Solicitud;
import javabeans.Solicitante;
import javabeans.Status;
import javabeans.Tramite;
import javabeans.UnidadAdministrativa;
import javabeans.Usuario;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;



/**
 *
 * @author rmendez1972
 */
/*
@WebServlet(name = "ControladorReportes", urlPatterns = {"/controladorreportes"})
public class ControladorReportes extends HttpServlet 
{
    public Connection cn;
    
        
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //almacena la operacion que debe gestionar el controlador
        String operacion=request.getParameter("operacion");
        
        if(operacion.equals("frm_reportesolicitudes"))
        {
            GestionUnidadAdministrativa oper1=new GestionUnidadAdministrativa();
            ArrayList ua=oper1.obtenerTodos();
            
            GestionStatus gstatus = new GestionStatus();
            ArrayList status = gstatus.obtenerTodos();
            
            request.setAttribute("ua",ua);
            request.setAttribute("status",status);         
            RequestDispatcher rd=request.getRequestDispatcher("frm_reportesolicitudes.jsp");
            rd.forward(request,response);
        }
        
         if(operacion.equals("frm_reporteseguimientos"))
        {
            GestionUnidadAdministrativa oper1=new GestionUnidadAdministrativa();
            ArrayList ua=oper1.obtenerTodos();
            
            GestionStatus gstatus = new GestionStatus();
            ArrayList status = gstatus.obtenerTodos();
            
            GestionSolicitud soli=new GestionSolicitud();
            ArrayList sol=soli.obtenerSolicitudes();
            
            request.setAttribute("ua",ua);
            request.setAttribute("status",status);
            request.setAttribute("sol",sol);
            RequestDispatcher rd=request.getRequestDispatcher("frm_reporteseguimientos.jsp");
            rd.forward(request,response);
        }
        
         
         if(operacion.equals("frm_reporteadjuntos"))
        {
            GestionUnidadAdministrativa oper1=new GestionUnidadAdministrativa();
            ArrayList ua=oper1.obtenerTodos();
            
            GestionStatus gstatus = new GestionStatus();
            ArrayList status = gstatus.obtenerTodos();
            
            GestionSolicitud soli=new GestionSolicitud();
            ArrayList sol=soli.obtenerSolicitudes();
            
            request.setAttribute("ua",ua);
            request.setAttribute("status",status);
            request.setAttribute("sol",sol);
            RequestDispatcher rd=request.getRequestDispatcher("frm_reporteadjuntos.jsp");
            rd.forward(request,response);
        } 
         
        if(operacion.equals("frm_reporteusuarios"))
        {
            GestionUnidadAdministrativa oper1=new GestionUnidadAdministrativa();
            ArrayList ua=oper1.obtenerTodos();
            
            GestionGrupo gpo=new GestionGrupo();
            ArrayList gp=gpo.obtenerTodos();
                                   
            request.setAttribute("ua",ua);
            request.setAttribute("gp",gp);
            RequestDispatcher rd=request.getRequestDispatcher("frm_reporteusuarios.jsp");
            rd.forward(request,response);
        }
         
        if(operacion.equals("frm_reportetramites"))
        {
            GestionUnidadAdministrativa oper1=new GestionUnidadAdministrativa();
            ArrayList ua=oper1.obtenerTodos();
            
                        
            request.setAttribute("ua",ua);
            RequestDispatcher rd=request.getRequestDispatcher("frm_reportetramites.jsp");
            rd.forward(request,response);
        }
          
         
         
         if(operacion.equals("solicitudes"))
        {
            //Usuario usuario;
            //HttpSession objSession = request.getSession(); 
            //usuario = (Usuario)(objSession.getAttribute("usuario")); 
            Integer id_status,id_unidadadministrativa,id_tramite;
            //Integer id_grupo=usuario.getId_grupo();
            //Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            try {
                 cn=conectaMysql.getConnection();
            } catch (SQLException ex) {
                Logger.getLogger(ControladorReportes.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            //recuperando parametros del reporte multipart
            
            String mid_status,mid_unidadadministrativa,mid_tramite=null;
            mid_status  = request.getParameter("id_status");
            id_status=Integer.parseInt(mid_status);
            mid_unidadadministrativa  = request.getParameter("id_unidadadministrativa");
            id_unidadadministrativa=Integer.parseInt(mid_unidadadministrativa);
            mid_tramite  = request.getParameter("id_tramite");
            id_tramite=Integer.parseInt(mid_tramite);
            
            SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
            Date fecha_inicial,fecha_final = null;
            try {
                fecha_inicial = sdf.parse(request.getParameter("fecha_inicial"));
            } catch (ParseException ex) {
                Logger.getLogger(ControladorReportes.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                fecha_final = sdf.parse(request.getParameter("fecha_final"));
            } catch (ParseException ex) {
                Logger.getLogger(ControladorReportes.class.getName()).log(Level.SEVERE, null, ex);
            }
                       
            ServletOutputStream servletOutputStream = response.getOutputStream();
            File reportFile=null;
            reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/ReporteSolicitudesParam.jasper"));
            
            
            try
            {
                
                Map param = new HashMap(); //inicializo un objeto HashMap variable,valor
                //param.put("id_delegacion", id_delegacion);
                //param.put("id_mecanica", id_mecanica);
                if (id_status==0 && id_unidadadministrativa==0){
                
                    param.put("sql","where DATE(S.fecha_ingreso) between '"+request.getParameter("fecha_inicial")+"' and '"+request.getParameter("fecha_final")+"'");
                }
                
                if (id_status!=0 && id_unidadadministrativa==0){
                   
                    param.put("sql","where DATE(S.fecha_ingreso) between '"+request.getParameter("fecha_inicial")+"' and '"+request.getParameter("fecha_final")+"' AND ST.id_status='"+id_status.toString()+"'");
                }
                
                if (id_status==0 && id_unidadadministrativa!=0){
                    
                    param.put("sql","where UA.id_unidadadministrativa='"+id_unidadadministrativa.toString()+"' and DATE(S.fecha_ingreso) between '"+request.getParameter("fecha_inicial")+"' AND '"+request.getParameter("fecha_final")+"'");
                }
                if (id_status!=0 && id_unidadadministrativa!=0){
                    
                    param.put("sql","where ST.id_status='"+id_status.toString()+"' and UA.id_unidadadministrativa='"+id_unidadadministrativa.toString()+"' and DATE(S.fecha_ingreso) between '"+request.getParameter("fecha_inicial")+"' AND '"+request.getParameter("fecha_final")+"'");
                }
                
                if (id_status==0 && id_unidadadministrativa!=0 && id_tramite!=0){
                    
                    param.put("sql","where UA.id_unidadadministrativa='"+id_unidadadministrativa.toString()+"' and T.id_tramite='"+id_tramite.toString()+"' and DATE(S.fecha_ingreso) between '"+request.getParameter("fecha_inicial")+"' AND '"+request.getParameter("fecha_final")+"'");
                }
                
                byte[] bytes = null;
                //bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),new HashMap(), new JREmptyDataSource());
                //bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),new HashMap(), cn);
                bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),param, cn);  //el segundo parametro es un hashmap para el paso de parametros al jasperreport
                response.setContentType("application/pdf");
                
                response.setContentLength(bytes.length);
                servletOutputStream.write(bytes, 0, bytes.length);
                
                servletOutputStream.flush();
                servletOutputStream.close();
            }
            catch (JRException e)
            {
                // display stack trace in the browser
                StringWriter stringWriter = new StringWriter();
                PrintWriter printWriter = new PrintWriter(stringWriter);
                e.printStackTrace(printWriter);
                response.setContentType("text/plain");
                response.getOutputStream().print(stringWriter.toString());
            } 
        
         
         
        }
         
    
        if(operacion.equals("usuarios"))
        {
            
            Integer id_unidadadministrativa=0;
            Integer id_grupo=0;
            
            try {
                 cn=conectaMysql.getConnection();
            } catch (SQLException ex) {
                Logger.getLogger(ControladorReportes.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            //recuperando parametros del reporte multipart
            
            
            String mid_grupo  = request.getParameter("id_grupo");
            String mid_unidadadministrativa  = request.getParameter("id_unidadadministrativa");
            
            
            if (mid_grupo!="" && mid_unidadadministrativa!="")
            {
                id_grupo=Integer.parseInt(mid_grupo);
                id_unidadadministrativa=Integer.parseInt(mid_unidadadministrativa);
            }
            
            if (mid_grupo=="" && mid_unidadadministrativa!="")
            {
                
                id_unidadadministrativa=Integer.parseInt(mid_unidadadministrativa);
                
            }
            
            if (mid_grupo=="" && mid_unidadadministrativa=="")
            {
                
                
            }
            
            ServletOutputStream servletOutputStream = response.getOutputStream();
            File reportFile=null;
            reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/ReporteUsuariosParam.jasper"));
            
            
            try
            {
                
                Map param = new HashMap(); //inicializo un objeto HashMap variable,valor
                //param.put("id_delegacion", id_delegacion);
                //param.put("id_mecanica", id_mecanica);
                
                if (mid_grupo!="" && mid_unidadadministrativa!="")
                {
                    param.put("sql","where U.id_unidadadministrativa='"+id_unidadadministrativa.toString()+"' and U.id_grupo='"+id_grupo+"'");
                    
                }
                if (mid_grupo=="" && mid_unidadadministrativa!="")
                {
                    param.put("sql","where U.id_unidadadministrativa='"+id_unidadadministrativa.toString()+"'");
                    
                }
                
                if (mid_grupo=="" && mid_unidadadministrativa=="")
                {
                    param.put("sql","");
                
                }
                
                byte[] bytes = null;
                //bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),new HashMap(), new JREmptyDataSource());
                //bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),new HashMap(), cn);
                bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),param, cn);  //el segundo parametro es un hashmap para el paso de parametros al jasperreport
                response.setContentType("application/pdf");
                
                response.setContentLength(bytes.length);
                servletOutputStream.write(bytes, 0, bytes.length);
                
                servletOutputStream.flush();
                servletOutputStream.close();
            }
            catch (JRException e)
            {
                // display stack trace in the browser
                StringWriter stringWriter = new StringWriter();
                PrintWriter printWriter = new PrintWriter(stringWriter);
                e.printStackTrace(printWriter);
                response.setContentType("text/plain");
                response.getOutputStream().print(stringWriter.toString());
            } 
        
         
         

        }
        
        
        
        if(operacion.equals("tramites"))
        {
            
            Integer id_unidadadministrativa=0;
            Integer id_direccion=0;
            
            try {
                 cn=conectaMysql.getConnection();
            } catch (SQLException ex) {
                Logger.getLogger(ControladorReportes.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            //recuperando parametros del reporte multipart
            
            
            String mid_direccion  = request.getParameter("id_direccion");
            String mid_unidadadministrativa  = request.getParameter("id_unidadadministrativa");
            
            
            if (mid_direccion!="" && mid_unidadadministrativa!="")
            {
                id_direccion=Integer.parseInt(mid_direccion);
                id_unidadadministrativa=Integer.parseInt(mid_unidadadministrativa);
            }
            
            if (mid_direccion=="" && mid_unidadadministrativa!="")
            {
                
                id_unidadadministrativa=Integer.parseInt(mid_unidadadministrativa);
                
            }
            
            if (mid_direccion=="" && mid_unidadadministrativa=="")
            {
                
                
            }
            
            ServletOutputStream servletOutputStream = response.getOutputStream();
            File reportFile=null;
            reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/ReporteTramitesParam.jasper"));
            
            try
            {
                
                Map param = new HashMap(); //inicializo un objeto HashMap variable,valor

                                
                if (mid_direccion!="" && mid_unidadadministrativa!="")
                {
                    param.put("sql","where UA.id_unidadadministrativa='"+id_unidadadministrativa.toString()+"' and D.id_direccion='"+id_direccion.toString()+"'");
                    
                }
                if (mid_direccion=="" && mid_unidadadministrativa!="")
                {
                    param.put("sql","where UA.id_unidadadministrativa='"+id_unidadadministrativa.toString()+"'");
                    
                }
                
                if (mid_direccion=="" && mid_unidadadministrativa=="")
                {
                    param.put("sql","");
                
                }
                
                byte[] bytes = null;

                
                
                //bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),new HashMap(), new JREmptyDataSource());
                //bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),new HashMap(), cn);

                bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),param, cn);  //el segundo parametro es un hashmap para el paso de parametros al jasperreport
                response.setContentType("application/pdf");
                
                response.setContentLength(bytes.length);
                servletOutputStream.write(bytes, 0, bytes.length);
                
                servletOutputStream.flush();
                servletOutputStream.close();
            }
            catch (JRException e)
            {
                // display stack trace in the browser
                StringWriter stringWriter = new StringWriter();
                PrintWriter printWriter = new PrintWriter(stringWriter);
                e.printStackTrace(printWriter);
                response.setContentType("text/plain");
                response.getOutputStream().print(stringWriter.toString());
            } 
            
        } 
        
        if(operacion.equals("imprimirseguimientos"))
        {
            Usuario usuario;
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            Integer id_solicitud;
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            String midsolicitud;   
            midsolicitud = request.getParameter("id_solicitud");  
            id_solicitud=Integer.parseInt(midsolicitud);
            
            /*SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
            Date fecha_inicial,fecha_final = null;
            try {
                fecha_inicial = sdf.parse(request.getParameter("fecha_inicial"));
                } catch (ParseException ex) {
                Logger.getLogger(ControladorReportes.class.getName()).log(Level.SEVERE, null, ex);
                }
            try {
                fecha_final = sdf.parse(request.getParameter("fecha_final"));
            } catch (ParseException ex) {
                Logger.getLogger(ControladorReportes.class.getName()).log(Level.SEVERE, null, ex);
            }*/
            /*
            try {
                 cn=conectaMysql.getConnection();
            } catch (SQLException ex) {
                Logger.getLogger(ControladorRegistro.class.getName()).log(Level.SEVERE, null, ex);
            }
            
                       
            ServletOutputStream servletOutputStream = response.getOutputStream();
            File reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/ReporteSeguimientos.jasper"));
            
            try {
                
                Map param = new HashMap(); //inicializo un objeto HashMap variable,valor
                
               // if (id_grupo==1)
               // {    
               //     param.put("sql","");
               // }else
               // {
                    param.put("sql","where O.id_solicitud='"+id_solicitud+"'");
                    
                //}
                byte[] bytes = null;
                //bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),new HashMap(), new JREmptyDataSource());
                //bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),new HashMap(), cn);
                bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),param, cn);  //el segundo parametro es un hashmap para el paso de parametros al jasperreport
                response.setContentType("application/pdf");
                
                response.setContentLength(bytes.length);
                servletOutputStream.write(bytes, 0, bytes.length);
                
                servletOutputStream.flush();
                servletOutputStream.close();
            }
            catch (JRException e)
            {
                // display stack trace in the browser
                StringWriter stringWriter = new StringWriter();
                PrintWriter printWriter = new PrintWriter(stringWriter);
                e.printStackTrace(printWriter);
                response.setContentType("text/plain");
                response.getOutputStream().print(stringWriter.toString());
            } 

        }
        
        
        if(operacion.equals("imprimiradjuntos"))
        {
            Usuario usuario;
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            Integer id_solicitud;
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            Integer id_seguimiento;
            
            //String midsolicitud;   
            //midsolicitud = request.getParameter("id_solicitud");  
            //id_solicitud=Integer.parseInt(midsolicitud);
            
            String midseguimiento;   
            midseguimiento = request.getParameter("id_seguimiento");  
            id_seguimiento=Integer.parseInt(midseguimiento);
            
            /*SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
            Date fecha_inicial,fecha_final = null;
            try {
                fecha_inicial = sdf.parse(request.getParameter("fecha_inicial"));
                } catch (ParseException ex) {
                Logger.getLogger(ControladorReportes.class.getName()).log(Level.SEVERE, null, ex);
                }
            try {
                fecha_final = sdf.parse(request.getParameter("fecha_final"));
            } catch (ParseException ex) {
                Logger.getLogger(ControladorReportes.class.getName()).log(Level.SEVERE, null, ex);
            }*/
            /*
            try {
                 cn=conectaMysql.getConnection();
            } catch (SQLException ex) {
                Logger.getLogger(ControladorRegistro.class.getName()).log(Level.SEVERE, null, ex);
            }
            
                       
            ServletOutputStream servletOutputStream = response.getOutputStream();
            File reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/ReporteAdjuntos.jasper"));
            
            try {
                
                Map param = new HashMap(); //inicializo un objeto HashMap variable,valor
                
               // if (id_grupo==1)
               // {    
               //     param.put("sql","");
               // }else
               // {
                    param.put("sql","where AD.id_seguimiento='"+id_seguimiento+"'");
                    
                //}
                byte[] bytes = null;
                //bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),new HashMap(), new JREmptyDataSource());
                //bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),new HashMap(), cn);
                bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),param, cn);  //el segundo parametro es un hashmap para el paso de parametros al jasperreport
                response.setContentType("application/pdf");
                
                response.setContentLength(bytes.length);
                servletOutputStream.write(bytes, 0, bytes.length);
                
                servletOutputStream.flush();
                servletOutputStream.close();
            }
            catch (JRException e)
            {
                // display stack trace in the browser
                StringWriter stringWriter = new StringWriter();
                PrintWriter printWriter = new PrintWriter(stringWriter);
                e.printStackTrace(printWriter);
                response.setContentType("text/plain");
                response.getOutputStream().print(stringWriter.toString());
            } 

        }

    }

         
         
   
   
}
*/