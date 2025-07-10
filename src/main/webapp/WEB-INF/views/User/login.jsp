<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Connexion Utilisateur</title>
    <style>
        body {
            background-color: #fef6f0;
            color: #4e342e;
            font-family: 'Segoe UI', sans-serif;
            padding: 30px;
        }

        h2 {
            color: #ff7043;
            text-align: center;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #ddd;
            max-width: 400px;
            margin: auto;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            margin-top: 16px;
            background-color: #a1887f;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover {
            background-color: #ff7043;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h2>Connexion Administrateur</h2>

    <c:if test="${not empty erreur}">
        <div class="error-message">${erreur}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/users/login">
        <label for="email">Email :</label>
        <input type="email" name="email" id="email" required>

        <label for="mdp">Mot de passe :</label>
        <input type="password" name="mdp" id="mdp" required>

        <button type="submit">Se connecter</button>
    </form>
</body>
</html>
