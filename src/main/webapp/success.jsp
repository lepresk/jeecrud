<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <li class="menu-accueil"><a href="index.html">Accueil</a></li>
                <li class="menu-news"><a href="news.html">News</a></li>
                <li class="menu-contact"><a href="contact.html">Contact</a></li>
            </ul>
        </nav>
        <div class="container">
            <div class="d-flex align-items-center justify-content-center flex-column" style="padding-top: 80px;">
                <h1>Votre commande à été passer avec succès</h1>
                <p class="text-center">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque aspernatur, ipsum aperiam veritatis, facilis hic minus consectetur maxime modi ab eveniet exercitationem ratione ad. Velit iste quo rem est expedita.</p>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}">Retour à l'acceuil</a>
            </div>
        </div>
    </body>
</html>
