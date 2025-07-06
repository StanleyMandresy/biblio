package itu.controllers;

import itu.models.Adherent;
import itu.models.ExemplaireLivre;
import itu.models.Livre;
import itu.models.Reservation;
import itu.services.AdherentService;
import itu.services.ExemplaireLivreService;
import itu.services.LivreService;
import itu.services.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/reservations")
public class ReservationController {

    @Autowired private ReservationService reservationService;
    @Autowired private LivreService livreService;
    @Autowired private AdherentService adherentService;
    @Autowired private ExemplaireLivreService exemplaireLivreService;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("reservations", reservationService.findAll());
        return "Reservation/list";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("reservation", new Reservation());
      model.addAttribute("livres", livreService.listerTousAvecExemplaires());
        model.addAttribute("adherents", adherentService.findAll());

        return "Reservation/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Reservation reservation) {
        reservation.setDateReservation(LocalDate.now());
        reservationService.save(reservation);
        return "redirect:/reservations";
    }
}
