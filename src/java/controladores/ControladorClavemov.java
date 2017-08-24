/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionClavemov;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javabeans.Clavemov;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author Rafael Méndez
 */
@WebServlet(name = "ControladorClavemov", urlPatterns = {"/controladorclavemov"})
public class ControladorClavemov extends ControladorBase {
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        GestionClavemov modelo=new GestionClavemov();
        ArrayList clave_movs=modelo.obtenerTodos();
        request.setAttribute("clave_movs", clave_movs);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_clavemov.jsp");
        rd.forward(request,response);
    }
    
    public void listarJson(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        GestionClavemov modelo=new GestionClavemov();
        ArrayList clave_movs=modelo.obtenerTodos();
        
        GsonBuilder builder=new GsonBuilder();
        Gson gson=builder.create();

        //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        response.getWriter().write("{\"clavemov\":"+gson.toJson(clave_movs)+"}");
        
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        RequestDispatcher rd=request.getRequestDispatcher("frm_clavemov.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionClavemov modelo=new GestionClavemov();
        Clavemov clavemov=new Clavemov();
        clavemov.setClave_mov(request.getParameter("clave_mov").toUpperCase());
        clavemov.setDescripcion(request.getParameter("descripcion").toUpperCase());
        
        if(modelo.registroClavemov(clavemov))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladorclavemov?operacion=listar");
        rd.forward(request,response);
    }
    
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id = Integer.parseInt(request.getParameter("id"));
        GestionClavemov modelo = new GestionClavemov();
        
        Clavemov clavemov = modelo.obtenerPorId(id);
        
        request.setAttribute("clavemov", clavemov);
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificaclavemov.jsp");
        rd.forward(request,response);
    
    }
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionClavemov modelo=new GestionClavemov();
        Clavemov clavemov=new Clavemov();
        clavemov.setId_clave_mov(Integer.parseInt(request.getParameter("id_clave_mov")));
        clavemov.setDescripcion(request.getParameter("descripcion").toUpperCase());
        clavemov.setClave_mov(request.getParameter("clave_mov").toUpperCase());
        
        if(modelo.actualizar(clavemov))
            request.setAttribute("msg", "Datos guardados");
        else
            request.setAttribute("msg", "Error al guardar, intente de nuevo más tarde");
        RequestDispatcher rd=request.getRequestDispatcher("controladorclavemov?operacion=listar");
        rd.forward(request,response);
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionClavemov modelo=new GestionClavemov();
        
        if(modelo.eliminarPorId(id))
            request.setAttribute("msg", "Registro eliminado");
        else
            request.setAttribute("msg", "No se pudo eliminar, intente más tarde.");
        RequestDispatcher rd=request.getRequestDispatcher("controladorclavemov?operacion=listar");
        rd.forward(request,response);
    }
    /*
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteNiveles.jasper", param, request, response);
    }
    
    */
    
}
