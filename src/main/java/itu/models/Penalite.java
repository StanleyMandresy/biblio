package itu.models;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "penalite")
public class Penalite {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idpenalite")
    private Long idPenalite;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idadherent", nullable = false)
    private Adherent adherent;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idpret")
    private Pret pret;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal montant;

    @Column(name = "datepenalite", nullable = false)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date datePenalite;

    @Column(nullable = false)
    private boolean paye = false;

    @Column(length = 255)
    private String motif;

    public Penalite(Long idPenalite, Adherent adherent, Pret pret, BigDecimal montant, Date datePenalite, boolean paye,
            String motif) {
        this.idPenalite = idPenalite;
        this.adherent = adherent;
        this.pret = pret;
        this.montant = montant;
        this.datePenalite = datePenalite;
        this.paye = paye;
        this.motif = motif;
    }

    public Long getIdPenalite() {
        return idPenalite;
    }

    public void setIdPenalite(Long idPenalite) {
        this.idPenalite = idPenalite;
    }

    public Adherent getAdherent() {
        return adherent;
    }

    public void setAdherent(Adherent adherent) {
        this.adherent = adherent;
    }

    public Pret getPret() {
        return pret;
    }

    public void setPret(Pret pret) {
        this.pret = pret;
    }

    public BigDecimal getMontant() {
        return montant;
    }

    public void setMontant(BigDecimal montant) {
        this.montant = montant;
    }

    public Date getDatePenalite() {
        return datePenalite;
    }

    public void setDatePenalite(Date datePenalite) {
        this.datePenalite = datePenalite;
    }

    public boolean isPaye() {
        return paye;
    }

    public void setPaye(boolean paye) {
        this.paye = paye;
    }

    public String getMotif() {
        return motif;
    }

    public void setMotif(String motif) {
        this.motif = motif;
    }

}