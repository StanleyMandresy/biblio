<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Nouvel Abonnement - Café Littéraire</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --cafe-creme: #fef6f0;
            --cafe-text: #4e342e;
            --cafe-button: #a1887f;
            --cafe-accent: #ff7043;
            --cafe-error: #d32f2f;
        }

        body {
            background-color: var(--cafe-creme);
            color: var(--cafe-text);
            font-family: 'Georgia', serif;
        }

        .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .card-header {
            background-color: var(--cafe-button) !important;
            border-bottom: none;
            border-radius: 8px 8px 0 0 !important;
            padding: 1.2rem;
        }

        .card-body {
            padding: 2rem;
        }

        .required:after {
            content: " *";
            color: var(--cafe-error);
        }

        .form-control, .form-select {
            border: 1px solid var(--cafe-button);
            padding: 0.6rem 1rem;
            border-radius: 4px;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--cafe-accent);
            box-shadow: 0 0 0 0.25rem rgba(255, 112, 67, 0.25);
        }

        .btn-primary {
            background-color: var(--cafe-button);
            border-color: var(--cafe-button);
            color: white;
            padding: 0.5rem 1.5rem;
        }

        .btn-primary:hover, .btn-primary:focus {
            background-color: var(--cafe-accent);
            border-color: var(--cafe-accent);
        }

        .btn-secondary {
            background-color: #d7ccc8;
            border-color: #d7ccc8;
            color: var(--cafe-text);
        }

        .btn-secondary:hover {
            background-color: #bcaaa4;
            border-color: #bcaaa4;
        }

        .alert-danger {
            background-color: rgba(211, 47, 47, 0.1);
            border-color: rgba(211, 47, 47, 0.3);
            color: var(--cafe-error);
        }

        .input-group-text {
            background-color: #e0e0e0;
            color: var(--cafe-text);
        }

        .bi {
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            <h2 class="mb-0">Nouvel Abonnement</h2>
        </div>
        <div class="card-body">
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/abonnements/create" method="post" class="needs-validation" novalidate>
                <!-- Sélection de l'adhérent -->
                <div class="mb-4">
                    <label for="adherentId" class="form-label required">Adhérent</label>
                    <select class="form-select" id="adherentId" name="adherentId" required>
                        <option value="">-- Sélectionnez un adhérent --</option>
                        <c:forEach items="${adherents}" var="adherent">
                            <option value="${adherent.idAdherent}"
                                ${adherent.idAdherent == adherentId ? 'selected' : ''}>
                                ${adherent.nom} ${adherent.prenom} (${adherent.email})
                            </option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">
                        Veuillez sélectionner un adhérent.
                    </div>
                </div>

                <!-- Date de début -->
                <div class="mb-4">
                    <label for="dateDebut" class="form-label required">Date de début</label>
                    <input type="date" class="form-control" id="dateDebut" name="dateDebut"
                           value="<fmt:formatDate value="${dateDebut}" pattern="yyyy-MM-dd" />"
                           required>
                    <div class="invalid-feedback">
                        Veuillez saisir une date de début valide.
                    </div>
                </div>

                <!-- Date de fin -->
                <div class="mb-4">
                    <label for="dateFin" class="form-label required">Date de fin</label>
                    <input type="date" class="form-control" id="dateFin" name="dateFin"
                           value="<fmt:formatDate value="${dateFin}" pattern="yyyy-MM-dd" />"
                           required>
                    <div class="invalid-feedback">
                        Veuillez saisir une date de fin valide.
                    </div>
                </div>

                <!-- Montant -->
                <div class="mb-4">
                    <label for="montant" class="form-label required">Montant</label>
                    <div class="input-group">
                        <input type="number" step="0.01" min="0" class="form-control"
                               id="montant" name="montant" value="${montant}" required>
                        <span class="input-group-text">€</span>
                    </div>
                    <div class="invalid-feedback">
                        Veuillez saisir un montant valide.
                    </div>
                </div>

                <!-- Boutons -->
                <div class="d-flex justify-content-between mt-5">
                    <a href="${pageContext.request.contextPath}/abonnements" class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Retour
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-save"></i> Enregistrer
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Script de validation côté client -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');

    form.addEventListener('submit', function(e) {
        const dateDebut = new Date(document.getElementById('dateDebut').value);
        const dateFin = new Date(document.getElementById('dateFin').value);

        if (dateDebut > dateFin) {
            e.preventDefault();
            alert('La date de fin doit être après la date de début');
            return false;
        }

        if (!form.checkValidity()) {
            e.preventDefault();
            e.stopPropagation();
        }

        form.classList.add('was-validated');
    });

    // Validation Bootstrap personnalisée
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
});
</script>
</body>
</html>
