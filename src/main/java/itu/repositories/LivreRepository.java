package itu.repositories;

import itu.models.Livre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface LivreRepository extends JpaRepository<Livre, Long> {
 @Query("SELECT l FROM Livre l LEFT JOIN FETCH l.exemplaires")
List<Livre> findAllWithExemplaires();   
   
}