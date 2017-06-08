/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import Modelo.GestionDelegacion;
import Modelo.GestionModulo;
import Modelo.GestionPermiso;
import java.util.ArrayList;
import javabeans.Modulo;
import javabeans.Permiso;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author arturo
 */
public class ControladorPermiso extends ControladorBase {
    public void listar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionDelegacion mod_grupo=new GestionDelegacion();
        ArrayList grupos=mod_grupo.obtenerTodos();
        request.setAttribute("grupos", grupos);
        RequestDispatcher rd=request.getRequestDispatcher("listar_permisos.jsp");
        rd.forward(request,response);
    }
    
    public void verPermisos(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionPermiso modelo=new GestionPermiso();
        int id=Integer.parseInt(request.getParameter("id_grupo"));
        ArrayList permisos=modelo.obtenerPorGrupo(id);
        request.setAttribute("permisos", permisos);
        request.setAttribute("id_grupo", id);
        RequestDispatcher rd=request.getRequestDispatcher("ver_permisos.jsp");
        rd.forward(request,response);
    }
    
    public void guardar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        GestionPermiso modelo=new GestionPermiso();
        GestionModulo mod_modulo=new GestionModulo();
        int id_grupo=Integer.parseInt(request.getParameter("id_grupo"));
        ArrayList modulos=mod_modulo.obtenerTodos();
        int i;
        for(i=0; i<modulos.size(); i++){
            Modulo mtemp=(Modulo)modulos.get(i);
            Permiso ptemp=new Permiso();
            ptemp.setId_grupo(id_grupo);
            ptemp.setId_modulo(mtemp.getId_modulo());
            if(request.getParameter("perm_"+mtemp.getId_modulo())==null)
                ptemp.setValor(0);
            else
                ptemp.setValor(1);
            
            modelo.actualizar(ptemp);
        }
        
        request.setAttribute("msg", "Datos guardados");
        RequestDispatcher rd=request.getRequestDispatcher("controladorpermiso?operacion=verPermisos");
        rd.forward(request,response);
    }
}
