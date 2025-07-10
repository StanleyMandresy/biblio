<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Nouvel Adhérent - Café Littéraire</title>
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

        .container {
            max-width: 800px;
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 3rem;
            margin-bottom: 3rem;
        }

        h1 {
            color: var(--cafe-text);
            border-bottom: 2px solid var(--cafe-button);
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .form-control, .form-select {
            border: 1px solid var(--cafe-button);
            padding: 0.6rem 1rem;
            border-radius: 4px;
            background-color: rgba(255, 255, 255, 0.8);
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
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary:hover, .btn-primary:focus {
            background-color: var(--cafe-accent);
            border-color: var(--cafe-accent);
            transform: translateY(-2px);
        }

        .required-field::after {
            content: " *";
            color: var(--cafe-error);
        }

        .password-help {
            font-size: 0.85rem;
            color: #6c757d;
            margin-top: 0.25rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Nouvel Adhérent</h1>

        <form action="${pageContext.request.contextPath}/adherents/create" method="post" class="needs-validation" novalidate>
            <!-- Nom -->
            <div class="mb-4">
                <label for="nom" class="form-label required-field">Nom</label>
                <input type="text" class="form-control" id="nom" name="nom" required>
                <div class="invalid-feedback">
                    Veuillez saisir un nom.
                </div>
            </div>

            <!-- Prénom -->
            <div class="mb-4">
                <label for="prenom" class="form-label">Prénom</label>
                <input type="text" class="form-control" id="prenom" name="prenom">
            </div>

            <!-- Date de Naissance -->
            <div class="mb-4">
                <label for="dateNaissance" class="form-label">Date de Naissance</label>
                <input type="date" class="form-control" id="dateNaissance" name="dateNaissance">
            </div>

            <!-- Email -->
            <div class="mb-4">
                <label for="email" class="form-label required-field">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
                <div class="invalid-feedback">
                    Veuillez saisir un email valide.
                </div>
            </div>

            <!-- Mot de passe -->
            <div class="mb-4">
                <label for="motDePasse" class="form-label required-field">Mot de passe</label>
                <input type="password" class="form-control" id="motDePasse" name="motDePasse"
                       maxlength="10" required>
                <div class="invalid-feedback">
                    Le mot de passe est requis (max 10 caractères).
                </div>
                <div class="password-help">
                    Maximum 10 caractères
                </div>
            </div>

            <!-- Profil -->
            <div class="mb-4">
                <label for="idProfil" class="form-label required-field">Profil</label>
                <select class="form-select" id="idProfil" name="idProfil" required>
                    <option value="">-- Sélectionnez un profil --</option>
                    <c:forEach items="${profils}" var="profil">
                        <option value="${profil.idProfil}">${profil.nomProfil}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">
                    Veuillez sélectionner un profil.
                </div>
            </div>

            <!-- Bouton Enregistrer -->
            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                <button type="submit" class="btn btn-primary px-4">
                    Enregistrer
                </button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Validation côté client -->
    <script>
    (function() {
        'use strict';

        // Fetch all forms we want to apply custom validation styles to
        var forms = document.querySelectorAll('.needs-validation');

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function(form) {
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
    })();
    </script>
</body>
</html>
