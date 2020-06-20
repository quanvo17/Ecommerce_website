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
@Table(name = "myRole")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MyRole.findAll", query = "SELECT m FROM MyRole m")
    , @NamedQuery(name = "MyRole.findByRoleID", query = "SELECT m FROM MyRole m WHERE m.roleID = :roleID")
    , @NamedQuery(name = "MyRole.findByName", query = "SELECT m FROM MyRole m WHERE m.name = :name")})
public class MyRole implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "roleID")
    private Integer roleID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "name")
    private String name;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "roleID")
    private Collection<MyUser> myUserCollection;

    public MyRole() {
    }

    public MyRole(Integer roleID) {
        this.roleID = roleID;
    }

    public MyRole(Integer roleID, String name) {
        this.roleID = roleID;
        this.name = name;
    }

    public Integer getRoleID() {
        return roleID;
    }

    public void setRoleID(Integer roleID) {
        this.roleID = roleID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlTransient
    public Collection<MyUser> getMyUserCollection() {
        return myUserCollection;
    }

    public void setMyUserCollection(Collection<MyUser> myUserCollection) {
        this.myUserCollection = myUserCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (roleID != null ? roleID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MyRole)) {
            return false;
        }
        MyRole other = (MyRole) object;
        if ((this.roleID == null && other.roleID != null) || (this.roleID != null && !this.roleID.equals(other.roleID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.MyRole[ roleID=" + roleID + " ]";
    }
    
}
