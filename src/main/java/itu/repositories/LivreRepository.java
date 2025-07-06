package itu.repositories;

import itu.models.Livre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface LivreRepository extends JpaRepository<Livre, Long> {
 @Query("SELECT l FROM Livre l LEFT JOIN FETCH l.exemplaires")
List<Livre> findAllWithExemplaires();   

@Query("SELECT DISTINCT l FROM Livre l LEFT JOIN FETCH l.categories WHERE " +
       "(:titre IS NULL OR LOWER(l.titre) LIKE LOWER('%' || CAST(:titre AS text) || '%')) " +
       "AND (:auteur IS NULL OR LOWER(l.auteur) LIKE LOWER('%' || CAST(:auteur AS text) || '%')) " +
       "AND (:annee IS NULL OR EXTRACT(YEAR FROM l.dateEdition) = :annee) " +
       "AND (:typeId IS NULL OR l.typeLivre.id = :typeId)")
List<Livre> rechercherLivres(
    @Param("titre") String titre,
    @Param("auteur") String auteur,
    @Param("annee") Integer annee,
    @Param("typeId") Long typeId
);

  @Query("SELECT DISTINCT l FROM Livre l JOIN FETCH l.categories c WHERE c.id IN :categories")
List<Livre> rechercherLivresParCategories(@Param("categories") List<Long> categories);
}
