/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionBonificacion;
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
import javabeans.Bonificacion;
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
@WebServlet(name = "ControladorBonificacion", urlPatterns = {"/controladorbonificacion"})
public class ControladorBonificacion extends ControladorBase 
{ 
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionBonificacion modelo=new GestionBonificacion();
        ArrayList bonificaciones=modelo.obtenerTodos();
        request.setAttribute("bonificaciones", bonificaciones);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_bonificaciones.jsp");
        rd.forward(request,response);
    }
    
    public void listarJson(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionBonificacion modelo=new GestionBonificacion();
        ArrayList bonificaciones=modelo.obtenerTodos();
        
        GsonBuilder builder=new GsonBuilder();
        Gson gson=builder.create();

        //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        response.getWriter().write("{\"bonificaciones\":"+gson.toJson(bonificaciones)+"}");
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionBonificacion modelo=new GestionBonificacion();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorbonificacion?operacion=listar");
        rd.forward(request,response);
    }
    
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionBonificacion modelo=new GestionBonificacion();
        Bonificacion bonificacion=modelo.obtenerPorId(id);
                   
        request.setAttribute("bonificacion", bonificacion);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificabonificacion.jsp");
        rd.forward(request,response);
    }
    
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Bonificacion bonificacion=new Bonificacion();
        Integer id_bonific=Integer.parseInt(request.getParameter("id_bonific"));
        bonificacion.setId_bonific(id_bonific);
        bonificacion.setClave_bonific(request.getParameter("clave_bonific").toUpperCase());
        bonificacion.setDescripcion(request.getParameter("descripcion").toUpperCase());
                  
        GestionBonificacion modelo=new GestionBonificacion();
        if(modelo.actualizar(bonificacion)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorbonificacion?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorbonificaciono?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
            RequestDispatcher rd=request.getRequestDispatcher("frm_bonificacion.jsp");
            rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Bonificacion bonificacion=new Bonificacion();
        String mclave_bonific= request.getParameter("clave_bonific").toUpperCase();
        bonificacion.setClave_bonific(mclave_bonific);
        String mdescripcion= request.getParameter("descripcion").toUpperCase();
        bonificacion.setDescripcion(mdescripcion);
                  
        GestionBonificacion modelo=new GestionBonificacion();
        if(modelo.registroBonificacion(bonificacion)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorbonificacion?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorbonificacion?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteBonificacion.jasper", param, request, response);
    }
}

