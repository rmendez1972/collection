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
        
        SimpleDateFormat formato = new SimpleDateFormat("yyyy/mm/dd");
        String ParFecha = request.getParameter("fecha");
        
        //Date Fecha = formato.parse(ParFecha);
        
        //salmin.setFecha(null);
        
        //salmin.setFecha(formato.parse(ParFecha));
        
        
        
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
    
    
}
