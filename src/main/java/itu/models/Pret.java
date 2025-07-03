package itu.models;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "pret")
public class Pret {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idpret")
    private Long idPret;

    @Column(name = "typepret", nullable = false, length = 20)
    private String typePret;

    @Column(name = "date_emprunt", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime dateEmprunt;

    @Column(name = "date_rendu")
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime dateRendu;

    @Column(name = "date_rendu_prevue", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime dateRenduPrevue;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idadherent", nullable = false)
    private Adherent adherent;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idexemplairelivre", nullable = false)
    private ExemplaireLivre exemplaireLivre;

    // Constructeurs
    public Pret() {}

    public Pret(String typePret, LocalDateTime dateEmprunt, LocalDateTime dateRenduPrevue, 
                Adherent adherent, ExemplaireLivre exemplaireLivre) {
        this.typePret = typePret;
        this.dateEmprunt = dateEmprunt;
        this.dateRenduPrevue = dateRenduPrevue;
        this.adherent = adherent;
        this.exemplaireLivre = exemplaireLivre;
    }

    // Getters et Setters
    public Long getIdPret() { return idPret; }
    public void setIdPret(Long idPret) { this.idPret = idPret; }

    public String getTypePret() { return typePret; }
    public void setTypePret(String typePret) { this.typePret = typePret; }

    public LocalDateTime getDateEmprunt() { return dateEmprunt; }
    public void setDateEmprunt(LocalDateTime dateEmprunt) { this.dateEmprunt = dateEmprunt; }

    public LocalDateTime getDateRendu() { return dateRendu; }
    public void setDateRendu(LocalDateTime dateRendu) { this.dateRendu = dateRendu; }

    public LocalDateTime getDateRenduPrevue() { return dateRenduPrevue; }
    public void setDateRenduPrevue(LocalDateTime dateRenduPrevue) { this.dateRenduPrevue = dateRenduPrevue; }

    public Adherent getAdherent() { return adherent; }
    public void setAdherent(Adherent adherent) { this.adherent = adherent; }

    public ExemplaireLivre getExemplaireLivre() { return exemplaireLivre; }
    public void setExemplaireLivre(ExemplaireLivre exemplaireLivre) { this.exemplaireLivre = exemplaireLivre; }

    // Méthodes utilitaires
    public boolean isEnCours() {
        return dateRendu == null;
    }

    public boolean isEnRetard() {
        return isEnCours() && LocalDateTime.now().isAfter(dateRenduPrevue);
    }

    public long getJoursDeRetard() {
        if (!isEnRetard()) return 0;
        return ChronoUnit.DAYS.between(dateRenduPrevue, LocalDateTime.now());
    }

    public long getJoursRestants() {
        if (!isEnCours()) return 0;
        if (isEnRetard()) return -getJoursDeRetard();
        return ChronoUnit.DAYS.between(LocalDateTime.now(), dateRenduPrevue);
    }

    public String getStatusPret() {
        if (!isEnCours()) return "Rendu";
        if (isEnRetard()) return "En retard";
        if (getJoursRestants() <= 2) return "À rendre bientôt";
        return "En cours";
    }
}