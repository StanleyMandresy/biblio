<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Nouvel Abonnement</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .required:after {
            content: " *";
            color: red;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h2 class="mb-0">Nouvel Abonnement</h2>
        </div>
        <div class="card-body">
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>
            
            <form action="${pageContext.request.contextPath}/abonnements/create" method="post">
                <!-- Sélection de l'adhérent -->
                <div class="mb-3">
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
                </div>
                
                <!-- Date de début -->
                <div class="mb-3">
                    <label for="dateDebut" class="form-label required">Date de début</label>
                    <input type="date" class="form-control" id="dateDebut" name="dateDebut" 
                           value="<fmt:formatDate value="${dateDebut}" pattern="yyyy-MM-dd" />" 
                           required>
                </div>
                
                <!-- Date de fin -->
                <div class="mb-3">
                    <label for="dateFin" class="form-label required">Date de fin</label>
                    <input type="date" class="form-control" id="dateFin" name="dateFin" 
                           value="<fmt:formatDate value="${dateFin}" pattern="yyyy-MM-dd" />" 
                           required>
                </div>
                
                <!-- Montant -->
                <div class="mb-3">
                    <label for="montant" class="form-label required">Montant</label>
                    <div class="input-group">
                        <input type="number" step="0.01" min="0" class="form-control" 
                               id="montant" name="montant" value="${montant}" required>
                        <span class="input-group-text">€</span>
                    </div>
                </div>
                
                <!-- Boutons -->
                <div class="d-flex justify-content-between mt-4">
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
});
</script>
</body>
</html>