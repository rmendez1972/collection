/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionSalmindf;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
import javabeans.Salmindf;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author Ismael
 */

@WebServlet(name = "Controladorsalmindf", urlPatterns = {"/controladorsalmindf"})
public class ControladorSalmindf extends ControladorBase {

    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionSalmindf modelo=new GestionSalmindf();
        ArrayList salmindf=modelo.obtenerSalmindf();
        request.setAttribute("salmindf", salmindf);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_salmindf.jsp");
        rd.forward(request,response);
    }
    
    public void listarJson(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionSalmindf modelo=new GestionSalmindf();
        ArrayList salmindf=modelo.obtenerSalmindf();
        GsonBuilder builder=new GsonBuilder().setDateFormat("yyyy-MM-dd");
        Gson gson=builder.create();

        //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        response.getWriter().write("{\"salmindf\":"+gson.toJson(salmindf)+"}");
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionSalmindf modelo=new GestionSalmindf();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }  else{
                request.setAttribute("msg", "No es posible eliminar. Intente más tarde.");
        }    
        RequestDispatcher rd=request.getRequestDispatcher("controladorsalmindf?operacion=listar");
        rd.forward(request,response);
    }
    
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionSalmindf modelo=new GestionSalmindf();
        Salmindf salmindf=modelo.obtenerPorId(id);
        
        request.setAttribute("salmindf", salmindf);
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificasalmindf.jsp");
        rd.forward(request,response);
    }
    
 
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Salmindf salmindf=new Salmindf();
        Integer id_salmindf=Integer.parseInt(request.getParameter("id_salmindf"));
        salmindf.setId_salmindf(id_salmindf);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = df.parse(request.getParameter("fecha"));
        salmindf.setFecha(fecha);
        BigDecimal big = new BigDecimal(request.getParameter("importe"));
        salmindf.setImporte(big);
          
         
        GestionSalmindf modelo=new GestionSalmindf();
        if(modelo.actualizarSalmindf(salmindf)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorsalmindf?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorsalmindf?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
   
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        RequestDispatcher rd=request.getRequestDispatcher("frm_salmindf.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Salmindf salmindf=new Salmindf();
        String mfecha= request.getParameter("fecha");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = df.parse(mfecha);
        salmindf.setFecha(fecha);
        BigDecimal big = new BigDecimal(request.getParameter("importe"));
        salmindf.setImporte(big);
           
        GestionSalmindf modelo=new GestionSalmindf();
        if(modelo.registroSalmindf(salmindf)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorsalmindf?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorsalmindf?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteSalmindf.jasper", param, request, response);
    } 
}
