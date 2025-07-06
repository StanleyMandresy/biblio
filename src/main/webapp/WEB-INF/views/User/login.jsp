<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Connexion Utilisateur</title>
</head>
<body>
    <h2>Connexion</h2>

    <c:if test="${not empty erreur}">
        <p style="color:red">${erreur}</p>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/users/login">
        <label>Email :</label><br>
        <input type="email" name="email" required><br>

        <label>Mot de passe :</label><br>
        <input type="password" name="mdp" required><br><br>

        <button type="submit">Se connecter</button>
    </form>
</body>
</html>
