package itu.controllers;

import itu.models.Adherent;
import itu.models.Profil;
import itu.services.AdherentService;
import itu.services.ProfilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {



    // Afficher le formulaire de création
    @GetMapping
    public String Dashboard(Model model) {

        return "Dashboard/dashboard";
    }




}
