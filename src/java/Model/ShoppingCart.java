/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import entity.Product;
import java.util.*;

/**
 *
 * @author Nguyen Minh Dang
 */
public class ShoppingCart {
    List<ShoppingCartItem> items;
    int numOfItems;
    long total;
    
    public ShoppingCart(){
        items = new ArrayList<ShoppingCartItem>();
        numOfItems = 0;
        total = 0;
    }
    public synchronized void addItem(Product product){
        boolean newItem = true;
        for (ShoppingCartItem scItem: items){
            if (scItem.getProd().getProdID() == product.getProdID()){
                newItem = false;
                scItem.incrementQuantity();
                break;
            }
        }
        
        if (newItem) {
            ShoppingCartItem scItem = new ShoppingCartItem(product);
            items.add(scItem);
        }
    }
    
    public synchronized void update(Product product, String quantity) {
        short qty = -1;
    // cast quantity as short
        qty = Short.parseShort(quantity);
        if (qty >= 0) {
            ShoppingCartItem item = null;
            for (ShoppingCartItem scItem : items) {
                if (scItem.getProd().getProdID() == product.getProdID()) {
                    if (qty != 0) {
                        // set item quantity to new value
                        scItem.setQuantity(qty);
                    } else {
                        // if quantity equals 0, save item and break
                        item = scItem;
                        break;
                    }
                }
            }
            if (item != null) {
            // remove from cart
            items.remove(item);
            }
        }
    }
    
    public synchronized List<ShoppingCartItem> getItems() {
        return items;
    }
    
    public synchronized int getNumberOfItems() {
        numOfItems = 0;
        for (ShoppingCartItem scItem : items) {
            numOfItems += scItem.getQuantity();
        }
        return numOfItems;
    }
    
    public synchronized long getSubtotal() {
        long amount = 0;
        for (ShoppingCartItem scItem : items) {
            Product product = (Product) scItem.getProd();
            amount += (scItem.getQuantity() * product.getPrice());
        }
        return amount;
    }
    
    public synchronized void calculateTotal (String surcharge){
        long amount = 0;
        
        long s = Long.parseLong(surcharge);      
        amount = this.getSubtotal();
        amount += s;
        total = amount;
    }
    
    public synchronized long getTotal(){
        return total;
    }
    
    public synchronized void clear (){
        items.clear();
        numOfItems = 0;
        total = 0;
    }
    
}
