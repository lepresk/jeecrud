<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Books Store Application</title>
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
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/">Liste des plats</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/new">Nouveau</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container my-5">
            <div class="row">
                <div class="col-lg-6 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="card-title">
                                <c:if test="${book != null}">
                                    Edit Book
                                </c:if>
                                <c:if test="${book == null}">
                                    Add New Book
                                </c:if>
                            </h3>

                            <c:if test="${book != null}">
                                <form action="${pageContext.request.contextPath}/admin/update" method="post" enctype="multipart/form-data">
                                </c:if>
                                <c:if test="${book == null}">
                                    <form action="${pageContext.request.contextPath}/admin/insert" method="post" enctype="multipart/form-data">
                                    </c:if>
                                    <c:if test="${book != null}">
                                        <input type="hidden" name="id" value="<c:out value='${book.id}' />" />
                                    </c:if>

                                    <div class="mb-3">
                                        <label for="formFile" class="form-label">Image</label>
                                        <input class="form-control" name="photo" type="file" id="formFile" required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Nom</label>
                                        <input type="text" name="title" class="form-control" value="<c:out value='${book.title}' />" required >
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Author: </label>
                                        <input type="text" name="author" class="form-control" value="<c:out value='${book.author}' />" required />
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Price: </label>
                                        <input type="number" min="0" step="1" name="price" class="form-control" value="<c:out value='${book.price}' />" required />
                                    </div>
                                    <div class="mb-3">
                                        <button class="btn btn-primary" type="submit">Enregistrer</button>
                                    </div>
                                </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>