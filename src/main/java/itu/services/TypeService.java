package itu.services;

import itu.models.Type;
import itu.repositories.TypeRepository; // Créez cette interface de dépôt
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service // Indique que c'est un composant de service Spring
public class TypeService {

    @Autowired
    private TypeRepository typeRepository; // Injection du dépôt de types

    /**
     * Récupère tous les types de métrage.
     * @return Une liste de tous les types.
     */
    public List<Type> findAll() {
        return typeRepository.findAll();
    }

    /**
     * Récupère un type par son ID.
     * @param id L'ID du type à récupérer.
     * @return Le type correspondant, ou null si non trouvé.
     */
    public Type findById(Long id) {
        return typeRepository.findById(id).orElse(null);
    }

    /**
     * Enregistre (crée ou met à jour) un type.
     * @param type Le type à enregistrer.
     * @return Le type enregistré.
     */
    public Type save(Type type) {
        return typeRepository.save(type);
    }

    /**
     * Supprime un type par son ID.
     * @param id L'ID du type à supprimer.
     */
    public void delete(Long id) {
        typeRepository.deleteById(id);
    }
}