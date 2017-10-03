/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionBeneficiario;
import Modelo.GestionCandidatos;
import Modelo.GestionMov_edocta;
import Modelo.GestionProgramas;
import Modelo.GestionTipocredito;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
@WebServlet(name = "ControladorBeneficiario", urlPatterns = {"/controladorbeneficiario"})
public class ControladorBeneficiario extends ControladorBase 
{ 
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionBeneficiario modelo=new GestionBeneficiario();
        ArrayList beneficiarios=modelo.obtenerBeneficiarios();
        request.setAttribute("beneficiarios", beneficiarios);
            
        RequestDispatcher rd=request.getRequestDispatcher("listar_beneficiarios.jsp");
        rd.forward(request,response);
    }
    
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
    
    
    public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionBeneficiario modelo=new GestionBeneficiario();
        Beneficiario benef=modelo.obtenerPorId(id);
        Boolean aperturado=benef.getAperturado();
        if (!aperturado){
        
            GestionProgramas mod_prog=new GestionProgramas();
            GestionTipocredito mod_tcr=new GestionTipocredito();
            ArrayList prog=mod_prog.obtenerTodos();
            ArrayList tipo=mod_tcr.obtenerTodos();

            request.setAttribute("benef", benef);
            request.setAttribute("prog", prog);
            request.setAttribute("tipo", tipo);

            RequestDispatcher rd=request.getRequestDispatcher("frm_modificabeneficiario.jsp");
            rd.forward(request,response);
        }else{
            request.setAttribute("msg", "No es posible editar. Este Beneficiario ya cuenta con Movimientos en Edo. de Cuenta.");
            RequestDispatcher rd=request.getRequestDispatcher("controladorbeneficiario?operacion=listar");
            rd.forward(request,response);
        }
    }
    
    
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
    
    public void aperturar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String sql=null;
        String sqlverifica = null;
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        int id=Integer.parseInt(request.getParameter("id"));
        int id_catprog=Integer.parseInt(request.getParameter("id_catprog"));
        GestionProgramas modelo_gp=new GestionProgramas();
        CatProgramas programa=modelo_gp.obtenerPorId(id_catprog);
        GestionBeneficiario mod_gb = new GestionBeneficiario();
        Beneficiario benef=mod_gb.obtenerPorId(id);
        int mecanica=programa.getMecanica();
        boolean condicionfija =programa.isCondicion_fija();
        HttpSession objSession = request.getSession(); 
        Usuario usuario = (Usuario)(objSession.getAttribute("usuario"));
        
        String claveb = benef.getClave_b();
        
            
        Integer id_usuario=usuario.getId_usuario();
        ParametrosApertura par_aper2=new ParametrosApertura();
        
        //sqlverifica= "{call sp_verificamovedocta(?,?,?)}";
        par_aper2.setId_beneficiario(id);
        par_aper2.setClave_b(claveb);
        GestionBeneficiario modelo=new GestionBeneficiario();
        boolean resultadoMovEdoCta = modelo.verificarMovimientosPorId(par_aper2);
        
        

        if ((benef.getAperturado()==false || benef.getAperturado()==null) && resultadoMovEdoCta==false){
            // defino variables para setear el javabean        
            Date fecha_pol = benef.getFecha_pol();
            String poliza= benef.getPoliza();
            BigDecimal imp_capital = benef.getCapital();
            BigDecimal imp_enganche =benef.getEnganche();
            String clave_b=benef.getClave_b();
            BigDecimal imp_admon=benef.getAdmon();
            BigDecimal imp_svida=benef.getSeguro();
            BigDecimal imp_pagos=benef.getPagant();
            BigDecimal imp_sui=benef.getSub_inic();
            int id_catprograma=benef.getId_catprog();
            String numcontrato = benef.getNumcontrato();
            ParametrosApertura par_aper=new ParametrosApertura();
                    
            switch (mecanica){
                case 29:
                    sql= "{call sp_apertura29(?,?,?,?,?,?,?)}";
                    // defino variables para setear el javabean
                    
                    par_aper.setId_beneficiario(id);
                    par_aper.setPoliza(poliza);
                    par_aper.setFecha_pol(fecha_pol);
                    par_aper.setImp_capital(imp_capital);
                    par_aper.setImp_enganche(imp_enganche);
                    par_aper.setClave_b(clave_b);
                    par_aper.setId_usuario(id_usuario);
                    break;

                case 20:
                    sql= "{call sp_apertura20(?,?,?,?,?,?,?,?,?)}";
                    par_aper.setId_beneficiario(id);
                    par_aper.setPoliza(poliza);
                    par_aper.setClave_b(clave_b);
                    par_aper.setFecha_pol(fecha_pol);
                    par_aper.setImp_capital(imp_capital);
                    par_aper.setImp_enganche(imp_enganche);
                    par_aper.setId_usuario(id_usuario);
                    par_aper.setId_catprog(id_catprograma);
                    par_aper.setNumcontrato(numcontrato);
                    break;
                
                case 38:
                    sql= "{call sp_apertura38(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
                    BigDecimal imp_comision = benef.getComision();
                    
                    par_aper.setId_beneficiario(id);
                    par_aper.setClave_b(clave_b);
                    par_aper.setFecha_pol(fecha_pol);
                    par_aper.setPoliza(poliza);
                    par_aper.setImp_capital(imp_capital);
                    par_aper.setImp_enganche(imp_enganche);
                    par_aper.setPagos_anticipados(imp_pagos);
                    par_aper.setSub_inic(imp_sui);
                    par_aper.setGastos_admon(imp_admon);
                    par_aper.setComision(imp_comision);
                    par_aper.setId_usuario(id_usuario);
                    par_aper.setId_catprog(id_catprograma);
                    par_aper.setNumcontrato(numcontrato);
                    break;
                    
                case 8:
                    sql= "{call sp_apertura8(?,?,?,?,?,?,?,?,?,?,?)}";
                    
                    par_aper.setId_beneficiario(id);
                    par_aper.setClave_b(clave_b);
                    par_aper.setFecha_pol(fecha_pol);
                    par_aper.setPoliza(poliza);
                    par_aper.setImp_capital(imp_capital);
                    par_aper.setImp_enganche(imp_enganche);
                    par_aper.setPagos_anticipados(imp_pagos);
                    par_aper.setSub_inic(imp_sui);
                    par_aper.setId_usuario(id_usuario);
                    par_aper.setId_catprog(id_catprograma);
                    par_aper.setNumcontrato(numcontrato);
                    break;
                
                case 10: //igh
                    sql= "{call sp_apertura10(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
                    // defino variables para setear el javabean
                    BigDecimal imp_interes=benef.getInteres();

                    par_aper.setId_beneficiario(id);
                    par_aper.setPoliza(poliza);
                    par_aper.setFecha_pol(fecha_pol);
                    par_aper.setImp_capital(imp_capital);
                    par_aper.setImp_enganche(imp_enganche);
                    par_aper.setClave_b(clave_b);                
                    par_aper.setIntereses(imp_interes);
                    par_aper.setGastos_admon(imp_admon);
                    par_aper.setSeguro_vida(imp_svida);
                    par_aper.setPagos_anticipados(imp_pagos);
                    par_aper.setSub_inic(imp_sui);
                    par_aper.setId_usuario(id_usuario);
                    
                    par_aper.setId_catprog(id_catprograma);
                    par_aper.setNumcontrato(numcontrato);
                    break;
                    
                case 36: //igh
                    sql= "{call sp_apertura36(?,?,?,?,?,?,?,?,?,?,?)}";

                    par_aper.setId_beneficiario(id);
                    par_aper.setPoliza(poliza);
                    par_aper.setFecha_pol(fecha_pol);
                    par_aper.setImp_capital(imp_capital);
                    par_aper.setImp_enganche(imp_enganche);
                    par_aper.setClave_b(clave_b);                
                    par_aper.setPagos_anticipados(imp_pagos);
                    par_aper.setSub_inic(imp_sui);
                    par_aper.setId_usuario(id_usuario);
                    
                    par_aper.setId_catprog(id_catprograma);
                    par_aper.setNumcontrato(numcontrato);
                    break;
                    
                case 26: //igh
                    sql= "{call sp_apertura26(?,?,?,?,?,?,?,?,?,?,?)}";

                    par_aper.setId_beneficiario(id);
                    par_aper.setPoliza(poliza);
                    par_aper.setFecha_pol(fecha_pol);
                    par_aper.setImp_capital(imp_capital);
                    par_aper.setImp_enganche(imp_enganche);
                    par_aper.setClave_b(clave_b);                
                    par_aper.setPagos_anticipados(imp_pagos);
                    par_aper.setSub_inic(imp_sui);
                    par_aper.setId_usuario(id_usuario);
                    
                    par_aper.setId_catprog(id_catprograma);
                    par_aper.setNumcontrato(numcontrato);
                    break;    
            }

            
            boolean resultado=modelo.aperturarPorId(mecanica,id,sql, par_aper);
            if (resultado)
            {
                benef.setAperturado(true);
                Boolean aperturado=mod_gb.actualizarBeneficiarioAperturado(benef);
                request.setAttribute("msg", "Estado de cuenta aperturado exitosamente para el Beneficiario "+benef.getNombre());
            }
        }else{
            request.setAttribute("msg", "El estado de cuenta ya ha sido aperturado anteriormente para el Beneficiario "+benef.getNombre());
        }    
        
        RequestDispatcher rd=request.getRequestDispatcher("controladorbeneficiario?operacion=listar");
        rd.forward(request,response);
    }
        
        //listar JsonBeneficiario
        public void listarJsonbyIdBeneficiario(HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        
        String valorcriterio = request.getParameter("valorcriterio");
        
        GestionBeneficiario gbenef = new GestionBeneficiario();
        Beneficiario benef = gbenef.obtenerGenerico(valorcriterio);
        
        ArrayList beneficiario = new ArrayList();
        
        beneficiario.add(benef);
        GsonBuilder builder=new GsonBuilder().setDateFormat("yyyy-MM-dd");
        Gson gson=builder.create();
            
        //response.addHeader("Access-Control-Allow-Origin", "http://localhost:4200");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        response.getWriter().write("{\"beneficiario\":"+gson.toJson(beneficiario)+"}");
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

