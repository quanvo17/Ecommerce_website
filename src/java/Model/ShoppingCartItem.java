/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import entity.Product;

/**
 *
 * @author Nguyen Minh Dang
 */
public class ShoppingCartItem {
    Product prod;
    short quantity;
    
    public ShoppingCartItem(Product prod){
        this.prod = prod;
        quantity = 1;
    }
    
    public Product getProd() {
        return prod;
    }

    public void setProd(Product prod) {
        this.prod = prod;
    }

    public short getQuantity() {
        return quantity;
    }

    public void setQuantity(short quantity) {
        this.quantity = quantity;
    }
    
    public void incrementQuantity() {
        quantity++;
    }
    
    public void decrementQuantity(){
        quantity--;
    }
    
    public long getTotal(){
        long amount = 0;
        amount = (this.getQuantity()*prod.getPrice());
        return amount;
    }
    
}
