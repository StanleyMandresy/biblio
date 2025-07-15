package itu.controllers;

import itu.models.Livre;
import itu.services.LivreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.MediaType;

@RestController
@RequestMapping("/web")
public class WebController {

    @Autowired
    private LivreService livreService;

    @GetMapping(value = "/livres/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Livre> getLivreAvecExemplaires(@PathVariable Long id) {
        Livre livre = livreService.getLivreAvecExemplaires(id);
        if (livre != null) {
            return ResponseEntity.ok(livre);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
