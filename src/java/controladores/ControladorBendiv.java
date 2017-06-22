/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controladores;

import Modelo.GestionBendiv;
import Modelo.GestionUsuario;
import Modelo.GestionProgramas;

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

import javabeans.BeneficiarioDiv;
import javabeans.Usuario;
import javabeans.CatProgramas;

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
@WebServlet(name = "ControladorBendiv", urlPatterns = {"/controladorbendiv"})
public class ControladorBendiv extends ControladorBase {
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

    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionBendiv modelo=new GestionBendiv();
        ArrayList bendivs=modelo.obtenerTodos();
        request.setAttribute("bendivs", bendivs);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_bendiv.jsp");
        rd.forward(request,response);
    }
    
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionBendiv modelo=new GestionBendiv();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. Intente más tarde.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorbendiv?operacion=listar");
        rd.forward(request,response);
        
    }
    
   
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionBendiv modelo=new GestionBendiv();
        BeneficiarioDiv bendivs=modelo.obtenerPorId(id);
        //GestionDelegacion modelodelegacion= new GestionDelegacion();
        GestionUsuario modelousuario= new GestionUsuario();
        ArrayList usuarios = modelousuario.obtenerUsuarios();
        request.setAttribute("usuarios", usuarios);
        request.setAttribute("bendivs", bendivs);
        
        //ArrayList programas = modeloprogramas.obtenerProgramas();
        //request.setAttribute("programas", programas);
        
        
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificabendiv.jsp");
        rd.forward(request,response);
    }
    
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        BeneficiarioDiv bendiv=new BeneficiarioDiv();
        Integer id_bendiv=Integer.parseInt(request.getParameter("id_bendiv"));
        bendiv.setId_bendiv(id_bendiv);
        bendiv.setClave_elect(request.getParameter("clave_elect").toUpperCase());
        bendiv.setCurp(request.getParameter("curp").toUpperCase());
        bendiv.setClave_b(request.getParameter("clave_b").toUpperCase());
        bendiv.setNombre(request.getParameter("nombre").toUpperCase());
        
        Integer id_catprog=Integer.parseInt(request.getParameter("id_catprog"));
        bendiv.setId_catprog(id_catprog);
        
        Integer id_usuario=Integer.parseInt(request.getParameter("id_usuario"));
        bendiv.setId_usuario(id_usuario);
        
        GestionBendiv modelo=new GestionBendiv();
        if(modelo.actualizarBendiv(bendiv)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorabendiv?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorbendiv?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        //Se obtienen los programas para poblar el select en la vista para añadir un beneficiario div
        GestionProgramas modelo= new GestionProgramas();
        ArrayList programas = modelo.obtenerTodos();
        request.setAttribute("programas", programas);
        
        RequestDispatcher rd=request.getRequestDispatcher("frm_bendiv.jsp");
            rd.forward(request,response);
    }
   
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        BeneficiarioDiv bendiv=new BeneficiarioDiv();
        
        bendiv.setClave_elect(request.getParameter("clave_elect").toUpperCase());
        bendiv.setCurp(request.getParameter("curp").toUpperCase());
        bendiv.setClave_b(request.getParameter("clave_b").toUpperCase());
        bendiv.setNombre(request.getParameter("nombre").toUpperCase());
        bendiv.setId_catprog(Integer.parseInt(request.getParameter("id_catprog")));
        bendiv.setId_usuario(Integer.parseInt(request.getParameter("id_usuario")));
           
        GestionBendiv modelo=new GestionBendiv();
        if(modelo.registroBendiv(bendiv)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorbendiv?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorbendiv?operacion=nuevo");
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
        generarReporte("ReporteBendiv.jasper", param, request, response);
    }
}
