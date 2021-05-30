<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PIZZA 242</title>
        <link href="${pageContext.request.contextPath}/ressources/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/ressources/css/app.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <nav>
            <ul>
                <li class="menu-accueil"><a href="${pageContext.request.contextPath}">Accueil</a></li>
                <li class="menu-news"><a href="news.html">News</a></li>
                <li class="menu-contact"><a href="contact.html">Contact</a></li>
            </ul>
        </nav>
        <form class="mb-5">
            <div class="page-content">
                <div class="menu-detail-container">
                    <div class="menu-item">
                        <img src='${pageContext.request.contextPath}/ressources/images/<c:url value="${book.image}"></c:url>' />
                        <div class="menu-title"><c:out value="${book.title}" /></div>
                        <div class="menu-price"><c:out value="${book.formattedPrice}" /></div>
                        <p><c:out value="${book.author}" /></p>

                        <div class="row">
                            <div class="col-md-4">
                                <label class="form-label">Quantité</label>
                                <input class="form-control" type="number" name="qty" min="1" placeholder="Quantité" step="1" required value="1" />
                            </div>
                        </div>

                    </div>

                    <div class="menu-form">
                        <h3>Informations de livraison</h3>
                        <hr>
                        <input type="hidden" name="action" value="save_order" />
                        <input type="hidden" name="id" value='<c:out value="${book.id}" />' />
                        <input type="hidden" name="menu_id" value='<c:out value="${book.id}" />' />
                        <div class="mb-3">
                            <label class="form-label">Nom complet</label>
                            <input class="form-control" name="name" required />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Adresse email</label>
                            <input class="form-control" name="email" type="email" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Téléphone</label>
                            <input class="form-control" name="phone" type="tel" required />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Adresse</label>
                            <textarea class="form-control" name="address"></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="mb-1">Mode de livraison</label>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="mode-livraison-1" name="delivery_option" value="1" checked>
                                <label class="form-check-label" for="mode-livraison-1">
                                    Livraison à domicile
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" id="mode-livraison-2" name="delivery_option" value="2">
                                <label class="form-check-label" for="mode-livraison-2">
                                    En boutique
                                </label>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-block btn-primary">Commander</button>

                    </div>
                </div>
            </div>
        </form>

        <footer>
            <div class="footer">
                <p>
                    PIZZA 242 <br />
                    Address : 88 rue Sainte 13007 Marseille <br />
                    Phone : +86 186 4049 4609<br />
                    E-mail: contact@pizza242.cg <br />
                    Web link : https://www.pizza242.cg
                </p>
                <p>By Cyndi Ntetani<br /> <a href="#">Thank you for your visit!</a></p>
            </div>
        </footer>
    </body>
</html>
