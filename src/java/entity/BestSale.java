/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nguyen Minh Dang
 */
@Entity
@Table(name = "bestSale")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BestSale.findAll", query = "SELECT b FROM BestSale b")
    , @NamedQuery(name = "BestSale.findByProdID", query = "SELECT b FROM BestSale b WHERE b.prodID = :prodID")
    , @NamedQuery(name = "BestSale.findByNumOfProd", query = "SELECT b FROM BestSale b WHERE b.numOfProd = :numOfProd")})
public class BestSale implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "prodID")
    private Integer prodID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "numOfProd")
    private int numOfProd;
    @JoinColumn(name = "prodID", referencedColumnName = "prodID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Product product;

    public BestSale() {
    }

    public BestSale(Integer prodID) {
        this.prodID = prodID;
    }

    public BestSale(Integer prodID, int numOfProd) {
        this.prodID = prodID;
        this.numOfProd = numOfProd;
    }

    public Integer getProdID() {
        return prodID;
    }

    public void setProdID(Integer prodID) {
        this.prodID = prodID;
    }

    public int getNumOfProd() {
        return numOfProd;
    }

    public void setNumOfProd(int numOfProd) {
        this.numOfProd = numOfProd;
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
        hash += (prodID != null ? prodID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BestSale)) {
            return false;
        }
        BestSale other = (BestSale) object;
        if ((this.prodID == null && other.prodID != null) || (this.prodID != null && !this.prodID.equals(other.prodID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.BestSale[ prodID=" + prodID + " ]";
    }
    
}
