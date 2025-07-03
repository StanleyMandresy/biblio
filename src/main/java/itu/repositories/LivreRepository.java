package itu.repositories;

import itu.models.Livre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface LivreRepository extends JpaRepository<Livre, Long> {
    
    @Query("SELECT DISTINCT l FROM Livre l " +
           "LEFT JOIN FETCH l.typeLivre " +
           "LEFT JOIN FETCH l.categories " +
           "LEFT JOIN FETCH l.exemplaires " +
           "ORDER BY l.titre")
    List<Livre> findAllWithDetails();

    @Query("SELECT l FROM Livre l " +
           "LEFT JOIN FETCH l.typeLivre " +
           "LEFT JOIN FETCH l.categories " +
           "LEFT JOIN FETCH l.exemplaires " +
           "WHERE l.idLivre = :id")
    Livre findByIdWithDetails(@Param("id") Long id);

    @Query("SELECT DISTINCT l FROM Livre l " +
           "LEFT JOIN FETCH l.typeLivre " +
           "LEFT JOIN FETCH l.exemplaires e " +
           "WHERE l.status = 'disponible' " +
           "AND EXISTS (SELECT 1 FROM ExemplaireLivre ex WHERE ex.livre = l AND ex.etat IN ('bon', 'moyen')) " +
           "ORDER BY l.titre")
    List<Livre> findLivresDisponibles();

    @Query("SELECT DISTINCT l FROM Livre l " +
           "LEFT JOIN FETCH l.typeLivre " +
           "LEFT JOIN FETCH l.exemplaires e " +
           "WHERE EXISTS (SELECT 1 FROM ExemplaireLivre ex " +
           "              WHERE ex.livre = l " +
           "              AND ex.etat IN ('bon', 'moyen') " +
           "              AND NOT EXISTS (SELECT 1 FROM Pret p WHERE p.exemplaireLivre = ex AND p.dateRendu IS NULL)) " +
           "ORDER BY l.titre")
    List<Livre> findLivresAvecExemplairesDisponibles();

    List<Livre> findByTitreContainingIgnoreCase(String titre);
    
    List<Livre> findByAuteurContainingIgnoreCase(String auteur);
    
    long countByStatus(String status);

    @Query("SELECT DISTINCT l FROM Livre l " +
           "JOIN l.categories c " +
           "WHERE c.idCatLivre = :categorieId " +
           "ORDER BY l.titre")
    List<Livre> findLivresParCategorie(@Param("categorieId") Long categorieId);

    @Query("SELECT l FROM Livre l " +
           "WHERE l.typeLivre.idTypeLivre = :typeId " +
           "ORDER BY l.titre")
    List<Livre> findLivresParType(@Param("typeId") Long typeId);

    @Query("SELECT l FROM Livre l " +
           "WHERE l.status = :status " +
           "ORDER BY l.titre")
    List<Livre> findByStatus(@Param("status") String status);
}