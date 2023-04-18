CREATE TABLE Etudiant (
  id_etudiant INT PRIMARY KEY,
  nom_etudiant VARCHAR(255) NOT NULL,
  prenom_etudiant VARCHAR(255) NOT NULL,
  numero_carte INT UNIQUE
 
);

CREATE TABLE Cours (
  id_cours INT PRIMARY KEY,
  nom_cours VARCHAR(255) NOT NULL,
  heure_debut TIME,
  heure_fin TIME,
  jour_semaine VARCHAR(10)
);

CREATE TABLE Salle (
  id_salle INT PRIMARY KEY,
  nom_salle VARCHAR(255) NOT NULL,
  batiment VARCHAR(255),
  etage INT
);

CREATE TABLE Presence (
  id_presence INT PRIMARY KEY,
  id_etudiant INT,
  id_cours INT,
  id_salle INT,
  date_presence DATE,
  heure_presence TIME,
  FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant),
  FOREIGN KEY (id_cours) REFERENCES Cours(id_cours),
  FOREIGN KEY (id_salle) REFERENCES Salle(id_salle)
);

CREATE TABLE Utilisateur (
  id_utilisateur INT PRIMARY KEY,
  nom_utilisateur VARCHAR(255) NOT NULL,
  prenom_utilisateur VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  mot_de_passe VARCHAR(255),
  type_utilisateur VARCHAR(255)
);

CREATE TABLE Acces (
  id_acces INT PRIMARY KEY,
  id_utilisateur INT,
  id_salle INT,
  date_acces DATE,
  heure_acces TIME,
  FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur),
  FOREIGN KEY (id_salle) REFERENCES Salle(id_salle)
);

CREATE TABLE Carte_RFID (
  id_carte INT PRIMARY KEY,
  numero_carte INT UNIQUE,
  id_etudiant INT,
  FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant)
);

CREATE TABLE Reconnaissance_faciale (
  id_reconnaissance INT PRIMARY KEY,
  id_etudiant INT,
  photo VARCHAR(255),
  FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant)
);

CREATE TABLE Administration (
  id_administration INT PRIMARY KEY,
  nom_administration VARCHAR(255) NOT NULL,
  adresse VARCHAR(255),
  telephone VARCHAR(20)
);

CREATE TABLE Emplois_du_temps (
  id_emploi INT PRIMARY KEY,
  id_cours INT,
  id_salle INT,
  jour_semaine VARCHAR(10),
  heure_debut TIME,
  heure_fin TIME,
  FOREIGN KEY (id_cours) REFERENCES Cours(id_cours),
  FOREIGN KEY (id_salle) REFERENCES Salle(id_salle)
);
