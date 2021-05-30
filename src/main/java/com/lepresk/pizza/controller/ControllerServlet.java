package com.lepresk.pizza.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.lepresk.pizza.dao.BookDAO;
import com.lepresk.pizza.dao.OrderDAO;
import com.lepresk.pizza.model.Book;
import com.lepresk.pizza.model.Order;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Dev
 */
@WebServlet("/admin/*")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class ControllerServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "images";

    private static final long serialVersionUID = 1L;
    private BookDAO bookDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() {
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

        bookDAO = new BookDAO(jdbcURL, jdbcUsername, jdbcPassword);
        orderDAO = new OrderDAO(jdbcURL, jdbcUsername, jdbcPassword);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String action = request.getServletPath();
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            String name = (String) request.getSession().getAttribute("name");

            if (!action.equals("login") && (name == null || name.isBlank())) {
                showLogin(request, response);
                return;
            }

            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertBook(request, response);
                    break;
                case "delete":
                    deleteBook(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateBook(request, response);
                    break;
                case "order":
                    listOrder(request, response);
                    break;
                case "login":
                    handleLogin(request, response);
                    break;
                case "logout":
                    handleLogout(request, response);
                    break;
                default:
                    listBook(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void showLogin(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username.equals("Admin") && password.equals("1234")) {
            request.getSession().setAttribute("name", "Administrator");
            response.sendRedirect("admin");
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getSession().removeAttribute("name");
        response.sendRedirect("login.jsp");
    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Book> listBook = bookDAO.listAllBooks();
        request.setAttribute("listBook", listBook);
        RequestDispatcher dispatcher = request.getRequestDispatcher("bookIndex.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book existingBook = bookDAO.getBook(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("BookForm.jsp");
        request.setAttribute("book", existingBook);
        dispatcher.forward(request, response);
    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        float price = Float.parseFloat(request.getParameter("price"));

        Book newBook = new Book(title, author, price);

        uploadFile(request, newBook);

        bookDAO.insertBook(newBook);
        response.sendRedirect("admin");
    }

    private void listOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Order> listOrders = orderDAO.listAllOrders();
        request.setAttribute("listOrders", listOrders);
        RequestDispatcher dispatcher = request.getRequestDispatcher("orderIndex.jsp");
        dispatcher.forward(request, response);
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        Book book = bookDAO.getBook(id);

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        float price = Float.parseFloat(request.getParameter("price"));

        book.setTitle(title);
        book.setAuthor(author);
        book.setPrice(price);

        uploadFile(request, book);

        bookDAO.updateBook(book);
        response.sendRedirect("admin");
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Book book = new Book(id);
        bookDAO.deleteBook(book);
        response.sendRedirect("admin");
    }

    private void uploadFile(HttpServletRequest request, Book book) throws IOException, ServletException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + "ressources" + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Part part = request.getPart("photo");
        String fileName = part.getSubmittedFileName();
        if (fileName.trim().isEmpty()) {
            return;
        }
        String fullPath = uploadPath + File.separator + fileName;
        part.write(fullPath);

        book.setImage(fileName);
        book.setPath(fullPath);
    }
}
