package itu.repositories;

import itu.models.Profil;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ProfilRepository extends JpaRepository<Profil, Long> {
    boolean existsByNomProfil(String nomProfil);
    List<Profil> findByOrderByNomProfilAsc();
}