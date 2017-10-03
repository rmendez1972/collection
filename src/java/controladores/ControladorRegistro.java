/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controladores;

import Modelo.GestionRequisito;
import Modelo.GestionSeguimiento;
import Modelo.GestionSexo;
import Modelo.GestionSolicitante;
import Modelo.GestionSolicitud;
import Modelo.GestionStatus;
import Modelo.GestionTramite;
import Modelo.GestionNiveles;
import Modelo.GestionDirecciones;
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
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.Map;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import javabeans.Direcciones;
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import javabeans.UsuarioApi;




/**
 *
 * @author rmendez1972
 */
/*
@WebServlet(name = "ControladorRegistro", urlPatterns = {"/controladorregistro"})
public class ControladorRegistro extends HttpServlet 
{
     public Connection cn;
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        //almacena la operacion que debe gestionar el controlador
        String operacion=request.getParameter("operacion");
        
         if(operacion.equals("capturar"))
        {
            GestionNiveles oper1=new GestionNiveles();
            ArrayList ua=oper1.obtenerTodos();
            
            request.setAttribute("ua",ua);
                     
            RequestDispatcher rd=request.getRequestDispatcher("frm_registra.jsp");
            rd.forward(request,response);
        }
        
         
        //grabación de una nueva solicitud y solicitante
        if(operacion.equals("grabar"))
        {
          long resultado;
          Boolean resultado2;
          Solicitud solicitud= new Solicitud();   //variable tipo solicitud en la q recibo el javabean
          Solicitante solicitante = new Solicitante();   //variable tipo solicitante en la q recibo el javabean
          String mensaje;
          //solicitud = (Solicitud)request.getAttribute("solicitud");  
          //solicitante = (Solicitante)request.getAttribute("solicitante");  
          
          //datos del solicitante
        String nombre=request.getParameter("nombre").toUpperCase();
        solicitante.setNombre(nombre);
        String apellido_p=request.getParameter("apellido_p").toUpperCase();
        solicitante.setApellido_paterno(apellido_p);
        String apellido_m=request.getParameter("apellido_m").toUpperCase();
        solicitante.setApellido_materno(apellido_m);
        String direccion=request.getParameter("domicilio").toUpperCase();
        solicitante.setDireccion(direccion);
        String rfc=request.getParameter("rfc").toUpperCase();
        solicitante.setRfc(rfc);
        String telefono=request.getParameter("telefono");
        solicitante.setTelefono(telefono);
        String email=request.getParameter("email").toLowerCase();
        solicitante.setEmail(email);
        String sexo=request.getParameter("sexo").toUpperCase();
        solicitante.setSexo(sexo);
        String password=request.getParameter("password").toUpperCase();
        solicitante.setPassword(password);
        //float costo=Float.parseFloat(request.getParameter("costo_t"));
        //solicitante.setCosto(costo);
        
        
        //recuperando datos del usuario
        HttpSession objSession = request.getSession(); 
        Usuario usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
        Integer id_grupo=usuario.getId_grupo();
        Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
        Integer id_usuario=usuario.getId_usuario();
        
        //datos de la solicitud
        Integer id_tramite=Integer.parseInt(request.getParameter("tramites"));
        solicitud.setId_tramite(id_tramite);
        
        Integer id_status=1;
        
        SimpleDateFormat sdf2= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                      
        TimeZone timeZone = TimeZone.getTimeZone("America/Bogota");
        Calendar calendar = Calendar.getInstance(timeZone);
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        int min = calendar.get(Calendar.MINUTE);
        int sec = calendar.get(Calendar.SECOND);
        //Date nuevafecha =  calendar.getTime();
        String tiempo=Integer.toString(hour)+':'+Integer.toString(min)+':'+Integer.toString(sec);
                       
                       
        String fechaactual = request.getParameter("fecha_r")+' '+tiempo;
        
        
        Date fecha_ingreso = null;
            try {
                fecha_ingreso = sdf2.parse(fechaactual);
            } catch (ParseException ex) {
                Logger.getLogger(ControladorRegistro.class.getName()).log(Level.SEVERE, null, ex);
            }
        solicitud.setFecha_ingreso(fecha_ingreso);
          
          GestionSolicitante oper1=new GestionSolicitante(); 
          GestionSolicitud oper2=new GestionSolicitud(); 
          resultado = oper1.registroSolicitante(solicitante); // metodo para grabar
          Integer id_solicitante = (int)(long)resultado;
          Solicitante msolicitante = oper1.obtenerPorId( id_solicitante);
          
          
          // acompletando los datos de la solicitud en el javabean
          solicitud.setId_solicitante(id_solicitante);
          solicitud.setId_usuario_ingreso(id_usuario);  //usuario real
          solicitud.setId_usuario_seguimiento(2);
          solicitud.setId_status(id_status);
          
          resultado2=oper2.registroSolicitud(solicitud);
          if(resultado2==true)
          {
              mensaje="Solicitud grabada exitosamente";
          }else
          {
              mensaje="Error al grabar solicitud";
          }
          request.setAttribute("mensaje",mensaje);
           
          ArrayList solicitudes=oper2.obtenerSolicitudes();
          request.setAttribute("solicitudes",solicitudes);
          RequestDispatcher rd=request.getRequestDispatcher("listarsolicitudes.jsp");
          rd.forward(request,response);
        } 
        
        
         if(operacion.equals("modificar"))
        {
           
          Boolean resultado,resultado2;
          Solicitud solicitud= new Solicitud();   //variable tipo solicitud en la q recibo el javabean
          Solicitante solicitante = new Solicitante();   //variable tipo solicitante en la q recibo el javabean
          String mensaje;
          //solicitud = (Solicitud)request.getAttribute("solicitud");  
          //solicitante = (Solicitante)request.getAttribute("solicitante");  
          
          //recuperando datos del usuario
        HttpSession objSession = request.getSession(); 
        Usuario usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
        Integer id_grupo=usuario.getId_grupo();
        Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
        Integer id_usuario=usuario.getId_usuario();
          
          //datos del solicitante
          Integer id_solicitante=Integer.parseInt(request.getParameter("id_solicitante"));
          Integer id_status=Integer.parseInt(request.getParameter("id_status"));
          solicitante.setId_solicitante(id_solicitante);
        String nombre=request.getParameter("nombre").toUpperCase();
        solicitante.setNombre(nombre);
        String apellido_p=request.getParameter("apellido_p").toUpperCase();
        solicitante.setApellido_paterno(apellido_p);
        String apellido_m=request.getParameter("apellido_m").toUpperCase();
        solicitante.setApellido_materno(apellido_m);
        String direccion=request.getParameter("domicilio").toUpperCase();
        solicitante.setDireccion(direccion);
        String rfc=request.getParameter("rfc").toUpperCase();
        solicitante.setRfc(rfc);
        String telefono=request.getParameter("telefono");
        solicitante.setTelefono(telefono);
        String email=request.getParameter("email").toLowerCase();
        solicitante.setEmail(email);
        String password=request.getParameter("password").toUpperCase();
        solicitante.setPassword(password);
        String sexo=request.getParameter("sexo").toUpperCase();
        solicitante.setSexo(sexo);
        if (id_grupo==2){       
        //Costo...
            float costo=Float.parseFloat(request.getParameter("costo_t"));
            solicitante.setCosto(costo);
        }
                
        
        
        
        //datos de la solicitud
        Integer id_solcitud=Integer.parseInt(request.getParameter("id_solicitud"));
        solicitud.setId_solicitud(id_solcitud);
        Integer id_tramite=Integer.parseInt(request.getParameter("tramites"));
        solicitud.setId_tramite(id_tramite);
        
        SimpleDateFormat sdf2= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                      
        TimeZone timeZone = TimeZone.getTimeZone("America/Bogota");
        Calendar calendar = Calendar.getInstance(timeZone);
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        int min = calendar.get(Calendar.MINUTE);
        int sec = calendar.get(Calendar.SECOND);
        //Date nuevafecha =  calendar.getTime();
        String tiempo=Integer.toString(hour)+':'+Integer.toString(min)+':'+Integer.toString(sec);
                       
                       
        String fechaactual = request.getParameter("fecha_r")+' '+tiempo;
        
        
        Date fecha_ingreso = null;
            try {
                fecha_ingreso = sdf2.parse(fechaactual);
            } catch (ParseException ex) {
                Logger.getLogger(ControladorRegistro.class.getName()).log(Level.SEVERE, null, ex);
            }
        solicitud.setFecha_ingreso(fecha_ingreso);
        
          
        GestionSolicitante oper1=new GestionSolicitante(); 
        GestionSolicitud oper2=new GestionSolicitud();
        if (id_grupo==1){  
            resultado = oper1.actualizarSolicitante(solicitante); // metodo para actualzar
        }
        
        if (id_grupo==2){  
            resultado = oper1.actualizarSolicitanteSeguimiento(solicitante); // metodo para actualzar
        }
          
          // acompletando los datos de la solicitud en el javabean
          solicitud.setId_solicitante(id_solicitante);
          solicitud.setId_usuario_ingreso(id_usuario);   //usuario real
          solicitud.setId_usuario_seguimiento(2);
          solicitud.setId_status(id_status);
          
          resultado2=oper2.actualizarSolicitud(solicitud);
          
          if(resultado2==true)
          {
              mensaje="Solicitud modificada exitosamente";
          }else
          {
              mensaje="Error al modificar la solicitud";
          }
          request.setAttribute("mensaje",mensaje);
          ArrayList solicitudes=oper2.obtenerSolicitudes();
          request.setAttribute("solicitudes",solicitudes);
          RequestDispatcher rd=request.getRequestDispatcher("listarsolicitudes.jsp");
          rd.forward(request,response);
        }
        
        
         if(operacion.equals("listar"))
        {
            Usuario usuario;
            UnidadAdministrativa unidadadministrativa;
            ArrayList solicitudes;
            String mensaje="Listado de Solicitudes exitoso";
            //recupero el usuario de la sesion 
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            Integer id_direccion=usuario.getId_direccion();
            GestionSolicitud oper2=new GestionSolicitud();
            if (id_grupo==1)
            {    
                
    
                solicitudes=oper2.obtenerSolicitudes();
                request.setAttribute("solicitudes",solicitudes);
                request.setAttribute("mensaje",mensaje);
                
                
                RequestDispatcher rd=request.getRequestDispatcher("listarsolicitudes.jsp");
                rd.forward(request,response);
            }else
            {
                GestionNiveles gua=new GestionNiveles(); 
                unidadadministrativa = gua.obtenerPorId(id_unidadadministrativa);
                String nombreunidadadministrativa=unidadadministrativa.getNombre();  //nombre de la subsecretaria
                
                GestionDirecciones mod_dir=new GestionDirecciones(); 
                Direcciones dir = mod_dir.obtenerPorId(id_direccion);
                String direccion=dir.getNombre();
                
                solicitudes = oper2.obtenerPorUnidad(id_unidadadministrativa, id_direccion);
                request.setAttribute("solicitudes",solicitudes);
                request.setAttribute("mensaje",mensaje);
                request.setAttribute("nombreunidadadministrativa",nombreunidadadministrativa);
                request.setAttribute("direccion",direccion);
                RequestDispatcher rd=request.getRequestDispatcher("listarsolicitudes_seguimiento.jsp");
                rd.forward(request,response);
            }
            
        }
         
       
       if(operacion.equals("listarId"))
        {
            Usuario usuario;
            UnidadAdministrativa unidadadministrativa;
            ArrayList solicitudes;
            Solicitud solicitud;
            Solicitante solicitante;//
            Tramite tramite;//
            String mensajeloc;
            Integer id_tramite,id_solicitante;//
            //recupero el usuario de la sesion 
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_solicitud=Integer.parseInt(request.getParameter("id_solicitud"));
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            GestionSolicitud oper2=new GestionSolicitud();
            
                GestionNiveles gua=new GestionNiveles(); 
                unidadadministrativa = gua.obtenerPorId(id_unidadadministrativa);
                String nombreunidadadministrativa=unidadadministrativa.getNombre();
                
                GestionSolicitud gsol=new GestionSolicitud();// 
                solicitud=gsol.obtenerPorId(id_solicitud);//
                id_tramite = solicitud.getId_tramite();//
                id_solicitante = solicitud.getId_solicitante();//                
                GestionSolicitante gsoli= new GestionSolicitante();//
                solicitante= gsoli.obtenerPorId(id_solicitante);//                
                GestionTramite gtm=new GestionTramite();// 
                tramite=gtm.obtenerPorId(id_tramite);//
                
                solicitud = oper2.obtenerPorId(id_solicitud);
                if (solicitud==null)
                {
                    mensajeloc="Solicitud no encontrada";
                }else
                {
                    mensajeloc="Solicitud localizada exitosamente";
                }
                request.setAttribute("solicitante",solicitante);//
                request.setAttribute("tramite",tramite); //
                request.setAttribute("solicitud",solicitud);
                request.setAttribute("mensajeloc",mensajeloc);
                request.setAttribute("nombreunidadadministrativa",nombreunidadadministrativa);
                RequestDispatcher rd=request.getRequestDispatcher("listarsolicitudes_seguimientoId.jsp");
                rd.forward(request,response);
            
            
        }  
         
         
       if(operacion.equals("verRequisitos"))
       {
        
            Usuario usuario;
            UnidadAdministrativa unidadadministrativa;
            ArrayList solicitudes;
            //recupero el usuario de la sesion 
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            String midtramite;   
            midtramite = request.getParameter("id");  
            Integer id_solicitud,id_solicitante,id_tramite,id_unidadaministrativa;
            id_tramite=Integer.parseInt(midtramite);
            
            GestionTramite modelo=new GestionTramite();
            Tramite t=modelo.obtenerPorId(id_tramite);
        
            GestionRequisito mod_req=new GestionRequisito();
            ArrayList req=mod_req.obtenerPorTramite(id_tramite);
            ArrayList noreq=mod_req.obtenerSinTramite(id_tramite);
        
            request.setAttribute("tramite", t);
            request.setAttribute("req", req);
            request.setAttribute("noreq", noreq);
        
            RequestDispatcher rd=request.getRequestDispatcher("listar_requisitosTramiteRegistrante.jsp");
            rd.forward(request,response);
       }    
         
        if(operacion.equals("localizar"))
        {
            Solicitud solicitud;
            Solicitante solicitante;
            ArrayList ua,tm,tramites,sexo,status,solicitudes = null;
            Tramite tramite;
            Usuario usuario;
            
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            
            String midsolicitud;   
            midsolicitud = request.getParameter("id_solicitud");  
            Integer id_solicitud,id_solicitante,id_tramite,id_unidadaministrativa;
            id_solicitud=Integer.parseInt(midsolicitud);
          
            GestionSolicitud oper1=new GestionSolicitud(); 
            solicitud = oper1.obtenerPorId(id_solicitud); 
            
            if (solicitud!=null)
            {    
                id_solicitante=solicitud.getId_solicitante();
                id_tramite=solicitud.getId_tramite();
                
                GestionSolicitud gsol = new GestionSolicitud();
                GestionSolicitante oper2=new GestionSolicitante(); 
                solicitante = oper2.obtenerPorId(id_solicitante); 

                GestionTramite oper3=new GestionTramite(); 
                tm = oper3.obtenerTodos();
                tramite= oper3.obtenerPorId(id_tramite);

                GestionNiveles oper4=new GestionNiveles(); 
                ua = oper4.obtenerTodos(); 

                GestionSexo oper5 =new GestionSexo();
                sexo= oper5.obtenerTodos();

                GestionStatus oper6 =new GestionStatus();
                status= oper6.obtenerTodos();

                request.setAttribute("solicitante",solicitante);
                request.setAttribute("solicitud",solicitud);
                request.setAttribute("tramite",tramite);
                request.setAttribute("tm",tm);
                request.setAttribute("ua",ua);
                request.setAttribute("sexo",sexo);
                request.setAttribute("status",status);

                if (id_grupo==1)
                {    
                    RequestDispatcher rd=request.getRequestDispatcher("frmmodifica_registra.jsp");
                    rd.forward(request,response);
              }else
              {
                  RequestDispatcher rd=request.getRequestDispatcher("frm_seguimiento.jsp");
                  rd.forward(request,response);

              }
            }else
            {
                String mensaje="El num. de solicitud ingresado no existe, intenta de nuevo";
                solicitudes=oper1.obtenerSolicitudes();
                request.setAttribute("solicitudes",solicitudes);
                request.setAttribute("mensaje",mensaje);
                RequestDispatcher rd=request.getRequestDispatcher("listarsolicitudes.jsp");
                rd.forward(request,response);
                
            }
        } 
        
         if(operacion.equals("borrar"))
        {
          Boolean resultado,resultado2;
          String mensaje;
          resultado=false;
          resultado2=false;
          
          Integer id_solicitud,id_solicitante;   
          Solicitud solicitud=null;
          id_solicitud = Integer.parseInt(request.getParameter("id_solicitud"));  
          
          GestionSolicitud oper1=new GestionSolicitud(); 
          solicitud = oper1.obtenerPorId(id_solicitud); 
          id_solicitante=solicitud.getId_solicitante();
          
          GestionSolicitante oper2=new GestionSolicitante(); 
          resultado=oper2.eliminarPorId(id_solicitante);
          
          if(resultado==true)
          {
              mensaje="Solicitud borrada exitosamente";
          }else
          {
              mensaje="Error al borrar la solicitud";
          }    
          
          ArrayList solicitudes=oper1.obtenerSolicitudes();
          request.setAttribute("solicitudes",solicitudes);
          request.setAttribute("mensaje",mensaje);
         
          RequestDispatcher rd=request.getRequestDispatcher("listarsolicitudes.jsp");
          rd.forward(request,response);
        }
         
         if(operacion.equals("borrar"))
        {
          Boolean resultado,resultado2;
          String mensaje;
          resultado=false;
          resultado2=false;
          
          Integer id_solicitud,id_solicitante;   
          Solicitud solicitud=null;
          id_solicitud = Integer.parseInt(request.getParameter("id_solicitud"));  
          
          GestionSolicitud oper1=new GestionSolicitud(); 
          solicitud = oper1.obtenerPorId(id_solicitud); 
          id_solicitante=solicitud.getId_solicitante();
          
          GestionSolicitante oper2=new GestionSolicitante(); 
          resultado=oper2.eliminarPorId(id_solicitante);
          
          if(resultado==true)
          {
              mensaje="Solicitud borrada exitosamente";
          }else
          {
              mensaje="Error al borrar la solicitud";
          }    
          
          ArrayList solicitudes=oper1.obtenerSolicitudes();
          request.setAttribute("solicitudes",solicitudes);
          request.setAttribute("mensaje",mensaje);
         
          RequestDispatcher rd=request.getRequestDispatcher("listarsolicitudes.jsp");
          rd.forward(request,response);
        }
         
        if(operacion.equals("apilogin"))
        {
            
            
            String username = request.getParameter("username");
            String password = request.getParameter("password").toUpperCase();
            GestionSolicitante gsol=new GestionSolicitante(); 
            Solicitante solicitante = gsol.obtenerPorEmailPassword(username, password);
            
            UsuarioApi user= new UsuarioApi(); 
            ArrayList usuario = new ArrayList();
            if (solicitante != null){
                user.setId(solicitante.getId_solicitante());
                user.setUsername(solicitante.getEmail());
                user.setPassword(solicitante.getPassword());
                user.setFirstname(solicitante.getNombre());
                user.setLastname(solicitante.getApellido_paterno()+" "+solicitante.getApellido_materno());
                           
                usuario.add(user);
            }
                
            
            GsonBuilder builder=new GsonBuilder();
            Gson gson=builder.create();
            
            //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "POST, GET");
            response.setHeader("Access-Control-Max-Age", "3600");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
            response.getWriter().write("{\"user\":"+gson.toJson(usuario)+"}");
            
          
        }
        
        if(operacion.equals("apiSolicitanteCambioPassword"))
        {
            
            
            Integer id_solicitante = Integer.parseInt(request.getParameter("id_solicitante"));
            String password = request.getParameter("new_password").toUpperCase();
            GestionSolicitante gsol=new GestionSolicitante(); 
            Boolean result = gsol.actualizarSolicitantePassworrd(id_solicitante, password);
                         
            ArrayList resultado = new ArrayList();
            if (result != null){
                                          
                resultado.add(result);
            }
            
            GsonBuilder builder=new GsonBuilder();
            Gson gson=builder.create();
            
            //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Methods", "POST, GET");
            response.setHeader("Content-Type", "application/json; charset=UTF-8");
            response.setHeader("Access-Control-Max-Age", "3600");
            response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Charset");
            response.getWriter().write("{\"resultado\":"+gson.toJson(resultado)+"}");
            
          
        }
       
       
       
       if(operacion.equals("enviarcorreosubsec"))
        {
            Boolean resultado=false;
            Usuario usuario;
            UnidadAdministrativa unidadadministrativa;
            ArrayList solicitudes;
            String mensaje,unidadadministrativanombre;
            //recupero el usuario de la sesion 
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            String midtramite,midsolicitud;   
            midsolicitud = request.getParameter("id_solicitud");  
            Integer id_solicitud,id_solicitante,id_tramite,id_unidadaministrativa;
            id_solicitud=Integer.parseInt(midsolicitud);
            
            GestionSolicitud gs= new GestionSolicitud();
            Solicitud solicitud= gs.obtenerPorId(id_solicitud);
            id_tramite=solicitud.getId_tramite();
            id_solicitante=solicitud.getId_solicitante();
            Date fecha_ingreso=solicitud.getFecha_ingreso();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            String fecha_solicitud = sdf.format(fecha_ingreso);
            
            
            
            GestionSolicitante gsol=new GestionSolicitante();
            Solicitante solicitante=gsol.obtenerPorId(id_solicitante);
            String email =solicitante.getEmail();
            String nombre_solicitante=solicitante.getNombre();
            String apellido_paterno=solicitante.getApellido_paterno();
            String apellido_materno=solicitante.getApellido_materno();
            
            GestionTramite modelo=new GestionTramite();
            Tramite t=modelo.obtenerPorId(id_tramite);
            String nombretramite = t.getNombre();
            unidadadministrativanombre=t.getUnidadAdministrativa();
            Integer mid_unidadadministrativa=t.getId_unidadadministrativa();
            
            GestionNiveles gua=new GestionNiveles();
            UnidadAdministrativa ua = gua.obtenerPorId(mid_unidadadministrativa);
            String emailua=ua.getEmail();
            String nombreua=ua.getNombre();
            
            
            GestionRequisito mod_req=new GestionRequisito();
            ArrayList req=mod_req.obtenerPorTramite(id_tramite);
            ArrayList noreq=mod_req.obtenerSinTramite(id_tramite);
            
          if(!emailua.equals("") || !emailua.equals("NULL"))
          {    
            mail correo = new mail();
            Iterator iterator=req.listIterator();
            String cuerpocorreo="<table border='0' align='center' width='90%'><tr><td><img src=\"http://localhost:8080/tramites/imagenes/headerreporte.png\" /></td></tr></table><br><b>C. Subsecretari@ <br>P R E S E N T E:</b><br><br>"+"Por este medio te notificamos de un nuevo trámite de: (<b>"+nombretramite+"</b>), con fecha: "+fecha_solicitud+" con <b>Núm. de Solicitud: "+midsolicitud+"</b> que ha sido ingresado al Sistema de Ventanilla Unica de Gestión de Trámites y Servicios de la SEDUVI para su atención. <br><br>";
            //resultado=correo.send(email, "Lista de Requisitos para trámite en la SEDUVI", "<table border='0' align='center' width='90%'><tr><td><img src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8BevTD5TfmuOTtwljH55eYl5nUR0dLpluk43gDdk5wlZegwHHPg\" /></td></tr></table><br><b>Hola, "+nombre_solicitante +" "+apellido_paterno+" "+apellido_materno+"</b><br><br>"+"Por este medio te enviamos los Requisitos para el tramite: (<b>"+nombretramite+"</b>) con la SEDUVI <br><br>"+"Atentamente"+"<br><br>"+"<b>"+unidadadministrativanombre+"</b><br>Secretaría de Desarrollo Urbano y Vivienda");
            Integer i=1;
                       
            cuerpocorreo=cuerpocorreo+"<br>Atentamente<br><br><b>Administrador del Sistema</b><br>";
            resultado=correo.send(emailua, "Ingreso de Nueva Solicitud en Ventanilla Unica de Trámites y Servicios de la SEDUVI", cuerpocorreo);
              
          }
          if(resultado==true)
          {
              mensaje="Notifiación de nueva solicitud enviada por correo exitosamente";
          }else
          {
              mensaje="No pudo ser enviado la notiticación de nueva solicitud por correo";
          
          }
          
          if (id_grupo==1)
          {    
                solicitudes=gs.obtenerSolicitudes();
                request.setAttribute("solicitudes",solicitudes);
                request.setAttribute("mensaje",mensaje);
                RequestDispatcher rd=request.getRequestDispatcher("listarsolicitudes.jsp");
                rd.forward(request,response);
          }
          
        }
       
       
        if(operacion.equals("enviarcorreo"))
        {
            Boolean resultado=false;
            Usuario usuario;
            UnidadAdministrativa unidadadministrativa;
            ArrayList solicitudes;
            String mensaje,unidadadministrativanombre;
            //recupero el usuario de la sesion 
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            String midtramite,midsolicitud;   
            midsolicitud = request.getParameter("id_solicitud");  
            Integer id_solicitud,id_solicitante,id_tramite,id_unidadaministrativa;
            id_solicitud=Integer.parseInt(midsolicitud);
            
            GestionSolicitud gs= new GestionSolicitud();
            Solicitud solicitud= gs.obtenerPorId(id_solicitud);
            id_tramite=solicitud.getId_tramite();
            id_solicitante=solicitud.getId_solicitante();
            Date fecha_ingreso=solicitud.getFecha_ingreso();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            String fecha_solicitud = sdf.format(fecha_ingreso);
            
            
            
            GestionSolicitante gsol=new GestionSolicitante();
            Solicitante solicitante=gsol.obtenerPorId(id_solicitante);
            String email =solicitante.getEmail();
            String nombre_solicitante=solicitante.getNombre();
            String apellido_paterno=solicitante.getApellido_paterno();
            String apellido_materno=solicitante.getApellido_materno();
            
            GestionTramite modelo=new GestionTramite();
            Tramite t=modelo.obtenerPorId(id_tramite);
            String nombretramite = t.getNombre();
            unidadadministrativanombre=t.getUnidadAdministrativa();
            Integer mid_unidadadministrativa=t.getId_unidadadministrativa();
            
            GestionNiveles gua=new GestionNiveles();
            UnidadAdministrativa ua = gua.obtenerPorId(mid_unidadadministrativa);
            String emailua=ua.getEmail();
            String nombreua=ua.getNombre();
            
            
            GestionRequisito mod_req=new GestionRequisito();
            ArrayList req=mod_req.obtenerPorTramite(id_tramite);
            ArrayList noreq=mod_req.obtenerSinTramite(id_tramite);
            
          if(!email.equals("") || !email.equals("NULL"))
          {    
            mail correo = new mail();
            //Iterator iterator=req.listIterator();
            //String cuerpocorreo="<table border='0' align='center' width='90%'><tr><td><img src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8BevTD5TfmuOTtwljH55eYl5nUR0dLpluk43gDdk5wlZegwHHPg\" /></td></tr></table><br><b>C. Subsecretari@ <br>P R E S E N T E:</b><br><br>"+"Por este medio te notificamos de un nuevo trámite de: (<b>"+nombretramite+"</b>), con fecha: "+fecha_solicitud+" con <b>Núm. de Solicitud: "+midsolicitud+"</b> que ha sido ingresado al Sistema de Ventanilla Unica de Gestión de Trámites y Servicios de la SEDUVI para su atención. <br><br>";
            
            String requisitos="";
            Iterator it = req.iterator();
            Integer num=1;
            while (it.hasNext()){
                Requisito requisito = (Requisito) it.next();
                requisitos+="<tr><td width='10%'>"+num.toString()+"</td><td width='90%'>"+requisito.getNombre()+"</td></tr>";
                num++;
            }
            resultado=correo.send(email, "Lista de Requisitos para trámite en la SEDUVI", "<table border='0' align='center' width='90%'><tr><td><img src=\"http://localhost:8080/tramites/imagenes/headerreporte.png\" /></td></tr></table><br><b>Hola, "+nombre_solicitante +" "+apellido_paterno+" "+apellido_materno+"</b><br><br>"+"Por este medio te enviamos los Requisitos para el tramite: (<b>"+nombretramite+"</b>) con la SEDUVI <br><br><table border='2' align='left' width='100%'><thead><tr><th width='20%'>No.</th><th width='80%'>Descripción</th></tr></thead><tbody>"+requisitos+"</tbody></table><br><br><br>"+"Atentamente"+"<br><br>"+"<b>"+unidadadministrativanombre+"<br>Secretaría de Desarrollo Urbano y Vivienda</b>");
            //Integer i=1;
                       
            //cuerpocorreo=cuerpocorreo+"<br>Atentamente<br><br><b>Administrador del Sistema</b><br>";
            //resultado=correo.send(emailua, "Ingreso de Nueva Solicitud en Ventanilla Unica de Trámites y Servicios de la SEDUVI", cuerpocorreo);
              
          }
          if(resultado==true)
          {
              mensaje="Notifiación de nueva solicitud enviada por correo exitosamente";
          }else
          {
              mensaje="No pudo ser enviado la notiticación de nueva solicitud por correo";
          
          }
          
          if (id_grupo==1)
          {    
                solicitudes=gs.obtenerSolicitudes();
                request.setAttribute("solicitudes",solicitudes);
                request.setAttribute("mensaje",mensaje);
                RequestDispatcher rd=request.getRequestDispatcher("listarsolicitudes.jsp");
                rd.forward(request,response);
          }
          
        }
         
       
        if(operacion.equals("acuse"))
        {
           /*Usuario usuario;
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();*/
/*
            
            Integer id_solicitud;   
            Solicitud solicitud=null;
            
            Usuario usuario;
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            id_solicitud = Integer.parseInt(request.getParameter("id_solicitud"));
            
            try {
                 cn=conectaMysql.getConnection();
            } catch (SQLException ex) {
                Logger.getLogger(ControladorRegistro.class.getName()).log(Level.SEVERE, null, ex);
            }
            
                       
            ServletOutputStream servletOutputStream = response.getOutputStream();
            File reportFile=null;
            reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/acuse.jasper"));
            
            try
            {
                
                Map param = new HashMap(); //inicializo un objeto HashMap variable,valor
                //param.put("id_delegacion", id_delegacion);
                //param.put("id_mecanica", id_mecanica);
                
                 param.put("sql","where S.id_solicitud='"+id_solicitud+"'");
                    
                 
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
       
         
         if(operacion.equals("imprimir"))
        {
           Usuario usuario;
            HttpSession objSession = request.getSession(); 
            usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
            Integer id_grupo=usuario.getId_grupo();
            Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
            try {
                 cn=conectaMysql.getConnection();
            } catch (SQLException ex) {
                Logger.getLogger(ControladorRegistro.class.getName()).log(Level.SEVERE, null, ex);
            }
            
                       
            ServletOutputStream servletOutputStream = response.getOutputStream();
            File reportFile=null;
            if (id_grupo==1)
            {    
                reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/solicitudes.jasper"));
            }
            else
            {
                
                reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/solicitudes_unidadadministrativa.jasper"));
             
            }
            
            try
            {
                
                Map param = new HashMap(); //inicializo un objeto HashMap variable,valor
                //param.put("id_delegacion", id_delegacion);
                //param.put("id_mecanica", id_mecanica);
                if (id_grupo==1)
                {    
                    param.put("sql","");
                }else
                {
                    param.put("sql","where T.id_unidadadministrativa='"+id_unidadadministrativa+"'");
                    
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