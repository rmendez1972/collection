/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package javabeans;

import java.math.BigDecimal;
import java.util.Date;


/**
 *
 * @author Rafael Mendez
 */
public class ParametrosApertura
{
    private int id_beneficiario;
    private String poliza;
    private Date fecha_pol;
    private BigDecimal imp_capital;
    private BigDecimal imp_enganche;
    private String clave_b;

    private BigDecimal intereses;
    private BigDecimal gastos_admon;
    private BigDecimal seguro_vida;
    private BigDecimal pagos_anticipados;
    private BigDecimal sub_inic;
    private int id_usuario;
    private BigDecimal comision;
    
    private int id_catprog;
    private String numcontrato;
    private BigDecimal titulacion;
    private BigDecimal sub_inf;
    private BigDecimal otros_seg;


    
    public ParametrosApertura(){ super();}
    //constructor que permite crear un objeto

    public ParametrosApertura(int id_beneficiario, String poliza, Date fecha_pol, BigDecimal imp_capital, BigDecimal imp_enganche, String clave_b, int id_usuario) {
        this.id_beneficiario = id_beneficiario;
        this.poliza = poliza;
        this.fecha_pol = fecha_pol;
        this.imp_capital = imp_capital;
        this.imp_enganche = imp_enganche;
        this.clave_b= clave_b;
        this.id_usuario=id_usuario;
    }
    
    //Constructor mecanicas: 10
    public ParametrosApertura(int id_beneficiario, String poliza, Date fecha_pol, BigDecimal imp_capital, BigDecimal imp_enganche, String clave_b, 
            BigDecimal intereses, BigDecimal gastos_admon, BigDecimal seguro_vida, BigDecimal pagos_anticipados, BigDecimal sub_inic, int id_catprog, String numcontrato) {
        this.id_beneficiario = id_beneficiario;
        this.poliza = poliza;
        this.fecha_pol = fecha_pol;
        this.imp_capital = imp_capital;
        this.imp_enganche = imp_enganche;
        this.clave_b= clave_b;
        this.intereses = intereses;
        this.gastos_admon = gastos_admon;
        this.seguro_vida = seguro_vida;
        this.pagos_anticipados = pagos_anticipados;
        this.sub_inic = sub_inic;
        
        this.id_catprog = id_catprog;
        this.numcontrato = numcontrato;
        
        
    }
    //Constructor mecanicas: 48
    
    
    public ParametrosApertura(int id_beneficiario, String clave_b) {
        this.id_beneficiario = id_beneficiario;
        this.clave_b= clave_b;
    }

    public int getId_beneficiario() {
        return id_beneficiario;
    }

    public void setId_beneficiario(int id_beneficiario) {
        this.id_beneficiario = id_beneficiario;
    }

    public String getPoliza() {
        return poliza;
    }

    public void setPoliza(String poliza) {
        this.poliza = poliza;
    }

    public Date getFecha_pol() {
        return fecha_pol;
    }

    public void setFecha_pol(Date fecha_pol) {
        this.fecha_pol = fecha_pol;
    }

    public BigDecimal getImp_capital() {
        return imp_capital;
    }

    public void setImp_capital(BigDecimal imp_capital) {
        this.imp_capital = imp_capital;
    }

    public BigDecimal getImp_enganche() {
        return imp_enganche;
    }

    public void setImp_enganche(BigDecimal imp_enganche) {
        this.imp_enganche = imp_enganche;
    }
       
     public String getClave_b() {
        return clave_b;
    }

    public void setClave_b(String clave_b) {
        this.clave_b = clave_b;
    }

    public BigDecimal getIntereses() {
        return intereses;
    }

    public void setIntereses(BigDecimal intereses) {
        this.intereses = intereses;
    }

    public BigDecimal getGastos_admon() {
        return gastos_admon;
    }

    public void setGastos_admon(BigDecimal gastos_admon) {
        this.gastos_admon = gastos_admon;
    }

    public BigDecimal getSeguro_vida() {
        return seguro_vida;
    }

    public void setSeguro_vida(BigDecimal seguro_vida) {
        this.seguro_vida = seguro_vida;
    }

    public BigDecimal getPagos_anticipados() {
        return pagos_anticipados;
    }

    public void setPagos_anticipados(BigDecimal pagos_anticipados) {
        this.pagos_anticipados = pagos_anticipados;
    }        
    public BigDecimal getSub_inic() {
        return sub_inic;
    }

    public void setSub_inic(BigDecimal sub_inic) {
        this.sub_inic = sub_inic;
    }
    
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public BigDecimal getComision() {
        return comision;
    }

    public void setComision(BigDecimal comision) {
        this.comision = comision;
    }

    public int getId_catprog() {
        return id_catprog;
    }

    public void setId_catprog(int id_catprog) {
        this.id_catprog = id_catprog;
    }

    public String getNumcontrato() {
        return numcontrato;
    }

    public void setNumcontrato(String numcontrato) {
        this.numcontrato = numcontrato;
    }

    public void setTitulacion(BigDecimal titulacion) {
        this.titulacion = titulacion;
    }
    public BigDecimal getTitulacion(){
        return titulacion;
    }

    public void setSub_inf(BigDecimal sub_inf) {
        this.sub_inf = sub_inf;
    }
    
    public BigDecimal getSub_inf(){
        return sub_inf;
    }

    public BigDecimal getOtros_seg() {
        return otros_seg;
    }

    public void setOtros_seg(BigDecimal otros_seg) {
        this.otros_seg = otros_seg;
    }
   
    
    

}
