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

   
    
    public ParametrosApertura(){ super();}
    //constructor que permite crear un objeto

    public ParametrosApertura(int id_beneficiario, String poliza, Date fecha_pol, BigDecimal imp_capital, BigDecimal imp_enganche, String clave_b) {
        this.id_beneficiario = id_beneficiario;
        this.poliza = poliza;
        this.fecha_pol = fecha_pol;
        this.imp_capital = imp_capital;
        this.imp_enganche = imp_enganche;
        this.clave_b= clave_b;
    }
    
    //Constructor mecanicas: 10
    public ParametrosApertura(int id_beneficiario, String poliza, Date fecha_pol, BigDecimal imp_capital, BigDecimal imp_enganche, String clave_b, 
            BigDecimal intereses, BigDecimal gastos_admon, BigDecimal seguro_vida, BigDecimal pagos_anticipados, BigDecimal sub_inic) {
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
    
    
     
}
