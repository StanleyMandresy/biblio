<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Liste des prêts</title>
</head>
<body>

<h2>Liste des prêts</h2>

<a href="${pageContext.request.contextPath}/prets/add?type=sur_place">Créer prêt sur place</a> |
<a href="${pageContext.request.contextPath}/prets/add?type=a_domicile">Créer prêt à domicile</a>

<br><br>
<table border="1" cellpadding="5">
    <thead>
        <tr>
            <th>Adhérent</th>
            <th>Livre</th>
            <th>Exemplaire</th>
            <th>Date Emprunt</th>
            <th>Date Rendu Prévue</th>
            <th>Type</th>
            <th>Status rendu</th>  <!-- nouvelle colonne -->
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="pret" items="${prets}">
            <tr>
                <td>${pret.adherent.nom} ${pret.adherent.prenom}</td>
                <td>${pret.exemplaireLivre.livre.titre}</td>
                <td>${pret.exemplaireLivre.codeBarre}</td>
                <td> "${pret.dateEmprunt}" </td>
                <td>"${pret.dateRenduPrevue}"</td>
                <td>${pret.typePret}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty pret.dateRendu}">
                            Rendu
                        </c:when>
                        <c:otherwise>
                            En cours
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:if test="${empty pret.dateRendu}">
                        <form action="${pageContext.request.contextPath}/prets/rendre/${pret.idPret}" method="get" style="display:inline;">
                            <input type="submit" value="Rendre" />
                        </form>
                        &nbsp;
                        <form action="${pageContext.request.contextPath}/prets/prolonger/${pret.idPret}" method="post" style="display:inline;">
                            <input type="submit" value="Prolonger" />
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
