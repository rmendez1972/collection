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
public class Mov_edocta
{
    private int id_movedoscta;
    private int id_benef;
    private BigDecimal capital;
    private BigDecimal interes;
    private BigDecimal admon;
    private BigDecimal seguro;
    private String clave_mov;
    private String poliza;
    private Date fecha_mov;
    private int recibo;
    private BigDecimal o_seguro;
    private BigDecimal moratorios;
    private String status;
    private Date fecha_pol;
    private int id_usuario;
    private String prepago;
    private int id_bonific;
    private BigDecimal comisiones;
    private String serie;
    private Boolean puntual;
    private String clave_b;
    private BigDecimal tit;
    private int id_catprog;
    private String numcontrato;
    private int id_caja;
    private String nombrebenef;
    private String nombreusuario;
    private Boolean bonific;
  
   
    public Mov_edocta(){ super();}
    
    public Mov_edocta(int id_movedoscta, int id_benef, BigDecimal capital, BigDecimal interes, BigDecimal admon, BigDecimal seguro, String clave_mov, String poliza, Date fecha_mov, int recibo, BigDecimal o_seguro, BigDecimal moratorios, String status, Date fecha_pol, int id_usuario, String prepago, int id_bonific, BigDecimal comisiones, String serie, Boolean puntual, String clave_b, BigDecimal tit, int id_catprog, String numcontrato, int id_caja, Boolean bonific) {
        this.id_movedoscta = id_movedoscta;
        this.id_benef = id_benef;
        this.capital = capital;
        this.interes = interes;
        this.admon = admon;
        this.seguro = seguro;
        this.clave_mov = clave_mov;
        this.poliza = poliza;
        this.fecha_mov = fecha_mov;
        this.recibo = recibo;
        this.o_seguro = o_seguro;
        this.moratorios = moratorios;
        this.status = status;
        this.fecha_pol = fecha_pol;
        this.id_usuario = id_usuario;
        this.prepago = prepago;
        this.id_bonific = id_bonific;
        this.comisiones = comisiones;
        this.serie = serie;
        this.puntual = puntual;
        this.clave_b = clave_b;
        this.tit = tit;
        this.id_catprog = id_catprog;
        this.numcontrato = numcontrato;
        this.id_caja = id_caja;
        this.bonific=bonific;
        
    }
    
    public Mov_edocta(int id_movedoscta, int id_benef, BigDecimal capital, BigDecimal interes, BigDecimal admon, BigDecimal seguro, String clave_mov, String poliza, Date fecha_mov, int recibo, BigDecimal o_seguro, BigDecimal moratorios, String status, Date fecha_pol) {
        this.id_movedoscta = id_movedoscta;
        this.id_benef = id_benef;
        this.capital = capital;
        this.interes = interes;
        this.admon = admon;
        this.seguro = seguro;
        this.clave_mov = clave_mov;
        this.poliza = poliza;
        this.fecha_mov = fecha_mov;
        this.recibo = recibo;
        this.o_seguro = o_seguro;
        this.moratorios = moratorios;
        this.status = status;
        this.fecha_pol = fecha_pol;
        
    }
    
    public Mov_edocta(int id_movedoscta, int id_benef, String clave_b, String clave_mov, Date fecha_mov, String poliza, Date fecha_pol, BigDecimal capital, BigDecimal admon, BigDecimal seguro, BigDecimal o_seguro, BigDecimal comisiones, BigDecimal tit) {
        this.id_movedoscta = id_movedoscta;
        this.id_benef = id_benef;
        this.clave_b =clave_b;
        this.clave_mov=clave_mov;
        this.fecha_mov=fecha_mov;
        this.poliza=poliza;
        this.fecha_pol=fecha_pol;
        this.capital = capital;
        this.admon = admon;
        this.seguro = seguro;
        this.o_seguro = o_seguro;
        this.comisiones = comisiones;
        this.tit = tit;
        
    }

    public int getId_movedoscta() {
        return id_movedoscta;
    }

    public void setId_movedoscta(int id_movedoscta) {
        this.id_movedoscta = id_movedoscta;
    }

    public int getId_benef() {
        return id_benef;
    }

    public void setId_benef(int id_benef) {
        this.id_benef = id_benef;
    }

    public BigDecimal getCapital() {
        return capital;
    }

    public void setCapital(BigDecimal capital) {
        this.capital = capital;
    }

    public BigDecimal getInteres() {
        return interes;
    }

    public void setInteres(BigDecimal interes) {
        this.interes = interes;
    }

    public BigDecimal getAdmon() {
        return admon;
    }

    public void setAdmon(BigDecimal admon) {
        this.admon = admon;
    }

    public BigDecimal getSeguro() {
        return seguro;
    }

    public void setSeguro(BigDecimal seguro) {
        this.seguro = seguro;
    }

    public String getClave_mov() {
        return clave_mov;
    }

    public void setClave_mov(String clave_mov) {
        this.clave_mov = clave_mov;
    }

    public String getPoliza() {
        return poliza;
    }

    public void setPoliza(String poliza) {
        this.poliza = poliza;
    }

    public Date getFecha_mov() {
        return fecha_mov;
    }

    public void setFecha_mov(Date fecha_mov) {
        this.fecha_mov = fecha_mov;
    }

    public int getRecibo() {
        return recibo;
    }

    public void setRecibo(int recibo) {
        this.recibo = recibo;
    }

    public BigDecimal getO_seguro() {
        return o_seguro;
    }

    public void setO_seguro(BigDecimal o_seguro) {
        this.o_seguro = o_seguro;
    }

    public BigDecimal getMoratorios() {
        return moratorios;
    }

    public void setMoratorios(BigDecimal moratorios) {
        this.moratorios = moratorios;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getFecha_pol() {
        return fecha_pol;
    }

    public void setFecha_pol(Date fecha_pol) {
        this.fecha_pol = fecha_pol;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getPrepago() {
        return prepago;
    }

    public void setPrepago(String prepago) {
        this.prepago = prepago;
    }

    public int getId_bonific() {
        return id_bonific;
    }

    public void setId_bonific(int id_bonific) {
        this.id_bonific = id_bonific;
    }

    public BigDecimal getComisiones() {
        return comisiones;
    }

    public void setComisiones(BigDecimal comisiones) {
        this.comisiones = comisiones;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public Boolean getPuntual() {
        return puntual;
    }

    public void setPuntual(Boolean puntual) {
        this.puntual = puntual;
    }

    public String getClave_b() {
        return clave_b;
    }

    public void setClave_b(String clave_b) {
        this.clave_b = clave_b;
    }

    public BigDecimal getTit() {
        return tit;
    }

    public void setTit(BigDecimal tit) {
        this.tit = tit;
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

    public int getId_caja() {
        return id_caja;
    }

    public void setId_caja(int id_caja) {
        this.id_caja = id_caja;
    }
    
    public String getNombrebenef() {
        return nombrebenef;
    }

    public void setNombrebenef(String nombrebenef) {
        this.nombrebenef = nombrebenef;
    }
    
    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }
    
    public Boolean getBonific() {
        return bonific;
    }

    public void setBonific(Boolean bonific) {
        this.bonific = bonific;
    }
     
}
