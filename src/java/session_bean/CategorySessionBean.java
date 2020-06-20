/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session_bean;

import entity.Category;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Nguyen Minh Dang
 */
@Stateless
public class CategorySessionBean extends AbstractSessionBean<Category>{
    
    @PersistenceContext(unitName = "EcommercePU")
    private EntityManager em;
    
    protected EntityManager getEntityManager(){
        return em;
    }
    
    public CategorySessionBean(){
        super(Category.class);
    }
    
    public void insertNewCate(int cateID, String name, String desc, String imag){
        em.createNativeQuery("insert into category (cateID, name, description, image) values (?, ?, ?, ?)")
                .setParameter(1, cateID)
                .setParameter(2, name)
                .setParameter(3, desc)
                .setParameter(4, imag)
                .executeUpdate();
    }
    public void disableCate(int cateID){
        em.createNativeQuery("update category set status = ? where cateID = ?")
                .setParameter(1, 0)
                .setParameter(2, cateID)
                .executeUpdate();
        em.createQuery("update Category c set c.status = :status where c.cateID = :cateID")
                .setParameter("status", false)
                .setParameter("cateID", cateID)
                .executeUpdate();
    }
    public void enableCate(int cateID){
        em.createNativeQuery("update category set status = ? where cateID = ?")
                .setParameter(1, 1)
                .setParameter(2, cateID)
                .executeUpdate();
        em.createQuery("update Category c set c.status = :status where c.cateID = :cateID")
                .setParameter("status", true)
                .setParameter("cateID", cateID)
                .executeUpdate();
    }
    
    public void updateName(String name, int cateID){
        em.createNativeQuery("update category set name = ? where cateID = ?")
                .setParameter(1, name)
                .setParameter(2, cateID)
                .executeUpdate();
        em.createQuery("update Category c set c.name = :name where c.cateID = :cateID")
                .setParameter("name", name)
                .setParameter("cateID", cateID)
                .executeUpdate();
    }
    public void updateDesc(String desc, int cateID){
        em.createNativeQuery("update category set description = ? where cateID = ?")
                .setParameter(1, desc)
                .setParameter(2, cateID)
                .executeUpdate();
        em.createQuery("update Category c set c.description = :desc where c.cateID = :cateID")
                .setParameter("desc", desc)
                .setParameter("cateID", cateID)
                .executeUpdate();
    }
    public void updateImage(String image, int cateID){
        em.createNativeQuery("update category set image = ? where cateID = ?")
                .setParameter(1, image)
                .setParameter(2, cateID)
                .executeUpdate();
        em.createQuery("update Category c set c.image = :desc where c.cateID = :cateID")
                .setParameter("desc", image)
                .setParameter("cateID", cateID)
                .executeUpdate();
    }
    public List<Category> findActiveCate(){
        return (List<Category>)em.createQuery("select c from Category c where c.status = :status")
                .setParameter("status", true)
                .getResultList();
    }
}
