package itu.services;

import itu.models.Reservation;
import itu.repositories.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationService {
    @Autowired
    private ReservationRepository reservationRepository;

    public List<Reservation> findAll() {
        return reservationRepository.findAll();
    }

    public Reservation save(Reservation reservation) {
        return reservationRepository.save(reservation);
    }

    public Reservation getById(Long id) {
        return reservationRepository.findById(id).orElse(null);
    }

    public void deleteById(Long id) {
        reservationRepository.deleteById(id);
    }
}
