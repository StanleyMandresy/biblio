<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste des livres - Café Littéraire</title>
    <style>
        body {
            background-color: #fef6f0;
            color: #4e342e;
            font-family: 'Georgia', serif;
            margin: 0;
            padding: 20px;
        }

        h2, h3 {
            color: #4e342e;
            border-bottom: 2px solid #a1887f;
            padding-bottom: 5px;
        }

        form {
            background-color: rgba(255, 255, 255, 0.7);
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        label {
            display: inline-block;
            width: 80px;
            margin-right: 10px;
            color: #4e342e;
        }

        input[type="text"],
        input[type="number"],
        select {
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #a1887f;
            border-radius: 3px;
        }

        button {
            background-color: #a1887f;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #ff7043;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th {
            background-color: #a1887f;
            color: white;
            padding: 10px;
            text-align: left;
        }

        td {
            padding: 8px;
            border-bottom: 1px solid #d7ccc8;
        }

        tr:hover {
            background-color: rgba(255, 112, 67, 0.1);
        }

        hr {
            border: 0;
            height: 1px;
            background-color: #d7ccc8;
            margin: 20px 0;
        }

        a {
            color: #ff7043;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<h2>Recherche livres</h2>

<form action="${pageContext.request.contextPath}/livres" method="get">
    <label>Titre :</label>
    <input type="text" name="titre" value="${titre != null ? titre : ''}" />

    <label>Auteur :</label>
    <input type="text" name="auteur" value="${auteur != null ? auteur : ''}" />

    <label>Année :</label>
    <input type="number" name="annee" value="${annee != null ? annee : ''}" />

    <label>Type :</label>
    <select name="typeId">
        <option value="">-- Tous --</option>
        <c:forEach var="type" items="${types}">
            <option value="${type.idTypeLivre}" ${typeId != null && type.idTypeLivre == typeId ? 'selected' : ''}>
                ${type.type}
            </option>
        </c:forEach>
    </select>

    <button type="submit">Rechercher</button>
</form>

<hr/>

<h3>Filtrer par catégories</h3>
<form action="${pageContext.request.contextPath}/livres/filtrer-categories" method="get">
    <c:forEach var="categorie" items="${categories}">
        <label>
            <input type="checkbox" name="categoriesSelectionnees" value="${categorie.idCatLivre}"
                <c:if test="${categoriesSelectionnees != null && categoriesSelectionnees.contains(categorie.idCatLivre)}">
                    checked
                </c:if>
            />
            ${categorie.categorie}
        </label><br/>
    </c:forEach>
    <button type="submit">Filtrer</button>
</form>

<hr/>

<h3>Résultats</h3>
<table>
    <thead>
        <tr>
            <th>Titre</th>
            <th>Auteur</th>
            <th>Date édition</th>
            <th>Type</th>
            <th>Catégories</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="livre" items="${livres}">
            <tr>
                <td>${livre.titre}</td>
                <td>${livre.auteur}</td>
                <td><c:out value="${livre.dateEdition}"/></td>
                <td><c:out value="${livre.typeLivre != null ? livre.typeLivre.type : ''}"/></td>
                <td>
                    <c:forEach var="cat" items="${livre.categories}">
                        ${cat.categorie}<br/>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty livres}">
            <tr><td colspan="5">Aucun livre trouvé.</td></tr>
        </c:if>
    </tbody>
</table>

</body>
</html>
