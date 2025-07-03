<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Liste des adhérents</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        a.button {
            padding: 6px 12px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
        }
    </style>
</head>
<body>

<h2>Liste des adhérents</h2>

<!-- Liens vers Inscription et Réabonnement -->
<div style="margin-bottom: 20px;">
    <a class="button" href="${pageContext.request.contextPath}/adherents/add">Inscrire un adhérent</a>
    <a class="button" href="${pageContext.request.contextPath}/adherents/create">Réabonnement</a>
</div>

<!-- Tableau des adhérents -->
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Date de naissance</th>
            <th>Email</th>
            <th>Date inscription</th>
            <th>Profil</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="a" items="${adherents}">
            <tr>
                <td>${a.idAdherent}</td>
                <td>${a.nom}</td>
                <td>${a.prenom}</td>
                <td>${a.dateNaissance}</td>
                <td>${a.email}</td>
                <td>${a.dateInscription}</td>
                <td>${a.profil.nom}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
