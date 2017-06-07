/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionTipocredito;
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
import javabeans.Tipocredito;
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
@WebServlet(name = "ControladorTipocredito", urlPatterns = {"/controladortipocredito"})
public class ControladorTipocredito extends ControladorBase 
{ 
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionTipocredito modelo=new GestionTipocredito();
        ArrayList tipocreditos=modelo.obtenerTodos();
        request.setAttribute("tipocreditos", tipocreditos);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_tipocreditos.jsp");
        rd.forward(request,response);
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionTipocredito modelo=new GestionTipocredito();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladortipocredito?operacion=listar");
        rd.forward(request,response);
    }
    
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionTipocredito modelo=new GestionTipocredito();
        Tipocredito tipocredito=modelo.obtenerPorId(id);
                   
        request.setAttribute("tipocredito", tipocredito);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificatipocredito.jsp");
        rd.forward(request,response);
    }
    
    /*
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
    */
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
            RequestDispatcher rd=request.getRequestDispatcher("frm_tipocredito.jsp");
            rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Tipocredito tipocredito=new Tipocredito();
        String mdescripcion= request.getParameter("descripcion").toUpperCase();
        tipocredito.setDescripcion(mdescripcion);
                  
        GestionTipocredito modelo=new GestionTipocredito();
        if(modelo.registroTipocredito(tipocredito)){
            RequestDispatcher rd=request.getRequestDispatcher("controladortipocredito?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladortipocredito?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    /*
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteCpp.jasper", param, request, response);
    } */
}

