<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>PIZZA 242</title>
        <link href="${pageContext.request.contextPath}/ressources/css/app.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <nav>
            <ul>
                <li class="menu-accueil"><a href="index.html">Accueil</a></li>
                <li class="menu-news"><a href="news.html">News</a></li>
                <li class="menu-contact"><a href="contact.html">Contact</a></li>
            </ul>
        </nav>
        <header class="header1">
            <div class="header-content">
                <h1> THE BEST PIZZAS IN CONGO </h1>
                <P>Discover our selection of pizzas, cream, tomato and our specialties and turnovers.<br />
                    With the possibility of having it delivered to your home or to pick up in our shop. </P>
            </div>
            <!-- </div> -->
        </header>

        <h3 class="title">YOUR SATISFRACTION IS OUR PRIORITY</h3>
        <div class="gallery" id="menuc"> 
            <c:forEach var="book" items="${listBook}">
                <div class="thumbnail">
                    <img src='${pageContext.request.contextPath}/ressources/images/<c:url value="${book.image}"></c:url>' />
                    <div class="menu-title"><c:out value="${book.title}" /></div>
                    <div class="menu-price"><c:out value="${book.formattedPrice}" /></div>
                    <p><c:out value="${book.author}" /></p>
                    <a href="${pageContext.request.contextPath}/detail?id=<c:out value='${book.id}' />" class="menu-button">Acheter</a>
                </div>
            </c:forEach>
        </div>

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