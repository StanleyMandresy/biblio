<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Liste des prêts - Café Littéraire</title>
    <style>
        body {
            background-color: #fef6f0;
            color: #4e342e;
            font-family: 'Georgia', serif;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #4e342e;
            border-bottom: 2px solid #a1887f;
            padding-bottom: 5px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        th {
            background-color: #a1887f;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #d7ccc8;
        }

        tr:hover {
            background-color: rgba(255, 112, 67, 0.1);
        }

        input[type="submit"] {
            background-color: #a1887f;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: 'Georgia', serif;
        }

        input[type="submit"]:hover {
            background-color: #ff7043;
        }

        .rendu {
            color: #2e7d32;
            font-weight: bold;
        }

        .en-cours {
            color: #ff7043;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>Liste des prêts</h2>

<div style="margin-bottom: 20px;">
    <a href="${pageContext.request.contextPath}/prets/add?type=sur_place">Créer prêt sur place</a>
    <a href="${pageContext.request.contextPath}/prets/add?type=a_domicile">Créer prêt à domicile</a>
</div>

<table>
    <thead>
        <tr>
            <th>Adhérent</th>
            <th>Livre</th>
            <th>Exemplaire</th>
            <th>Date Emprunt</th>
            <th>Date Rendu Prévue</th>
            <th>Type</th>
            <th>Status rendu</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="pret" items="${prets}">
            <tr>
                <td>${pret.adherent.nom} ${pret.adherent.prenom}</td>
                <td>${pret.exemplaireLivre.livre.titre}</td>
                <td>${pret.exemplaireLivre.codeBarre}</td>
         <td>${pret.dateEmprunt}</td>
                <td>${pret.dateRenduPrevue}</td>
                <td>${pret.typePret}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty pret.dateRendu}">
                            <span class="rendu">Rendu</span>
                        </c:when>
                        <c:otherwise>
                            <span class="en-cours">En cours</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:if test="${empty pret.dateRendu}">
                        <form action="${pageContext.request.contextPath}/prets/rendre/${pret.idPret}" method="get" style="display:inline;">
                            <input type="submit" value="Rendre" />
                        </form>
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
