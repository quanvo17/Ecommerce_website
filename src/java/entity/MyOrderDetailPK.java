/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Nguyen Minh Dang
 */
@Embeddable
public class MyOrderDetailPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "orderID")
    private String orderID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "prodID")
    private int prodID;

    public MyOrderDetailPK() {
    }

    public MyOrderDetailPK(String orderID, int prodID) {
        this.orderID = orderID;
        this.prodID = prodID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public int getProdID() {
        return prodID;
    }

    public void setProdID(int prodID) {
        this.prodID = prodID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderID != null ? orderID.hashCode() : 0);
        hash += (int) prodID;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MyOrderDetailPK)) {
            return false;
        }
        MyOrderDetailPK other = (MyOrderDetailPK) object;
        if ((this.orderID == null && other.orderID != null) || (this.orderID != null && !this.orderID.equals(other.orderID))) {
            return false;
        }
        if (this.prodID != other.prodID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.MyOrderDetailPK[ orderID=" + orderID + ", prodID=" + prodID + " ]";
    }
    
}
