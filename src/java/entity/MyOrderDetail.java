/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nguyen Minh Dang
 */
@Entity
@Table(name = "myOrderDetail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MyOrderDetail.findAll", query = "SELECT m FROM MyOrderDetail m")
    , @NamedQuery(name = "MyOrderDetail.findByOrderID", query = "SELECT m FROM MyOrderDetail m WHERE m.myOrderDetailPK.orderID = :orderID")
    , @NamedQuery(name = "MyOrderDetail.findByProdID", query = "SELECT m FROM MyOrderDetail m WHERE m.myOrderDetailPK.prodID = :prodID")
    , @NamedQuery(name = "MyOrderDetail.findByUnitPrice", query = "SELECT m FROM MyOrderDetail m WHERE m.unitPrice = :unitPrice")
    , @NamedQuery(name = "MyOrderDetail.findByQuantity", query = "SELECT m FROM MyOrderDetail m WHERE m.quantity = :quantity")
    , @NamedQuery(name = "MyOrderDetail.findByAmount", query = "SELECT m FROM MyOrderDetail m WHERE m.amount = :amount")})
public class MyOrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected MyOrderDetailPK myOrderDetailPK;
    @Basic(optional = false)
    @NotNull
    @Column(name = "unitPrice")
    private int unitPrice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity")
    private short quantity;
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount")
    private int amount;
    @JoinColumn(name = "orderID", referencedColumnName = "orderID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private MyOrder myOrder;
    @JoinColumn(name = "prodID", referencedColumnName = "prodID", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Product product;

    public MyOrderDetail() {
    }

    public MyOrderDetail(MyOrderDetailPK myOrderDetailPK) {
        this.myOrderDetailPK = myOrderDetailPK;
    }

    public MyOrderDetail(MyOrderDetailPK myOrderDetailPK, int unitPrice, short quantity, int amount) {
        this.myOrderDetailPK = myOrderDetailPK;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.amount = amount;
    }

    public MyOrderDetail(String orderID, int prodID) {
        this.myOrderDetailPK = new MyOrderDetailPK(orderID, prodID);
    }

    public MyOrderDetailPK getMyOrderDetailPK() {
        return myOrderDetailPK;
    }

    public void setMyOrderDetailPK(MyOrderDetailPK myOrderDetailPK) {
        this.myOrderDetailPK = myOrderDetailPK;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public short getQuantity() {
        return quantity;
    }

    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public MyOrder getMyOrder() {
        return myOrder;
    }

    public void setMyOrder(MyOrder myOrder) {
        this.myOrder = myOrder;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (myOrderDetailPK != null ? myOrderDetailPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MyOrderDetail)) {
            return false;
        }
        MyOrderDetail other = (MyOrderDetail) object;
        if ((this.myOrderDetailPK == null && other.myOrderDetailPK != null) || (this.myOrderDetailPK != null && !this.myOrderDetailPK.equals(other.myOrderDetailPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.MyOrderDetail[ myOrderDetailPK=" + myOrderDetailPK + " ]";
    }
    
}
