<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Connexion Adhérent</title>
    <style>
        body {
            background-color: #fef6f0;
            color: #4e342e;
            font-family: 'Segoe UI', sans-serif;
            padding: 30px;
        }

        h2 {
            color: #ff7043;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            max-width: 400px;
            margin: auto;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            background-color: #a1887f;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover {
            background-color: #ff7043;
        }

        .error-message {
            color: red;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Connexion Adhérent</h2>

    <c:if test="${not empty erreur}">
        <div class="error-message">${erreur}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/adherents/login" method="post">
        <label>Email :</label>
        <input type="email" name="email" required />

        <label>Mot de passe :</label>
        <input type="password" name="motDePasse" required />

        <button type="submit">Se connecter</button>
    </form>
</body>
</html>
