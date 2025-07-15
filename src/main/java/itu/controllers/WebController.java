package itu.controllers;

import itu.models.Livre;
import itu.models.Adherent;
import itu.models.Abonnement;
import itu.models.AdherentQuota;
import itu.models.Profil;
import itu.services.AdherentService;
import itu.services.AbonnementService;
import itu.services.AdherentQuotaService;
import itu.services.PenaliteService;

import itu.services.LivreService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.MediaType;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.ui.Model;

import java.util.*;


@RestController
@RequestMapping("/web")
public class WebController {

    @Autowired
    private LivreService livreService;

    @Autowired
private AdherentService adherentService;

@Autowired
private AdherentQuotaService adherentQuotaService;

@Autowired
private AbonnementService abonnementService;

@Autowired
private PenaliteService penaliteService;


    @GetMapping(value = "/livres/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Livre> getLivreAvecExemplaires(@PathVariable Long id) {
        Livre livre = livreService.getLivreAvecExemplaires(id);
        if (livre != null) {
            return ResponseEntity.ok(livre);
        } else {
            return ResponseEntity.notFound().build();
        }
    }


@GetMapping("/adherents/{id}")
public ResponseEntity<Map<String, Object>> infosAdherent(@PathVariable Long id) {
    Adherent adherent = adherentService.findById(id);

    // Nouvelle méthode : liste triée par dateDebut
    List<Abonnement> abonnements = abonnementService.getAbonnementsParAdherentOrdreChronologique(id);

    AdherentQuota quotaAdherent = adherentQuotaService.getQuotaParAdherent(id);
    Profil profil = adherent.getProfil();
    boolean estPenalise = penaliteService.aPenaliteNonLevee(id);

    Map<String, Object> infos = new LinkedHashMap<>();

    infos.put("nom", adherent.getNom());
    infos.put("prenom", adherent.getPrenom());
    infos.put("email", adherent.getEmail());

    Map<String, Object> quotaProfilMap = new LinkedHashMap<>();
    quotaProfilMap.put("maxSurPlace", profil.getQuotaMaxSurPlace());
    quotaProfilMap.put("maxEmprunter", profil.getQuotaMaxEmprunter());
    infos.put("quotaProfil", quotaProfilMap);

    infos.put("quotaAdherent", quotaAdherent);

    // ⬇️ Abonnements triés (plusieurs périodes)
    List<Map<String, Object>> abonnementsMap = new ArrayList<>();
    for (Abonnement ab : abonnements) {
        Map<String, Object> abMap = new LinkedHashMap<>();
        abMap.put("dateDebut", ab.getDateDebut());
        abMap.put("dateFin", ab.getDateFin());
        abonnementsMap.add(abMap);
    }
    infos.put("abonnements", abonnementsMap); // ⬅️ nouveau champ

    infos.put("estPenalise", estPenalise);

    return ResponseEntity.ok(infos);
}


}
