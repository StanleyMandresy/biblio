

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Liste des livres</title>
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
<table border="1" cellpadding="5" cellspacing="0">
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
