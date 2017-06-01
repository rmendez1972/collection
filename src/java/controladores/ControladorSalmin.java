/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionSalmin;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javabeans.Status;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javabeans.Salmin;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author Marlon
 */
@WebServlet(name = "ControladorSalmin", urlPatterns = {"/controladorsalmin"})
public class ControladorSalmin extends ControladorBase{
    
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionSalmin modelo = new GestionSalmin();
        ArrayList salmin = modelo.obtenerTodos();
        request.setAttribute("salmin", salmin);
        RequestDispatcher rd=request.getRequestDispatcher("listar_salmin.jsp");
        rd.forward(request,response);
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        RequestDispatcher rd=request.getRequestDispatcher("frm_salmin.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Salmin salmin = new Salmin();
        //se crea el formato
        //se obtiene el parametro de fecha y se guarda en una variable
        String mfecha = request.getParameter("fecha");
        //se le da un formato a la fecha y se almacena en una variable
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        //se hace la conversion de Date -> String
        Date fecha = df.parse(mfecha);
        //se setea
        salmin.setFecha(fecha);
        
        BigDecimal big = new BigDecimal(request.getParameter("importe"));
        salmin.setImporte(big);
       
        GestionSalmin modelo = new GestionSalmin();
        if(modelo.registroSalmin(salmin)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorsalmin?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
            }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorsalmin?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionSalmin modelo = new GestionSalmin();
        Salmin salmin = modelo.obtenerPorId(id);
        
        request.setAttribute("salmin", salmin);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificasalmin.jsp");
        rd.forward(request,response);
    }
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Salmin salmin = new Salmin();
        
        Integer id_salmin = Integer.parseInt(request.getParameter("id_salmin"));
        salmin.setId_salmin(id_salmin);
        
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = df.parse(request.getParameter("fecha"));
        salmin.setFecha(fecha);
        
        BigDecimal big = new BigDecimal(request.getParameter("importe"));
        salmin.setImporte(big);
          
        GestionSalmin modelo = new GestionSalmin();
        if(modelo.actualizarSalmin(salmin)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorsalmin?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorsalmin?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionSalmin modelo=new GestionSalmin();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. El usuario tiene solicitudes registradas.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorsalmin?operacion=listar");
        rd.forward(request,response);
    }
    
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteSalmin.jasper", param, request, response);
    } 
    
    
    
}
