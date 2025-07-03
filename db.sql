CREATE DATABASE biblio;
\c biblio;

CREATE TABLE Profil (
    Id_Profil SERIAL PRIMARY KEY,
    Nom_Profil VARCHAR(50) NOT NULL,
    Quota_maxSurPlace INTEGER NOT NULL,
    Quota_maxEmprunter INTEGER,
    Duree_pret INTEGER NOT NULL
);
INSERT INTO Profil (Nom_Profil, Quota_maxSurPlace, Quota_maxEmprunter, Duree_pret) VALUES
('Etudiant',4, 2, 15),
('Enseignant', 6, 4, 30),
('Administrateur', 10, 10, 60),
('Visiteur', 2, 0, 0);

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
    MaisonEdition VARCHAR(100),
    IdTypeLivre INTEGER REFERENCES TypeLivre(IdTypeLivre),
    Status VARCHAR(20) NOT NULL DEFAULT 'disponible' CHECK (Status IN ('disponible', 'emprunté', 'perdu', 'en réparation'))
);

CREATE TABLE ExemplaireLivre (
    IdExemplaireLivre SERIAL PRIMARY KEY,
    IdLivre INTEGER NOT NULL REFERENCES Livre(IdLivre),
    CodeBarre VARCHAR(50) UNIQUE,
    DateAcquisition DATE DEFAULT CURRENT_DATE,
    Etat VARCHAR(20) DEFAULT 'bon' CHECK (Etat IN ('bon', 'moyen', 'mauvais', 'hors service'))
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
    TypePret VARCHAR(20) NOT NULL CHECK (TypePret IN ('standard', 'prolongé', 'express')),
    Date_emprunt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Date_rendu TIMESTAMP,
    Date_rendu_prevue TIMESTAMP NOT NULL,
    IdAdherent INTEGER NOT NULL REFERENCES Adherent(IdAdherent),
    IdExemplaireLivre INTEGER NOT NULL REFERENCES ExemplaireLivre(IdExemplaireLivre),
    CONSTRAINT check_dates CHECK (Date_rendu IS NULL OR Date_rendu >= Date_emprunt)
);

CREATE TABLE Penalite (
    IdPenalite SERIAL PRIMARY KEY,
    IdAdherent INTEGER NOT NULL REFERENCES Adherent(IdAdherent),
    IdPret INTEGER REFERENCES Pret(IdPret),
    Montant DECIMAL(10,2) NOT NULL CHECK (Montant >= 0),
    DatePenalite DATE NOT NULL DEFAULT CURRENT_DATE,
    Paye BOOLEAN NOT NULL DEFAULT FALSE,
    Motif VARCHAR(255)
);

CREATE INDEX idx_livre_titre ON Livre(Titre);
CREATE INDEX idx_livre_auteur ON Livre(Auteur);
CREATE INDEX idx_pret_user ON Pret(IdAdherent);
CREATE INDEX idx_pret_exemplaire ON Pret(IdExemplaireLivre);
CREATE INDEX idx_pret_dates ON Pret(Date_emprunt, Date_rendu);
CREATE INDEX idx_user_profil ON Adherent(Id_Profil);


CREATE TABLE "User" (
    IdUser SERIAL PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Prenom VARCHAR(100),
    Mdp VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    DateNaissance DATE,
    Id_Profil INTEGER NOT NULL REFERENCES Profil(Id_Profil)
);
