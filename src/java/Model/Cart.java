/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Dan
 */
public class Cart {
    private int accountid;   
    private int productid;   
    private int quantity; 
    private int size;

    public Cart() {
    }

    public Cart(int accountid, int productid, int quantity, int size) {
        this.accountid = accountid;
        this.productid = productid;
        this.quantity = quantity;
        this.size = size;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
    
    
    
   

    public int getAccountid() {
        return accountid;
    }

    public void setAccountid(int accountid) {
        this.accountid = accountid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" + "accountid=" + accountid + ", productid=" + productid + ", quantity=" + quantity + ", size=" + size + '}';
    }

    
}
