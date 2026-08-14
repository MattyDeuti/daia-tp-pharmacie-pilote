# Plan d'Implémentation - Extension Gestion de Stock Pharmacie

## Vue d'ensemble

Ce document décrit les tâches d'implémentation pour l'extension de gestion de stock de la pharmacie. Le plan est basé sur le design technique et les exigences fonctionnelles établis. L'implémentation suit une approche par couches : Modèle → DAO → Service → Controller, avec les tests correspondants à chaque niveau.

Les tâches sont organisées pour permettre un développement incrémental avec des points de contrôle réguliers. Les tests property-based sont marqués d'un astérisque (*) et peuvent être sautés pour un MVP plus rapide.

## Conventions

- Langage : Java 17
- Build : Maven
- Tests : JUnit 5 + Mockito
- Property-based testing : jqwik
- Base de données : MySQL via JDBC
- Langue : Français pour tous les messages, commentaires et logs

---

## Tâches

### Phase 1 : Modèle de données

- [ ] 1. Créer la classe Produit (model/Produit.java)
  - Définir les attributs : produitId (String), libelle (String), categorie (String), quantite (int), seuilAlerte (int)
  - Implémenter le constructeur avec tous les paramètres
  - Implémenter les getters et setters
  - _Exigences : 1.4, 1.5, 2.2, 2.5, 3.1, 3.3, 4.3, 5.1, 5.3_

- [ ] 2. Créer la classe Mouvement (model/Mouvement.java)
  - Définir les attributs : mouvementId (int), produitId (String), quantite (int), dateMouvement (LocalDateTime), fournisseur (String), type (String)
  - Implémenter le constructeur avec tous les paramètres
  - Implémenter les getters et setters
  - _Exigences : 1.6, 2.6, 3.3, 6.4, 6.5, 6.6_

- [ ] 3. Créer la classe Lot (model/Lot.java)
  - Définir les attributs : lotId (int), produitId (String), datePeremption (LocalDate), quantiteLot (int)
  - Implémenter le constructeur avec tous les paramètres
  - Implémenter les getters et setters
  - _Exigences : 1.7, 3.5_

- [ ] 4. Créer la classe TraceStupefiant (model/TraceStupefiant.java)
  - Définir les attributs : traceId (int), mouvementId (int), utilisateurId (String), dateHeure (LocalDateTime), motif (String), type (String)
  - Implémenter le constructeur avec tous les paramètres
  - Implémenter les getters et setters
  - _Exigences : 1.7, 5.7, 5.8_

### Phase 2 : Couche DAO

- [ ] 5. Créer la classe StockDAO (dao/StockDAO.java)
  - [ ] 5.1 Implémenter trouverOuCreer(String produitId, String libelle, String categorie)
    - Requête SQL : INSERT avec ON DUPLICATE KEY UPDATE
    - _Exigences : 1.4_
  
  - [ ] 5.2 Implémenter modifierQuantite(String produitId, int deltaQuantite)
    - Requête SQL : UPDATE avec addition
    - _Exigences : 1.5, 2.5_
  
  - [ ] 5.3 Implémenter trouverParId(String produitId)
    - Requête SQL : SELECT avec WHERE
    - _Exigences : 2.2, 3.1, 4.3_
  
  - [ ] 5.4 Implémenter modifierSeuilAlerte(String produitId, int seuil)
    - Requête SQL : UPDATE avec WHERE
    - _Exigences : 4.4_
  
  - [ ] 5.5 Implémenter listerAlertes()
    - Requête SQL : SELECT avec COALESCE pour seuil par défaut
    - _Exigences : 4.7_

- [ ] 6. Créer la classe MouvementDAO (dao/MouvementDAO.java)
  - [ ] 6.1 Implémenter creer(String produitId, int quantite, LocalDateTime date, String fournisseur, String type)
    - Requête SQL : INSERT et retour de l'ID généré
    - _Exigences : 1.6, 2.6_
  
  - [ ] 6.2 Implémenter getHistorique(String produitId)
    - Requête SQL : SELECT avec ORDER BY date DESC, LIMIT 100
    - _Exigences : 6.3, 6.4, 6.5, 6.6, 6.7_

- [ ] 7. Créer la classe PeremptionDAO (dao/PeremptionDAO.java)
  - [ ] 7.1 Implémenter creer(String produitId, LocalDate datePeremption, int quantiteLot)
    - Requête SQL : INSERT
    - _Exigences : 1.7_
  
  - [ ] 7.2 Implémenter trouverDateProche(String produitId)
    - Requête SQL : SELECT MIN(date_peremption) avec WHERE date > CURDATE()
    - _Exigences : 3.5_

- [ ] 8. Créer la classe StupefiantsDAO (dao/StupefiantsDAO.java)
  - [ ] 8.1 Implémenter creer(int mouvementId, String utilisateurId, LocalDateTime dateHeure, String motif, String type)
    - Requête SQL : INSERT
    - _Exigences : 5.7, 5.8_

- [ ] 9. Point de contrôle - Couche DAO
  - Exécuter les tests unitaires des DAO
  - Vérifier la connexion à la base de données
  - Valider les requêtes SQL avec des données de test

### Phase 3 : Couche Service

- [ ] 10. Créer ResultatMouvement (model/ResultatMouvement.java)
  - Attributs : succes (boolean), message (String), stockApres (int), alerteGeneree (boolean)
  - _Exigences : 1.1-1.8, 2.1-2.8_

- [ ] 11. Créer StockService (service/StockService.java)
  - [ ] 11.1 Implémenter getStock(String produitId)
    - Déléguer à StockDAO.trouverParId
    - _Exigences : 3.1, 3.3_
  
  - [ ] 11.2 Implémenter getDatePeremptionProche(String produitId)
    - Déléguer à PeremptionDAO.trouverDateProche
    - _Exigences : 3.5, 3.6_

- [ ] 12. Créer MouvementService (service/MouvementService.java)
  - [ ] 12.1 Implémenter validerEntree(String produitId, int quantite, String datePeremption, String fournisseur)
    - Valider : quantité 1-999999, date future, fournisseur 1-200 car.
    - Retourner tuple de validation
    - _Exigences : 1.1, 1.2, 1.3_
  
  - [ ] 12.2 Implémenter validerSortie(String produitId, int quantite)
    - Valider : quantité 1-999999, produit existe, stock suffisant
    - Retourner tuple de validation
    - _Exigences : 2.1, 2.2, 2.3, 2.4_
  
  - [ ] 12.3 Implémenter enregistrerEntree(String produitId, int quantite, String datePeremption, String fournisseur, String libelle, String categorie, String utilisateurId, String motif)
    - Valider les paramètres
    - Gérer transaction JDBC (commit/rollback)
    - Appeler StockDAO.trouverOuCreer
    - Appeler StockDAO.modifierQuantite
    - Appeler MouvementDAO.creer
    - Appeler PeremptionDAO.creer
    - Appeler StupefiantsDAO.creer si stupéfiant
    - _Exigences : 1.1-1.8, 5.5, 5.6_
  
  - [ ] 12.4 Implémenter enregistrerSortie(String produitId, int quantite, String utilisateurId, String motif)
    - Valider les paramètres stupéfiant
    - Gérer transaction JDBC (commit/rollback)
    - Vérifier stock suffisant
    - Appeler StockDAO.modifierQuantite
    - Appeler MouvementDAO.creer
    - Appeler StupefiantsDAO.creer si stupéfiant
    - _Exigences : 2.1-2.8, 5.4, 5.5, 5.6_

- [ ] 13. Créer AlerteService (service/AlerteService.java)
  - [ ] 13.1 Implémenter validerSeuil(int seuil)
    - Valider : seuil entre 0 et 1000000
    - _Exigences : 4.1, 4.2_
  
  - [ ] 13.2 Implémenter modifierSeuil(String produitId, int seuil)
    - Valider seuil, vérifier produit existe, appeler StockDAO.modifierSeuilAlerte
    - _Exigences : 4.3, 4.4_
  
  - [ ] 13.3 Implémenter listerAlertes()
    - Appeler StockDAO.listerAlertes
    - Formater les messages d'alerte
    - _Exigences : 4.7, 4.8_

- [ ] 14. Créer CategorieService (service/CategorieService.java)
  - [ ] 14.1 Implémenter validerCategorie(String categorie)
    - Valider : appartient à {médicament, stupéfiant, parapharmacie}
    - _Exigences : 5.1, 5.2_
  
  - [ ] 14.2 Implémenter estStupefiant(String produitId)
    - Vérifier si un produit est catégorisé comme stupéfiant
    - _Exigences : 5.4_

- [ ] 15. Point de contrôle - Couche Service
  - Exécuter les tests unitaires des Services
  - Vérifier la gestion des transactions JDBC

### Phase 4 : Couche Controller

- [ ] 16. Créer StockController (controller/StockController.java)
  - [ ] 16.1 Implémenter traiterEntree(Map params) → Map resultat
    - Extraire les paramètres, appeler MouvementService.enregistrerEntree
    - Gérer les erreurs et retourner le message approprié
    - _Exigences : 1.1-1.8_
  
  - [ ] 16.2 Implémenter traiterSortie(Map params) → Map resultat
    - Extraire les paramètres, appeler MouvementService.enregistrerSortie
    - Gérer les erreurs et retourner le message approprié
    - _Exigences : 2.1-2.8_
  
  - [ ] 16.3 Implémenter consulterStock(String produitId) → Map resultat
    - Appeler StockService.getStock
    - Formater la réponse (produit_id, quantité, message approprié)
    - _Exigences : 3.1-3.6_
  
  - [ ] 16.4 Implémenter definirSeuil(String produitId, int seuil) → Map resultat
    - Appeler AlerteService.modifierSeuil
    - _Exigences : 4.1-4.4_
  
  - [ ] 16.5 Implémenter listerAlertes() → List<Map> resultats
    - Appeler AlerteService.listerAlertes
    - Formater la liste des alertes
    - _Exigences : 4.5-4.8_
  
  - [ ] 16.6 Implémenter getHistorique(String produitId) → List<Map> resultats
    - Appeler MouvementService.getHistorique
    - Joindre les données de tracabilite_stupefiants pour stupéfiants
    - _Exigences : 6.1-6.8_

- [ ] 17. Point de contrôle - Contrôleur
  - Exécuter les tests d'intégration du Controller
  - Vérifier le format des réponses API

### Phase 5 : Migrations SQL

- [ ] 18. Créer migrations pour les tables supplémentaires (db/schema_extensions.sql)
  - [ ] 18.1 Créer table mouvements
    - Colonnes : mouvement_id (INT PK AUTO_INCREMENT), produit_id (VARCHAR 20), quantite (INT), date_mouvement (DATETIME), fournisseur (VARCHAR 200), type (VARCHAR 10)
    - _Exigences : 1.6, 2.6, 6.3_
  
  - [ ] 18.2 Créer table dates_peremption
    - Colonnes : lot_id (INT PK AUTO_INCREMENT), produit_id (VARCHAR 20), date_peremption (DATE), quantite_lot (INT)
    - _Exigences : 1.7, 3.5_
  
  - [ ] 18.3 Créer table tracabilite_stupefiants
    - Colonnes : trace_id (INT PK AUTO_INCREMENT), mouvement_id (INT FK), utilisateur_id (VARCHAR 50), date_heure (DATETIME), motif (VARCHAR 500), type (VARCHAR 10)
    - _Exigences : 5.7, 5.8, 6.6, 6.7_
  
  - [ ] 18.4 Créer les indexes nécessaires
    - Index sur mouvements(produit_id), dates_peremption(produit_id, date_peremption), tracabilite_stupefiants(mouvement_id)

- [ ] 19. Exécuter les migrations
  - Vérifier la création des tables
  - Valider les contraintes de clés étrangères

### Phase 6 : Tests Unitaires JUnit 5

- [ ] 20. Tests unitaires pour les classes Model
  - [ ]* 20.1 Tester Produit - validation des getters/setters
    - Vérifier que tous les attributs sont accessibles
    - _Exigences : 1.4, 5.1_
  
  - [ ]* 20.2 Tester Mouvement - validation des getters/setters
    - Vérifier que tous les attributs sont accessibles
    - _Exigences : 1.6, 2.6_

- [ ] 21. Tests unitaires pour les classes DAO (avec Mockito)
  - [ ]* 21.1 Tester StockDAO.trouverOuCreer
    - Simuler Connection et PreparedStatement
    - Vérifier la requête INSERT avec ON DUPLICATE KEY
    - _Exigences : 1.4_
  
  - [ ]* 21.2 Tester StockDAO.modifierQuantite
    - Simuler Connection et PreparedStatement
    - Vérifier la requête UPDATE avec addition
    - _Exigences : 1.5, 2.5_
  
  - [ ]* 21.3 Tester MouvementDAO.creer
    - Simuler Connection et PreparedStatement
    - Vérifier le retour de l'ID généré
    - _Exigences : 1.6, 2.6_
  
  - [ ]* 21.4 Tester PeremptionDAO.trouverDateProche
    - Simuler Connection et ResultSet
    - Vérifier la requête avec MIN et CURDATE
    - _Exigences : 3.5_

- [ ] 22. Tests unitaires pour les classes Service
  - [ ]* 22.1 Tester MouvementService.validerEntree
    - Cas valide : quantité 100, date future, fournisseur valide
    - Cas invalide : quantité 0, date passée, fournisseur vide
    - _Exigences : 1.1, 1.2, 1.3_
  
  - [ ]* 22.2 Tester MouvementService.validerSortie
    - Cas valide : quantité 50, stock suffisant
    - Cas invalide : quantité 0, stock insuffisant, produit inexistant
    - _Exigences : 2.1, 2.2, 2.3, 2.4_
  
  - [ ]* 22.3 Tester MouvementService.enregistrerEntree - scénario complet
    - Mock de tous les DAO
    - Vérifier l'appel dans le bon ordre
    - Vérifier le commit transaction
    - _Exigences : 1.4-1.8_
  
  - [ ]* 22.4 Tester MouvementService.enregistrerSortie - scénario complet
    - Mock de tous les DAO
    - Vérifier l'appel dans le bon ordre
    - Vérifier le rollback sur erreur
    - _Exigences : 2.5-2.8_
  
  - [ ]* 22.5 Tester AlerteService.validerSeuil
    - Cas valide : seuil 100
    - Cas invalide : seuil -1, seuil 1000001
    - _Exigences : 4.1, 4.2_
  
  - [ ]* 22.6 Tester CategorieService.validerCategorie
    - Cas valide : "médicament", "stupéfiant", "parapharmacie"
    - Cas invalide : "inconnu"
    - _Exigences : 5.1, 5.2_
  
  - [ ]* 22.7 Tester CategorieService.estStupefiant
    - Produit stupéfiant → true
    - Produit non stupéfiant → false
    - _Exigences : 5.4_

- [ ] 23. Tests unitaires pour le Controller
  - [ ]* 23.1 Tester StockController.traiterEntree
    - Appel du service avec bons paramètres
    - Format de réponse correct
    - _Exigences : 1.1-1.8_
  
  - [ ]* 23.2 Tester StockController.traiterSortie
    - Appel du service avec bons paramètres
    - Format de réponse correct
    - _Exigences : 2.1-2.8_
  
  - [ ]* 23.3 Tester StockController.consulterStock
    - Produit existant → données correctes
    - Produit inexistant → message d'erreur
    - Stock épuisé → message approprié
    - _Exigences : 3.1-3.6_
  
  - [ ]* 23.4 Tester StockController.getHistorique
    - Mouvement avec tracabilité stupéfiant
    - Mouvement sans tracabilité
    - _Exigences : 6.4-6.7_

- [ ] 24. Point de contrôle - Tests Unitaires
  - Exécuter tous les tests JUnit 5
  - Atteindre une couverture de code minimum de 80%

### Phase 7 : Tests Property-Based jqwik

- [ ] 25. Tests property-based pour MouvementService
  - [ ]* 25.1 Tester property - Entrée augmente le stock
    - **Propriété 1 : Invariant Stock**
    - **Valide : Exigences 1.5**
    - Pour toute quantité valide (1-999999), le stock augmente de cette quantité
  
  - [ ]* 25.2 Tester property - Sortie diminue le stock
    - **Propriété 2 : Invariant Stock Sortie**
    - **Valide : Exigences 2.5**
    - Pour toute sortie valide avec stock suffisant, le stock diminue de la quantité
  
  - [ ]* 25.3 Tester property - Round-trip lot
    - **Propriété 3 : Round-trip Lot**
    - **Valide : Exigence 1.7**
    - L'insertion d'un lot suivi d'une lecture retourne un équivalent
  
  - [ ]* 25.4 Tester property - Métamorphisme mouvement
    - **Propriété 4 : Métamorphique Mouvement**
    - **Valide : Exigences 1.5, 2.5**
    - Le nombre de mouvements augmente de 1 après chaque entrée/sortie

- [ ] 26. Tests property-based pour CategorieService
  - [ ]* 26.1 Tester property - Catégorie valide
    - **Propriété 5 : Invariant Catégorie**
    - **Valide : Exigences 5.1, 5.2**
    - Toute catégorie dans {médicament, stupéfiant, parapharmacie} est acceptée
  
  - [ ]* 26.2 Tester property - Round-trip catégorie
    - **Propriété 6 : Round-trip Catégorie**
    - **Valide : Exigence 5.5**
    - Définir une catégorie et la relire retourne la même valeur

- [ ] 27. Tests property-based pour AlerteService
  - [ ]* 27.1 Tester property - Seuil valide
    - **Propriété 7 : Condition Erreur Seuil**
    - **Valide : Exigences 4.1, 4.2**
    - Tout seuil hors plage (0-1000000) est rejeté
  
  - [ ]* 27.2 Tester property - Idempotence consultation
    - **Propriété 8 : Idempotence Alerte**
    - **Valide : Exigence 4.8**
    - La consultation répétée ne modifie pas l'état

- [ ] 28. Point de contrôle - Property-Based Tests
  - Exécuter tous les tests jqwik
  - Vérifier que les propriétés passent avec 1000 itérations
  - Analyser les contre-exemples générés

### Phase 8 : Finalisation

- [ ] 29. Exécuter tous les tests
  - Lancer la suite complète de tests
  - Corriger les éventuels échecs

- [ ] 30. Documentation du code
  - Ajouter les JavaDoc pour toutes les classes publiques
  - Vérifier les messages d'erreur en français

- [ ] 31. Point de contrôle final
  - Exécuter tous les tests (unitaires + property-based)
  - Valider la conformité avec les exigences
  - Obtenir la validation du PO

---

## Notes

- Les tâches marquées d'un astérisque (*) sont optionnelles et peuvent être sautées pour un MVP plus rapide.
- Chaque tâche référence les exigences correspondantes pour assurer la traçabilité.
- Les points de contrôle permettent de valider l'incrément avant de continuer.
- Les tests property-based valident les propriétés universelles définies dans le design.

---

## Graphe de dépendances des tâches

```json
{
  "waves": [
    {
      "id": 0,
      "tasks": ["1", "2", "3", "4"]
    },
    {
      "id": 1,
      "tasks": ["5.1", "5.2", "5.3", "5.4", "5.5", "6.1", "6.2", "7.1", "7.2", "8.1"]
    },
    {
      "id": 2,
      "tasks": ["10", "11.1", "11.2", "12.1", "12.2", "13.1", "13.2", "13.3", "14.1", "14.2"]
    },
    {
      "id": 3,
      "tasks": ["12.3", "12.4", "15"]
    },
    {
      "id": 4,
      "tasks": ["16.1", "16.2", "16.3", "16.4", "16.5", "16.6", "17"]
    },
    {
      "id": 5,
      "tasks": ["18.1", "18.2", "18.3", "18.4", "19"]
    },
    {
      "id": 6,
      "tasks": ["20.1", "20.2", "21.1", "21.2", "21.3", "21.4", "22.1", "22.2", "22.3", "22.4"]
    },
    {
      "id": 7,
      "tasks": ["22.5", "22.6", "22.7", "23.1", "23.2", "23.3", "23.4", "24"]
    },
    {
      "id": 8,
      "tasks": ["25.1", "25.2", "25.3", "25.4", "26.1", "26.2", "27.1", "27.2", "28"]
    },
    {
      "id": 9,
      "tasks": ["9", "15", "17", "24", "28", "29", "30", "31"]
    }
  ]
}
```