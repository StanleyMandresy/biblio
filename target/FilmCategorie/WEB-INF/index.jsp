
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.sendRedirect(request.getContextPath() + "/");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bienvenue sur Biblio'Tec</title>
    <style>
        body {
            background-color: #fef6f0;
            color: #4e342e;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 20px;
        }

        h1, h2 {
            color: #ff7043;
        }

        a {
            color: #ff7043;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .button {
            background-color: #a1887f;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
        }

        .button:hover {
            background-color: #ff7043;
        }

        .container {
            max-width: 800px;
            margin: auto;
        }

        .roles {
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Bienvenue sur <strong>Biblio'Tec</strong></h1>

    <div class="roles">
        <p>Vous êtes :</p>
        <ul>
            <li><a class="button" href="${pageContext.request.contextPath}/adherents/login">Adhérent</a></li>
            <li><a class="button" href="${pageContext.request.contextPath}/users/login">Admin</a></li>
        </ul>
    </div>

    <p style="margin-top: 40px;">🎨 Thème : <strong>Café Littéraire</strong> — ambiance chaleureuse avec des couleurs douces.</p>
</div>
</body>
</html>
