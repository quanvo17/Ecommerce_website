/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Nguyen Minh Dang
 */
@Entity
@Table(name = "product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
    , @NamedQuery(name = "Product.findByProdID", query = "SELECT p FROM Product p WHERE p.prodID = :prodID")
    , @NamedQuery(name = "Product.findByName", query = "SELECT p FROM Product p WHERE p.name = :name")
    , @NamedQuery(name = "Product.findByPrice", query = "SELECT p FROM Product p WHERE p.price = :price")
    , @NamedQuery(name = "Product.findByThumbImage", query = "SELECT p FROM Product p WHERE p.thumbImage = :thumbImage")
    , @NamedQuery(name = "Product.findByStatus", query = "SELECT p FROM Product p WHERE p.status = :status")})
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "prodID")
    private Integer prodID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private int price;
    @Size(max = 20)
    @Column(name = "thumbImage")
    private String thumbImage;
    @Column(name = "status")
    private Boolean status;
    @JoinColumn(name = "cateID", referencedColumnName = "cateID")
    @ManyToOne(optional = false)
    private Category cateID;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "product")
    private BestSale bestSale;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "product")
    private ProductDetail productDetail;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "product")
    private Collection<MyOrderDetail> myOrderDetailCollection;

    public Product() {
    }

    public Product(Integer prodID) {
        this.prodID = prodID;
    }

    public Product(Integer prodID, String name, int price) {
        this.prodID = prodID;
        this.name = name;
        this.price = price;
    }

    public Integer getProdID() {
        return prodID;
    }

    public void setProdID(Integer prodID) {
        this.prodID = prodID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getThumbImage() {
        return thumbImage;
    }

    public void setThumbImage(String thumbImage) {
        this.thumbImage = thumbImage;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Category getCateID() {
        return cateID;
    }

    public void setCateID(Category cateID) {
        this.cateID = cateID;
    }

    public BestSale getBestSale() {
        return bestSale;
    }

    public void setBestSale(BestSale bestSale) {
        this.bestSale = bestSale;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    @XmlTransient
    public Collection<MyOrderDetail> getMyOrderDetailCollection() {
        return myOrderDetailCollection;
    }

    public void setMyOrderDetailCollection(Collection<MyOrderDetail> myOrderDetailCollection) {
        this.myOrderDetailCollection = myOrderDetailCollection;
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
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.prodID == null && other.prodID != null) || (this.prodID != null && !this.prodID.equals(other.prodID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Product[ prodID=" + prodID + " ]";
    }
    
}
