package itu.controllers;

import itu.models.Profil;
import itu.services.ProfilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/profils")
public class ProfilController {

    @Autowired
    private ProfilService profilService;

    // Afficher la liste des profils
    @GetMapping
    public String listerProfils(Model model) {
        model.addAttribute("profils", profilService.listerTous());
        return "profils/liste";
    }

    // Afficher le formulaire de création
    @GetMapping("/nouveau")
    public String afficherFormulaireCreation(Model model) {
        model.addAttribute("profil", new Profil());
        return "profils/formulaire";
    }

    // Traiter la création
    @PostMapping("/creer")
    public String creerProfil(
            @RequestParam String nomProfil,
            @RequestParam int quotaMaxSurPlace,
            @RequestParam Integer quotaMaxEmprunter,
            @RequestParam int dureePret) {
        
        profilService.creerProfil(nomProfil, quotaMaxSurPlace, quotaMaxEmprunter, dureePret);
        return "redirect:/profils";
    }

    // Afficher le formulaire d'édition
    @GetMapping("/editer/{id}")
    public String afficherFormulaireEdition(@PathVariable Long id, Model model) {
        model.addAttribute("profil", profilService.trouverParId(id));
        return "profils/edition";
    }

    // Supprimer un profil
    @GetMapping("/supprimer/{id}")
    public String supprimerProfil(@PathVariable Long id) {
        profilService.supprimerProfil(id);
        return "redirect:/profils";
    }
}