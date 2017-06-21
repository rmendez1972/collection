/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionCandidatos;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javabeans.Candidatos;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperRunManager;



/**
 *
 * @author Rafael Mendez
 */
@WebServlet(name = "ControladorCandidato", urlPatterns = {"/controladorcandidato"})
public class ControladorCandidato extends ControladorBase 
{ 
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionCandidatos modelo=new GestionCandidatos();
        ArrayList candidatos=modelo.obtenerCandidatos();
        request.setAttribute("candidatos", candidatos);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_candidatos.jsp");
        rd.forward(request,response);
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionCandidatos modelo=new GestionCandidatos();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. Intente más tarde.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorcandidato?operacion=listar");
        rd.forward(request,response);
    }
    
    /*
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionCpp modelo=new GestionCpp();
        Cpp cpp=modelo.obtenerPorId(id);
                   
        request.setAttribute("cpp", cpp);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificacpp.jsp");
        rd.forward(request,response);
    }
    
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Cpp cpp=new Cpp();
        Integer id_cpp=Integer.parseInt(request.getParameter("id_cpp"));
        cpp.setId_cpp(id_cpp);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = df.parse(request.getParameter("fecha"));
        cpp.setFecha(fecha);
        BigDecimal big = new BigDecimal(request.getParameter("importe"));
        cpp.setImporte(big);
          
         
        GestionCpp modelo=new GestionCpp();
        if(modelo.actualizarCpp(cpp)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorcpp?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorcpp?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
            RequestDispatcher rd=request.getRequestDispatcher("frm_cpp.jsp");
            rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Cpp cpp=new Cpp();
        String mfecha= request.getParameter("fecha");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = df.parse(mfecha);
        cpp.setFecha(fecha);
        BigDecimal big = new BigDecimal(request.getParameter("importe"));
        cpp.setImporte(big);
           
        GestionCpp modelo=new GestionCpp();
        if(modelo.registroCpp(cpp)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorcpp?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorcpp?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteCpp.jasper", param, request, response);
    } */
}

