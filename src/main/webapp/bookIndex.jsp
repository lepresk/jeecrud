<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Books Store Application</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
                <a class="navbar-brand" href="#">Gestion des plats</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/admin/">Liste des plats</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/new">Nouveau</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="px-4 py-5 text-center">
                <h1 class="display-5 fw-bold">Bienvenu au back-office</h1>
                <div class="col-lg-6 mx-auto">
                    <p class="lead mb-4">Gérer les menus disponible sur le site</p>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>Author</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="book" items="${listBook}">
                                <tr>
                                    <td><c:out value="${book.id}" /></td>
                                    <td><img style="max-width: 90px; height: auto; object-fit: cover;" src='${pageContext.request.contextPath}/images/<c:url value="${book.image}"></c:url>' />   </td>
                                    <td><c:out value="${book.title}" /></td>
                                    <td><c:out value="${book.author}" /></td>
                                    <td><c:out value="${book.price}" /></td>
                                    <td>
                                        <a class="btn btn-sm btn-light" href="${pageContext.request.contextPath}/admin/edit?id=<c:out value='${book.id}' />">Editer</a>
                                        <a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/admin/delete?id=<c:out value='${book.id}' />">Supprimer</a>                     
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>