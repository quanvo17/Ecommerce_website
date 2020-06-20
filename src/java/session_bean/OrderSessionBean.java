/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session_bean;

import entity.MyOrder;
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
public class OrderSessionBean extends AbstractSessionBean<MyOrder>{
    @PersistenceContext(unitName = "EcommercePU")
    private EntityManager em;
    
    protected EntityManager getEntityManager(){
        return em;
    }
    
    public OrderSessionBean(){
        super(MyOrder.class);
    }
    
    public void insertOrder(String orderID,Integer userID, String contactName, String contactPhone, String shipAddress, long totalMoney){
        em.createNativeQuery("insert into myOrder (orderID, userID, contactName, contactPhone, shipAddress, totalMoney) values (?, ?, ?, ?, ?, ?)")
                .setParameter(1, orderID)
                .setParameter(2, userID)
                .setParameter(3, contactName)
                .setParameter(4, contactPhone)
                .setParameter(5, shipAddress)
                .setParameter(6, totalMoney)
                .executeUpdate();
    }
    
    public void insertOrderDetail(String orderID, Integer prodID, int unitPrice, short quantity, long amount){
        em.createNativeQuery("insert into myOrderDetail (orderID, prodID, unitPrice, quantity, amount) values (?, ?, ?, ?, ?)")
                .setParameter(1, orderID)
                .setParameter(2, prodID)
                .setParameter(3, unitPrice)
                .setParameter(4, quantity)
                .setParameter(5, amount)
                .executeUpdate();
    }
    public List<MyOrder> findByUserID(MyUser userID){
        return (List<MyOrder>)em.createQuery("select c from MyOrder c where c.userID = :userID")
                .setParameter("userID", userID)
                .getResultList();
    }
}
