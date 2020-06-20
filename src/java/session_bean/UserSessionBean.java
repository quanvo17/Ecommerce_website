/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session_bean;

import entity.MyUser;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
/**
 *
 * @author Nguyen Minh Dang
 */
@Stateless
public class UserSessionBean extends AbstractSessionBean<MyUser>{
    @PersistenceContext(unitName = "EcommercePU")
    private EntityManager em;
    
    protected EntityManager getEntityManager(){
        return em;
    }
    
    public UserSessionBean(){
        super(MyUser.class);
    }

    public MyUser checkUser(String username) {
        return (MyUser)em.createQuery("select c from MyUser c where c.username = '"+username+"'").getSingleResult();
    }
    
    public void insertUser(String email, String username, String password){
        em.createNativeQuery("insert into myUser (email, username, password, roleID) values (?, ?, ?, ?)")
                .setParameter(1, email)
                .setParameter(2, username)
                .setParameter(3, password)
                .setParameter(4, 1)
                .executeUpdate();
    }
    
    public void updateName(String newname, int userID){
        em.createNativeQuery("update myUser set name = ? where userID = ?")
                .setParameter(1, newname)
                .setParameter(2, userID)
                .executeUpdate();
        em.createQuery("update MyUser c set c.name = :newname where c.userID = :userID")
                .setParameter("newname", newname)
                .setParameter("userID", userID)
                .executeUpdate();    
    }
    
    public void updateAddress(String newaddr, int userID){
        em.createNativeQuery("update myUser set address = ? where userID = ?")
                .setParameter(1, newaddr)
                .setParameter(2, userID)
                .executeUpdate();
        em.createQuery("update MyUser c set c.address = :newaddr where c.userID = :userID")
                .setParameter("newaddr", newaddr)
                .setParameter("userID", userID)
                .executeUpdate();
    }
    
    public void updateEmail(String newemail, int userID){
        em.createNativeQuery("update myUser set email = ? where userID = ?")
                .setParameter(1, newemail)
                .setParameter(2, userID)
                .executeUpdate();
        em.createQuery("update MyUser c set c.email = :newemail where c.userID = :userID")
                .setParameter("newemail", newemail)
                .setParameter("userID", userID)
                .executeUpdate();
    }
    
    public void updateSex(String newsex, int userID){
        em.createNativeQuery("update myUser set sex = ? where userID = ?")
                .setParameter(1, newsex)
                .setParameter(2, userID)
                .executeUpdate();
        em.createQuery("update MyUser c set c.sex = :newsex where c.userID = :userID")
                .setParameter("newsex", newsex)
                .setParameter("userID", userID)
                .executeUpdate();
    }
    
    public void updatePhone(String newphone, int userID){
        em.createNativeQuery("update myUser set phone = ? where userID = ?")
                .setParameter(1, newphone)
                .setParameter(2, userID)
                .executeUpdate();
        em.createQuery("update MyUser c set c.phone = :newphone where c.userID = :userID")
                .setParameter("newphone", newphone)
                .setParameter("userID", userID)
                .executeUpdate();
    } 
    
    public void deleteUser(int userID){
        em.createQuery("delete from MyUser c where c.userID = :userID")
                .setParameter("userID", userID)
                .executeUpdate();
        em.createNativeQuery("delete from myUser where userID = ?")
                .setParameter(1, userID)
                .executeUpdate();
    }
}
