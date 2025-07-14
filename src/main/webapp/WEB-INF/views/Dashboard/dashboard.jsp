<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Café Littéraire</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        :root {
            --cafe-creme: #fef6f0;
            --cafe-text: #4e342e;
            --cafe-button: #a1887f;
            --cafe-accent: #ff7043;
            --cafe-nav-bg: #8d6e63;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Georgia', serif;
        }

        body {
            background-color: var(--cafe-creme);
            color: var(--cafe-text);
        }

        .dashboard {
            display: flex;
            min-height: 100vh;
        }

        .navbar {
            width: 250px;
            background-color: var(--cafe-nav-bg);
            color: white;
            padding: 1.5rem 0;
            position: sticky;
            top: 0;
            height: 100vh;
        }

        .nav-header {
            padding: 0 1.5rem 1.5rem;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .nav-title {
            font-size: 1.5rem;
            font-weight: 500;
        }

        .nav-links {
            list-style: none;
        }

        .nav-link {
            padding: 0.8rem 1.5rem;
        }

        .nav-link a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .nav-link:hover {
            background-color: rgba(255,255,255,0.1);
        }

        .nav-link.active {
            background-color: var(--cafe-accent);
        }

        .main-content {
            flex: 1;
            padding: 2rem;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .page-title {
            font-size: 1.8rem;
        }

        form {
            margin-bottom: 2rem;
        }

        form input {
            padding: 0.5rem;
            margin-right: 1rem;
            border: 1px solid var(--cafe-button);
            border-radius: 4px;
        }

        form input[type="submit"] {
            background-color: var(--cafe-button);
            color: white;
            border: none;
            cursor: pointer;
        }

        form input[type="submit"]:hover {
            background-color: var(--cafe-accent);
        }
    </style>
</head>
<body>
<div class="dashboard">

    <!-- Barre latérale -->
    <nav class="navbar">
        <div class="nav-header">
            <div class="nav-title">Café Littéraire</div>
        </div>
        <ul class="nav-links">
            <li class="nav-link active"><a href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-home"></i>Accueil</a></li>
            <li class="nav-link"><a href="${pageContext.request.contextPath}/adherents"><i class="fas fa-user"></i>Voir Adhérents</a></li>
            <li class="nav-link"><a href="${pageContext.request.contextPath}/prets"><i class="fas fa-book"></i>Voir Prêts</a></li>
            <li class="nav-link"><a href="${pageContext.request.contextPath}/penalites"><i class="fas fa-ban"></i>Voir Pénalités</a></li>
            <li class="nav-link"><a href="${pageContext.request.contextPath}/reservations"><i class="fas fa-calendar-check"></i>Voir Réservations</a></li>
            <li class="nav-link"><a href="${pageContext.request.contextPath}/profils"><i class="fas fa-cogs"></i>Config</a></li>
        </ul>
    </nav>

    <!-- Contenu principal -->
    <main class="main-content">
        <header class="header">
            <h1 class="page-title">Tableau de bord</h1>
        </header>

        <div class="dashboard-content">
            <!-- Formulaire -->
            <form method="get" action="${pageContext.request.contextPath}/dashboard/stats">
                <label>Mois :</label>
            <select name="mois" required>
    <option value="">-- Sélectionner un mois --</option>
    <option value="1">Janvier</option>
    <option value="2">Février</option>
    <option value="3">Mars</option>
    <option value="4">Avril</option>
    <option value="5">Mai</option>
    <option value="6">Juin</option>
    <option value="7">Juillet</option>
    <option value="8">Août</option>
    <option value="9">Septembre</option>
    <option value="10">Octobre</option>
    <option value="11">Novembre</option>
    <option value="12">Décembre</option>
</select>


                <label>Année :</label>
                <input type="number" name="annee" value="2025" required />

                <input type="submit" value="Voir les statistiques" />
            </form>

            <!-- Affichage stats -->
            <c:if test="${not empty mois and not empty annee}">
                <h2>Statistiques de ${mois}/${annee}</h2>
                <ul>
                    <li>📦 Prêts effectués : ${nbPrets}</li>
                    <li>📚 Réservations validées : ${nbReservations}</li>
                    <li>👤 Nouveaux adhérents : ${nbAdherents}</li>
                    <li>🚫 Adhérents pénalisés : ${nbPenalites}</li>
                </ul>

<h3>📕 Top 3 livres les plus prêtés</h3>
<ul>
    <c:forEach var="row" items="${topLivres}">
        <c:set var="titreLivre" value="${row[0]}" />
        <c:set var="nbPret" value="${row[1]}" />
        <li>${titreLivre} (${nbPret} prêts)</li>
    </c:forEach>
</ul>



                <h3>🏆 Top 3 adhérents les plus actifs</h3>
                <ul>
                <c:forEach var="adherent" items="${topAdherents}">
                <c:set var="nomAdherent" value="${adherent[0]}" />
                <c:set var="nbPret" value="${adherent[1]}" />
                <li>${nomAdherent} (${nbPret} prêts)</li>
            </c:forEach>
                </ul>
            </c:if>
        </div>
    </main>
</div>
</body>
</html>
