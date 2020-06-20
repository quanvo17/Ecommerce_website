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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Nguyen Minh Dang
 */
@Entity
@Table(name = "productDetail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductDetail.findAll", query = "SELECT p FROM ProductDetail p")
    , @NamedQuery(name = "ProductDetail.findByProdID", query = "SELECT p FROM ProductDetail p WHERE p.prodID = :prodID")
    , @NamedQuery(name = "ProductDetail.findByInfo", query = "SELECT p FROM ProductDetail p WHERE p.info = :info")
    , @NamedQuery(name = "ProductDetail.findByDescription", query = "SELECT p FROM ProductDetail p WHERE p.description = :description")
    , @NamedQuery(name = "ProductDetail.findByImage1", query = "SELECT p FROM ProductDetail p WHERE p.image1 = :image1")
    , @NamedQuery(name = "ProductDetail.findByImage2", query = "SELECT p FROM ProductDetail p WHERE p.image2 = :image2")})
public class ProductDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "prodID")
    private Integer prodID;
    @Size(max = 200)
    @Column(name = "info")
    private String info;
    @Size(max = 1000)
    @Column(name = "description")
    private String description;
    @Size(max = 20)
    @Column(name = "image1")
    private String image1;
    @Size(max = 20)
    @Column(name = "image2")
    private String image2;
    @JoinColumn(name = "prodID", referencedColumnName = "prodID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Product product;

    public ProductDetail() {
    }

    public ProductDetail(Integer prodID) {
        this.prodID = prodID;
    }

    public Integer getProdID() {
        return prodID;
    }

    public void setProdID(Integer prodID) {
        this.prodID = prodID;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
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
        if (!(object instanceof ProductDetail)) {
            return false;
        }
        ProductDetail other = (ProductDetail) object;
        if ((this.prodID == null && other.prodID != null) || (this.prodID != null && !this.prodID.equals(other.prodID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ProductDetail[ prodID=" + prodID + " ]";
    }
    
}
