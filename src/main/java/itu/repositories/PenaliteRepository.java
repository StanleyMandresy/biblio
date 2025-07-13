package itu.repositories;

import itu.models.Penalite;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface PenaliteRepository extends JpaRepository<Penalite, Long> {
    List<Penalite> findByAdherentIdAdherent(Long idAdherent);
    boolean existsByAdherent_IdAdherentAndLeveFalse(Long idAdherent);

}
