/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;
import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author Ismael
 */
public class BeneficiarioDiv {
    private int id_bendiv;
    private String clave_elect;
    private String curp;
    private String clave_b;
    private String nombre;
    private Date fecha_con;
    private BigDecimal capital;
    private BigDecimal sub_inic;
    private BigDecimal enganche;
    private BigDecimal interes;
    private BigDecimal admon;
    private BigDecimal seguro;
    private BigDecimal o_seg;
    private int plazo;
    private BigDecimal pago_mes;
    private BigDecimal sal_con;
    private String juridico;
    private String referencia_jur;
    private Date fecha_jur;    
    private int id_usuario;
    private int id_catprog;
    private String mza;
    private String lte;
    private String conyuge;
    private Date fecha;
    private boolean aperturado;
    private String numcontrato;
    
    private String catprog;
    private String usuario;
       
    public BeneficiarioDiv(){}

    public BeneficiarioDiv(int id_bendiv, String clave_elect, String curp, String clave_b, String nombre, Date fecha_con, BigDecimal capital, BigDecimal sub_inic, BigDecimal enganche, BigDecimal interes, BigDecimal admon, BigDecimal seguro, BigDecimal o_seg, int plazo, BigDecimal pago_mes, BigDecimal sal_con, String juridico, String referencia_jur, Date fecha_jur, int id_usuario, int id_catprog, String mza, String lte, String conyuge, Date fecha, boolean aperturado, String numcontrato) {
        this.id_bendiv = id_bendiv;
        this.clave_elect = clave_elect;
        this.curp = curp;
        this.clave_b = clave_b;
        this.nombre = nombre;
        this.fecha_con = fecha_con;
        this.capital = capital;
        this.sub_inic = sub_inic;
        this.enganche = enganche;
        this.interes = interes;
        this.admon = admon;
        this.seguro = seguro;
        this.o_seg = o_seg;
        this.plazo = plazo;
        this.pago_mes = pago_mes;
        this.sal_con = sal_con;
        this.juridico = juridico;
        this.referencia_jur = referencia_jur;
        this.fecha_jur = fecha_jur;
        this.id_usuario = id_usuario;
        this.id_catprog = id_catprog;
        this.mza = mza;
        this.lte = lte;
        this.conyuge = conyuge;
        this.fecha = fecha;
        this.aperturado = aperturado;
        this.numcontrato = numcontrato;
    }
    
    
    
    
    public BeneficiarioDiv(int id_bendiv, String clave_elect, String curp, String clave_b, 
            String nombre, int id_catprog, int id_usuario, boolean aperturado, String numcontrato){
        
        this.id_bendiv=id_bendiv;
        this.clave_elect=clave_elect;
        this.curp=curp;
        this.clave_b=clave_b;
        this.nombre=nombre;
        this.id_catprog=id_catprog;
        this.id_usuario=id_usuario;
        this.aperturado=aperturado;
        this.numcontrato=numcontrato;
    }

    public int getId_bendiv() {
        return id_bendiv;
    }

    public void setId_bendiv(int id_bendiv) {
        this.id_bendiv = id_bendiv;
    }

    public String getClave_elect() {
        return clave_elect;
    }

    public void setClave_elect(String clave_elect) {
        this.clave_elect = clave_elect;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getClave_b() {
        return clave_b;
    }

    public void setClave_b(String clave_b) {
        this.clave_b = clave_b;
    }

    public int getId_catprog() {
        return id_catprog;
    }

    public void setId_catprog(int id_catprog) {
        this.id_catprog = id_catprog;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCatprog() {
        return catprog;
    }

    public void setCatprog(String catprog) {
        this.catprog = catprog;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public Date getFecha_con() {
        return fecha_con;
    }

    public void setFecha_con(Date fecha_con) {
        this.fecha_con = fecha_con;
    }

    public BigDecimal getCapital() {
        return capital;
    }

    public void setCapital(BigDecimal capital) {
        this.capital = capital;
    }

    public BigDecimal getSub_inic() {
        return sub_inic;
    }

    public void setSub_inic(BigDecimal sub_inic) {
        this.sub_inic = sub_inic;
    }

    public BigDecimal getEnganche() {
        return enganche;
    }

    public void setEnganche(BigDecimal enganche) {
        this.enganche = enganche;
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

    public BigDecimal getO_seg() {
        return o_seg;
    }

    public void setO_seg(BigDecimal o_seg) {
        this.o_seg = o_seg;
    }

    public int getPlazo() {
        return plazo;
    }

    public void setPlazo(int plazo) {
        this.plazo = plazo;
    }

    public BigDecimal getPago_mes() {
        return pago_mes;
    }

    public void setPago_mes(BigDecimal pago_mes) {
        this.pago_mes = pago_mes;
    }

    public BigDecimal getSal_con() {
        return sal_con;
    }

    public void setSal_con(BigDecimal sal_con) {
        this.sal_con = sal_con;
    }

    public String getJuridico() {
        return juridico;
    }

    public void setJuridico(String juridico) {
        this.juridico = juridico;
    }

    public String getReferencia_jur() {
        return referencia_jur;
    }

    public void setReferencia_jur(String referencia_jur) {
        this.referencia_jur = referencia_jur;
    }

    public Date getFecha_jur() {
        return fecha_jur;
    }

    public void setFecha_jur(Date fecha_jur) {
        this.fecha_jur = fecha_jur;
    }

    public String getMza() {
        return mza;
    }

    public void setMza(String mza) {
        this.mza = mza;
    }

    public String getLte() {
        return lte;
    }

    public void setLte(String lte) {
        this.lte = lte;
    }

    public String getConyuge() {
        return conyuge;
    }

    public void setConyuge(String conyuge) {
        this.conyuge = conyuge;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    
    
    public boolean isAperturado() {
        return aperturado;
    }

    public void setAperturado(boolean aperturado) {
        this.aperturado = aperturado;
    }

    public String getNumcontrato() {
        return numcontrato;
    }

    public void setNumcontrato(String numcontrato) {
        this.numcontrato = numcontrato;
    }
    
    
}
