package itu.services;

import itu.models.AdherentQuota;
import itu.repositories.AdherentQuotaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AdherentQuotaService {

    @Autowired
    private AdherentQuotaRepository adherentQuotaRepository;

    public AdherentQuota getQuotaParAdherent(Long idAdherent) {
        return adherentQuotaRepository.findById(idAdherent).orElse(null);
    }
}
