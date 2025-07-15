INSERT INTO Profil (Nom_Profil, Quota_maxSurPlace, Quota_maxEmprunter, Duree_pret) VALUES
('Etudiant',4, 2, 15),
('Enseignant', 6, 4, 30),
('Administrateur', 10, 10, 60),
('Visiteur', 2, 0, 0);


INSERT INTO TypeLivre (Type) VALUES
('Roman'),
('Essai'),
('Science'),
('Informatique'),
('Histoire');

INSERT INTO Livre (Titre, Auteur, DateEdition, IdTypeLivre, Status) VALUES
('Le Petit Prince', 'Antoine de Saint-Exupéry', '1943-04-06', 1, 'disponible'),
('LArt de la Guerre', 'Sun Tzu', '1910-01-01', 2, 'disponible'),
('Introduction à Java', 'James Gosling', '2010-09-15', 4, 'emprunté'),
('LOrigine des espèces', 'Charles Darwin', '1859-11-24', 3, 'perdu'),
('La Révolution Française', 'Jules Michelet', '1847-01-01', 5, 'en réparation');

INSERT INTO ExemplaireLivre (IdLivre, CodeBarre, DateAcquisition, Etat, Status) VALUES
(1, 'EX001', '2020-01-01', 'bon', 1),
(1, 'EX002', '2021-06-01', 'moyen', 1),
(2, 'EX003', '2022-03-12', 'bon', 1),
(3, 'EX004', '2022-08-25', 'mauvais', 0),
(4, 'EX005', '2019-11-05', 'hors service', 0),
(5, 'EX006', '2023-01-10', 'bon', 1);


INSERT INTO CategorieLivre (Categorie) VALUES
('Philosophie'),
('Science Fiction'),
('Education'),
('Biographie'),
('Politique');

INSERT INTO LivreCategorie (IdCatLivre, IdLivre) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 5),
(5, 5);
INSERT INTO Users (Nom, Prenom, Mdp, Email, DateNaissance, Id_Profil)
VALUES ('admin', 'super', 'admin123', 'admin@gmail.com', '1990-01-01', 3);

