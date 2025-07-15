CREATE DATABASE biblio;
\c biblio;

CREATE TABLE Profil (
    Id_Profil SERIAL PRIMARY KEY,
    Nom_Profil VARCHAR(50) NOT NULL,
    Quota_maxSurPlace INTEGER NOT NULL,
    Quota_maxEmprunter INTEGER
 
);
ALTER TABLE Profil ADD COLUMN Duree_penalite INTEGER DEFAULT 0;



CREATE TABLE Adherent (
    IdAdherent SERIAL PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Prenom VARCHAR(100),
    DateNaissance DATE,
    Email VARCHAR(100),
    MotDePasse VARCHAR(10),
    Date_inscription DATE NOT NULL DEFAULT CURRENT_DATE,

    Id_Profil INTEGER NOT NULL REFERENCES Profil(Id_Profil)
);

CREATE TABLE Abonnement (
    IdAbonnement SERIAL PRIMARY KEY,
    IdAdherent INTEGER NOT NULL REFERENCES Adherent(IdAdherent),
    Datedebut DATE NOT NULL DEFAULT CURRENT_DATE,
    DateFin DATE NOT NULL DEFAULT CURRENT_DATE,
    Montant DECIMAL(10,2) NOT NULL CHECK (Montant >= 0),
);

CREATE TABLE TypeLivre (
    IdTypeLivre SERIAL PRIMARY KEY,
    Type VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE Livre (
    IdLivre SERIAL PRIMARY KEY,
    Titre VARCHAR(255) NOT NULL,
    Auteur VARCHAR(255),
    DateEdition DATE,
    IdTypeLivre INTEGER REFERENCES TypeLivre(IdTypeLivre),
    Status VARCHAR(20) NOT NULL DEFAULT 'disponible' CHECK (Status IN ('disponible', 'emprunté', 'perdu', 'en réparation'))
);
ALTER TABLE Livre
ADD COLUMN restriction_age INTEGER;



CREATE TABLE ExemplaireLivre (
    IdExemplaireLivre SERIAL PRIMARY KEY,
    IdLivre INTEGER NOT NULL REFERENCES Livre(IdLivre),
    CodeBarre VARCHAR(50) UNIQUE,
    DateAcquisition DATE DEFAULT CURRENT_DATE,
    Etat VARCHAR(20) DEFAULT 'bon' CHECK (Etat IN ('bon', 'moyen', 'mauvais', 'hors service')),
    Status INT DEFAULT 1 CHECK (Status IN (0, 1))
);


CREATE TABLE CategorieLivre (
    IdCatLivre SERIAL PRIMARY KEY,
    Categorie VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE LivreCategorie (
    IdCatLivre INTEGER NOT NULL REFERENCES CategorieLivre(IdCatLivre),
    IdLivre INTEGER NOT NULL REFERENCES Livre(IdLivre),
    PRIMARY KEY (IdCatLivre, IdLivre)
);



CREATE TABLE Pret (
    IdPret SERIAL PRIMARY KEY,
    TypePret VARCHAR(20) NOT NULL 
        CHECK (TypePret IN ( 'sur_place', 'a_domicile')),
    
    Date_emprunt DATE NOT NULL DEFAULT CURRENT_DATE,
    Date_rendu DATE,
    Date_rendu_prevue DATE NOT NULL,

    is_prolonged BOOLEAN DEFAULT FALSE,

    IdAdherent INTEGER NOT NULL REFERENCES Adherent(IdAdherent),
    IdExemplaireLivre INTEGER NOT NULL REFERENCES ExemplaireLivre(IdExemplaireLivre),

    CONSTRAINT check_dates CHECK (Date_rendu IS NULL OR Date_rendu >= Date_emprunt)
);
CREATE TABLE Penalite (
    IdPenalite SERIAL PRIMARY KEY,
    IdAdherent INTEGER NOT NULL REFERENCES Adherent(IdAdherent),
    IdPret INTEGER REFERENCES Pret(IdPret),
    DateDebutPenalite DATE NOT NULL DEFAULT CURRENT_DATE,
    DatelevePenalite DATE NOT NULL DEFAULT CURRENT_DATE
);
ALTER TABLE Penalite ADD COLUMN Leve BOOLEAN NOT NULL DEFAULT FALSE;

CREATE TABLE adherent_quota ( 
    id_adherent INTEGER NOT NULL REFERENCES Adherent(IdAdherent)  ,
    quota_surplace INTEGER NOT NULL DEFAULT 0,
    quota_emprunter INTEGER NOT NULL DEFAULT 0,

        
);
CREATE TABLE Reservation (
    idReservation SERIAL PRIMARY KEY,
    idAdherent INT NOT NULL REFERENCES Adherent(idAdherent),
    idLivre INT NOT NULL REFERENCES Livre(idLivre),
    idExemplaireLivre INT REFERENCES ExemplaireLivre(idExemplaireLivre),
    date_reservation DATE NOT NULL DEFAULT CURRENT_DATE,
    date_debut_reservation DATE,
      date_fin_reservation DATE,

    isApproved BOOLEAN DEFAULT FALSE
);

CREATE INDEX idx_livre_titre ON Livre(Titre);
CREATE INDEX idx_livre_auteur ON Livre(Auteur);
CREATE INDEX idx_pret_user ON Pret(IdAdherent);
CREATE INDEX idx_pret_exemplaire ON Pret(IdExemplaireLivre);
CREATE INDEX idx_pret_dates ON Pret(Date_emprunt, Date_rendu);
CREATE INDEX idx_user_profil ON Adherent(Id_Profil);


CREATE TABLE Users (
    IdUser SERIAL PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Prenom VARCHAR(100),
    Mdp VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    DateNaissance DATE,
    Id_Profil INTEGER NOT NULL REFERENCES Profil(Id_Profil)
);


CREATE TABLE Pret_Prolongement (
    idProlongement SERIAL PRIMARY KEY,
    idPret INTEGER NOT NULL REFERENCES Pret(idPret),
    jour_prolongement INTEGER NOT NULL CHECK (jour_prolongement BETWEEN 1 AND 15),
    est_valide BOOLEAN DEFAULT FALSE
);


