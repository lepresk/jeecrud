<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Books Store Application</title>
        <!-- CSS only -->
        <link href="${pageContext.request.contextPath}/ressources/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <title>Order history</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/admin">Gestion des plats</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/admin">Liste des plats</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/admin?action=order">Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin?action=new">Nouveau</a>
                        </li>
                    </ul>

                    <div class="navbar-nav flex-row flex-wrap ms-md-auto">
                        <li class="nav-item col-6 col-md-auto">
                            <a class="nav-link p-2" href="${pageContext.request.contextPath}/admin?action=logout">
                                Logout
                            </a>
                        </li>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="px-4 py-5 text-center">
                <h1 class="display-5 fw-bold">Bienvenu au back-office</h1>
                <div class="col-lg-6 mx-auto">
                    <p class="lead mb-4">Gérer les commandes disponible sur le site</p>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 mx-auto">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Titre</th>
                                <th>Qty</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Delivery option</th>
                                <th>Unit price</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${listOrders}">
                                <tr>
                                    <td><img style="max-height: 50px; width: auto; object-fit: cover;" src='${pageContext.request.contextPath}/ressources/images/<c:url value="${order.menuImageName}"></c:url>' />   </td>
                                    <td><c:out value="${order.menuName}" /></td>
                                    <td><c:out value="${order.qty}" /></td>
                                    <td><c:out value="${order.name}" /></td>
                                    <td><c:out value="${order.phone}" /></td>
                                    <td><c:out value="${order.deliveryOptionName}" /></td>
                                    <td><c:out value="${order.menuPrice}" /></td>
                                    <td><c:out value="${order.total}" /></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>