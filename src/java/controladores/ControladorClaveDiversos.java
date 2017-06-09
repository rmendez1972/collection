/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionClaveDiversos;
import java.math.BigDecimal;
import javabeans.ClaveDiversos;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Marlon
 */
@WebServlet(name = "ControladorClaveDiversos", urlPatterns = {"/controladorclavediversos"})
public class ControladorClaveDiversos extends ControladorBase{
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionClaveDiversos modelo = new GestionClaveDiversos();
        ArrayList cd = modelo.obtenerTodos();
        request.setAttribute("cd", cd);
        RequestDispatcher rd=request.getRequestDispatcher("listar_clavediv.jsp");
        rd.forward(request,response);
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        RequestDispatcher rd=request.getRequestDispatcher("frm_clavediv.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        ClaveDiversos cd = new ClaveDiversos();
        
        cd.setClave_div(request.getParameter("clave_div").toUpperCase());
        cd.setDescripcion(request.getParameter("descripcion").toUpperCase());
        BigDecimal big = new BigDecimal(request.getParameter("importe"));
        cd.setImporte(big);
        cd.setCuenta_cont(request.getParameter("cuenta_cont").toUpperCase());     
        
        GestionClaveDiversos modelo = new GestionClaveDiversos();
        if(modelo.registroClvdiv(cd)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorclavediversos?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
            }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorclavediversos?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionClaveDiversos modelo = new GestionClaveDiversos();
        ClaveDiversos cd = modelo.obtenerPorId(id);
        
        request.setAttribute("cd", cd);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificaclavediv.jsp");
        rd.forward(request,response);
    }
    
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ClaveDiversos cd = new ClaveDiversos();
        Integer id_clave_div = Integer.parseInt(request.getParameter("id_clave_div"));
        cd.setId_clave_div(id_clave_div);
        cd.setClave_div(request.getParameter("clave_div").toUpperCase());
        cd.setDescripcion(request.getParameter("descripcion").toUpperCase());
        BigDecimal big = new BigDecimal(request.getParameter("importe"));
        cd.setImporte(big);
        cd.setCuenta_cont(request.getParameter("cuenta_cont").toUpperCase());
        
        GestionClaveDiversos modelo = new GestionClaveDiversos();
        if(modelo.actualizarClvdiv(cd)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorclavediversos?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
            }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorclavediversos?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionClaveDiversos modelo=new GestionClaveDiversos();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. El usuario tiene solicitudes registradas.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorclavediversos?operacion=listar");
        rd.forward(request,response);
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteClaveDiversos.jasper", param, request, response);
    } 
    
}
