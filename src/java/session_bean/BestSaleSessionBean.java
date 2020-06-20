/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session_bean;

import entity.BestSale;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Nguyen Minh Dang
 */
@Stateless
public class BestSaleSessionBean extends AbstractSessionBean<BestSale>{ 
    
    @PersistenceContext(unitName="EcommercePU")
    private EntityManager em;
    
    protected EntityManager getEntityManager(){
        return em;
    }
    
    public BestSaleSessionBean(){
        super(BestSale.class);
    }
    
    public List<BestSale> getBestSale(){
        return (List<BestSale>) em.createQuery("select c from BestSale c where c.product.status = :status order by c.numOfProd desc").setParameter("status", true).setMaxResults(8).getResultList();
    }
    public List<BestSale> getTrendy(){
        return (List<BestSale>) em.createQuery("select c from BestSale c where c.product.status = :status order by c.numOfProd desc").setParameter("status", true).getResultList();
    }
}
