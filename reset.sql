-- Connect to the biblio database
\c biblio;

-- Truncate all tables with CASCADE to handle foreign key constraints
TRUNCATE TABLE Pret_Prolongement CASCADE;
TRUNCATE TABLE Reservation CASCADE;
TRUNCATE TABLE Penalite CASCADE;
TRUNCATE TABLE Pret CASCADE;
TRUNCATE TABLE LivreCategorie CASCADE;
TRUNCATE TABLE ExemplaireLivre CASCADE;
TRUNCATE TABLE Livre CASCADE;
TRUNCATE TABLE CategorieLivre CASCADE;
TRUNCATE TABLE TypeLivre CASCADE;
TRUNCATE TABLE Abonnement CASCADE;
TRUNCATE TABLE adherent_quota CASCADE;
TRUNCATE TABLE Adherent CASCADE;
TRUNCATE TABLE Users CASCADE;
TRUNCATE TABLE Profil CASCADE;

-- Reset all sequences to start from 1
ALTER SEQUENCE Profil_Id_Profil_seq RESTART WITH 1;
ALTER SEQUENCE Adherent_IdAdherent_seq RESTART WITH 1;
ALTER SEQUENCE Abonnement_IdAbonnement_seq RESTART WITH 1;
ALTER SEQUENCE TypeLivre_IdTypeLivre_seq RESTART WITH 1;
ALTER SEQUENCE Livre_IdLivre_seq RESTART WITH 1;
ALTER SEQUENCE ExemplaireLivre_IdExemplaireLivre_seq RESTART WITH 1;
ALTER SEQUENCE CategorieLivre_IdCatLivre_seq RESTART WITH 1;
ALTER SEQUENCE LivreCategorie_IdCatLivre_seq RESTART WITH 1;
ALTER SEQUENCE Pret_IdPret_seq RESTART WITH 1;
ALTER SEQUENCE Penalite_IdPenalite_seq RESTART WITH 1;
ALTER SEQUENCE Reservation_idReservation_seq RESTART WITH 1;
ALTER SEQUENCE Users_IdUser_seq RESTART WITH 1;
ALTER SEQUENCE Pret_Prolongement_idProlongement_seq RESTART WITH 1;

-- Optional: Commit the transaction to ensure changes are applied
COMMIT;
