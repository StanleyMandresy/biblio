<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Café Littéraire</title>
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

        /* Navigation */
        .navbar {
            width: 250px;
            background-color: var(--cafe-nav-bg);
            color: white;
            padding: 1.5rem 0;
            height: 100vh;
            position: sticky;
            top: 0;
        }

        .nav-header {
            padding: 0 1.5rem 1.5rem;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 1.5rem;
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
            transition: all 0.3s ease;
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

        .nav-link i {
            margin-right: 10px;
        }

        /* Contenu principal */
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
            color: var(--cafe-text);
        }
    </style>
    <!-- Lien pour les icônes (remplacez par votre propre solution d'icônes) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="dashboard">
        <!-- Barre de navigation -->
        <nav class="navbar">
            <div class="nav-header">
                <div class="nav-title">Café Littéraire</div>
            </div>

            <ul class="nav-links">
                <!-- Exemple de lien - À remplacer par vos propres liens -->
                <li class="nav-link active">
                    <a href="${pageContext.request.contextPath}/dashboard">
                        <i class="fas fa-home"></i>
                        <span>Accueil</span>
                    </a>
                </li>
                     <li class="nav-link active">
                    <a href="${pageContext.request.contextPath}/adherents">
                        <i class="fas fa-home"></i>
                        <span>Voir Adherents</span>
                    </a>
                </li>



                  <li class="nav-link active">
                    <a href="${pageContext.request.contextPath}/prets">
                        <i class="fas fa-home"></i>
                        <span>Voir Pret</span>
                    </a>
                </li>

                   <li class="nav-link active">
                    <a href="${pageContext.request.contextPath}/penalites">
                        <i class="fas fa-home"></i>
                        <span>Voir Penalites</span>
                    </a>
                </li>

                    <li class="nav-link active">
                    <a href="${pageContext.request.contextPath}/reservations">
                        <i class="fas fa-home"></i>
                        <span>Voir  Reservations</span>
                    </a>
                </li>

 <li class="nav-link active">
                    <a href="${pageContext.request.contextPath}/profils">
                        <i class="fas fa-home"></i>
                        <span>Config</span>
                    </a>
                </li>



                <!-- Espace pour ajouter d'autres liens -->


            </ul>
        </nav>

        <!-- Contenu principal -->
        <main class="main-content">
            <header class="header">
                <h1 class="page-title">Tableau de bord</h1>
                <!-- Espace pour d'autres éléments d'en-tête si nécessaire -->
            </header>

            <!-- Le contenu de votre dashboard ira ici -->
            <div class="dashboard-content">
                <!-- Vous pouvez ajouter vos widgets, graphiques, etc. ici -->
            </div>
        </main>
    </div>
</body>
</html>
