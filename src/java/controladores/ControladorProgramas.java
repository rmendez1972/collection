/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionColonia;
import Modelo.GestionDelegacion;
import Modelo.GestionModRec;
import Modelo.GestionModulo;
import Modelo.GestionProgramas;
import Modelo.GestionTipocredito;
import Modelo.GestionUsuario;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javabeans.CatProgramas;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Marlon
 */
@WebServlet(name = "ControladorProgramas", urlPatterns = {"/controladorprogramas"})
public class ControladorProgramas extends ControladorBase{
    
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionProgramas modelo = new GestionProgramas();
        ArrayList pr = modelo.obtenerTodos();
        request.setAttribute("pr", pr);
        RequestDispatcher rd=request.getRequestDispatcher("listar_Programas.jsp");
        rd.forward(request,response);
    
    }
    
    public void nuevo(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionTipocredito mod_tc = new GestionTipocredito();
        GestionColonia mod_col = new GestionColonia();
        GestionDelegacion mod_del = new GestionDelegacion();
        GestionModRec mod_modu = new GestionModRec();
        //GestionUsuario mod_usu = new GestionUsuario();
        
        ArrayList tc = mod_tc.obtenerTodos();
        ArrayList col = mod_col.obtenerTodos();
        ArrayList del = mod_del.obtenerTodos();
        ArrayList modu = mod_modu.obtenerTodos();
        //ArrayList usu = mod_usu.obtenerUsuarios();
        
        request.setAttribute("tc", tc);
        request.setAttribute("col", col);
        request.setAttribute("del", del);
        request.setAttribute("modu", modu);
        //request.setAttribute("usu", usu);
        
        RequestDispatcher rd=request.getRequestDispatcher("frm_programas.jsp");
        rd.forward(request,response);
    }
    
    public void nuevoGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        CatProgramas cp = new CatProgramas();
        
        cp.setClave(request.getParameter("clave").toUpperCase());
        cp.setDescripcion(request.getParameter("descripcion").toUpperCase());
        
        BigDecimal sub_ini = new BigDecimal(request.getParameter("sub_ini"));
        cp.setSub_ini(sub_ini);
        
        BigDecimal eng_fon = new BigDecimal(request.getParameter("eng_fon"));
        cp.setEng_fon(eng_fon);
        
        BigDecimal eng_inv = new BigDecimal(request.getParameter("eng_inv"));
        cp.setEng_inv(eng_inv);
        
        BigDecimal interes = new BigDecimal(request.getParameter("interes"));
        cp.setInteres(interes);
        
        BigDecimal admon = new BigDecimal(request.getParameter("admon"));
        cp.setAdmon(admon);
        
        BigDecimal seguro = new BigDecimal(request.getParameter("seguro"));
        cp.setSeguro(seguro);
        
        BigDecimal costo_m2 = new BigDecimal(request.getParameter("costo_m2"));
        cp.setCosto_m2(costo_m2);
        
        BigDecimal por_sub = new BigDecimal(request.getParameter("por_sub"));
        cp.setPor_sub(por_sub);
        
        BigDecimal por_admon = new BigDecimal(request.getParameter("por_admon"));
        cp.setPor_admon(por_admon);
        
        BigDecimal por_sv = new BigDecimal(request.getParameter("por_sv"));
        cp.setPor_sv(por_sv);
        
        BigDecimal por_os = new BigDecimal(request.getParameter("por_os"));
        cp.setPor_os(por_os);
        
        BigDecimal sal_min = new BigDecimal(request.getParameter("sal_min"));
        cp.setSal_min(sal_min);
        
        BigDecimal pago_mes = new BigDecimal(request.getParameter("pago_mes"));
        cp.setPago_mes(pago_mes);
        
        BigDecimal por_eng = new BigDecimal(request.getParameter("por_eng"));
        cp.setPor_eng(por_eng);
        
        BigDecimal anual = new BigDecimal(request.getParameter("anual"));
        cp.setAnual(anual);
        
        Integer plazo = Integer.parseInt(request.getParameter("plazo"));
        cp.setPlazo(plazo);
        
        BigDecimal por_cap = new BigDecimal(request.getParameter("por_cap"));
        cp.setPor_cap(por_cap);
        
        String valStatus = request.getParameter("status");
        Boolean status = Boolean.parseBoolean(valStatus);
        cp.setStatus(status);
        
        
        Integer mecanica = Integer.parseInt(request.getParameter("mecanica"));
        cp.setMecanica(mecanica);
        
        Integer id_tipocred = Integer.parseInt(request.getParameter("id_tipocred"));
        cp.setId_tipocred(id_tipocred);
        
        BigDecimal mensual = new BigDecimal(request.getParameter("mensual"));
        cp.setMensual(mensual);
        
        BigDecimal sub_bp = new BigDecimal(request.getParameter("sub_bp"));
        cp.setSub_bp(sub_bp);
        
        BigDecimal apor_fij = new BigDecimal(request.getParameter("apor_fij"));
        cp.setApor_fij(apor_fij);
        
        BigDecimal por_pm = new BigDecimal(request.getParameter("por_pm"));
        cp.setPor_pm(por_pm);
        
        BigDecimal por_pf = new BigDecimal(request.getParameter("por_pf"));
        cp.setPor_pf(por_pf);
        
        cp.setClave_ant(request.getParameter("clave_ant").toUpperCase());
        
        Integer id_colonia = Integer.parseInt(request.getParameter("id_colonia"));
        cp.setId_colonia(id_colonia);
        
        Integer dias_gracia = Integer.parseInt(request.getParameter("dias_gracia"));
        cp.setDias_gracia(dias_gracia);
        
        String valmora = request.getParameter("mora");
        Boolean mora = Boolean.parseBoolean(valmora);
        cp.setMora(mora);
        
        BigDecimal por_ga = new BigDecimal(request.getParameter("por_ga"));
        cp.setPor_ga(por_ga);
        
        cp.setCuenta_cont(request.getParameter("cuenta_cont").toUpperCase());
        
        Integer id_delegacion = Integer.parseInt(request.getParameter("id_delegacion"));
        cp.setId_delegacion(id_delegacion);
        
        Integer id_modulo = Integer.parseInt(request.getParameter("id_modulo"));
        cp.setId_modulo(id_modulo);
        
        String valcondicion_fija = request.getParameter("condicion_fija");
        Boolean condicion_fija = Boolean.parseBoolean(valcondicion_fija);
        cp.setCondicion_fija(condicion_fija);
        
        Integer id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        cp.setId_usuario(id_usuario);
        
        GestionProgramas modelo = new GestionProgramas();
        
        if(modelo.registroPrograma(cp)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorprogramas?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
            }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorprogramas?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
    }
    
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        GestionProgramas modelo=new GestionProgramas();
        if(modelo.eliminarPorId(id))
        {    
            request.setAttribute("msg", "Registro eliminado");
        }else{
            request.setAttribute("msg", "No es posible eliminar. El usuario tiene solicitudes registradas.");
            
        }
        RequestDispatcher rd=request.getRequestDispatcher("controladorprogramas?operacion=listar");
        rd.forward(request,response);
    }
    
     public void editar(HttpServletRequest request, HttpServletResponse response) throws Exception{
         
        int id=Integer.parseInt(request.getParameter("id"));
        GestionTipocredito mod_tc = new GestionTipocredito();
        GestionColonia mod_col = new GestionColonia();
        GestionDelegacion mod_del = new GestionDelegacion();
        GestionModRec mod_modu = new GestionModRec();
        GestionProgramas mod_prog = new GestionProgramas();
        
        ArrayList tc = mod_tc.obtenerTodos();
        ArrayList col = mod_col.obtenerTodos();
        ArrayList del = mod_del.obtenerTodos();
        ArrayList modu = mod_modu.obtenerTodos();
        CatProgramas prog = mod_prog.obtenerPorId(id);
        
        request.setAttribute("tc", tc);
        request.setAttribute("col", col);
        request.setAttribute("del", del);
        request.setAttribute("modu", modu);
        request.setAttribute("prog", prog);

        RequestDispatcher rd=request.getRequestDispatcher("frm_modificaprogramas.jsp");
        rd.forward(request,response);
         
     }
     
     public void editarGuardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
         
        CatProgramas cp = new CatProgramas();
        
        cp.setId_catprog(Integer.parseInt(request.getParameter("id_catprog")));
        cp.setClave(request.getParameter("clave").toUpperCase());
        cp.setDescripcion(request.getParameter("descripcion").toUpperCase());
        
        BigDecimal sub_ini = new BigDecimal(request.getParameter("sub_ini"));
        cp.setSub_ini(sub_ini);
        
        BigDecimal eng_fon = new BigDecimal(request.getParameter("eng_fon"));
        cp.setEng_fon(eng_fon);
        
        BigDecimal eng_inv = new BigDecimal(request.getParameter("eng_inv"));
        cp.setEng_inv(eng_inv);
        
        BigDecimal interes = new BigDecimal(request.getParameter("interes"));
        cp.setInteres(interes);
        
        BigDecimal admon = new BigDecimal(request.getParameter("admon"));
        cp.setAdmon(admon);
        
        BigDecimal seguro = new BigDecimal(request.getParameter("seguro"));
        cp.setSeguro(seguro);
        
        BigDecimal costo_m2 = new BigDecimal(request.getParameter("costo_m2"));
        cp.setCosto_m2(costo_m2);
        
        BigDecimal por_sub = new BigDecimal(request.getParameter("por_sub"));
        cp.setPor_sub(por_sub);
        
        BigDecimal por_admon = new BigDecimal(request.getParameter("por_admon"));
        cp.setPor_admon(por_admon);
        
        BigDecimal por_sv = new BigDecimal(request.getParameter("por_sv"));
        cp.setPor_sv(por_sv);
        
        BigDecimal por_os = new BigDecimal(request.getParameter("por_os"));
        cp.setPor_os(por_os);
        
        BigDecimal sal_min = new BigDecimal(request.getParameter("sal_min"));
        cp.setSal_min(sal_min);
        
        BigDecimal pago_mes = new BigDecimal(request.getParameter("pago_mes"));
        cp.setPago_mes(pago_mes);
        
        BigDecimal por_eng = new BigDecimal(request.getParameter("por_eng"));
        cp.setPor_eng(por_eng);
        
        BigDecimal anual = new BigDecimal(request.getParameter("anual"));
        cp.setAnual(anual);
        
        Integer plazo = Integer.parseInt(request.getParameter("plazo"));
        cp.setPlazo(plazo);
        
        BigDecimal por_cap = new BigDecimal(request.getParameter("por_cap"));
        cp.setPor_cap(por_cap);
        
        String valStatus = request.getParameter("status");
        Boolean status = Boolean.parseBoolean(valStatus);
        cp.setStatus(status);
        
        
        Integer mecanica = Integer.parseInt(request.getParameter("mecanica"));
        cp.setMecanica(mecanica);
        
        Integer id_tipocred = Integer.parseInt(request.getParameter("id_tipocred"));
        cp.setId_tipocred(id_tipocred);
        
        BigDecimal mensual = new BigDecimal(request.getParameter("mensual"));
        cp.setMensual(mensual);
        
        BigDecimal sub_bp = new BigDecimal(request.getParameter("sub_bp"));
        cp.setSub_bp(sub_bp);
        
        BigDecimal apor_fij = new BigDecimal(request.getParameter("apor_fij"));
        cp.setApor_fij(apor_fij);
        
        BigDecimal por_pm = new BigDecimal(request.getParameter("por_pm"));
        cp.setPor_pm(por_pm);
        
        BigDecimal por_pf = new BigDecimal(request.getParameter("por_pf"));
        cp.setPor_pf(por_pf);
        
        cp.setClave_ant(request.getParameter("clave_ant").toUpperCase());
        
        Integer id_colonia = Integer.parseInt(request.getParameter("id_colonia"));
        cp.setId_colonia(id_colonia);
        
        Integer dias_gracia = Integer.parseInt(request.getParameter("dias_gracia"));
        cp.setDias_gracia(dias_gracia);
        
        String valmora = request.getParameter("mora");
        Boolean mora = Boolean.parseBoolean(valmora);
        cp.setMora(mora);
        
        BigDecimal por_ga = new BigDecimal(request.getParameter("por_ga"));
        cp.setPor_ga(por_ga);
        
        cp.setCuenta_cont(request.getParameter("cuenta_cont").toUpperCase());
        
        Integer id_delegacion = Integer.parseInt(request.getParameter("id_delegacion"));
        cp.setId_delegacion(id_delegacion);
        
        Integer id_modulo = Integer.parseInt(request.getParameter("id_modulo"));
        cp.setId_modulo(id_modulo);
        
        String valcondicion_fija = request.getParameter("condicion_fija");
        Boolean condicion_fija = Boolean.parseBoolean(valcondicion_fija);
        cp.setCondicion_fija(condicion_fija);
        
        Integer id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        cp.setId_usuario(id_usuario);
        
        GestionProgramas modelo = new GestionProgramas();
        
        if(modelo.actualizarPrograma(cp)){
            RequestDispatcher rd=request.getRequestDispatcher("controladorprogramas?operacion=listar");
            request.setAttribute("msg", "Datos guardados");
            rd.forward(request,response);
            }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("controladorprogramas?operacion=nuevo");
            request.setAttribute("msg", "Error al guardar. Intente de nuevo más tarde");
            rd.forward(request,response);
        }
     
     }
     
     public void reporte(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Map param = new HashMap();
        generarReporte("ReporteProgramas.jasper", param, request, response);
    }

}
