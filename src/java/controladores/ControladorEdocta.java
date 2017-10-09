/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionMov_edocta;
import java.util.ArrayList;
import java.util.Iterator;
import javabeans.Mov_edocta;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Marlon
 */
@WebServlet(name = "ControladorEdocta", urlPatterns = {"/controladoredocta"})
public class ControladorEdocta extends ControladorBase{
    
    public void formulario(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        
        
    }
    
    
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionMov_edocta modelo=new GestionMov_edocta();
        ArrayList movimientos=modelo.obtenerMovimientosPorBenefId(id);
        
        //iterador para iterar sobre el arreglo de movbonific para sacar el valor de id_bonificacion
        Iterator<Mov_edocta> it = movimientos.iterator();
        Mov_edocta mov_edocta = new Mov_edocta();
        while(it.hasNext()){
             mov_edocta = it.next();
        }       
        Integer id_beneficiario = mov_edocta.getId_benef();
        
        ArrayList sumamov = modelo.obtenerSuma(id);
        
        request.setAttribute("movimientos", movimientos);
        request.setAttribute("id_benef", id_beneficiario);
        request.setAttribute("sumamov", sumamov);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_edoscta.jsp");
        rd.forward(request,response);
    
    }
    
}
