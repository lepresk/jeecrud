/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lepresk.pizza.model;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author Dev
 */
public class Book {
    protected int id;
    protected String title;
    protected String author;
    protected float price;
    protected String image;
    protected String path;
    protected String formattedPrice;
 
    public Book() {
    }
 
    public Book(int id) {
        this.id = id;
    }
 
    public Book(int id, String title, String author, float price) {
        this(title, author, price);
        this.id = id;
    }
    
    public Book(int id, String title, String author, float price, String imageName, String imagePath) {
        this(title, author, price, imageName, imagePath);
        this.id = id;
    }
     
    public Book(String title, String author, float price) {
        this.title = title;
        this.author = author;
        this.price = price;
        this.formattedPrice = NumberFormat.getInstance(Locale.FRENCH).format(price) + " $";
    }
    
    public Book(String title, String author, float price, String imageName, String imagePath) {
        this(title, author, price);
        this.image = imageName;
        this.path = imagePath;
    }
 
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
 
    public String getTitle() {
        return title;
    }
 
    public void setTitle(String title) {
        this.title = title;
    }
 
    public String getAuthor() {
        return author;
    }
 
    public void setAuthor(String author) {
        this.author = author;
    }
 
    public float getPrice() {
        return price;
    }
 
    public void setPrice(float price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getFormattedPrice() {
        return formattedPrice;
    }
   
}
