<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title><c:choose>
        <c:when test="${profil.idProfil != null}">Modifier un profil</c:when>
        <c:otherwise>Ajouter un profil</c:otherwise>
    </c:choose></title>
    <style>
        label { display: block; margin-top: 10px; }
        input { width: 300px; padding: 5px; }
        button { margin-top: 15px; padding: 8px 12px; }
    </style>
</head>
<body>

<h2>
    <c:choose>
        <c:when test="${profil.idProfil != null}">Modifier un profil</c:when>
        <c:otherwise>Ajouter un nouveau profil</c:otherwise>
    </c:choose>
</h2>

<form method="post" action="${pageContext.request.contextPath}/profils/create">
    <!-- Champ ID caché (présent seulement en mode édition) -->
    <c:if test="${profil.idProfil != null}">
        <input type="hidden" name="id" value="${profil.idProfil}" />
    </c:if>

    <label for="nomProfil">Nom du profil :</label>
    <input type="text" id="nomProfil" name="nomProfil" value="${profil.nomProfil}" required />

    <label for="quotaMaxSurPlace">Quota max sur place :</label>
    <input type="number" id="quotaMaxSurPlace" name="quotaMaxSurPlace" value="${profil.quotaMaxSurPlace}" required />

    <label for="quotaMaxEmprunter">Quota max à emprunter :</label>
    <input type="number" id="quotaMaxEmprunter" name="quotaMaxEmprunter" value="${profil.quotaMaxEmprunter}" />

    <label for="dureePret">Durée de prêt (jours) :</label>
    <input type="number" id="dureePret" name="dureePret" value="${profil.dureePret}" required />

    <label for="dureePenalite">Durée pénalité (jours) :</label>
<input type="number" id="dureePenalite" name="dureePenalite" 
       value="${profil.dureePenalite != null ? profil.dureePenalite : 0}" />
    <br>
    <button type="submit">
        <c:choose>
            <c:when test="${profil.idProfil != null}">Mettre à jour</c:when>
            <c:otherwise>Créer</c:otherwise>
        </c:choose>
    </button>
</form>

<p><a href="${pageContext.request.contextPath}/profils">⬅ Retour à la liste des profils</a></p>

</body>
</html>
