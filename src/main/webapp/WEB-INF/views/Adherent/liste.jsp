<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des adhérents - Café Littéraire</title>
    <style>
        :root {
            --cafe-creme: #fef6f0;
            --cafe-text: #4e342e;
            --cafe-button: #a1887f;
            --cafe-accent: #ff7043;
            --cafe-border: #d7ccc8;
            --cafe-table-header: #a1887f;
        }

        body {
            background-color: var(--cafe-creme);
            color: var(--cafe-text);
            font-family: 'Georgia', serif;
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        h2 {
            color: var(--cafe-text);
            border-bottom: 2px solid var(--cafe-button);
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
        }

        .action-buttons {
            margin-bottom: 2rem;
            display: flex;
            gap: 1rem;
        }

        .button {
            padding: 0.7rem 1.5rem;
            background-color: var(--cafe-button);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
        }

        .button:hover {
            background-color: var(--cafe-accent);
            transform: translateY(-2px);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        th {
            background-color: var(--cafe-table-header);
            color: white;
            padding: 1rem;
            text-align: left;
            font-weight: 500;
        }

        td {
            padding: 0.8rem 1rem;
            border-bottom: 1px solid var(--cafe-border);
        }

        tr:nth-child(even) {
            background-color: rgba(255,255,255,0.7);
        }

        tr:hover {
            background-color: rgba(255, 112, 67, 0.1);
        }

        .date-cell {
            white-space: nowrap;
        }
    </style>
</head>
<body>

<h2>Liste des adhérents</h2>

<!-- Boutons d'action -->
<div class="action-buttons">
    <a class="button" href="${pageContext.request.contextPath}/adherents/add">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" style="margin-right: 8px;">
            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
        </svg>
        Inscrire un adhérent
    </a>
    <a class="button" href="${pageContext.request.contextPath}/abonnements/add">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16" style="margin-right: 8px;">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
        </svg>
        Réabonnement
    </a>
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
                <td class="date-cell"><fmt:formatDate value="${a.dateNaissance}" pattern="dd/MM/yyyy"/></td>
                <td>${a.email}</td>
                <td class="date-cell"><fmt:formatDate value="${a.dateInscription}" pattern="dd/MM/yyyy"/></td>
                <td>${a.profil.nomProfil}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
