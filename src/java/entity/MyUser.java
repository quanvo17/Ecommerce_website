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
@Table(name = "myUser")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MyUser.findAll", query = "SELECT m FROM MyUser m")
    , @NamedQuery(name = "MyUser.findByUserID", query = "SELECT m FROM MyUser m WHERE m.userID = :userID")
    , @NamedQuery(name = "MyUser.findByEmail", query = "SELECT m FROM MyUser m WHERE m.email = :email")
    , @NamedQuery(name = "MyUser.findByUsername", query = "SELECT m FROM MyUser m WHERE m.username = :username")
    , @NamedQuery(name = "MyUser.findByPassword", query = "SELECT m FROM MyUser m WHERE m.password = :password")
    , @NamedQuery(name = "MyUser.findByName", query = "SELECT m FROM MyUser m WHERE m.name = :name")
    , @NamedQuery(name = "MyUser.findBySex", query = "SELECT m FROM MyUser m WHERE m.sex = :sex")
    , @NamedQuery(name = "MyUser.findByPhone", query = "SELECT m FROM MyUser m WHERE m.phone = :phone")
    , @NamedQuery(name = "MyUser.findByAddress", query = "SELECT m FROM MyUser m WHERE m.address = :address")})
public class MyUser implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "userID")
    private Integer userID;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "password")
    private String password;
    @Size(max = 50)
    @Column(name = "name")
    private String name;
    @Size(max = 10)
    @Column(name = "sex")
    private String sex;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Size(max = 15)
    @Column(name = "phone")
    private String phone;
    @Size(max = 200)
    @Column(name = "address")
    private String address;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userID")
    private Collection<MyOrder> myOrderCollection;
    @JoinColumn(name = "roleID", referencedColumnName = "roleID")
    @ManyToOne(optional = false)
    private MyRole roleID;

    public MyUser() {
    }

    public MyUser(Integer userID) {
        this.userID = userID;
    }

    public MyUser(Integer userID, String email, String username, String password) {
        this.userID = userID;
        this.email = email;
        this.username = username;
        this.password = password;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @XmlTransient
    public Collection<MyOrder> getMyOrderCollection() {
        return myOrderCollection;
    }

    public void setMyOrderCollection(Collection<MyOrder> myOrderCollection) {
        this.myOrderCollection = myOrderCollection;
    }

    public MyRole getRoleID() {
        return roleID;
    }

    public void setRoleID(MyRole roleID) {
        this.roleID = roleID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userID != null ? userID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MyUser)) {
            return false;
        }
        MyUser other = (MyUser) object;
        if ((this.userID == null && other.userID != null) || (this.userID != null && !this.userID.equals(other.userID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.MyUser[ userID=" + userID + " ]";
    }
    
}
