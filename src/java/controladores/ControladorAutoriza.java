/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controladores;

import Modelo.GestionAutoriza;
import Modelo.GestionDelegacion;
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
import javabeans.Autoriza;
import javabeans.Delegacion;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;


/**
 *
 * @author Isamel
 */
@WebServlet(name = "ControladorAutoriza", urlPatterns = {"/controladorautoriza"})
public class ControladorAutoriza extends ControladorBase {
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
        GestionAutoriza modelo=new GestionAutoriza();
        ArrayList autorizas=modelo.obtenerTodos();
        request.setAttribute("autorizas", autorizas);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_autoriza.jsp");
        rd.forward(request,response);
    }
    
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionAutoriza modelo=new GestionAutoriza();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. Intente más tarde.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorautoriza?operacion=listar");
        rd.forward(request,response);
        
    }
    
   
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionAutoriza modelo=new GestionAutoriza();
        Autoriza autoriza=modelo.obtenerPorId(id);
        
        GestionDelegacion modelodelegacion= new GestionDelegacion();
        ArrayList delegaciones = modelodelegacion.obtenerTodos();
        request.setAttribute("delegaciones", delegaciones);
        request.setAttribute("autoriza", autoriza);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificaautoriza.jsp");
        rd.forward(request,response);
    }
    
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Autoriza autoriza=new Autoriza();
        Integer id_autoriza=Integer.parseInt(request.getParameter("id_autoriza"));
        autoriza.setId_autoriza(id_autoriza);
        autoriza.setNombre(request.getParameter("nombre").toUpperCase());
        autoriza.setCargo(request.getParameter("cargo").toUpperCase());
        Integer id_delegacion=Integer.parseInt(request.getParameter("id_delegacion"));
        autoriza.setId_delegacion(id_delegacion);
          
         
        GestionAutoriza modelo=new GestionAutoriza();
        if(modelo.actualizarAutoriza(autoriza)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorautoriza?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorautoriza?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionDelegacion modelo= new GestionDelegacion();
        ArrayList delegaciones = modelo.obtenerTodos();
        request.setAttribute("delegaciones", delegaciones);
        
        RequestDispatcher rd=request.getRequestDispatcher("frm_autoriza.jsp");
            rd.forward(request,response);
    }
   
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Autoriza autoriza=new Autoriza();
        autoriza.setNombre(request.getParameter("nombre").toUpperCase());
        autoriza.setCargo(request.getParameter("cargo").toUpperCase());
        autoriza.setId_delegacion(Integer.parseInt(request.getParameter("id_delegacion")));
           
        GestionAutoriza modelo=new GestionAutoriza();
        if(modelo.registroAutoriza(autoriza)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorautoriza?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorautoriza?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
     
    /*
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
        
    }*/
    
        public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteAutoriza.jasper", param, request, response);
    }
        
        public void listarJson(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionAutoriza modelo=new GestionAutoriza();
        ArrayList autorizas=modelo.obtenerTodos();
        
        GsonBuilder builder=new GsonBuilder().setDateFormat("yyyy-MM-dd");
        Gson gson=builder.create();
            
        //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        response.getWriter().write("{\"autoriza\":"+gson.toJson(autorizas)+"}");
    }
}
