/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lepresk.pizza.dao;

import com.lepresk.pizza.model.Book;
import com.lepresk.pizza.model.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dev
 */
public class OrderDAO {

    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public OrderDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    public boolean insertOrder(Order order) throws SQLException {
        String sql = "INSERT INTO orders (name, email, address, phone, delivery_option, qty, menu_id, order_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, order.getName());
        statement.setString(2, order.getEmail());
        statement.setString(3, order.getAddress());
        statement.setString(4, order.getPhone());
        statement.setInt(5, order.getDeliveryOption());
        statement.setInt(6, order.getQty());
        statement.setInt(7, order.getMenuId());
        statement.setDate(8, order.getOrderDate());

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }

    public List<Order> listAllOrders() throws SQLException {
        List<Order> listOrders = new ArrayList<>();

        String sql = "SELECT o.*, b.title as menu_name, b.price as menu_price, b.image_name as menu_image FROM orders o INNER JOIN book b ON o.menu_id = b.book_id";

        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String address = resultSet.getString("address");
            String phone = resultSet.getString("phone");
            int deliveryOption = resultSet.getInt("delivery_option");
            int qty = resultSet.getInt("qty");
            int menuId = resultSet.getInt("menu_id");
            Date orderDate = resultSet.getDate("order_date");

            String menuName = resultSet.getString("menu_name");
            float menuPrice = resultSet.getFloat("menu_price");
            String menuImage = resultSet.getString("menu_image");

            Order order = new Order(id, name, email, phone, address, deliveryOption, qty, menuId, orderDate);
            order.setMenuName(menuName);
            order.setMenuPrice(menuPrice);
            order.setMenuImageName(menuImage);

            listOrders.add(order);
        }

        resultSet.close();
        statement.close();

        disconnect();

        return listOrders;
    }

    public boolean deleteBook(Book book) throws SQLException {
        String sql = "DELETE FROM book where book_id = ?";

        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, book.getId());

        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowDeleted;
    }

    public Book getBook(int id) throws SQLException {
        Book book = null;
        String sql = "SELECT * FROM book WHERE book_id = ?";

        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);

        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String title = resultSet.getString("title");
            String author = resultSet.getString("ingredients");
            float price = resultSet.getFloat("price");

            String image = resultSet.getString("image_name");
            String imagePath = resultSet.getString("image_path");

            book = new Book(id, title, author, price, image, imagePath);
        }

        resultSet.close();
        statement.close();

        return book;
    }
}
