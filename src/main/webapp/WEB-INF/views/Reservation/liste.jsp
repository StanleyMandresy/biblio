<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des réservations</title>
    <style>
        :root {
            --cafe-creme: #fef6f0;
            --cafe-text: #4e342e;
            --cafe-button: #a1887f;
            --cafe-accent: #ff7043;
            --cafe-border: #d7ccc8;
            --cafe-error: #d32f2f;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: var(--cafe-creme);
            color: var(--cafe-text);
            padding: 20px;
        }

        h2 {
            color: var(--cafe-accent);
        }

        table {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid var(--cafe-border);
            background-color: white;
        }

        th, td {
            border: 1px solid var(--cafe-border);
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: var(--cafe-button);
            color: white;
        }

        td span {
            font-weight: bold;
        }

        input[type="submit"] {
            background-color: var(--cafe-accent);
            border: none;
            color: white;
            padding: 6px 12px;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #ff5722;
        }
           a {
            color: #ff7043;
            text-decoration: none;
            margin: 0 10px;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Liste des réservations</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Adhérent</th>
            <th>Livre</th>
            <th>Exemplaire</th>
            <th>Date début</th>
            <th>Date Fin</th>
            <th>Statut</th>
            <th>Action</th>
        </tr>
        <c:forEach var="r" items="${reservations}">
            <tr>
                <td>${r.idReservation}</td>
                <td>${r.adherent.nom} ${r.adherent.prenom}</td>
                <td>${r.livre.titre}</td>
                <td>${r.exemplaireLivre.codeBarre}</td>
                <td>${r.dateDebutReservation}</td>
                <td>${r.dateFinReservation}</td>
                <td>
                    <c:choose>
                        <c:when test="${r.isApproved}">
                            <span style="color:green;">Validée</span>
                        </c:when>
                        <c:otherwise>
                            <span style="color:orange;">En attente</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:if test="${not r.isApproved}">
                        <form method="post" action="${pageContext.request.contextPath}/reservations/valider/${r.idReservation}">
                            <input type="submit" value="Valider" />
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
        <div style="margin-bottom: 20px;">
        <a href="${pageContext.request.contextPath}/dashboard">revenir au dashboard</a>
   
    </div>
</body>
</html>
