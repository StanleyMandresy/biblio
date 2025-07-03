package itu.services;

import itu.models.Livre;
import itu.repositories.LivreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class LivreService {
    
    @Autowired
    private LivreRepository livreRepository;

    public List<Livre> findAll() {
        return livreRepository.findAllWithDetails();
    }

    public Livre findById(Long id) {
        return livreRepository.findByIdWithDetails(id);
    }

    public List<Livre> findLivresDisponibles() {
        return livreRepository.findLivresDisponibles();
    }

    public List<Livre> findByTitreContaining(String titre) {
        return livreRepository.findByTitreContainingIgnoreCase(titre);
    }

    public List<Livre> findByAuteurContaining(String auteur) {
        return livreRepository.findByAuteurContainingIgnoreCase(auteur);
    }

    public long countTotalLivres() {
        return livreRepository.count();
    }

    public long countLivresDisponibles() {
        return livreRepository.countByStatus("disponible");
    }

    public long countLivresEmpruntes() {
        return livreRepository.countByStatus("emprunté");
    }

    public Livre save(Livre livre) {
        return livreRepository.save(livre);
    }

    public void delete(Long id) {
        livreRepository.deleteById(id);
    }

    public List<Livre> findLivresAvecExemplairesDisponibles() {
        return livreRepository.findLivresAvecExemplairesDisponibles();
    }

    public List<Livre> findLivresParCategorie(Long categorieId) {
        return livreRepository.findLivresParCategorie(categorieId);
    }

    public List<Livre> findLivresParType(Long typeId) {
        return livreRepository.findLivresParType(typeId);
    }
}