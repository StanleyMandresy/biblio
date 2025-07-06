<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><body>
<h2>Nouvelle réservation</h2>
<form action="${pageContext.request.contextPath}/reservations/save" method="post">
    Adhérent :
    <select name="adherent.idAdherent">
        <c:forEach var="a" items="${adherents}">
            <option value="${a.idAdherent}">${a.nom}</option>
        </c:forEach>
    </select><br>

    Livre :
    <select name="livre.idLivre">
        <c:forEach var="l" items="${livres}">
            <option value="${l.idLivre}">${l.titre}</option>
        </c:forEach>
    </select><br>

    Exemplaire (optionnel) :
    <select name="exemplaireLivre.idExemplaireLivre">
        <option value="">--</option>
        <c:forEach var="e" items="${exemplaires}">
            <option value="${e.idExemplaireLivre}">${e.codeBarre}</option>
        </c:forEach>
    </select><br>

    Jours réservation :
    <input type="number" name="jourReservation"/><br>

    Date début (optionnelle) :
    <input type="date" name="dateDebutReservation"/><br>

    <input type="submit" value="Réserver"/>
</form>
</body></html>
