package itu.models;

import jakarta.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "livre")
public class Livre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idlivre")
    private Long idLivre;

    @Column(nullable = false, length = 255)
    private String titre;

    @Column(length = 255)
    private String auteur;

    @Column(name = "dateedition")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateEdition;

    @Column(name = "maisonedition", length = 100)
    private String maisonEdition;

    @Column(length = 20)
    private String status = "disponible";

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idtypelivre")
    private TypeLivre typeLivre;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "livrecategorie",
        joinColumns = @JoinColumn(name = "idlivre"),
        inverseJoinColumns = @JoinColumn(name = "idcatlivre")
    )
    private Set<CategorieLivre> categories = new HashSet<>();

    @OneToMany(mappedBy = "livre", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ExemplaireLivre> exemplaires;

    // Constructeurs
    public Livre() {}

    public Livre(String titre, String auteur, Date dateEdition, String maisonEdition) {
        this.titre = titre;
        this.auteur = auteur;
        this.dateEdition = dateEdition;
        this.maisonEdition = maisonEdition;
    }

    // Getters et Setters
    public Long getIdLivre() { return idLivre; }
    public void setIdLivre(Long idLivre) { this.idLivre = idLivre; }

    public String getTitre() { return titre; }
    public void setTitre(String titre) { this.titre = titre; }

    public String getAuteur() { return auteur; }
    public void setAuteur(String auteur) { this.auteur = auteur; }

    public Date getDateEdition() { return dateEdition; }
    public void setDateEdition(Date dateEdition) { this.dateEdition = dateEdition; }

    public String getMaisonEdition() { return maisonEdition; }
    public void setMaisonEdition(String maisonEdition) { this.maisonEdition = maisonEdition; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public TypeLivre getTypeLivre() { return typeLivre; }
    public void setTypeLivre(TypeLivre typeLivre) { this.typeLivre = typeLivre; }

    public Set<CategorieLivre> getCategories() { return categories; }
    public void setCategories(Set<CategorieLivre> categories) { this.categories = categories; }

    public List<ExemplaireLivre> getExemplaires() { return exemplaires; }
    public void setExemplaires(List<ExemplaireLivre> exemplaires) { this.exemplaires = exemplaires; }

    // Méthodes utilitaires
    public boolean isDisponible() {
        return "disponible".equals(this.status);
    }

    public long getNombreExemplairesDisponibles() {
        if (exemplaires == null) return 0;
        return exemplaires.stream()
            .filter(ex -> "bon".equals(ex.getEtat()) || "moyen".equals(ex.getEtat()))
            .count();
    }
}