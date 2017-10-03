/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionBeneficiario;
import Modelo.GestionMov_edocta;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javabeans.Beneficiario;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Marlon
 */
@WebServlet(name = "ControladorVencidos", urlPatterns = {"/controladorvencidos"})
public class ControladorVencidos extends ControladorBase{
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        
        //se obtiene el parametro de fecha la fecha de corte y se guarda en una variable
        String mfecha_corte = request.getParameter("fecha_corte");
        //se le da un formato a la fecha de corte y se almacena en una variable
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        //se hace la conversion de Date -> String
        Date fecha = df.parse(mfecha_corte);
        //obteniendo el parametro del id beneficiario
        int id_benef=Integer.parseInt(request.getParameter("id_benef"));
        
        GestionMov_edocta modelo=new GestionMov_edocta();
        ArrayList movimientos=modelo.obtenerMovimientosPorBenefId(id_benef);
        
        //obteniendo los datos del beneficiario
        GestionBeneficiario mod_benef = new GestionBeneficiario();
        Beneficiario benef = mod_benef.obtenerPorId(id_benef);
        
        request.setAttribute("movvencidos", movimientos);
        RequestDispatcher rd=request.getRequestDispatcher("listar_mov_vencidos.jsp");
        rd.forward(request,response);
        
    }
    
    
    
}
