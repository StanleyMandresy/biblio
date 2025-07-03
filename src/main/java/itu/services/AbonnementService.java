package itu.services;

import itu.models.Abonnement;
import itu.models.Adherent;
import itu.repositories.AbonnementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Service
public class AbonnementService {

    @Autowired
    private AbonnementRepository abonnementRepository;
    
    @Autowired
    private AdherentService adherentService;
    
@Transactional
public Abonnement creerAbonnement(Long adherentId, BigDecimal montant, 
                                 LocalDate dateDebut, LocalDate dateFin) {
    
    // Validation des dates
    if (dateDebut.isAfter(dateFin)) {
        throw new IllegalArgumentException("La date de fin doit être après la date de début");
    }

    Adherent adherent = adherentService.findById(adherentId);

    // Vérification des conflits de dates
    if (abonnementRepository.existsByAdherentAndDates(
            adherent, dateDebut, dateFin)) {
        throw new IllegalStateException("Un abonnement existe déjà pour cet adhérent sur cette période");
    }

    // Validation du montant
    if (montant.compareTo(BigDecimal.ZERO) <= 0) {
        throw new IllegalArgumentException("Le montant doit être positif");
    }

    Abonnement abonnement = new Abonnement();
    abonnement.setAdherent(adherent);
    abonnement.setMontant(montant);
    abonnement.setDateDebut(dateDebut);
    abonnement.setDateFin(dateFin);

    return abonnementRepository.save(abonnement);
}
    @Transactional(readOnly = true)
    public List<Abonnement> listerAbonnementsAdherent(Long adherentId) {
        return abonnementRepository.findByAdherentId(adherentId);
    }
    
    @Transactional(readOnly = true)
    public boolean adherentAAbonnementActif(Long adherentId) {
        return abonnementRepository.existsByAdherentIdAndDateFinAfter(adherentId, LocalDate.now());
    }
}