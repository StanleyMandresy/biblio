<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty errorMessage}">
    <p style="color: red;">${errorMessage}</p>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/prets/save">

    <input type="hidden" name="typePret" value="${typePret}" />

    <label>Adhérent :</label>
    <select name="adherentId" required>
        <c:forEach var="adherent" items="${adherents}">
            <option value="${adherent.idAdherent}">${adherent.nom} ${adherent.prenom}</option>
        </c:forEach>
    </select>
    <br><br>

    <label>Livre :</label>
    <select id="livreSelect" name="livreId" required>
        <option value="">-- Sélectionner un livre --</option>
        <c:forEach var="livre" items="${livres}">
            <option value="${livre.idLivre}">${livre.titre}</option>
        </c:forEach>
    </select>
    <br><br>

    <label>Exemplaire :</label>
    <select id="exemplaireSelect" name="exemplaireId" required>
        <option value="">-- Sélectionner un exemplaire --</option>
    </select>
    <br><br>

    <!-- Caché : pour chaque livre, on crée un <select> d'exemplaires, non affiché -->
    <c:forEach var="livre" items="${livres}">
        <select id="exemplaires-for-livre-${livre.idLivre}" style="display:none;">
            <c:forEach var="exemplaire" items="${livre.exemplaires}">
                <option value="${exemplaire.idExemplaireLivre}">${exemplaire.codeBarre}</option>
            </c:forEach>
        </select>
    </c:forEach>

    <c:if test="${typePret == 'a_domicile'}">
    <label>Nombre de jours (1 à 15) :</label>
    <input type="number" name="joursPret" min="1" max="15" value="1" required />
    <br><br>
</c:if>

    <input type="submit" value="Enregistrer le prêt" />
</form>

<script>
    document.getElementById('livreSelect').addEventListener('change', function() {
        const livreId = this.value;
        const exemplaireSelect = document.getElementById('exemplaireSelect');

        // Vider la liste actuelle
        exemplaireSelect.innerHTML = '<option value="">-- Sélectionner un exemplaire --</option>';

        if (!livreId) return;

        // Trouver la liste cachée correspondante
        const hiddenSelect = document.getElementById('exemplaires-for-livre-' + livreId);
        if (!hiddenSelect) return;

        // Copier les options de la liste cachée dans la liste visible
        for (let option of hiddenSelect.options) {
            exemplaireSelect.appendChild(option.cloneNode(true));
        }
    });
</script>
