package itu.repositories;

import itu.models.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import java.time.LocalDate;
public interface ReservationRepository extends JpaRepository<Reservation, Long> {
  boolean existsByExemplaireLivre_IdExemplaireLivreAndDateDebutReservationBetween(
        Long idExemplaire, LocalDate debut, LocalDate fin
    );
}
