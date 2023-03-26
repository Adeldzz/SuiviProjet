CREATE TABLE Enseignant(
   idE int AUTO_INCREMENT,
   nom VARCHAR(50),
   prénom VARCHAR(50),
   statut VARCHAR(50),
   PRIMARY KEY(idE)
);

CREATE TABLE Projet(
   Id_Projet int AUTO_INCREMENT,
   etat VARCHAR(50),
   année INT,
   semestre VARCHAR(50),
   nomP VARCHAR(50),
   resumé VARCHAR(50),
   Lien VARCHAR(50),
   PRIMARY KEY(Id_Projet)
);

CREATE TABLE Equipe(
   Id_Equipe VARCHAR(50),
   nomEq VARCHAR(50),
   roleEtu VARCHAR(50),
   idE INT NOT NULL,
   Id_Projet INT NOT NULL,
   PRIMARY KEY(Id_Equipe),
   FOREIGN KEY(idE) REFERENCES Enseignant(idE),
   FOREIGN KEY(Id_Projet) REFERENCES Projet(Id_Projet)
);

CREATE TABLE Etudiant(
   Id_Etudiant int AUTO_INCREMENT,
   numE INT,
   nomE VARCHAR(50),
   prénomE VARCHAR(50),
   Id_Equipe VARCHAR(50),
   PRIMARY KEY(Id_Etudiant),
   FOREIGN KEY(Id_Equipe) REFERENCES Equipe(Id_Equipe)

);

CREATE TABLE Jalon(
   IdJ int AUTO_INCREMENT,
   rangJ INT,
   dateLim DATE,
   type VARCHAR(50),
   note BOOLEAN,
   PRIMARY KEY(IdJ)
);

CREATE TABLE Avancement(
   Id_Avancement int AUTO_INCREMENT,
   pageAcceuil_copieEcran VARCHAR(50),
   fichierSQL VARCHAR(50),
   IdJ INT NOT NULL,
   PRIMARY KEY(Id_Avancement),
   FOREIGN KEY(IdJ) REFERENCES Jalon(IdJ)
);

CREATE TABLE Rapport(
   IdR int AUTO_INCREMENT,
   titreR VARCHAR(50),
   texteDescriptif VARCHAR(50),
   IdJ INT NOT NULL,
   PRIMARY KEY(IdR),
   FOREIGN KEY(IdJ) REFERENCES Jalon(IdJ)
);

CREATE TABLE Code(
   Id_Code int AUTO_INCREMENT,
   revue VARCHAR(50),
   IdJ INT NOT NULL,
   PRIMARY KEY(Id_Code),
   FOREIGN KEY(IdJ) REFERENCES Jalon(IdJ)
);


CREATE TABLE UE(
   APOGE VARCHAR(50),
   libelléUE VARCHAR(50),
   nbTotal VARCHAR(50),
   sigle VARCHAR(50),
   niveau VARCHAR(50),
   semestre VARCHAR(50),
   idE INT NOT NULL,
   Id_Projet INT NOT NULL,
   PRIMARY KEY(APOGE),
   FOREIGN KEY(idE) REFERENCES Enseignant(idE),
   FOREIGN KEY(Id_Projet) REFERENCES Projet(Id_Projet)
);

CREATE TABLE Soutenance(
   IdS int AUTO_INCREMENT,
   titreS VARCHAR(50),
   consignes VARCHAR(50),
   dateS DATE,
   heureS TIME,
   lieuS VARCHAR(50),
   IdJ INT NOT NULL,
   PRIMARY KEY(IdS),
   FOREIGN KEY(IdJ) REFERENCES Jalon(IdJ)
);

CREATE TABLE Réalisation(
   Id_Réalisation int AUTO_INCREMENT,
   nomR VARCHAR(50),
   logo VARCHAR(50),
   noteFinale VARCHAR(50),
   commentaire VARCHAR(50),
   Id_Equipe VARCHAR(50),
   PRIMARY KEY(Id_Réalisation),
   FOREIGN KEY(Id_Equipe) REFERENCES Equipe(Id_Equipe)

);



CREATE TABLE Concours(
   IdC int AUTO_INCREMENT,
   libelléC VARCHAR(50),
   descriptionC VARCHAR(50),
   prix VARCHAR(50),
   PRIMARY KEY(IdC)
);

CREATE TABLE Question(
   Id_Question int AUTO_INCREMENT,
   thème VARCHAR(50),
   libelléQ VARCHAR(50),
   APOGE VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_Question),
   FOREIGN KEY(APOGE) REFERENCES UE(APOGE)
);

CREATE TABLE Rendu(
   Id_Rendu int AUTO_INCREMENT,
   dateR VARCHAR(50),
   étatR VARCHAR(50),
   estNoté BOOLEAN,
   note INT,
   idE INT NOT NULL,
   Id_Etudiant INT NOT NULL,
   IdJ INT NOT NULL,
   Id_Réalisation INT NOT NULL,
   PRIMARY KEY(Id_Rendu),
   FOREIGN KEY(idE) REFERENCES Enseignant(idE),
   FOREIGN KEY(Id_Etudiant) REFERENCES Etudiant(Id_Etudiant),
   FOREIGN KEY(IdJ) REFERENCES Jalon(IdJ),
   FOREIGN KEY(Id_Réalisation) REFERENCES Réalisation(Id_Réalisation)
);

CREATE TABLE Questionnaire(
   Id_Questionnaire int AUTO_INCREMENT,
   thème VARCHAR(50),
   listeQuestion VARCHAR(50),
   Id_Question INT NOT NULL,
   IdJ INT NOT NULL,
   PRIMARY KEY(Id_Questionnaire),
   FOREIGN KEY(Id_Question) REFERENCES Question(Id_Question),
   FOREIGN KEY(IdJ) REFERENCES Jalon(IdJ)
);

CREATE TABLE Est_Composé(
   Id_Projet INT NOT NULL,
   IdJ INT NOT NULL,
   PRIMARY KEY(Id_Projet, IdJ),
   FOREIGN KEY(Id_Projet) REFERENCES Projet(Id_Projet),
   FOREIGN KEY(IdJ) REFERENCES Jalon(IdJ)
);

CREATE TABLE Est_Responsable(
   idE INT NOT NULL,
   APOGE VARCHAR(50),
   FOREIGN KEY(idE) REFERENCES Enseignant(idE),
   FOREIGN KEY(APOGE) REFERENCES UE(APOGE)
);

CREATE TABLE Est_Inscrit(
   Id_Etudiant INT,
   APOGE VARCHAR(50),
   grpTD VARCHAR(50),
   grpTP VARCHAR(50),
   FOREIGN KEY(Id_Etudiant) REFERENCES Etudiant(Id_Etudiant),
   FOREIGN KEY(APOGE) REFERENCES UE(APOGE)
);

CREATE TABLE Est_Identifier(
   Id_Projet INT NOT NULL,
   Id_Réalisation INT NOT NULL,
   PRIMARY KEY(Id_Projet, Id_Réalisation),
   FOREIGN KEY(Id_Projet) REFERENCES Projet(Id_Projet),
   FOREIGN KEY(Id_Réalisation) REFERENCES Réalisation(Id_Réalisation)
);

CREATE TABLE Est_Organisé(
   Id_Projet INT NOT NULL,
   IdC INT NOT NULL,
   PRIMARY KEY(Id_Projet, IdC),
   FOREIGN KEY(Id_Projet) REFERENCES Projet(Id_Projet),
   FOREIGN KEY(IdC) REFERENCES Concours(IdC)
);

CREATE TABLE Voter(
   idE INT NOT NULL,
   Id_Réalisation INT NOT NULL,
   PRIMARY KEY(idE, Id_Réalisation),
   FOREIGN KEY(idE) REFERENCES Enseignant(idE),
   FOREIGN KEY(Id_Réalisation) REFERENCES Réalisation(Id_Réalisation)
);

CREATE TABLE Est_mutualisé(
   Id_Projet INT NOT NULL,
   Id_Question INT NOT NULL,
   PRIMARY KEY(Id_Projet, Id_Question),
   FOREIGN KEY(Id_Projet) REFERENCES Projet(Id_Projet),
   FOREIGN KEY(Id_Question) REFERENCES Question(Id_Question)
);

CREATE TABLE Est_crée(
   Id_Projet INT NOT NULL,
   Id_Projet_1 INT NOT NULL,
   PRIMARY KEY(Id_Projet, Id_Projet_1),
   FOREIGN KEY(Id_Projet) REFERENCES Projet(Id_Projet),
   FOREIGN KEY(Id_Projet_1) REFERENCES Projet(Id_Projet)
);
