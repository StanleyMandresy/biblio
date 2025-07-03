package itu.controllers;

import itu.models.Livre;
import itu.models.Adherent;
import itu.models.Pret;
import itu.services.LivreService;
import itu.services.AdherentService;
import itu.services.PretService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    
    @Autowired
    private LivreService livreService;
    
    @Autowired
    private AdherentService adherentService;
    
    @Autowired
    private PretService pretService;
    
    @GetMapping
    public String showDashboard(Model model) {
        List<Livre> livresDisponibles = livreService.findLivresDisponibles();
    
        List<Adherent> adherents = adherentService.findAllWithCurrentPrets();
        
        Map<Long, List<Pret>> empruntsParAdherent = pretService.getEmpruntsEnCoursParAdherent();
        
        long totalLivres = livreService.countTotalLivres();
        long totalLivresDisponibles = livresDisponibles.size();
        long totalAdherents = adherentService.countTotalAdherents();
        long totalEmpruntsEnCours = pretService.countEmpruntsEnCours();
        
        model.addAttribute("livresDisponibles", livresDisponibles);
        model.addAttribute("adherents", adherents);
        model.addAttribute("empruntsParAdherent", empruntsParAdherent);
        model.addAttribute("totalLivres", totalLivres);
        model.addAttribute("totalLivresDisponibles", totalLivresDisponibles);
        model.addAttribute("totalAdherents", totalAdherents);
        model.addAttribute("totalEmpruntsEnCours", totalEmpruntsEnCours);
        
        return "dashboard";
    }
    
    @GetMapping("/livres-disponibles")
    public String showLivresDisponibles(Model model) {
        List<Livre> livresDisponibles = livreService.findLivresDisponibles();
        model.addAttribute("livres", livresDisponibles);
        return "livres-disponibles";
    }
    
    @GetMapping("/adherents-emprunts")
    public String showAdherentsEmprunts(Model model) {
        List<Adherent> adherents = adherentService.findAllWithCurrentPrets();
        Map<Long, List<Pret>> empruntsParAdherent = pretService.getEmpruntsEnCoursParAdherent();
        
        model.addAttribute("adherents", adherents);
        model.addAttribute("empruntsParAdherent", empruntsParAdherent);
        
        return "adherents-emprunts";
    }
    
    @GetMapping("/api/stats")
    @ResponseBody
    public Map<String, Object> getStats() {
        return Map.of(
            "totalLivres", livreService.countTotalLivres(),
            "livresDisponibles", livreService.countLivresDisponibles(),
            "totalAdherents", adherentService.countTotalAdherents(),
            "empruntsEnCours", pretService.countEmpruntsEnCours(),
            "empruntsEnRetard", pretService.countEmpruntsEnRetard()
        );
    }
}