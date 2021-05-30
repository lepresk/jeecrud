/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lepresk.pizza.model;

import java.sql.Date;

/**
 *
 * @author Dev
 */
public class Order {
    
    private static final int DELIVERY_DOMICILE = 1;
    private static final int DELIVERY_EN_BOUTIQUE = 2;
    
    protected int id;
    protected String name;
    protected String email;
    protected String phone;
    protected String address;
    protected int deliveryOption;
    protected int qty;
    protected int menuId;
    protected Date orderDate;

    public Order() {
    }

    public Order(int id, String name, String email, String phone, String address, int deliveryOption, int qty, int menuId, Date orderDate) {
        this(name, email, phone, address, deliveryOption, qty, menuId);
        this.id = id;
        this.orderDate = orderDate;
    }

    public Order(String name, String email, String phone, String address, int deliveryOption, int qty, int menuId) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.deliveryOption = deliveryOption;
        this.qty = qty;
        this.menuId = menuId;
        this.orderDate = new Date(System.currentTimeMillis());
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getDeliveryOption() {
        return deliveryOption;
    }

    public void setDeliveryOption(int deliveryOption) {
        this.deliveryOption = deliveryOption;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}
