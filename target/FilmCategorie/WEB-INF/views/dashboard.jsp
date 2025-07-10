<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Système de Bibliothèque</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-50">
    <!-- Navigation -->
    <nav class="bg-indigo-700 text-white shadow-lg">
        <div class="container mx-auto px-4 py-3 flex justify-between items-center">
            <a href="#" class="flex items-center space-x-2 text-xl font-bold">
                <i class="fas fa-book-open text-2xl"></i>
                <span>Système de Bibliothèque</span>
            </a>
            <div class="hidden md:flex space-x-6">
                <a href="/dashboard" class="hover:text-indigo-200 transition-colors">
                    <i class="fas fa-tachometer-alt mr-1"></i> Dashboard
                </a>
                <a href="/dashboard/livres-disponibles" class="hover:text-indigo-200 transition-colors">
                    <i class="fas fa-book mr-1"></i> Livres
                </a>
                <a href="/dashboard/adherents-emprunts" class="hover:text-indigo-200 transition-colors">
                    <i class="fas fa-users mr-1"></i> Adhérents
                </a>
            </div>
            <button class="md:hidden text-2xl">
                <i class="fas fa-bars"></i>
            </button>
        </div>
    </nav>

    <div class="container mx-auto px-4 py-6">
        <!-- Statistiques principales -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
            <!-- Total Livres -->
            <div class="bg-gradient-to-r from-indigo-500 to-purple-600 rounded-xl shadow-lg overflow-hidden text-white">
                <div class="p-6 flex items-center">
                    <div class="bg-white bg-opacity-20 p-4 rounded-full mr-4">
                        <i class="fas fa-book text-2xl"></i>
                    </div>
                    <div>
                        <p class="text-sm opacity-80">Total Livres</p>
                        <h3 class="text-2xl font-bold"><c:out value="${totalLivres}"/></h3>
                    </div>
                </div>
            </div>

            <!-- Livres Disponibles -->
            <div class="bg-gradient-to-r from-pink-500 to-rose-500 rounded-xl shadow-lg overflow-hidden text-white">
                <div class="p-6 flex items-center">
                    <div class="bg-white bg-opacity-20 p-4 rounded-full mr-4">
                        <i class="fas fa-check-circle text-2xl"></i>
                    </div>
                    <div>
                        <p class="text-sm opacity-80">Livres Disponibles</p>
                        <h3 class="text-2xl font-bold"><c:out value="${totalLivresDisponibles}"/></h3>
                    </div>
                </div>
            </div>

            <!-- Total Adhérents -->
            <div class="bg-gradient-to-r from-blue-500 to-cyan-400 rounded-xl shadow-lg overflow-hidden text-white">
                <div class="p-6 flex items-center">
                    <div class="bg-white bg-opacity-20 p-4 rounded-full mr-4">
                        <i class="fas fa-users text-2xl"></i>
                    </div>
                    <div>
                        <p class="text-sm opacity-80">Total Adhérents</p>
                        <h3 class="text-2xl font-bold"><c:out value="${totalAdherents}"/></h3>
                    </div>
                </div>
            </div>

            <!-- Emprunts en Cours -->
            <div class="bg-gradient-to-r from-green-500 to-teal-400 rounded-xl shadow-lg overflow-hidden text-white">
                <div class="p-6 flex items-center">
                    <div class="bg-white bg-opacity-20 p-4 rounded-full mr-4">
                        <i class="fas fa-hand-holding text-2xl"></i>
                    </div>
                    <div>
                        <p class="text-sm opacity-80">Emprunts en Cours</p>
                        <h3 class="text-2xl font-bold"><c:out value="${totalEmpruntsEnCours}"/></h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
            <!-- Livres disponibles -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden">
                <div class="bg-indigo-700 text-white px-6 py-4 flex justify-between items-center">
                    <h3 class="text-lg font-semibold flex items-center">
                        <i class="fas fa-book mr-2"></i>
                        Livres Disponibles
                    </h3>
                    <a href="/dashboard/livres-disponibles" class="text-sm bg-white text-indigo-700 px-3 py-1 rounded-full hover:bg-indigo-50 transition-colors">
                        Voir tout
                    </a>
                </div>
                <div class="max-h-96 overflow-y-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Titre</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Auteur</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Exemplaires</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:choose>
                                <c:when test="${not empty livresDisponibles}">
                                    <c:forEach items="${livresDisponibles.size() > 10 ? livresDisponibles.subList(0, 10) : livresDisponibles}" var="livre">
                                        <tr class="hover:bg-gray-50">
                                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"><c:out value="${livre.titre}"/></td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><c:out value="${livre.auteur}"/></td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                <span class="bg-green-100 text-green-800 text-xs font-semibold px-2.5 py-0.5 rounded-full">
                                                    <c:out value="${livre.nombreExemplairesDisponibles}"/>
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="3" class="px-6 py-4 text-center text-sm text-gray-500">Aucun livre disponible</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Adhérents et leurs emprunts -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden">
                <div class="bg-green-600 text-white px-6 py-4 flex justify-between items-center">
                    <h3 class="text-lg font-semibold flex items-center">
                        <i class="fas fa-users mr-2"></i>
                        Adhérents - Emprunts en Cours
                    </h3>
                    <a href="/dashboard/adherents-emprunts" class="text-sm bg-white text-green-700 px-3 py-1 rounded-full hover:bg-green-50 transition-colors">
                        Voir tout
                    </a>
                </div>
                <div class="max-h-96 overflow-y-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Adhérent</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Profil</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Emprunts</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:choose>
                                <c:when test="${not empty adherents}">
                                    <c:forEach items="${adherents.size() > 10 ? adherents.subList(0, 10) : adherents}" var="adherent">
                                        <tr class="hover:bg-gray-50">
                                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"><c:out value="${adherent.nomComplet}"/></td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                <span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded-full">
                                                    <c:out value="${adherent.profil.nomProfil}"/>
                                                </span>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                <span class="bg-indigo-100 text-indigo-800 text-xs font-semibold px-2.5 py-0.5 rounded-full mr-1">
                                                    <c:out value="${adherent.nombreEmpruntsEnCours}"/>
                                                </span>
                                                <c:if test="${not empty empruntsParAdherent[adherent.idAdherent]}">
                                                    <c:forEach items="${empruntsParAdherent[adherent.idAdherent]}" var="pret">
                                                        <span class="text-xs font-semibold px-2 py-0.5 rounded-full ml-1 ${pret.enRetard ? 'bg-red-100 text-red-800' : (pret.joursRestants <= 2 ? 'bg-yellow-100 text-yellow-800' : 'bg-green-100 text-green-800')}">
                                                            <c:out value="${pret.exemplaireLivre.livre.titre}"/>
                                                        </span>
                                                    </c:forEach>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="3" class="px-6 py-4 text-center text-sm text-gray-500">Aucun adhérent trouvé</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Section des emprunts en retard ou à rendre bientôt -->
        <div class="bg-white rounded-xl shadow-md overflow-hidden">
            <div class="bg-amber-500 text-white px-6 py-4">
                <h3 class="text-lg font-semibold flex items-center">
                    <i class="fas fa-exclamation-triangle mr-2"></i>
                    Emprunts Nécessitant une Attention
                </h3>
            </div>
            <div class="max-h-96 overflow-y-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Adhérent</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Livre</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date d'emprunt</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date de retour prévue</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Statut</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Jours</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <c:forEach items="${empruntsParAdherent}" var="entry">
                            <c:forEach items="${entry.value}" var="pret">
                                <c:if test="${pret.enRetard or pret.joursRestants <= 3}">
                                    <tr class="hover:bg-gray-50">
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"><c:out value="${pret.adherent.nomComplet}"/></td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><c:out value="${pret.exemplaireLivre.livre.titre}"/></td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><fmt:formatDate value="${pret.dateEmprunt}" pattern="dd/MM/yyyy"/></td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><fmt:formatDate value="${pret.dateRenduPrevue}" pattern="dd/MM/yyyy"/></td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                            <span class="${pret.enRetard ? 'bg-red-100 text-red-800' : 'bg-yellow-100 text-yellow-800'} text-xs font-semibold px-2.5 py-0.5 rounded-full">
                                                <c:out value="${pret.statusPret}"/>
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                            <c:choose>
                                                <c:when test="${pret.enRetard}">
                                                    <span class="text-red-600 font-bold">-<c:out value="${pret.joursDeRetard}"/> j</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-amber-600 font-bold"><c:out value="${pret.joursRestants}"/> j</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
    <script>
        // Actualisation automatique des statistiques toutes les 5 minutes
        setInterval(function() {
            fetch('/dashboard/api/stats')
                .then(response => response.json())
                .then(data => {
                    // Mise à jour des compteurs sans recharger la page
                    console.log('Statistiques mises à jour:', data);
                })
                .catch(error => console.error('Erreur lors de la mise à jour:', error));
        }, 300000); // 5 minutes
    </script>
</body>
</html>
