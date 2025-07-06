<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><body>
<h2>Liste des Réservations</h2>
<a href="${pageContext.request.contextPath}/reservations/create">Nouvelle réservation</a>
<table border="1">
    <tr>
        <th>ID</th><th>Adhérent</th><th>Livre</th><th>Exemplaire</th><th>Date</th><th>Début</th><th>Jours</th>
    </tr>
    <c:forEach var="r" items="${reservations}">
        <tr>
            <td>${r.idReservation}</td>
            <td>${r.adherent.nom}</td>
            <td>${r.livre.titre}</td>
            <td><c:out value="${r.exemplaireLivre.codeBarre}"/></td>
            <td>${r.dateReservation}</td>
            <td>${r.dateDebutReservation}</td>
            <td>${r.jourReservation}</td>
        </tr>
    </c:forEach>
</table>
</body></html>
