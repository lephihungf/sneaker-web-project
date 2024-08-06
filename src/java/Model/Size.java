/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
//[sizeid] [int] IDENTITY(1,1) NOT NULL,
//	[productid] [int] NOT NULL,
//	[quantity] [int] NULL,
//	[size] [int] NOT NULL,
public class Size {
    int sizeid;
    int productid;
    int quantity;
    int size;

    public Size() {
    }

    public Size(int sizeid, int productid, int quantity, int size) {
        this.sizeid = sizeid;
        this.productid = productid;
        this.quantity = quantity;
        this.size = size;
    }

    public int getSizeid() {
        return sizeid;
    }

    public void setSizeid(int sizeid) {
        this.sizeid = sizeid;
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

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "Size{" + "sizeid=" + sizeid + ", productid=" + productid + ", quantity=" + quantity + ", size=" + size + '}';
    }
    
}
