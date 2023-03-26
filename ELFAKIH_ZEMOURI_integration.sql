/* ------------------------------------------ENSEIGNANT------------------------------------------ 
 */
/* --noms et prénoms de tout les responsables */
INSERT INTO p1812386.Enseignant (nom,prénom) SELECT ue_responsable_nom,ue_responsable_prenom FROM donnees_fournies.instances GROUP BY ue_responsable_nom,ue_responsable_prenom;
/* --noms et prénoms encadrant qui ne sont pas responsables */
INSERT INTO p1812386.Enseignant (nom,prénom) SELECT encadrant_nom, encadrant_prenom FROM donnees_fournies.instances WHERE encadrant_nom NOT IN (SELECT ue_responsable_nom FROM donnees_fournies.instances) OR encadrant_prenom NOT IN (SELECT ue_responsable_prenom FROM donnees_fournies.instances) GROUP BY encadrant_nom, encadrant_prenom;




/* ------------------------------------------ PROJET ------------------------------------------*/
/* insert semestre de donnees_fournies dans semestre de Projet */

INSERT INTO p1812386.Projet (semestre, Id_Projet, année, nomP) SELECT semestre, idp, annee, projet_titre FROM donnees_fournies.instances GROUP BY idp;

/* Change automne en S1 */
UPDATE p1812386.Projet
SET semestre = 'S1'
WHERE semestre = 'Automne';

/* Change printemps en S2 */
UPDATE p1812386.Projet
SET semestre = 'S2'
WHERE semestre = 'Printemps';



/* Change les etats en fonction de l'année */

UPDATE p1812386.Projet
SET Projet.etat = 'En attente';

UPDATE p1812386.Projet
SET Projet.etat = 'Actif'
WHERE Projet.année = 2022 AND semestre='S2';

UPDATE p1812386.Projet
SET Projet.etat = 'Archivé'
WHERE année < 2022;


/* ------------------------------------------ UE ------------------------------------------
 */
/* insert les libellés, code_apoge et semestre des UE de donnees_fournies dans libelléUE, APOGE et semestre de UE  + sigle et nbtotal de projet*/
/* -- et Lier Projet, Ue, et Enseignant(relation ternaire)-- */


INSERT INTO p1812386.UE (libelléUE,APOGE, semestre, sigle, nbTotal, idE, Id_Projet) SELECT ue_libelle, code_apoge, semestre,  CONCAT(SUBSTRING(SUBSTRING(projet_titre, 7),1 , 4), SUBSTRING(projet_titre,-2,1)), COUNT(DISTINCT idp), idE, idp
FROM donnees_fournies.instances JOIN p1812386.Enseignant WHERE nom = ue_responsable_nom AND prénom = ue_responsable_prenom GROUP BY code_apoge;
/* Change automne en S1 */
UPDATE p1812386.UE
SET semestre = 'S1'
WHERE semestre = 'Automne';

/* Change printemps en S2 */
UPDATE p1812386.UE
SET semestre = 'S2'
WHERE semestre = 'Printemps';






/*  ------------------------------------------ Lier UE et enseignant (Est_Responsable) ------------------------------------------
 */

INSERT INTO p1812386.Est_Responsable (idE, APOGE) SELECT idE, code_apoge FROM Enseignant JOIN donnees_fournies.instances WHERE nom = ue_responsable_nom AND prénom = ue_responsable_prenom GROUP BY idE, code_apoge;





/* ------------------------------------------Equipe-------------------------------------------------*/









/* SELECT CONCAT(A.nomE), Id_Equipe
FROM (SELECT A.Id_Equipe, A.nomE
FROM Etudiant A CROSS JOIN Etudiant B ON A.Id_Equipe = B.Id_Equipe
GROUP BY A.Id_Equipe,  A.numE, A.nomE, A.prénomE, A.Id_Equipe ) AS A
WHERE A.Id_Equipe = B.Id_Equipe

SELECT DISTINCT A.nomE,B.nomE, A.Id_Equipe
FROM Etudiant A CROSS JOIN Etudiant B ON A.Id_Equipe = B.Id_Equipe */




INSERT INTO Equipe(Id_Equipe, nomEq, Id_Projet, idE)
SELECT  A.nom_equipe, A.nom_equipe, A.idp, B.idE
FROM donnees_fournies.instances A JOIN UE B ON A.idp = B.Id_Projet;




/* ------------------------------------------ ETUDIANT ------------------------------------------*/
/* sépare et insert les noms et prénom des Etudiant de donnees_fournies dans nomE et prénomE de Etudiant et insert aussi les numero d'etudiant dans numE*/

INSERT INTO p1812386.Etudiant(prénomE, nomE, numE, Id_Equipe) SELECT SUBSTRING_INDEX(etudiant1_nomprenom, ';', 1), SUBSTRING_INDEX(etudiant1_nomprenom, ';', -1), A.etudiant1_numetu, B.Id_Equipe FROM donnees_fournies.instances A JOIN Equipe B ON B.Id_Equipe = A.nom_equipe;

INSERT INTO p1812386.Etudiant(prénomE, nomE, numE, Id_Equipe) SELECT SUBSTRING_INDEX(etudiant2_nomprenom, ';', 1), SUBSTRING_INDEX(etudiant2_nomprenom, ';', -1), A.etudiant2_numetu, B.Id_Equipe FROM donnees_fournies.instances A JOIN Equipe B ON B.Id_Equipe = A.nom_equipe;

INSERT INTO p1812386.Etudiant(prénomE, nomE, numE, Id_Equipe) SELECT SUBSTRING_INDEX(etudiant3_nomprenom, ';', 1), SUBSTRING_INDEX(etudiant3_nomprenom, ';', -1), A.etudiant3_numetu, B.Id_Equipe FROM donnees_fournies.instances A JOIN Equipe B ON B.Id_Equipe = A.nom_equipe;

INSERT INTO p1812386.Etudiant(prénomE, nomE, numE, Id_Equipe) SELECT SUBSTRING_INDEX(etudiant4_nomprenom, ';', 1), SUBSTRING_INDEX(etudiant4_nomprenom, ';', -1), A.etudiant4_numetu, B.Id_Equipe FROM donnees_fournies.instances A JOIN Equipe B ON B.Id_Equipe = A.nom_equipe;

INSERT INTO p1812386.Etudiant(prénomE, nomE, numE, Id_Equipe) SELECT SUBSTRING_INDEX(etudiant5_nomprenom, ';', 1), SUBSTRING_INDEX(etudiant5_nomprenom, ';', -1), A.etudiant5_numetu, B.Id_Equipe FROM donnees_fournies.instances A JOIN Equipe B ON B.Id_Equipe = A.nom_equipe;

INSERT INTO p1812386.Etudiant(prénomE, nomE, numE, Id_Equipe) SELECT SUBSTRING_INDEX(etudiant6_nomprenom, ';', 1), SUBSTRING_INDEX(etudiant6_nomprenom, ';', -1), A.etudiant6_numetu, B.Id_Equipe FROM donnees_fournies.instances A JOIN Equipe B ON B.Id_Equipe = A.nom_equipe;

INSERT INTO p1812386.Etudiant(prénomE, nomE, numE, Id_Equipe) SELECT SUBSTRING_INDEX(etudiant7_nomprenom, ';', 1), SUBSTRING_INDEX(etudiant7_nomprenom, ';', -1), A.etudiant7_numetu, B.Id_Equipe FROM donnees_fournies.instances A JOIN Equipe B ON B.Id_Equipe = A.nom_equipe;

INSERT INTO p1812386.Etudiant(prénomE, nomE, numE, Id_Equipe) SELECT SUBSTRING_INDEX(etudiant8_nomprenom, ';', 1), SUBSTRING_INDEX(etudiant8_nomprenom, ';', -1), A.etudiant8_numetu, B.Id_Equipe FROM donnees_fournies.instances A JOIN Equipe B ON B.Id_Equipe = A.nom_equipe;

/* Mettre les noms en majuscules */
UPDATE p1812386.Etudiant
SET nomE=UPPER(nomE);


DELETE FROM p1812386.Etudiant WHERE numE IS NULL;









/* ------------------------------------------ JALON ------------------------------------------*/
/* Insert les numeros,les dates limites,les libelle et  les notes des jalons de donnees_fournies dans ranJ, dateLim, type et note de Jalon */
INSERT INTO p1812386.Jalon (rangJ, dateLim, type, note) SELECT DISTINCT jalon1_num, jalon1_datelimite, jalon1_libelle, jalon1_note FROM donnees_fournies.instances WHERE jalon1_libelle IS NOT NULL;
INSERT INTO p1812386.Jalon (rangJ, dateLim, type, note) SELECT DISTINCT jalon2_num, jalon2_datelimite, jalon2_libelle, jalon2_note FROM donnees_fournies.instances WHERE jalon2_libelle IS NOT NULL;
INSERT INTO p1812386.Jalon (rangJ, dateLim, type, note) SELECT DISTINCT jalon3_num, jalon3_datelimite, jalon3_libelle, jalon3_note FROM donnees_fournies.instances WHERE jalon3_libelle IS NOT NULL;
INSERT INTO p1812386.Jalon (rangJ, dateLim, type, note) SELECT DISTINCT jalon4_num, jalon4_datelimite, jalon4_libelle, jalon4_note FROM donnees_fournies.instances WHERE jalon4_libelle IS NOT NULL;



/* ------------------------------------------Lier projet et Jalon (est_composé) ------------------------------------------
 */
INSERT INTO p1812386.Est_Composé (idJ, Id_Projet) SELECT a.idJ, b.Id_projet FROM Jalon a JOIN Projet b WHERE a.idJ=b.Id_Projet;







/*  ------------------------------------------Soutenance-------------------------------------------
 */
INSERT INTO p1812386.Soutenance(titreS, idJ)
SELECT type, idJ FROM p1812386.Jalon WHERE type="Soutenance Finale" OR type="Soutenance Intermediaire";

/*  ------------------------------------------Avancement------------------------------------------
 */
INSERT INTO p1812386.Avancement(idJ)
SELECT idJ FROM p1812386.Jalon WHERE type="Etat Avancement";

/* ------------------------------------------Rapport------------------------------------------
 */
INSERT INTO p1812386.Rapport(titreR, idJ)
SELECT type, idJ FROM p1812386.Jalon WHERE type="Rapport Final" OR type="Rapport Intermediaire";

/* ------------------------------------------Code------------------------------------------ 
 */
INSERT INTO p1812386.Code(idJ)
SELECT idJ FROM p1812386.Jalon WHERE type="Revue de code" ;



/* ------------------------------------------Est_inscrit------------------------------------------*/

INSERT INTO p1812386.Est_Inscrit(Id_Etudiant, APOGE)
SELECT DISTINCT Id_Etudiant, code_apoge FROM p1812386.Etudiant A JOIN donnees_fournies.instances B WHERE A.numE= B.etudiant1_numetu OR A.numE= B.etudiant2_numetu OR A.numE= B.etudiant3_numetu 
OR A.numE= B.etudiant4_numetu OR A.numE= B.etudiant5_numetu OR A.numE= B.etudiant6_numetu OR A.numE= B.etudiant7_numetu OR A.numE= B.etudiant8_numetu ORDER BY Id_Etudiant;




 /* ---------------------------------REALISATION-------------------------------------------*/



INSERT INTO p1812386.Réalisation(Id_Equipe, nomR, noteFinale,commentaire)
SELECT A.nom_equipe, A.titre_realisation, A.note_finale, A.observations
FROM donnees_fournies.instances A JOIN p1812386.Equipe B ON A.nom_equipe = B.Id_Equipe;



/* ---------------------------------------------Est_Identifier-------------------------------- */


INSERT INTO p1812386.Est_Identifier(Id_Projet, Id_Réalisation)
SELECT A.idp, B.Id_Réalisation
FROM donnees_fournies.instances A JOIN p1812386.Réalisation B ON A.titre_realisation = B.nomR;


/* -------------------------------------------------- RENDU------------------------------------------------- */



INSERT INTO p1812386.Rendu(dateR, etat, note, idE, Id_Etudiant, IdJ, Id_Réalisation)
SELECT D.DateLim, D.type, D.note, idE, Id_Etudiant, D.IdJ, Id_Réalisation
FROM Est_Identifier A JOIN Est_Composé B ON A.Id_Projet=B.Id_Projet JOIN Equipe C ON B.Id_Projet=C.Id_Projet JOIN Jalon D ON D.IdJ = B.IdJ JOIN Etudiant E ON C.Id_Equipe = E.Id_Equipe;


UPDATE p1812386.Rendu
SET estNoté = true
WHERE note IS NOT NULL;

UPDATE p1812386.Rendu
SET estNoté = NON
WHERE note IS NULL;
















