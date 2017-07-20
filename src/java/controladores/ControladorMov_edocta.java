/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionBeneficiario;
import Modelo.GestionMov_edocta;

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
import javabeans.Mov_edocta;
import javabeans.ParametrosApertura;
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
@WebServlet(name = "ControladorMov_edocta", urlPatterns = {"/controladormov_edocta"})
public class ControladorMov_edocta extends ControladorBase 
{ 
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionMov_edocta modelo=new GestionMov_edocta();
        ArrayList movimientos=modelo.obtenerMovimientos();
        request.setAttribute("movimientos", movimientos);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_mov_edoscta.jsp");
        rd.forward(request,response);
    }
    
    /*
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionBeneficiario modelo=new GestionBeneficiario();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. Este Beneficiario ya cuenta con Movimientos en Edo. de Cuenta.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorbeneficiario?operacion=listar");
        rd.forward(request,response);
    }
    */
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionMov_edocta modelo=new GestionMov_edocta();
        Mov_edocta movimiento=modelo.obtenerPorId(id);
        int id_benef=movimiento.getId_benef();
        GestionBeneficiario modelo_ben= new GestionBeneficiario();
        ArrayList beneficiarios=modelo_ben.obtenerBeneficiarios();
        
        request.setAttribute("movimiento", movimiento);
        request.setAttribute("beneficiarios", beneficiarios);
                    
        RequestDispatcher rd=request.getRequestDispatcher("frm_modificamov_edocta.jsp");
        rd.forward(request,response);
    }
    
    /*
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Beneficiario benef=new Beneficiario();
        Integer id_beneficiario=Integer.parseInt(request.getParameter("id_beneficiario"));
        benef.setId_beneficiario(id_beneficiario);
        Integer id_catprog=Integer.parseInt(request.getParameter("id_catprog"));
        benef.setId_catprog(id_catprog);
        String num_contrato=request.getParameter("numcontrato");
        benef.setNumcontrato(num_contrato);
        String clave_elect=request.getParameter("clave_elect").toUpperCase();
        benef.setClave_elect(clave_elect);
        String curp=request.getParameter("curp").toUpperCase();
        benef.setCurp(curp);
        String rfc=request.getParameter("rfc").toUpperCase();
        benef.setRfc(rfc);
        String nombre=request.getParameter("nombre").toUpperCase();
        benef.setNombre(nombre);
        String conyuge=request.getParameter("conyuge").toUpperCase();
        benef.setConyuge(conyuge);
               
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_con = df.parse(request.getParameter("fecha_con"));
        benef.setFecha_con(fecha_con);
        String mza=request.getParameter("mza").toUpperCase();
        benef.setMza(mza);
        String lte=request.getParameter("lte").toUpperCase();
        benef.setLte(lte);
        BigDecimal area = new BigDecimal(request.getParameter("area"));
        benef.setArea(area);
        String domicilio=request.getParameter("domicilio").toUpperCase();
        benef.setDomicilio(domicilio);
        String clave_cat=request.getParameter("clave_cat").toUpperCase();
        benef.setClave_cat(clave_cat);
        Integer id_tipocredito=Integer.parseInt(request.getParameter("id_tipocredito"));
        benef.setId_tipocredito(id_tipocredito);        
        
        HttpSession objSession = request.getSession(); 
        Usuario usuario = (Usuario)(objSession.getAttribute("usuario")); 
            
        Integer id_usuario=usuario.getId_usuario();
        benef.setId_usuario(id_usuario);
        GestionProgramas mod_gp= new GestionProgramas();
        CatProgramas programa=mod_gp.obtenerPorId(id_catprog);
        String clave_b=programa.getClave()+'-'+num_contrato;
        benef.setClave_b(clave_b);
        Date fecha_ip = df.parse(request.getParameter("fecha_ip"));
        benef.setFecha_ip(fecha_ip);
        BigDecimal capital = new BigDecimal(request.getParameter("capital"));
        benef.setCapital(capital);
        BigDecimal sub_inic = new BigDecimal(request.getParameter("sub_inic"));
        benef.setSub_inic(sub_inic);
        BigDecimal enganche = new BigDecimal(request.getParameter("enganche"));
        benef.setEnganche(enganche);
        BigDecimal pagant = new BigDecimal(request.getParameter("pagant"));
        benef.setPagant(pagant);
        BigDecimal admon = new BigDecimal(request.getParameter("admon"));
        benef.setAdmon(admon);
        BigDecimal comision = new BigDecimal(request.getParameter("comision"));
        benef.setComision(comision);
        BigDecimal interes = new BigDecimal(request.getParameter("interes"));
        benef.setInteres(interes);
        BigDecimal seguro = new BigDecimal(request.getParameter("seguro"));
        benef.setSeguro(seguro);
        
        GestionBeneficiario modelo=new GestionBeneficiario();
        if(modelo.actualizarBeneficiario(benef)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorbeneficiario?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorbeneficiario?operacion=editar");
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
        candidato.setId_usuario(1);
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
    */
    
    /*
    public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteCpp.jasper", param, request, response);
    } */
}

