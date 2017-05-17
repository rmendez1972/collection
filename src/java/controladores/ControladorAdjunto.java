/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionAdjunto;
import Modelo.GestionSeguimiento;
import Modelo.GestionSexo;
import Modelo.GestionSolicitante;
import Modelo.GestionSolicitud;
import Modelo.GestionStatus;
import Modelo.GestionTramite;
import Modelo.GestionUnidadAdministrativa;
import Modelo.conectaMysql;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import javabeans.Adjunto;
import javabeans.Seguimiento;
import javabeans.Solicitante;
import javabeans.Solicitud;
import javabeans.Tramite;
import javabeans.Usuario;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;


/**
 *
 * @author Rafael Méndez
 */
@MultipartConfig
public class ControladorAdjunto extends ControladorBase {
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
                String ruta="/adjuntos";
                // ruta relativa a donde subo el archivo adjunto
                //String outputfile = this.getServletContext().getRealPath("/adjuntos/");  // get path on the server
                String outputfile = "c:/users/rmendez1972/documents/netbeansprojects/tramites/web/adjuntos";
                File saveFile = new File(outputfile+"/" + filename);
                FileOutputStream os = new FileOutputStream (saveFile);
            
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

    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Usuario usuario;
        ArrayList adjuntos;
        Seguimiento seguimiento;
        Solicitud solicitud;
        Solicitante solicitante;
        Tramite tramite;
        Integer id_seguimiento,id_tramite,id_solicitante,id_solicitud;
        String mensaje="Listado de archivos adjuntos exitoso";
        String pathadjuntos="adjuntos/";
        String pathuploads="http://localhost:3001/upload/";
        //recupero el usuario de la sesion 
        HttpSession objSession = request.getSession(); 
        usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
        Integer id_grupo=usuario.getId_grupo();
        Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
        //obetnes datos del seguimiento por id_seguimiento
        String midseguimiento;   
        midseguimiento = request.getParameter("id_seguimiento");  
        id_seguimiento=Integer.parseInt(midseguimiento);
        
        
        GestionSeguimiento gs=new GestionSeguimiento(); 
        seguimiento = gs.obtenerPorId(id_seguimiento);
        id_solicitud = seguimiento.getId_solicitud();
        
            
        GestionSolicitud gsol=new GestionSolicitud(); 
        solicitud=gsol.obtenerPorId(id_solicitud);
        id_tramite = solicitud.getId_tramite();
        id_solicitante = solicitud.getId_solicitante();
            
        GestionSolicitante gsoli= new GestionSolicitante();
        solicitante= gsoli.obtenerPorId(id_solicitante);
                    
        GestionTramite gtm=new GestionTramite(); 
        tramite=gtm.obtenerPorId(id_tramite);
        id_unidadadministrativa=tramite.getId_unidadadministrativa();
            
            
            
             
            
            
        GestionAdjunto gad=new GestionAdjunto(); 
        adjuntos = gad.obtenerPorSeguimiento(id_seguimiento);
            
            
        request.setAttribute("mensaje",mensaje);
        request.setAttribute("seguimiento",seguimiento);
        request.setAttribute("solicitante",solicitante);
        request.setAttribute("solicitud",solicitud);
        request.setAttribute("tramite",tramite);
        request.setAttribute("adjuntos",adjuntos);
        request.setAttribute("pathadjuntos",pathadjuntos);
        request.setAttribute("pathuploads",pathuploads);
        if (id_grupo==1)
        {    
            RequestDispatcher rd=request.getRequestDispatcher("listaradjunto_registrante.jsp");
            rd.forward(request,response);
        }else
        {
            RequestDispatcher rd=request.getRequestDispatcher("listaradjunto.jsp");
            rd.forward(request,response);
            
        }
    }
    
    public void listarjson(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Usuario usuario;
        ArrayList adjuntos;
        Seguimiento seguimiento;
        Solicitud solicitud;
        Solicitante solicitante;
        Tramite tramite;
        Integer id_seguimiento,id_tramite,id_solicitante,id_solicitud;
        //String mensaje="Listado de archivos adjuntos exitoso";
        //String pathadjuntos="build/web/adjuntos/";
        //recupero el usuario de la sesion 
        //HttpSession objSession = request.getSession(); 
        //usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
        //Integer id_grupo=usuario.getId_grupo();
        //Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
        //obetnes datos del seguimiento por id_seguimiento
        String midseguimiento;   
        midseguimiento = request.getParameter("id_seguimiento");  
        id_seguimiento=Integer.parseInt(midseguimiento);
        
        
        GestionSeguimiento gs=new GestionSeguimiento(); 
        seguimiento = gs.obtenerPorId(id_seguimiento);
        id_solicitud = seguimiento.getId_solicitud();
        ArrayList seg=new ArrayList();
        seg.add(seguimiento);
            
        GestionSolicitud gsol=new GestionSolicitud(); 
        solicitud=gsol.obtenerPorId(id_solicitud);
        id_tramite = solicitud.getId_tramite();
        id_solicitante = solicitud.getId_solicitante();
        ArrayList solic=new ArrayList();
        solic.add(solicitud);
            
        GestionSolicitante gsoli= new GestionSolicitante();
        solicitante= gsoli.obtenerPorId(id_solicitante);
        ArrayList sol=new ArrayList();
        sol.add(solicitante);
                    
        GestionTramite gtm=new GestionTramite(); 
        tramite=gtm.obtenerPorId(id_tramite);
        Integer id_unidadadministrativa=tramite.getId_unidadadministrativa();
        ArrayList tram=new ArrayList();
        tram.add(tramite);
          
            
        GestionAdjunto gad=new GestionAdjunto(); 
        adjuntos = gad.obtenerPorSeguimiento(id_seguimiento);
        
        GsonBuilder builder=new GsonBuilder();
        Gson gson=builder.create();
            
        //response.addHeader("Content-Type", "text/html; charset=utf-8; Access-Control-Allow-Origin http://localhost:4200");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET");
        response.setHeader("Content-Type", "application/json; charset=UTF-8");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        response.getWriter().write("{\"data\":"+gson.toJson(adjuntos)+",\"solicitud\":"+gson.toJson(solic)+",\"tramite\":"+gson.toJson(tram)+",\"seguimiento\":"+gson.toJson(seg)+"}");
            
        //request.setAttribute("mensaje",mensaje);
        //request.setAttribute("seguimiento",seguimiento);
        //request.setAttribute("solicitante",solicitante);
        //request.setAttribute("solicitud",solicitud);
        //request.setAttribute("tramite",tramite);
        //request.setAttribute("adjuntos",adjuntos);
        //request.setAttribute("pathadjuntos",pathadjuntos);
        //if (id_grupo==1)
        //{    
        //    RequestDispatcher rd=request.getRequestDispatcher("listaradjunto_registrante.jsp");
        //    rd.forward(request,response);
        //}else
        //{
        //    RequestDispatcher rd=request.getRequestDispatcher("listaradjunto.jsp");
        //    rd.forward(request,response);
            
        //}
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Integer id_seguimiento,id_tramite,id_solicitante,id_solicitud;
        //String mensaje=request.getParameter("mensaje");
        int id_adjunto=Integer.parseInt(request.getParameter("id_adjunto"));
        GestionAdjunto modelo=new GestionAdjunto();
        Adjunto adjunto = modelo.obtenerPorId(id_adjunto);
        id_seguimiento= adjunto.getId_seguimiento();
        String midseguimiento=Integer.toString(id_seguimiento);
        if(modelo.eliminarPorId(id_adjunto))
        {    
            request.setAttribute("mensaje", "Registro eliminado");
            
        }
        else
        {
            request.setAttribute("mensaje", "No se pudo eliminar, el adjunto se encuentra en uso");
        }
        
        Usuario usuario;
        ArrayList adjuntos;
        Seguimiento seguimiento;
        Solicitud solicitud;
        Solicitante solicitante;
        Tramite tramite;
        
        
        String pathadjuntos="adjuntos/";
        //recupero el usuario de la sesion 
        HttpSession objSession = request.getSession(); 
        usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
        Integer id_grupo=usuario.getId_grupo();
        Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
        //obetnes datos del seguimiento por id_seguimiento
        //String midseguimiento;   
        //midseguimiento = request.getParameter("id_seguimiento");  
        id_seguimiento=Integer.parseInt(midseguimiento);
        
        
        GestionSeguimiento gs=new GestionSeguimiento(); 
        seguimiento = gs.obtenerPorId(id_seguimiento);
        id_solicitud = seguimiento.getId_solicitud();
        
            
        GestionSolicitud gsol=new GestionSolicitud(); 
        solicitud=gsol.obtenerPorId(id_solicitud);
        id_tramite = solicitud.getId_tramite();
        id_solicitante = solicitud.getId_solicitante();
            
        GestionSolicitante gsoli= new GestionSolicitante();
        solicitante= gsoli.obtenerPorId(id_solicitante);
                    
        GestionTramite gtm=new GestionTramite(); 
        tramite=gtm.obtenerPorId(id_tramite);
        id_unidadadministrativa=tramite.getId_unidadadministrativa();
            
            
            
             
            
            
        GestionAdjunto gad=new GestionAdjunto(); 
        adjuntos = gad.obtenerPorSeguimiento(id_seguimiento);
        
        
        
        request.setAttribute("seguimiento",seguimiento);
        request.setAttribute("solicitante",solicitante);
        request.setAttribute("solicitud",solicitud);
        request.setAttribute("tramite",tramite);
        request.setAttribute("adjuntos",adjuntos);
        request.setAttribute("pathadjuntos",pathadjuntos);
        
       
        RequestDispatcher rd=request.getRequestDispatcher("listaradjunto.jsp");
        rd.forward(request,response);
        
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String midseguimiento;   
        midseguimiento = request.getParameter("id_seguimiento");  
        Integer id_seguimiento;
        id_seguimiento=Integer.parseInt(midseguimiento);
          
        GestionSeguimiento modelo=new GestionSeguimiento(); 
        Seguimiento  seguimiento = modelo.obtenerPorId(id_seguimiento);
        
        request.setAttribute("seguimiento",seguimiento);
        
        RequestDispatcher rd=request.getRequestDispatcher("frm_adjunto.jsp");
        rd.forward(request,response);
    }
    
    public void grabar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession objSession = request.getSession(); 
        Usuario usuario = (Usuario)(objSession.getAttribute("usuario")); 
        String pathadjuntos="adjuntos/";
            
        Integer id_grupo=usuario.getId_grupo();
        Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
        Integer id_usuario=usuario.getId_usuario();
            
        Part p1 = request.getPart("adjunto");  
        String nombreadjunto = getFileName(p1);
        Boolean adjuntosubido=subirAdjunto(p1);
        
        // leer el id_seguimiento q es enviado como multi part
        Part p2  = request.getPart("id_seguimiento");
        Scanner s2 = new Scanner(p2.getInputStream()); //la clase Scanner es utilizada para leer datos de un dispostivo de entrada o stream
        String midseguimiento = s2.nextLine();    // lectura del stream como cadena de caracteres
        int id_seguimiento=Integer.parseInt(midseguimiento); // pareseo el string a integer
             
          
        Adjunto adjunto = new Adjunto();   
        adjunto.setNombre(nombreadjunto);
        adjunto.setId_usuario(id_usuario);
        adjunto.setId_seguimiento(id_seguimiento);
            
        GestionAdjunto adj=new GestionAdjunto(); 
        Boolean resultado=  adj.registroAdjunto(adjunto);
        String mensaje=null;
        
        if(resultado==true )
        {
            mensaje="Adjunto grabado exitosamente";
            
            GestionSeguimiento modelo=new GestionSeguimiento();
            Boolean actualizaseguimiento=modelo.actualizarSeguimientoAdjunto(id_seguimiento);
        }else
        {
            mensaje="Problemas al grabar adjunto";
        }
            
        GestionSeguimiento gs=new GestionSeguimiento(); 
        Seguimiento seguimiento = gs.obtenerPorId(id_seguimiento);
        int id_solicitud = seguimiento.getId_solicitud();
        
            
        GestionSolicitud gsol=new GestionSolicitud(); 
        Solicitud solicitud=gsol.obtenerPorId(id_solicitud);
        int id_tramite = solicitud.getId_tramite();
        int id_solicitante = solicitud.getId_solicitante();
            
        GestionSolicitante gsoli= new GestionSolicitante();
        Solicitante solicitante= gsoli.obtenerPorId(id_solicitante);
                    
        GestionTramite gtm=new GestionTramite(); 
        Tramite tramite=gtm.obtenerPorId(id_tramite);
        id_unidadadministrativa=tramite.getId_unidadadministrativa();
            
                   
            
            
        GestionAdjunto gad=new GestionAdjunto(); 
        ArrayList adjuntos = gad.obtenerPorSeguimiento(id_seguimiento);
            
            
        request.setAttribute("mensaje",mensaje);
        request.setAttribute("seguimiento",seguimiento);
        request.setAttribute("solicitante",solicitante);
        request.setAttribute("solicitud",solicitud);
        request.setAttribute("tramite",tramite);
        request.setAttribute("adjuntos",adjuntos);
        request.setAttribute("pathadjuntos",pathadjuntos);
        if (id_grupo==1)
        {    
            RequestDispatcher rd=request.getRequestDispatcher("listaradjunto_registrante.jsp");
            rd.forward(request,response);
        }else
        {
            RequestDispatcher rd=request.getRequestDispatcher("listaradjunto.jsp");
            rd.forward(request,response);
            
        }
    }
    
    
    public void grabarfromApp(HttpServletRequest request, HttpServletResponse response) throws Exception{

        Integer id_unidadadministrativa;
        Integer id_usuario=22;
                      
        int id_seguimiento = Integer.parseInt(request.getParameter("id_seguimiento"));  
        String nombreadjunto= request.getParameter("filename");
        Adjunto adjunto = new Adjunto();   
        adjunto.setNombre(nombreadjunto);
        adjunto.setId_usuario(id_usuario);
        adjunto.setId_seguimiento(id_seguimiento);
            
        GestionAdjunto adj=new GestionAdjunto(); 
        Boolean res=  adj.registroAdjunto(adjunto);
        String mensaje=null;
        
        ArrayList resultado = new ArrayList();
        if (res != null){
                                       
            resultado.add(res);
        }
            
        
        if(res==true )
        {
            mensaje="Adjunto grabado exitosamente";
            
            GestionSeguimiento modelo=new GestionSeguimiento();
            Boolean actualizaseguimiento=modelo.actualizarSeguimientoAdjunto(id_seguimiento);
        }else
        {
            mensaje="Problemas al grabar adjunto";
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
    
    public void imprimir(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        Usuario usuario;
        HttpSession objSession = request.getSession(); 
        usuario = (Usuario)(objSession.getAttribute("usuario")); 
        Integer id_seguimiento;
        Integer id_grupo=usuario.getId_grupo();
        Integer id_unidadadministrativa=usuario.getId_unidadadministrativa();
            
        String midseguimiento;   
        midseguimiento = request.getParameter("id_seguimiento");  
        id_seguimiento=Integer.parseInt(midseguimiento);
            
        try 
        {
            cn=conectaMysql.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(ControladorRegistro.class.getName()).log(Level.SEVERE, null, ex);
        }
            
                       
        ServletOutputStream servletOutputStream = response.getOutputStream();
        File reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/adjuntos.jasper"));
            
            
        try
        {
                
            Map param = new HashMap(); //inicializo un objeto HashMap variable,valor
            param.put("sql","where AD.id_seguimiento='"+id_seguimiento+"'");
                    
                
            byte[] bytes = null;
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
