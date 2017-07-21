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
    
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionMov_edocta modelo=new GestionMov_edocta();
        
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. Este Movimiento cuenta con binificación.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladormov_edocta?operacion=listar");
        rd.forward(request,response);
    }
    
    
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
    
    
    public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Mov_edocta movimiento=new Mov_edocta();
        Integer id_movedoscta=Integer.parseInt(request.getParameter("id_movedoscta"));
        movimiento.setId_movedoscta(id_movedoscta);
        Integer id_benef=Integer.parseInt(request.getParameter("id_benef"));
        movimiento.setId_benef(id_benef);
        String clave_b=request.getParameter("clave_b").toUpperCase();
        movimiento.setClave_b(clave_b);
        String clave_mov=request.getParameter("clave_mov").toUpperCase();
        movimiento.setClave_mov(clave_mov);
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha_mov = df.parse(request.getParameter("fecha_mov"));
        movimiento.setFecha_mov(fecha_mov);
        String poliza=request.getParameter("poliza").toUpperCase();
        movimiento.setPoliza(poliza);
        Date fecha_pol = df.parse(request.getParameter("fecha_pol"));
        movimiento.setFecha_pol(fecha_pol);
        BigDecimal capital = new BigDecimal(request.getParameter("capital"));
        movimiento.setCapital(capital);
        BigDecimal admon = new BigDecimal(request.getParameter("admon"));
        movimiento.setAdmon(admon);
        BigDecimal seguro = new BigDecimal(request.getParameter("seguro"));
        movimiento.setSeguro(seguro);
        BigDecimal o_seguro = new BigDecimal(request.getParameter("o_seguro"));
        movimiento.setO_seguro(o_seguro);
        BigDecimal comisiones = new BigDecimal(request.getParameter("comisiones"));
        movimiento.setComisiones(comisiones);
        BigDecimal tit = new BigDecimal(request.getParameter("tit"));
        movimiento.setTit(tit);
        BigDecimal interes = new BigDecimal(request.getParameter("interes"));
        movimiento.setInteres(interes);
        
        HttpSession objSession = request.getSession(); 
        Usuario usuario = (Usuario)(objSession.getAttribute("usuario")); 
        Integer id_usuario=usuario.getId_usuario();
        movimiento.setId_usuario(id_usuario);
        
        GestionMov_edocta modelo=new GestionMov_edocta();
        if(modelo.actualizarMov_edocta(movimiento)){
            RequestDispatcher rd=request.getRequestDispatcher("controladormov_edocta?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladormov_edocta?operacion=editar");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    /*
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

