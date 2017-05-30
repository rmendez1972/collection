/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionAdjunto;
import control.Tools;
import Modelo.GestionSeguimiento;
import Modelo.GestionSexo;
import Modelo.GestionSolicitante;
import Modelo.GestionSolicitud;
import Modelo.GestionStatus;
import Modelo.GestionTramite;
import Modelo.GestionUnidadAdministrativa;
import Modelo.conectaMysql;
import Modelo.mail;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
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
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ControladorSeguimiento", urlPatterns = {"/controladorseguimiento"})
@MultipartConfig
public class ControladorSeguimiento extends HttpServlet 
{
    
    public Connection cn;
    
    private String getFileName(Part part) 
    {

        String partHeader = part.getHeader("content-disposition");

        //logger.info(“Part Header = ” + partHeader);

        for (String cd : part.getHeader("content-disposition").split(";")) 
        {

            if (cd.trim().startsWith("filename")) 
            {

                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                
            }

        }

        return null;

    }

    private Boolean subirAdjunto(Part p1)
    {
        String filename = getFileName(p1);
        if (!filename.isEmpty())
        {    
            // en caso de querer escupir en un PrintWriter
            //response.setContentType("text/html;charset=UTF-8");
            //PrintWriter out = response.getWriter();
            try {
                            
                InputStream is = p1.getInputStream();
                // ruta relativa a donde subo el archivo adjunto
                String outputfile = this.getServletContext().getRealPath("/adjuntos/"+filename);  // get path on the server
                FileOutputStream os = new FileOutputStream (outputfile);
            
                // lee bytes del archivo q esta como inputstream
                int ch = is.read();
                while (ch != -1)  //-1 significa q se alcalzó el final del stream
                {
                    os.write(ch);    //grabo el archivo como un outputstream
                    ch = is.read(); //lee de nuevo el stream de entrada
                }
                os.close();  //dejo de grabar al archivo en disco duro
                //out.println("<h3>Archivo adjunto subido exitosamente!</h3><a href='controladorseguimiento?operacion=listar&id_solicitud=48' ><img src='imagenes/listar.png' class='btn-tabla'  alt='Listar'  title='listar seguimientos de la solicitud'/></a>");
            }
            catch(Exception ex) {
                //out.println("Exception -->" + ex.getMessage());
                return false;
            }
            finally { 
                //out.close();
            }
            return true;
        }
        return false;
    
    }        
        
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //almacena la operacion que debe gestionar el controlador
        String operacion=request.getParameter("operacion");
         
       
         if(operacion.equals("capturar"))
        {
            Solicitud solicitud;
            Solicitante solicitante;
            UnidadAdministrativa uatramite;
            ArrayList ua,tm,tramites,sexo,status = null;
            Tramite tramite;
            Usuario usuario;
                                   
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            
            String midsolicitud;   
            midsolicitud = request.getParameter("id_solicitud");  
            Integer id_solicitud,id_solicitante,id_tramite,id_unidadaministrativa,id_unidadadministrativatramite;
            id_solicitud=Integer.parseInt(midsolicitud);
          
            GestionSolicitud oper1=new GestionSolicitud(); 
            solicitud = oper1.obtenerPorId(id_solicitud); 
          
            id_solicitante=solicitud.getId_solicitante();
            id_tramite=solicitud.getId_tramite();
          
            GestionSolicitante oper2=new GestionSolicitante(); 
            solicitante = oper2.obtenerPorId(id_solicitante); 
          
            GestionTramite oper3=new GestionTramite(); 
            tm = oper3.obtenerTodos();
            tramite= oper3.obtenerPorId(id_tramite);
            id_unidadadministrativatramite=tramite.getId_unidadadministrativa();
                    
            GestionUnidadAdministrativa oper4=new GestionUnidadAdministrativa(); 
            ua = oper4.obtenerTodos(); 
          
            GestionSexo oper5 =new GestionSexo();
            sexo= oper5.obtenerTodos();
            
            GestionStatus oper6 =new GestionStatus();
            status= oper6.obtenerTodos();
            
            GestionUnidadAdministrativa gua=new GestionUnidadAdministrativa(); 
            ua = gua.obtenerTodos();
            uatramite=oper4.obtenerPorId(id_unidadadministrativatramite);
          
            request.setAttribute("solicitante",solicitante);
            request.setAttribute("solicitud",solicitud);
            request.setAttribute("tramite",tramite);
            request.setAttribute("tm",tm);
            request.setAttribute("ua",ua);
            request.setAttribute("sexo",sexo);
            request.setAttribute("status",status);
            request.setAttribute("uatramite",uatramite);
            
            
          
            RequestDispatcher rd=request.getRequestDispatcher("frm_seguimiento.jsp");
            rd.forward(request,response);
          
          
        }
        
        
         
         
        //grabación de una nueva solicitud y solicitante
        if(operacion.equals("grabar"))
        {
            
            long resultado;
            Boolean resultado3;
            Solicitud solicitud;
            Solicitante solicitante;
            Seguimiento seguimiento;
            Sexo sexosolicitante;
            UnidadAdministrativa uatramite;
            Status statusseguimiento;
            ArrayList ua,tm,tramites,sexo,status= null;
            Tramite tramite;
            Usuario usuario;
            Integer id_seguimiento,id_solicitud,id_solicitante,id_tramite,id_unidadaministrativa,id_unidadadministrativatramite,id_status;
            Float costo_t;
            String clave,mensaje;
            Boolean nombreadjunto=false;
                    
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            Integer id_usuario=usuario.getId_usuario();
            
            //Part p1 = request.getPart("adjunto");  
            //nombreadjunto = getFileName(p1);
            //Boolean adjuntosubido=subirAdjunto(p1);
            
             
          
            // leer el id_solicitud q es enviado como multi part
            Part p3  = request.getPart("id_solicitud");
            Scanner s2 = new Scanner(p3.getInputStream()); //la clase Scanner es utilizada para leer datos de un dispostivo de entrada o stream
            String midsolicitud = s2.nextLine();    // lectura del stream como cadena de caracteres
            id_solicitud=Integer.parseInt(midsolicitud); // pareseo el string a integer
          
            GestionSolicitud oper1=new GestionSolicitud(); 
            solicitud = oper1.obtenerPorId(id_solicitud); 
          
            id_solicitante=solicitud.getId_solicitante();
            id_tramite=solicitud.getId_tramite();
          
            GestionSolicitante oper2=new GestionSolicitante(); 
            solicitante = oper2.obtenerPorId(id_solicitante); 
          
            GestionTramite oper3=new GestionTramite(); 
            tm = oper3.obtenerTodos();
            tramite= oper3.obtenerPorId(id_tramite);
                    
            GestionUnidadAdministrativa oper4=new GestionUnidadAdministrativa(); 
            ua = oper4.obtenerTodos(); 
          
            GestionSexo oper5 =new GestionSexo();
            sexo= oper5.obtenerTodos();
            
            GestionStatus oper6 =new GestionStatus();
            status= oper6.obtenerTodos(); 
          
            seguimiento = new Seguimiento();
          
            // leer la fecha q viene como multipart
            Part p4  = request.getPart("fecha_t");
            Scanner s4 = new Scanner(p4.getInputStream());
            String fecha_t = s4.nextLine();    // read filename from stream
          
            //datos del seguimiento
            SimpleDateFormat sdf2= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                      
            TimeZone timeZone = TimeZone.getTimeZone("America/Bogota");
            Calendar calendar = Calendar.getInstance(timeZone);
            int hour = calendar.get(Calendar.HOUR_OF_DAY);
            int min = calendar.get(Calendar.MINUTE);
            int sec = calendar.get(Calendar.SECOND);
            //Date nuevafecha =  calendar.getTime();
            String tiempo=Integer.toString(hour)+':'+Integer.toString(min)+':'+Integer.toString(sec);
                       
                       
            String fechaactual = fecha_t+' '+tiempo;
            Date fecha = null;
            
            
            try {
                fecha =(Date) sdf2.parse(fechaactual);
                
            } catch (ParseException ex) {
                Logger.getLogger(ControladorSeguimiento.class.getName()).log(Level.SEVERE, null, ex);
            }
            seguimiento.setFecha(fecha);
        
            // leer las observaciones q viene como multipart
            Part p5  = request.getPart("observaciones");
            Scanner s5 = new Scanner(p5.getInputStream());
            String observacioness = s5.nextLine();    // read filename from stream
         
            String observaciones=observacioness.toUpperCase();
            seguimiento.setObservaciones(observaciones);
        
            // leer el id_solicitud q viene como multipart
            Part p6  = request.getPart("id_solicitud");
            Scanner s6 = new Scanner(p6.getInputStream());
            String id_solicitud2 = s6.nextLine();    // read filename from stream
        
            id_solicitud=Integer.parseInt(id_solicitud2);
            seguimiento.setId_solicitud(id_solicitud);
        
            // leer el id_status q viene como multipart
            Part p7  = request.getPart("id_status");
            Scanner s7 = new Scanner(p7.getInputStream());
            String id_status2 = s7.nextLine();    // read filename from stream
            
            //Agregando costo del tramite igh 24/01/2017
            Part p8  = request.getPart("costo_t");
            Scanner s8 = new Scanner(p8.getInputStream());
            String costo_t2 = s8.nextLine();    // read filename from stream
            //costo_t=Integer.parseInt(costo_t2);
            float costox= Float.parseFloat(costo_t2);
            solicitante.setCosto(costox);
            
            id_status=Integer.parseInt(id_status2);
            seguimiento.setId_status(id_status);  
            seguimiento.setId_usuario(id_usuario);
            seguimiento.setAdjunto(nombreadjunto);
            
            //Actualizando datos solicitante igh 24/01/2017
            GestionSolicitante gso=new GestionSolicitante();
            resultado3=gso.actualizarSolicitanteSeguimiento(solicitante);
            
            GestionSeguimiento gs=new GestionSeguimiento(); 
            
            resultado3=gs.registroSeguimiento(seguimiento);
        
            if(resultado3==true )
            {
                mensaje="Seguimiento grabado exitosamente";
            }else
            {
                mensaje="Errror al grabar seguimiento";
            }
            
           
            ArrayList seguimientos=gs.obtenerPorSolicitud(id_solicitud);
            request.setAttribute("mensaje",mensaje);
            request.setAttribute("seguimientos",seguimientos);
            request.setAttribute("tramite",tramite);
            request.setAttribute("solicitante",solicitante);
            request.setAttribute("solicitud",solicitud);
            RequestDispatcher rd=request.getRequestDispatcher("listarseguimiento.jsp");
            rd.forward(request,response);
        } 
        
        
        
        if(operacion.equals("modificar"))
        {
           
          Boolean resultado,resultado2;
          Solicitud solicitud= new Solicitud();   //variable tipo solicitud en la q recibo el javabean
          Solicitante solicitante = new Solicitante();   //variable tipo solicitante en la q recibo el javabean
          Seguimiento seguimiento = new Seguimiento();
          Usuario usuario=null;
          Tramite tramite=null;
          Integer id_solicitud,id_tramite,id_solicitante,id_unidadadministrativa,id_grupo,id_usuario;
          String mensaje,nombreadjuntonuevo;
          Boolean nombreadjunto=false;
          HttpSession objSession = request.getSession(); 
          usuario = (Usuario)(objSession.getAttribute("usuario")); 
          
           //Part p1 = request.getPart("adjuntonuevo");  
           //nombreadjuntonuevo = getFileName(p1);
           //Boolean adjuntosubido=subirAdjunto(p1);
           
          
           Part p2  = request.getPart("id_solicitud");
           Scanner s2 = new Scanner(p2.getInputStream()); //la clase Scanner es utilizada para leer datos de un dispostivo de entrada o stream
           String midsolicitud = s2.nextLine();    // lectura del stream como cadena de caracteres
           id_solicitud=Integer.parseInt(midsolicitud); // pareseo el string a integer
                      
           GestionSolicitud gsol=new GestionSolicitud(); 
           solicitud=gsol.obtenerPorId(id_solicitud);
           id_tramite = solicitud.getId_tramite();
           id_solicitante = solicitud.getId_solicitante();
            
           GestionSolicitante gsoli= new GestionSolicitante();
           solicitante= gsoli.obtenerPorId(id_solicitante);
                    
           GestionTramite gtm=new GestionTramite(); 
           tramite=gtm.obtenerPorId(id_tramite);
           id_unidadadministrativa=tramite.getId_unidadadministrativa();
          
            
          id_grupo=usuario.getId_grupo();
          id_unidadadministrativa=usuario.getId_unidadadministrativa();
          id_usuario=usuario.getId_usuario();
                  
          // recuperando datos
          
          seguimiento.setId_solicitud(id_solicitud);
          
          Part p3  = request.getPart("id_seguimiento");
          Scanner s3 = new Scanner(p3.getInputStream()); //la clase Scanner es utilizada para leer datos de un dispostivo de entrada o stream
          String midseguimiento = s3.nextLine();    // lectura del stream como cadena de caracteres
          Integer id_seguimiento=Integer.parseInt(midseguimiento); // pareseo el string a integer
          seguimiento.setId_seguimiento(id_seguimiento);
          
          Part p4  = request.getPart("id_status");
          Scanner s4 = new Scanner(p4.getInputStream()); //la clase Scanner es utilizada para leer datos de un dispostivo de entrada o stream
          String midstatus = s4.nextLine();    // lectura del stream como cadena de caracteres
          Integer id_status=Integer.parseInt(midstatus); // pareseo el string a integer
          seguimiento.setId_status(id_status);
          
          
          Part p5  = request.getPart("fecha_t");
          Scanner s5 = new Scanner(p5.getInputStream()); //la clase Scanner es utilizada para leer datos de un dispostivo de entrada o stream
          String mfecha_t = s5.nextLine();    // lectura del stream como cadena de caracteres
          
          SimpleDateFormat sdf2= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                      
          TimeZone timeZone = TimeZone.getTimeZone("America/Bogota");
          Calendar calendar = Calendar.getInstance(timeZone);
          int hour = calendar.get(Calendar.HOUR_OF_DAY);
          int min = calendar.get(Calendar.MINUTE);
          int sec = calendar.get(Calendar.SECOND);
          //Date nuevafecha =  calendar.getTime();
          String tiempo=Integer.toString(hour)+':'+Integer.toString(min)+':'+Integer.toString(sec);
                       
                       
          String fechaactual = mfecha_t+' '+tiempo;
          Date fecha = null;
            try {
                fecha =(Date) sdf2.parse(fechaactual);
            } catch (ParseException ex) {
                Logger.getLogger(ControladorSeguimiento.class.getName()).log(Level.SEVERE, null, ex);
            }
            seguimiento.setFecha(fecha);
            
          Part p6  = request.getPart("observaciones");
          Scanner s6 = new Scanner(p6.getInputStream()); //la clase Scanner es utilizada para leer datos de un dispostivo de entrada o stream
          String observaciones = s6.nextLine().toUpperCase();    // lectura del stream como cadena de caracteres
          seguimiento.setObservaciones(observaciones);
          seguimiento.setId_usuario(id_usuario);
          
          //if(!nombreadjuntonuevo.isEmpty())
          //{    
          //  seguimiento.setAdjunto(nombreadjuntonuevo);
          //}else
          //{
              seguimiento.setAdjunto(nombreadjunto);
          //}
            
            GestionSeguimiento gs= new GestionSeguimiento();
            resultado=gs.actualizarSeguimiento(seguimiento);
            if(resultado==true )
            {
                mensaje="Seguimiento modificado exitosamente";
            }else
            {
                mensaje="Error al modificar seguimiento";
            
            }
             
            ArrayList seguimientos=gs.obtenerPorSolicitud(id_solicitud);
            request.setAttribute("seguimientos",seguimientos);
            request.setAttribute("tramite",tramite);
            request.setAttribute("solicitante",solicitante);
            request.setAttribute("solicitud",solicitud);
            request.setAttribute("mensaje",mensaje);
            RequestDispatcher rd=request.getRequestDispatcher("listarseguimiento.jsp");
            rd.forward(request,response);
        }
        
                
         if(operacion.equals("localizar"))
        {
            Solicitud solicitud;
            Solicitante solicitante;
            Seguimiento seguimiento;
            Sexo sexosolicitante;
            UnidadAdministrativa uatramite;
            Status statusseguimiento;
            ArrayList ua,tm,tramites,sexo,status = null;
            Tramite tramite;
            Usuario usuario;
            Integer id_seguimiento,id_solicitud,id_solicitante,id_tramite,id_unidadaministrativa,id_unidadadministrativatramite,id_status;
            String clave;
            
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            //obetnes datos del seguimiento por id_seguimiento
            String midseguimiento;   
            midseguimiento = request.getParameter("id_seguimiento");  
            id_seguimiento=Integer.parseInt(midseguimiento);
            
            GestionSeguimiento oper7=new GestionSeguimiento(); 
            seguimiento = oper7.obtenerPorId(id_seguimiento);
            
            //Date fechaseguimiento = new Date(seguimiento.getFecha().getTime());
            
            //SimpleDateFormat fecha = new SimpleDateFormat("dd/MM/yyyy");
            //String fecha_seguimiento = fecha.format(fechaseguimiento);
            
            id_solicitud =seguimiento.getId_solicitud();
            id_status=seguimiento.getId_status();
            
            GestionSolicitud oper1=new GestionSolicitud(); 
            solicitud = oper1.obtenerPorId(id_solicitud);
          
            id_solicitante=solicitud.getId_solicitante();
            id_tramite=solicitud.getId_tramite();
          
            GestionSolicitante oper2=new GestionSolicitante(); 
            solicitante = oper2.obtenerPorId(id_solicitante); 
            clave = solicitante.getSexo();
                    
            GestionTramite oper3=new GestionTramite(); 
            tm = oper3.obtenerTodos();
            tramite= oper3.obtenerPorId(id_tramite);
            id_unidadadministrativatramite = tramite.getId_unidadadministrativa();
            
            GestionUnidadAdministrativa oper4=new GestionUnidadAdministrativa(); 
            ua = oper4.obtenerTodos();
            uatramite=oper4.obtenerPorId(id_unidadadministrativatramite);
          
            GestionSexo oper5 =new GestionSexo();
            sexo= oper5.obtenerTodos();
            sexosolicitante=oper5.obtenerPorId(clave);
            
            GestionStatus oper6 =new GestionStatus();
            status= oper6.obtenerTodos();
            
            //obtenemos datos del seguimiento
            
          
            request.setAttribute("solicitante",solicitante);
            request.setAttribute("solicitud",solicitud);
            request.setAttribute("tramite",tramite);
            request.setAttribute("tm",tm);
            
            //request.setAttribute("fecha_seguimiento",fecha_seguimiento);
            request.setAttribute("status",status);
            request.setAttribute("seguimiento",seguimiento);
            request.setAttribute("sexosolicitante",sexosolicitante);
            request.setAttribute("uatramite",uatramite);
                        
            RequestDispatcher rd=request.getRequestDispatcher("frmmodifica_seguimiento.jsp");
            rd.forward(request,response);
          
          
        }
         
         if(operacion.equals("listar"))
        {
            Usuario usuario;
            ArrayList seguimientos;
            Seguimiento seguimiento;
            Solicitud solicitud;
            Solicitante solicitante;
            Tramite tramite;
            Integer id_solicitud,id_tramite,id_solicitante;
            String mensaje="Listado de seguimientos exitoso";
            String pathadjuntos="build/web/adjuntos/";
            //recupero el usuario de la sesion 
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            //obetnes datos del seguimiento por id_seguimiento
            String midsolicitud;   
            midsolicitud = request.getParameter("id_solicitud");  
            id_solicitud=Integer.parseInt(midsolicitud);
            
            GestionSolicitud gsol=new GestionSolicitud(); 
            solicitud=gsol.obtenerPorId(id_solicitud);
            id_tramite = solicitud.getId_tramite();
            id_solicitante = solicitud.getId_solicitante();
            
            GestionSolicitante gsoli= new GestionSolicitante();
            solicitante= gsoli.obtenerPorId(id_solicitante);
                    
            GestionTramite gtm=new GestionTramite(); 
            tramite=gtm.obtenerPorId(id_tramite);
            id_unidadadministrativa=tramite.getId_unidadadministrativa();
            
            
            
            GestionSeguimiento gs=new GestionSeguimiento(); 
            seguimientos = gs.obtenerPorSolicitud(id_solicitud);
            
            
            request.setAttribute("mensaje",mensaje);
            request.setAttribute("seguimientos",seguimientos);
            request.setAttribute("tramite",tramite);
            request.setAttribute("solicitante",solicitante);
            request.setAttribute("solicitud",solicitud);
            request.setAttribute("pathadjuntos",pathadjuntos);
            if (id_grupo==1)
            {    
                RequestDispatcher rd=request.getRequestDispatcher("listarseguimiento_registrante.jsp");
                rd.forward(request,response);
            }else
            {
                RequestDispatcher rd=request.getRequestDispatcher("listarseguimiento.jsp");
                rd.forward(request,response);
            
            }
        } 
         
        if(operacion.equals("borrar"))
        {
          Boolean resultado,resultado2;
          ArrayList seguimientos;
          Seguimiento seguimiento;
          Solicitud solicitud;
          Solicitante solicitante;
          Tramite tramite;
          Integer id_solicitud,id_tramite,id_solicitante,id_unidadadministrativa;
          resultado=false;
          resultado2=false;
          String mensaje;
          
          Integer id_seguimiento;   
          id_seguimiento = Integer.parseInt(request.getParameter("id_seguimiento"));  
          
          GestionSeguimiento gs=new GestionSeguimiento();
          seguimiento= gs.obtenerPorId(id_seguimiento);
          id_solicitud=seguimiento.getId_solicitud();
          resultado = gs.eliminarPorId(id_seguimiento); 
          seguimientos = gs.obtenerPorSolicitud(id_solicitud);
         
                     
          GestionSolicitud gsol=new GestionSolicitud(); 
          solicitud=gsol.obtenerPorId(id_solicitud);
          id_tramite = solicitud.getId_tramite();
          id_solicitante = solicitud.getId_solicitante();
            
          GestionSolicitante gsoli= new GestionSolicitante();
          solicitante= gsoli.obtenerPorId(id_solicitante);
                    
          GestionTramite gtm=new GestionTramite(); 
          tramite=gtm.obtenerPorId(id_tramite);
          id_unidadadministrativa=tramite.getId_unidadadministrativa();
          if(resultado==true)
          {
              mensaje="Seguimeinto borrado exitosamente";
          }else
          {
              mensaje="Error al borrar seguimiento";
          
          }
          
          request.setAttribute("mensaje",mensaje);
          request.setAttribute("seguimientos",seguimientos);
          request.setAttribute("tramite",tramite);
          request.setAttribute("solicitante",solicitante);
          request.setAttribute("solicitud",solicitud);
          RequestDispatcher rd=request.getRequestDispatcher("listarseguimiento.jsp");
          rd.forward(request,response);
        }
        
        
        if(operacion.equals("listarjson"))
        {
            Usuario usuario;
            ArrayList seguimientos= new ArrayList();
            Seguimiento seguimiento;
            Solicitud solicitud;
            Solicitante solicitante;
            Tramite tramite;
            Integer id_solicitud,id_tramite,id_solicitante;
            String mensaje="Listado de seguimientos exitoso";
            String pathadjuntos="build/web/adjuntos/";
            //recupero el usuario de la sesion 
            //HttpSession objSession = request.getSession(); 
            //usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            //Integer id_grupo=usuario.getId_grupo();
            //Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            //obetnes datos del seguimiento por id_seguimiento
            String midsolicitud,midsolicitante;   
            midsolicitud = request.getParameter("id_solicitud");
            midsolicitante=request.getParameter("id_solicitante");
            id_solicitud=Integer.parseInt(midsolicitud);
            
            GestionSolicitud gsol=new GestionSolicitud(); 
            solicitud=gsol.obtenerPorId(id_solicitud);
            id_tramite = solicitud.getId_tramite();
            id_solicitante = solicitud.getId_solicitante();
            ArrayList solic=new ArrayList();
            if (Integer.parseInt(midsolicitante)==id_solicitante){
               solic.add(solicitud);
               
            }else{
               solic.add("");
            }
            
            
            GestionSolicitante gsoli= new GestionSolicitante();
            solicitante= gsoli.obtenerPorId(id_solicitante);
            ArrayList sol=new ArrayList();
            if (Integer.parseInt(midsolicitante)==id_solicitante){
               sol.add(solicitante);
               
            }else{
               sol.add("");
            }
            
                    
            GestionTramite gtm=new GestionTramite(); 
            tramite=gtm.obtenerPorId(id_tramite);
            Integer id_unidadadministrativa=tramite.getId_unidadadministrativa();
            ArrayList tram=new ArrayList();
            if (Integer.parseInt(midsolicitante)==id_solicitante){
               tram.add(tramite);
               
            }else{
               tram.add("");
            }
            
            
            
            GestionSeguimiento gs=new GestionSeguimiento(); 
            if (Integer.parseInt(midsolicitante)==id_solicitante){
               seguimientos = gs.obtenerPorSolicitud(id_solicitud);
               
            }
            
                
                GsonBuilder builder=new GsonBuilder();
                Gson gson=builder.create();
            
                //response.addHeader("Content-Type", "text/html; charset=utf-8; Access-Control-Allow-Origin http://localhost:4200");
                response.setHeader("Access-Control-Allow-Origin", "*");
                response.setHeader("Access-Control-Allow-Methods", "POST, GET");
                response.setHeader("Content-Type", "application/json; charset=UTF-8");
                response.setHeader("Access-Control-Max-Age", "3600");
                response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Charset");
                //response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"data\":"+gson.toJson(sol)+",\"solicitud\":"+gson.toJson(solic)+",\"tramite\":"+gson.toJson(tram)+",\"seguimientos\":"+gson.toJson(seguimientos)+"}");
            
            //}
        } 
        
        
         if(operacion.equals("enviarcorreo"))
        {
          Boolean resultado=false;
          Integer id_seguimiento,id_solicitud,id_tramite,id_solicitante,id_status,id_unidadadministrativa;
          Seguimiento seguimiento;
          Solicitud solicitud;
          Solicitante solicitante;
          Tramite tramite;
          UnidadAdministrativa ua;
          Status status;
          ArrayList seguimientos;
          String nombrestatus,email,observaciones,mensaje,nombre_solicitante,apellido_paterno,apellido_materno,nombretramite,nombreunidadadministrativa;
          id_seguimiento = Integer.parseInt(request.getParameter("id_seguimiento"));
          
          GestionSeguimiento gs=new GestionSeguimiento();
          seguimiento= gs.obtenerPorId(id_seguimiento);
          id_solicitud=seguimiento.getId_solicitud();
          id_status=seguimiento.getId_status();
          observaciones=seguimiento.getObservaciones();
          Date fecha=seguimiento.getFecha();
          SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
          String fecha_seguimiento = sdf.format(fecha);

          
          seguimientos = gs.obtenerPorSolicitud(id_solicitud);
          
         
                     
          GestionSolicitud gsol=new GestionSolicitud(); 
          solicitud=gsol.obtenerPorId(id_solicitud);
          id_tramite = solicitud.getId_tramite();
          id_solicitante = solicitud.getId_solicitante();
            
          GestionSolicitante gsoli= new GestionSolicitante();
          solicitante= gsoli.obtenerPorId(id_solicitante);
          email=solicitante.getEmail();
          nombre_solicitante=solicitante.getNombre();
          apellido_paterno=solicitante.getApellido_paterno();
          apellido_materno=solicitante.getApellido_materno();
                    
          GestionTramite gtm=new GestionTramite(); 
          tramite=gtm.obtenerPorId(id_tramite);
          id_unidadadministrativa=tramite.getId_unidadadministrativa();
          nombretramite=tramite.getNombre();
          
          GestionUnidadAdministrativa gua=new GestionUnidadAdministrativa(); 
          ua=gua.obtenerPorId(id_unidadadministrativa);
          nombreunidadadministrativa=ua.getNombre();
          
          GestionStatus gst=new GestionStatus(); 
          status=gst.obtenerPorId(id_status);
          nombrestatus=status.getNombre();
          
          if(nombrestatus.equals("CONCLUIDO"))
          {    
            mail correo = new mail();
            resultado=correo.send(email, "Notificación de Estatus de Trámite con la SEDUVI", "<table border='0' align='center' width='90%'><tr><td><img src=\"http://localhost:8080/tramites/imagenes/headerreporte.png\" /></td></tr></table><br><b>Hola, "+nombre_solicitante +" "+apellido_paterno+" "+apellido_materno+"</b><br><br>"+"Por este medio te avisamos de la conclusión de tu trámite (<b>"+nombretramite+"</b>), de fecha: "+fecha_seguimiento+" con número de folio: <b>"+id_solicitud+"</b> con las siguientes observaciones: <br>"+observaciones+"<br><br>"+"Atentamente"+"<br><br>"+"<b>"+nombreunidadadministrativa+"</b><br>Secretaría de Desarrollo Urbano y Vivienda");
          }
          
          if(nombrestatus.equals("INCONCLUSO"))
          {    
            mail correo = new mail();
            resultado=correo.send(email, "Notificación de Estatus de Trámite con la SEDUVI", "<table border='0' align='center' width='90%'><tr><td><img src=\"http://localhost:8080/tramites/imagenes/headerreporte.png\" /></td></tr></table><br><b>Hola, "+nombre_solicitante +" "+apellido_paterno+" "+apellido_materno+"</b><br><br>"+"Por este medio te avisamos que tu trámite se encuentra INCONCLUSO (<b>"+nombretramite+"</b>), de fecha: "+fecha_seguimiento+" con número de folio: <b>"+id_solicitud+"</b> con las siguientes observaciones: <br>"+observaciones+"<br><br>"+"Atentamente"+"<br><br>"+"<b>"+nombreunidadadministrativa+"</b><br>Secretaría de Desarrollo Urbano y Vivienda");
          }
          
          if(nombrestatus.equals("REVERTIDO"))
          {    
            mail correo = new mail();
            resultado=correo.send(email, "Notificación de Estatus de Trámite con la SEDUVI", "<table border='0' align='center' width='90%'><tr><td><img src=\"http://localhost:8080/tramites/imagenes/headerreporte.png\" /></td></tr></table><br><b>Hola, "+nombre_solicitante +" "+apellido_paterno+" "+apellido_materno+"</b><br><br>"+"Por este medio te avisamos que tu trámite se encuentra REVERTIDO(<b>"+nombretramite+"</b>), de fecha: "+fecha_seguimiento+" con número de folio: <b>"+id_solicitud+"</b> con las siguientes observaciones: <br>"+observaciones+"<br><br>"+"Atentamente"+"<br><br>"+"<b>"+nombreunidadadministrativa+"</b><br>Secretaría de Desarrollo Urbano y Vivienda");
          }
          
          if(resultado==true)
          {
              mensaje="Correo de conclusión de trámite enviado exitosamente";
          }else
          {
              mensaje="No se envió el correo, sólo son enviados los seguimientos con estatus CONCLUIDO "+id_status;
          
          }
          
          request.setAttribute("mensaje",mensaje);
          request.setAttribute("seguimientos",seguimientos);
          request.setAttribute("tramite",tramite);
          request.setAttribute("solicitante",solicitante);
          request.setAttribute("solicitud",solicitud);
          RequestDispatcher rd=request.getRequestDispatcher("listarseguimiento.jsp");
          rd.forward(request,response);
          
        }
         
         if(operacion.equals("imprimir"))
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
            
            try {
                 cn=conectaMysql.getConnection();
            } catch (SQLException ex) {
                Logger.getLogger(ControladorRegistro.class.getName()).log(Level.SEVERE, null, ex);
            }
            
                       
            ServletOutputStream servletOutputStream = response.getOutputStream();
            File reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/seguimientos.jasper"));
            
            
            try
            {
                
                Map param = new HashMap(); //inicializo un objeto HashMap variable,valor
                
                if (id_grupo==1)
                {    
                    param.put("sql","where O.id_solicitud='"+id_solicitud+"'");
                }else
                {
                    param.put("sql","where O.id_solicitud='"+id_solicitud+"'");
                    
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
   
        
     
         
         
         
         
    }
}
*/