package itu.services;

import itu.models.Abonnement;
import itu.models.Adherent;
import itu.models.AdherentQuota;
import itu.repositories.AbonnementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import itu.repositories.AdherentQuotaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.*;

import java.util.Optional;
import java.time.ZoneId;

@Service
public class AbonnementService {

    @Autowired
    private AbonnementRepository abonnementRepository;
    
    @Autowired
    private AdherentService adherentService;

    @Autowired
    private AdherentQuotaRepository adherentQuotaRepository;
    

@Transactional
public Abonnement creerAbonnement(Long adherentId, 
                                 LocalDate dateDebut, LocalDate dateFin) {
    
    // Validation des dates
    if (dateDebut.isAfter(dateFin)) {
        throw new IllegalArgumentException("La date de fin doit être après la date de début");
    }

    Adherent adherent = adherentService.findById(adherentId);
     

    // 2. Initialiser le quota si nécessaire
 

    System.out.println("ID adhérent = " + adherent.getIdAdherent());

    // Vérification des conflits de dates
    if (abonnementRepository.existsByAdherentAndDates(
            adherent, dateDebut, dateFin)) {
        throw new IllegalStateException("Un abonnement existe déjà pour cet adhérent sur cette période");
    }


    
    // --- Nouvelle partie : gestion quota ---
    // Vérifie si un quota existe déjà pour cet adhérent
    boolean quotaExiste = adherentQuotaRepository.existsById(adherent.getIdAdherent());
    
    if (!quotaExiste) {
      AdherentQuota quota = new AdherentQuota(adherentId,0,0);
       
        adherentQuotaRepository.save(quota);  

    }
    // ----------------------------------------

    Abonnement abonnement = new Abonnement();
    abonnement.setAdherent(adherent);
    abonnement.setMontant(BigDecimal.ZERO);
    abonnement.setDateDebut(dateDebut);
    abonnement.setDateFin(dateFin);

    return abonnementRepository.save(abonnement);
}
    @Transactional(readOnly = true)
    public List<Abonnement> listerAbonnementsAdherent(Long adherentId) {
        return abonnementRepository.findByAdherentIdAdherent(adherentId);
    }
    
    @Transactional(readOnly = true)
    public boolean adherentAbonnementActif(Long adherentId) {
        return abonnementRepository.existsByAdherentIdAdherentAndDateFinAfter(adherentId, LocalDate.now());
    }
public Abonnement getDernierAbonnementParAdherent(Long idAdherent) {
    Optional<Object[]> resultat = abonnementRepository.findPeriodeGlobaleParAdherent(idAdherent);

    if (resultat.isEmpty()) {
        System.out.println("❌ Aucun résultat trouvé pour l'adhérent ID: " + idAdherent);
        return null;
    }

    Object[] row = resultat.get();
   

 

    LocalDate debut = convertToLocalDate(row[0]);
    LocalDate fin = convertToLocalDate(row[0]);


    Abonnement synthese = new Abonnement();
    synthese.setDateDebut(debut);
    synthese.setDateFin(fin);

    System.out.println("✅ Abonnement synthétique construit : " + synthese);
    return synthese;
}


private LocalDate convertToLocalDate(Object dateObj) {
    if (dateObj instanceof LocalDate) {
        return (LocalDate) dateObj;
    } else if (dateObj instanceof java.sql.Date) {
        return ((java.sql.Date) dateObj).toLocalDate();
    } else if (dateObj instanceof java.util.Date) {
        return ((java.util.Date) dateObj).toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    } else {
        return null;
    }
}
public List<Abonnement> getAbonnementsParAdherentOrdreChronologique(Long idAdherent) {
    return abonnementRepository.findByAdherentIdAdherentOrderByDateDebutAsc(idAdherent);
}


}