/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperRunManager;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author arturo
 */
public class ControladorBase extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String operacion=request.getParameter("operacion");

        try{
            Class[] mParams={HttpServletRequest.class, HttpServletResponse.class};
            Method metodo=this.getClass().getMethod(operacion, mParams);
            metodo.invoke(this, request, response);
        }
        catch(Exception e){
            e.printStackTrace();
            return;
        }
    }
    
    public void generarReporte(String reporte, Map param, HttpServletRequest request, HttpServletResponse response) throws Exception{

            Connection cn=Modelo.conectaMysql.getConnection();
            File reportFile = new File(getServletConfig().getServletContext().getRealPath("/Reportes/"+reporte));
            
            byte[] bytes = null;
            bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),param, cn);
            
            ServletOutputStream servletOutputStream = response.getOutputStream();
            response.setContentType("application/pdf");
                
            response.setContentLength(bytes.length);
            servletOutputStream.write(bytes, 0, bytes.length);
                
            servletOutputStream.flush();
            servletOutputStream.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
