<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Nouvel Adhérent</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Nouvel Adhérent</h1>

        
        <form action="${pageContext.request.contextPath}/adherents/create" method="post">
            <div class="mb-3">
                <label for="nom" class="form-label">Nom</label>
                <input type="text" class="form-control" id="nom" name="nom" required>
            </div>
            
            <div class="mb-3">
                <label for="prenom" class="form-label">Prénom</label>
                <input type="text" class="form-control" id="prenom" name="prenom">
            </div>
            
            <div class="mb-3">
                <label for="dateNaissance" class="form-label">Date de Naissance</label>
                <input type="date" class="form-control" id="dateNaissance" name="dateNaissance">
            </div>
            
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            
            <div class="mb-3">
                <label for="motDePasse" class="form-label">Mot de passe (max 10 caractères)</label>
                <input type="password" class="form-control" id="motDePasse" name="motDePasse" 
                       maxlength="10" required>
            </div>
            
       <div class="mb-3">
                <label for="idProfil" class="form-label">Profil</label>
                <select class="form-select" id="idProfil" name="idProfil" required>
                    <option value="">-- Sélectionnez un profil --</option>
                    <c:forEach items="${profils}" var="profil">
                        <option value="${profil.idProfil}">${profil.nomProfil}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Enregistrer</button>
          
        </form>
    </div>
</body>
</html>