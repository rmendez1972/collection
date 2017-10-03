/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionTramite;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javabeans.Tramite;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;

/**
 *
 * @author Rafael Mendez
 */
@WebServlet(name = "Tramites2", urlPatterns = {"/tramites2"})
public class Tramites2 extends HttpServlet 
{
    public Tramites2 () 
    {
        //super();
    }
    String lista = "";
    public Connection cn;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
                GestionTramite tramite = new GestionTramite();
                //acceder al metodo buscaPaises
                
                Tramite tramites = new Tramite();
                Integer id_unidadAdministrativa;
                if (request.getParameter("id_unidadAdministrativa")==""){
                    id_unidadAdministrativa=0;
                }else
                {    
                    id_unidadAdministrativa = Integer.parseInt(request.getParameter("id_unidadAdministrativa").toString());
                }
                ArrayList tm = tramite.obtenerPorUnidadAdministrativa(id_unidadAdministrativa);
                if (tm.size() != 0) 
                {
                    lista = "\"" + "Tramites" + "\":" + "[";
                        for (int x = 0; x < tm.size(); x=x+1) 
                        {
                            
                            tramites=(Tramite) tm.get(x);
                            Integer id_tramite= tramites.getId_tramite();
                            String nombre= tramites.getNombre();
                            
                            lista += "{" + "\"" + "id_tramite" + "\"" + ":" + id_tramite.toString() + "," +"\"" + "nombre" + "\"" + ":" + " \"" + nombre + "\"" + "}" + ",";
                            //formar la cadena en formato JSON para enviarlo a la vista con jquery
                        }
                        //quitar la ultima coma para parsear la cadena JSON
                        lista = lista.substring(0, lista.length() - 1);
                } else 
                {
                    //out.println("No se logro obtener datos");
                    Integer id_tramite=0;
                    String nombre= "Sin trámites";
                    lista = "\"" + "Tramites" + "\":" + "["+"{" + "\"" + "id_tramite" + "\"" + ":" + id_tramite.toString() + "," +"\"" + "nombre" + "\"" + ":" + " \"" + nombre + "\"" + "}";
                }
            } finally 
        { 
            out.println("{" + lista + "]}");
            System.out.println("{" + lista + "]}");
            out.close();
        }
    }
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
            processRequest(request, response);
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(Tramites2.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    try {
            processRequest(request, response);
        } catch (Exception ex) 
        {
            Logger.getLogger(Tramites2.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public String getServletInfo() 
    {
        return "Short description";
    }// </editor-fold>
    
}
