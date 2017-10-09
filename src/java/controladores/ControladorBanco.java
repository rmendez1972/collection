/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionBanco;
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
import javabeans.Banco;
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
@WebServlet(name = "ControladorBanco", urlPatterns = {"/controladorbanco"})
public class ControladorBanco extends ControladorBase 
{ 
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionBanco modelo=new GestionBanco();
        ArrayList bancos=modelo.obtenerTodos();
        request.setAttribute("bancos", bancos);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_bancos.jsp");
        rd.forward(request,response);
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionBanco modelo=new GestionBanco();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorbanco?operacion=listar");
        rd.forward(request,response);
    }
    
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionBanco modelo=new GestionBanco();
        Banco banco=modelo.obtenerPorId(id);
                   
        request.setAttribute("banco", banco);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificabanco.jsp");
        rd.forward(request,response);
    }
    
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Banco banco=new Banco();
        Integer id_banco=Integer.parseInt(request.getParameter("id_banco"));
        banco.setId_banco(id_banco);
        banco.setDescripcion(request.getParameter("descripcion").toUpperCase());
          
         
        GestionBanco modelo=new GestionBanco();
        if(modelo.actualizar(banco)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorbanco?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorbanco?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
            RequestDispatcher rd=request.getRequestDispatcher("frm_banco.jsp");
            rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Banco banco=new Banco();
        String mdescripcion= request.getParameter("descripcion").toUpperCase();
        banco.setDescripcion(mdescripcion);
                  
        GestionBanco modelo=new GestionBanco();
        if(modelo.registroBanco(banco)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorbanco?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorbanco?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    /*
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteTipocredito.jasper", param, request, response);
    }*/
}

