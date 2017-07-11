/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionBeneficiario;
import Modelo.GestionCandidatos;
import Modelo.GestionProgramas;
import Modelo.GestionTipocredito;
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
import javabeans.Beneficiario;
import javabeans.Candidatos;
import javabeans.CatProgramas;
import javabeans.Usuario;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JasperRunManager;



/**
 *
 * @author Rafael Mendez
 */
@WebServlet(name = "ControladorCandidato", urlPatterns = {"/controladorcandidato"})
public class ControladorCandidato extends ControladorBase 
{ 
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionCandidatos modelo=new GestionCandidatos();
        ArrayList candidatos=modelo.obtenerCandidatos();
        request.setAttribute("candidatos", candidatos);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_candidatos.jsp");
        rd.forward(request,response);
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionCandidatos modelo=new GestionCandidatos();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. Intente más tarde.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorcandidato?operacion=listar");
        rd.forward(request,response);
    }
    
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionCandidatos modelo=new GestionCandidatos();
        Candidatos candidato=modelo.obtenerPorId(id);
        
        GestionProgramas mod_prog=new GestionProgramas();
        GestionTipocredito mod_tcr=new GestionTipocredito();
        ArrayList prog=mod_prog.obtenerTodos();
        ArrayList tipo=mod_tcr.obtenerTodos();
                   
        request.setAttribute("candidato", candidato);
        request.setAttribute("prog", prog);
        request.setAttribute("tipo", tipo);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificacandidato.jsp");
        rd.forward(request,response);
    }
    
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Candidatos candidato=new Candidatos();
        Integer id_candidato=Integer.parseInt(request.getParameter("id_candidato"));
        candidato.setId_candidato(id_candidato);
        Integer id_catprog=Integer.parseInt(request.getParameter("id_catprog"));
        candidato.setId_catprog(id_catprog);
        String num_contrato=request.getParameter("numcontrato");
        candidato.setNumcontrato(num_contrato);
        String clave_elect=request.getParameter("clave_elect").toUpperCase();
        candidato.setClave_elect(clave_elect);
        String curp=request.getParameter("curp").toUpperCase();
        candidato.setCurp(curp);
        String rfc=request.getParameter("rfc").toUpperCase();
        candidato.setRfc(rfc);
        String nombre=request.getParameter("nombre").toUpperCase();
        candidato.setNombre(nombre);
        String conyuge=request.getParameter("conyuge").toUpperCase();
        candidato.setConyuge(conyuge);
               
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_con = df.parse(request.getParameter("fecha_con"));
        candidato.setFecha_con(fecha_con);
        String mza=request.getParameter("mza").toUpperCase();
        candidato.setMza(mza);
        String lte=request.getParameter("lte").toUpperCase();
        candidato.setLte(lte);
        BigDecimal area = new BigDecimal(request.getParameter("area"));
        candidato.setArea(area);
        String domicilio=request.getParameter("domicilio").toUpperCase();
        candidato.setDomicilio(domicilio);
        String clave_cat=request.getParameter("clave_cat").toUpperCase();
        candidato.setClave_cat(clave_cat);
        Integer id_tipocredito=Integer.parseInt(request.getParameter("id_tipocredito"));
        candidato.setId_tipocredito(id_tipocredito);        
        
        HttpSession objSession = request.getSession(); 
        Usuario usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
        Integer id_usuario=usuario.getId_usuario();
        candidato.setId_usuario(id_usuario);
        GestionProgramas mod_gp= new GestionProgramas();
        CatProgramas programa=mod_gp.obtenerPorId(id_catprog);
        String clave_b=programa.getClave()+'-'+num_contrato;
        candidato.setClave_b(clave_b);
        
        GestionCandidatos modelo=new GestionCandidatos();
        if(modelo.actualizarCandidatos(candidato)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorcandidato?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorcandidato?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void aperturar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionCandidatos modelo=new GestionCandidatos();
        Candidatos candidato=modelo.obtenerPorId(id);
                          
        request.setAttribute("candidato", candidato);
                            
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificacandidatoapertura.jsp");
        rd.forward(request,response);
    }
    
    public void aperturarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Integer id_candidato=Integer.parseInt(request.getParameter("id_candidato"));
         
        GestionCandidatos modelo=new GestionCandidatos();
        Candidatos candidato=modelo.obtenerPorId(id_candidato);
        
        String poliza=request.getParameter("poliza");
        candidato.setPoliza(poliza);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_pol = df.parse(request.getParameter("fecha_pol"));
        candidato.setFecha_pol(fecha_pol);
        HttpSession objSession = request.getSession(); 
        Usuario usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
        Integer id_usuario=usuario.getId_usuario();
        candidato.setId_usuario(id_usuario);
        
        
        /*seteamos al bean de beneficiario*/
        Beneficiario beneficiario = new Beneficiario();
        beneficiario.setId_catprog(candidato.getId_catprog());
        beneficiario.setNumcontrato(candidato.getNumcontrato());
        beneficiario.setClave_elect(candidato.getClave_elect());
        beneficiario.setCurp(candidato.getCurp());
        beneficiario.setRfc(candidato.getRfc());
        beneficiario.setNombre(candidato.getNombre());
        beneficiario.setConyuge(candidato.getConyuge());
               
        //DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        //Date fecha_con = df.parse(request.getParameter("fecha_con"));
        beneficiario.setFecha_con(candidato.getFecha_con());
        beneficiario.setMza(candidato.getMza());
        beneficiario.setLte(candidato.getLte());
        //BigDecimal area = new BigDecimal(request.getParameter("area"));
        beneficiario.setArea(candidato.getArea());
        beneficiario.setDomicilio(candidato.getDomicilio());
        beneficiario.setClave_cat(candidato.getClave_cat());
        beneficiario.setId_tipocredito(candidato.getId_tipocredito());   
        beneficiario.setId_usuario(candidato.getId_usuario());
        beneficiario.setPoliza(candidato.getPoliza());
        beneficiario.setFecha_pol(candidato.getFecha_pol());
        beneficiario.setClave_b(candidato.getClave_b());
                                
        GestionBeneficiario mod_ben = new GestionBeneficiario();
        
        if(modelo.actualizaraperturaCandidatos(candidato) && mod_ben.registroBeneficiario(beneficiario)){
            modelo.eliminarPorId(id_candidato);
            RequestDispatcher rd=request.getRequestDispatcher("controladorcandidato?operacion=listar");
            request.setAttribute("msg", "Ciudadano Contratado Ingresado al Catálogo de Beneficiarios (CxC)");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorcandidato?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionProgramas mod_prog=new GestionProgramas();
        GestionTipocredito mod_tcr=new GestionTipocredito();
        ArrayList prog=mod_prog.obtenerTodos();
        ArrayList tipo=mod_tcr.obtenerTodos();
        
        request.setAttribute("prog", prog);
        request.setAttribute("tipo", tipo);
        RequestDispatcher rd=request.getRequestDispatcher("frm_candidato.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Candidatos candidato=new Candidatos();
        Integer id_catprog=Integer.parseInt(request.getParameter("id_catprog"));
        candidato.setId_catprog(id_catprog);
        String num_contrato=request.getParameter("numcontrato");
        candidato.setNumcontrato(num_contrato);
        String clave_elect=request.getParameter("clave_elect").toUpperCase();
        candidato.setClave_elect(clave_elect);
        String curp=request.getParameter("curp").toUpperCase();
        candidato.setCurp(curp);
        String rfc=request.getParameter("rfc").toUpperCase();
        candidato.setRfc(rfc);
        String nombre=request.getParameter("nombre").toUpperCase();
        candidato.setNombre(nombre);
        String conyuge=request.getParameter("conyuge").toUpperCase();
        candidato.setConyuge(conyuge);
               
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_con = df.parse(request.getParameter("fecha_con"));
        candidato.setFecha_con(fecha_con);
        String mza=request.getParameter("mza").toUpperCase();
        candidato.setMza(mza);
        String lte=request.getParameter("lte").toUpperCase();
        candidato.setLte(lte);
        BigDecimal area = new BigDecimal(request.getParameter("area"));
        candidato.setArea(area);
        String domicilio=request.getParameter("domicilio").toUpperCase();
        candidato.setDomicilio(domicilio);
        String clave_cat=request.getParameter("clave_cat").toUpperCase();
        candidato.setClave_cat(clave_cat);
        Integer id_tipocredito=Integer.parseInt(request.getParameter("id_tipocredito"));
        candidato.setId_tipocredito(id_tipocredito);
        HttpSession objSession = request.getSession(); 
        Usuario usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
        Integer id_usuario=usuario.getId_usuario();
        candidato.setId_usuario(id_usuario);
        GestionProgramas mod_gp= new GestionProgramas();
        CatProgramas programa=mod_gp.obtenerPorId(id_catprog);
        String clave_b=programa.getClave()+'-'+num_contrato;
        candidato.setClave_b(clave_b);
        GestionCandidatos modelo=new GestionCandidatos();
        if(modelo.registroCandidatos(candidato)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorcandidato?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorcandidato?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    /*
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteCpp.jasper", param, request, response);
    } */
}

