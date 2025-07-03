package itu.services;

import itu.models.Pret;
import itu.repositories.PretRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Transactional
public class PretService {
    
    @Autowired
    private PretRepository pretRepository;

    public List<Pret> findAll() {
        return pretRepository.findAllWithDetails();
    }

    public Pret findById(Long id) {
        return pretRepository.findByIdWithDetails(id);
    }

    public List<Pret> findEmpruntsEnCours() {
        return pretRepository.findEmpruntsEnCours();
    }

    public List<Pret> findEmpruntsEnRetard() {
        return pretRepository.findEmpruntsEnRetard();
    }

    public List<Pret> findEmpruntsParAdherent(Long adherentId) {
        return pretRepository.findByAdherentIdAdherentOrderByDateEmpruntDesc(adherentId);
    }

    public List<Pret> findEmpruntsEnCoursParAdherent(Long adherentId) {
        return pretRepository.findEmpruntsEnCoursParAdherent(adherentId);
    }

    public Map<Long, List<Pret>> getEmpruntsEnCoursParAdherent() {
        List<Pret> empruntsEnCours = findEmpruntsEnCours();
        return empruntsEnCours.stream()
            .collect(Collectors.groupingBy(pret -> pret.getAdherent().getIdAdherent()));
    }

    public long countEmpruntsEnCours() {
        return pretRepository.countEmpruntsEnCours();
    }

    public long countEmpruntsEnRetard() {
        return pretRepository.countEmpruntsEnRetard();
    }

    public long countEmpruntsParAdherent(Long adherentId) {
        return pretRepository.countEmpruntsEnCoursParAdherent(adherentId);
    }

    public Pret save(Pret pret) {
        return pretRepository.save(pret);
    }

    public void delete(Long id) {
        pretRepository.deleteById(id);
    }

    public Pret rendreExemplaire(Long pretId) {
        Pret pret = findById(pretId);
        if (pret != null && pret.isEnCours()) {
            pret.setDateRendu(java.time.LocalDateTime.now());
            return save(pret);
        }
        return pret;
    }

    public List<Pret> findEmpruntsARendreBientot() {
        return pretRepository.findEmpruntsARendreBientot();
    }

    public List<Pret> findHistoriqueEmpruntsAdherent(Long adherentId) {
        return pretRepository.findByAdherentIdAdherentOrderByDateEmpruntDesc(adherentId);
    }
}