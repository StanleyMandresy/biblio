<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h2>Liste des pénalités</h2>

<table border="1">
    <tr>
        <th>Adhérent</th>
        <th>Date début</th>
        <th>Date levée</th>
        <th>Pret lié</th>
    </tr>
    <c:forEach var="p" items="${penalites}">
        <tr>
            <td>${p.adherent.nom}</td>
            <td>${p.dateDebutPenalite}</td>
            <td>${p.datelevePenalite}</td>
            <td><c:if test="${not empty p.pret}">${p.pret.idPret}</c:if></td>
        </tr>
    </c:forEach>
</table>
