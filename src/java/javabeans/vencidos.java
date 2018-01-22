/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javabeans;

/**
 *
 * @author Rafael Mendez
 */

import java.math.BigDecimal;
import java.util.Date;

public class vencidos
{

    
    private Date x0;
    private Integer x1;     //numero de letra
    private Integer x1A;    //mes
    private Integer x2;     //año
    
    private BigDecimal x3;  //saldo
    private BigDecimal x4;  //pago a capital
    private BigDecimal x5;  //pago a interes
    private BigDecimal x6;  //pago a seguro de vida
    private BigDecimal x6A; //pago a gtos. de admon.
    private BigDecimal x7;  //total mensual

    

    public vencidos(Integer x1, Integer x1A, Integer x2, BigDecimal x3, BigDecimal x4, BigDecimal x5, BigDecimal x6, BigDecimal x6A, BigDecimal x7, Date x0) {
        this.x0 = x0;
        this.x1 = x1;
        this.x1A = x1A;
        this.x2 = x2;
        this.x3 = x3;
        this.x4 = x4;
        this.x5 = x5;
        this.x6 = x6;
        this.x6A = x6A;
        this.x7 = x7;
    }
    

    

    public vencidos() {}

    
    public Date getX0() {
        return x0;
    }

    public void setX0(Date x0) {
        this.x0 = x0;
    }
    
    public Integer getX1() {
        return x1;
    }

    public void setX1(Integer x1) {
        this.x1 = x1;
    }

    public Integer getX1A() {
        return x1A;
    }

    public void setX1A(Integer x1A) {
        this.x1A = x1A;
    }

    public Integer getX2() {
        return x2;
    }

    public void setX2(Integer x2) {
        this.x2 = x2;
    }

    public BigDecimal getX3() {
        return x3;
    }

    public void setX3(BigDecimal x3) {
        this.x3 = x3;
    }

    public BigDecimal getX4() {
        return x4;
    }

    public void setX4(BigDecimal x4) {
        this.x4 = x4;
    }

    public BigDecimal getX5() {
        return x5;
    }

    public void setX5(BigDecimal x5) {
        this.x5 = x5;
    }

    public BigDecimal getX6() {
        return x6;
    }

    public void setX6(BigDecimal x6) {
        this.x6 = x6;
    }

    public BigDecimal getX6A() {
        return x6A;
    }

    public void setX6A(BigDecimal x6A) {
        this.x6A = x6A;
    }

    public BigDecimal getX7() {
        return x7;
    }

    public void setX7(BigDecimal x7) {
        this.x7 = x7;
    }
    
     
}
