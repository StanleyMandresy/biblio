package itu.services;

import itu.models.Livre;
import itu.repositories.LivreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class LivreService {
    
    @Autowired
    private LivreRepository livreRepository;

  public List<Livre> listerTous() {
        return livreRepository.findAll();
    }

    public List<Livre> listerTousAvecExemplaires() {
    return livreRepository.findAllWithExemplaires();
}
}