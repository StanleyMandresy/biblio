<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Connexion</title></head>
<body>
    <h2>Connexion Adhérent</h2>

    <c:if test="${not empty erreur}">
        <p style="color: red">${erreur}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/adherents/login" method="post">
        Email : <input type="email" name="email" required /><br>
        Mot de passe : <input type="password" name="motDePasse" required /><br>
        <button type="submit">Se connecter</button>
    </form>
</body>
</html>
