<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Rendre un prêt</title>
</head>
<body>
<h2>Rendre le prêt de ${pret.exemplaireLivre.livre.titre}</h2>

<form action="${pageContext.request.contextPath}/prets/rendre" method="post">
    <input type="hidden" name="idPret" value="${pret.idPret}" />

    <label for="dateRendu">Date de rendu :</label>
    <input type="date" name="dateRendu" value="${dateRendu}" required />

    <br><br>
    <input type="submit" value="Confirmer le rendu" />
</form>

<br>
<a href="${pageContext.request.contextPath}/prets/liste">Annuler</a>
</body>
</html>
