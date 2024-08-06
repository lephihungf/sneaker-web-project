/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Dan
 */
//[productid] [int] IDENTITY(1,1) NOT NULL,
//	[productname] [nvarchar](250) NULL,
//	[categoryid] [int] NOT NULL,
//	[price] [float] NULL,
//	[quantity] [int] NULL,
//	[image] [nvarchar](250) NULL,
//	[description] [nvarchar](250) NULL,
//	[sold_quantity] [int] NULL,
//	[releaseDate] [date] NULL,
public class Product {
    int productId;
    String productName;
    Category category;
    double price;
    String image;
    String description;
    int sold_quantity;
    Date releaseDate;
  

    public Product() {
    }

    public Product(int productId, String productName, Category category, double price, String image, String description, int sold_quantity, Date releaseDate, Size size) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
        this.price = price;
        this.image = image;
        this.description = description;
        this.sold_quantity = sold_quantity;
        this.releaseDate = releaseDate;
        
    }

 

    

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSold_quantity() {
        return sold_quantity;
    }

    public void setSold_quantity(int sold_quantity) {
        this.sold_quantity = sold_quantity;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", category=" + category + ", price=" + price + ", image=" + image + ", description=" + description + ", sold_quantity=" + sold_quantity + ", releaseDate=" + releaseDate + '}';
    }

    

    
    
    
}
