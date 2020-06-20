/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session_bean;

import entity.Category;
import entity.Product;
import entity.ProductDetail;
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
public class ProductSessionBean extends AbstractSessionBean<Product>{
    
    @PersistenceContext(unitName = "EcommercePU")
    private EntityManager em;
    
    protected EntityManager getEntityManager(){
        return em;
    }
    
    public ProductSessionBean(){
        super(Product.class);
    }
    public void updateName(String newname, int prodID){
        em.createNativeQuery("update product set name = ? where prodID = ?")
            .setParameter(1, newname)
            .setParameter(2, prodID)
            .executeUpdate();
        em.createQuery("update Product c set c.name = :newname where c.prodID = :prodID")
                .setParameter("newname", newname)
                .setParameter("prodID", prodID)
                .executeUpdate();
    }
    public void updateInfo(String newinfo, int prodID){
        em.createNativeQuery("update productDetail set info = ? where prodID = ?")
                .setParameter(1, newinfo)
                .setParameter(2, prodID)
                .executeUpdate();
        em.createQuery("update ProductDetail c set c.info = :newinfo  where c.prodID = :prodID")
                .setParameter("newinfo", newinfo)
                .setParameter("prodID", prodID)
                .executeUpdate();
    }
    public void updateDescription(String newdes, int prodID){
        em.createNativeQuery("update productDetail set description = ? where prodID = ?")
                .setParameter(1, newdes)
                .setParameter(2, prodID)
                .executeUpdate();
        em.createQuery("update ProductDetail c set c.description = :newdes where c.prodID = :prodID")
                .setParameter("newdes", newdes)
                .setParameter("prodID", prodID)
                .executeUpdate();
    }
    public void updateCategory(Category newcate, int prodID){
        em.createNativeQuery("update product set cateID = ? where prodID = ?")
                .setParameter(1, newcate.getCateID())
                .setParameter(2, prodID)
                .executeUpdate();
        em.createQuery("update Product c set c.cateID = :newcate where c.prodID = :prodID")
                .setParameter("newcate", newcate)
                .setParameter("prodID", prodID)
                .executeUpdate();
    }
    public void updateUnitPrice(int price, int prodID){
        em.createNativeQuery("update product set price = ? where prodID = ?")
                .setParameter(1, price)
                .setParameter(2, prodID)
                .executeUpdate();
        em.createQuery("update Product c set c.price = :price where c.prodID = :prodID")
                .setParameter("price", price)
                .setParameter("prodID", prodID)
                .executeUpdate();
    }  
    public void disableProduct(int prodID){
        em.createNativeQuery("update product set status = 0 where prodID = ?")
                .setParameter(1, prodID)
                .executeUpdate();
        em.createQuery("update Product c set c.status = :status where c.prodID = :prodID")
                .setParameter("status", false)
                .setParameter("prodID", prodID)
                .executeUpdate();
    }
    public void enableProduct(int prodID){
        em.createNativeQuery("update product set status = 1 where prodID = ?")
                .setParameter(1, prodID)
                .executeUpdate();
        em.createQuery("update Product c set c.status = :status where c.prodID = :prodID")
                .setParameter("status", true)
                .setParameter("prodID", prodID)
                .executeUpdate();
    }
    public void disableByCate(Category cateID){
        em.createQuery("update Product c set c.status = :status where c.cateID = :cateID")
                .setParameter("status", false)
                .setParameter("cateID", cateID)
                .executeUpdate();
        em.createNativeQuery("update product set status = ? where cateID = ?")
                .setParameter(1, 0)
                .setParameter(2, cateID.getCateID())
                .executeUpdate();
    }
    public void enableByCate(Category cateID){
        em.createQuery("update Product c set c.status = :status where c.cateID = :cateID")
                .setParameter("status", true)
                .setParameter("cateID", cateID)
                .executeUpdate();
        em.createNativeQuery("update product set status = ? where cateID = ?")
                .setParameter(1, 1)
                .setParameter(2, cateID.getCateID())
                .executeUpdate();
    }
    public void addNewProduct(Product pr){
        em.createNativeQuery("insert into product (name, cateID, price, thumbImage, status) values (?, ?, ?, ?, ?)")
                .setParameter(1, pr.getName())
                .setParameter(2, pr.getCateID().getCateID())
                .setParameter(3, pr.getPrice())
                .setParameter(4, pr.getThumbImage())
                .setParameter(5, pr.getStatus()?1:0)
                .executeUpdate();
    }
    public void addNewProdDetail(ProductDetail prd){
        em.createNativeQuery("insert into productDetail (prodID, info, description, image1, image2) values (?, ?, ?, ?, ?)")
                .setParameter(1, prd.getProdID())
                .setParameter(2, prd.getInfo())
                .setParameter(3, prd.getDescription())
                .setParameter(4, prd.getImage1())
                .setParameter(5, prd.getImage2())
                .executeUpdate();
    }
    public int getLastIndex(){
        return (int) em.createNativeQuery("select max(prodID) from product").getSingleResult();
    }
    
    public List<Product> findActiveRange(int l, int r){
        List<Product> list = em.createQuery("select c from Product c where c.status = :status").setParameter("status", true).getResultList();
        int len = list.size();
        List<Product> LIST = new ArrayList<>();
        int right = len < r ? len : r;
            for (int i = l; i < right; i ++){
                    LIST.add(list.get(i));
            }
        return LIST;
    }
    public List<Product> findAllActive(){
        return (List<Product>) em.createQuery("select c from Product c where c.status = :status").setParameter("status", true).getResultList();
    }
    public List<Product> findNewArrival(){
        List<Product> list = em.createQuery("select c from Product c where c.status = :status").setParameter("status", true).getResultList();
        int count = list.size();
        if (count < 8) return list;
        List<Product> LIST = new ArrayList<>();
        for (int i = count - 8; i < count; i ++){
            LIST.add(list.get(i));
        }
        return LIST;
    }
    public List<Product> findByCate(Category ctg){
        return (List<Product>) em.createQuery("select c from Product c where c.status = :status and c.cateID = :cate")
                .setParameter("status", true)
                .setParameter("cate", ctg)
                .getResultList();
    }
}
