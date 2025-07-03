<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Liste des Profils</title>
    <style>
        table {
            border-collapse: collapse;
            width: 90%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px 12px;
            text-align: center;
        }
        th {
            background-color: #eee;
        }
        a {
            margin: 0 5px;
            text-decoration: none;
        }
        .btn-ajout {
            display: inline-block;
            margin: 20px;
            padding: 8px 12px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>

<h2 style="text-align: center;">Liste des Profils</h2>

<a class="btn-ajout" href="${pageContext.request.contextPath}/profils/add">+ Ajouter un nouveau profil</a>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Quota sur place</th>
            <th>Quota emprunt</th>
            <th>Durée prêt</th>
            <th>Durée pénalité</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="profil" items="${profils}">
            <tr>
                <td>${profil.idProfil}</td>
                <td>${profil.nomProfil}</td>
                <td>${profil.quotaMaxSurPlace}</td>
                <td>${profil.quotaMaxEmprunter}</td>
                <td>${profil.dureePret}</td>
                  <td>${profil.dureePenalite}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/profils/update/${profil.idProfil}">Modifier</a> |
                    <a href="${pageContext.request.contextPath}/profils/delete/${profil.idProfil}" onclick="return confirm('Confirmer la suppression ?')">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
