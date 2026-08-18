# Spécification des Besoins - Extension Gestion de Stock Pharmacie

## Introduction

Cette spécification décrit l'extension du système de gestion de stock pour une pharmacie.
Le système permet de gérer les mouvements de marchandises (réceptions et sorties), de suivre
les niveaux de stock par produit, de déclencher des alertes automatiques lorsque les seuils
sont atteints, de gérer les catégories de produits incluant les stupéfiants, et de conserver
un historique complet des mouvements pour assurer la traçabilité.

Le système existant est une application Java 17 utilisant Maven, JUnit 5 et Mockito,
avec une base de données relationnelle MySQL. L'extension doit s'intégrer de manière
cohérente avec le code existant tout en respectant les règles métier de la pharmacie.

## Glossaire

- **Produit**: Article pharmaceutique identifié par un code unique, appartenant à une catégorie
  et ayant un stock courant ainsi qu'un seuil d'alerte configurable.
- **Catégorie**: Classification d'un produit parmi les valeurs autorisées : médicament,
  stupéfiant, ou parapharmacie.
- **Mouvement**: Opération affectant le stock d'un produit, soit en entrée (réception),
  soit en sortie (vente ou usage interne). Chaque mouvement est horodaté.
- **Stock courant**: Quantité disponible pour un produit, calculée comme la somme de toutes
  les réceptions moins la somme de toutes les sorties.
- **Seuil d'alerte**: Valeur numérique en dessous de laquelle le système déclenche une
  notification pour un produit donné.
- **Stupéfiant**: Catégorie de produits pharmaceutiques soumis à des règles légales strictes
  de traçabilité et de contrôle.
- **Date de péremption**: Date à laquelle un lot de produit expire et ne peut plus être vendu
  ou utilisé.
- **Lot**: Quantité d'un produit reçue à une date de péremption spécifique.
- **Fournisseur**: Entité fournissant les produits à la pharmacie.
- **Utilisateur**: Personnel autorisé à manipuler les stupéfiants, identifié par un identifiant
  unique.
- **Motif**: Justification documentée pour tout mouvement de stupéfiant.

## Règles Métier Spécifiques aux Stupéfiants

Les règles suivantes s'appliquent exclusivement aux produits de catégorie stupéfiant et sont
imposées par la réglementation pharmaceutique :

- **RM-001** : Tout mouvement (entrée ou sortie) de stupéfiant doit être tracé avec l'identité
  de l'utilisateur effectuant l'opération, la date et l'heure précises, la quantité concernée,
  et le motif de l'opération. Aucune exception n'est permise.

- **RM-002** : Un mouvement de stupéfiant ne peut être effectué sans qu'un motif valide ne soit
  fourni. Le motif doit être documenté et justifiable.

- **RM-003** : L'identifiant utilisateur doit être valide (non null, non vide, longueur max 50
  caractères) pour toute opération sur stupéfiants.

- **RM-004** : Le motif d'un mouvement de stupéfiant doit être documenté (longueur max 500
  caractères) et ne peut être vide.

- **RM-005** : Un mouvement de stupéfiant ne peut concerner qu'un produit préalablement
  catégorisé comme stupéfiant dans le système.

## Exigences

### Exigence 1 : Enregistrer une Réception de Marchandises

**User Story** : En tant que gestionnaire de stock, je veux enregistrer les réceptions de
marchandises fournisseurs, afin de mettre à jour le stock et maintenir la traçabilité des
entrées.

#### Critères d'Acceptation

1. WHEN une demande de réception est reçue, THE Système SHALL vérifier que la quantité
   est strictement positive et n'excède pas 999 999 unités.

2. WHEN une demande de réception est reçue, THE Système SHALL vérifier que la date de
   péremption est au format AAAA-MM-JJ, est postérieure à la date du jour, et n'est pas null.

3. WHEN une demande de réception est reçue, THE Système SHALL vérifier que le fournisseur
   est fourni (non null, non vide) et ne dépasse pas 200 caractères.

4. WHEN tous les paramètres sont valides, THE Système SHALL créer le produit dans la table
   stock s'il n'existe pas encore, avec une quantité initiale de 0 et un seuil d'alerte
   par défaut de 10.

5. WHEN tous les paramètres sont valides, THE Système SHALL augmenter la quantité en stock
   du produit de la quantité reçue.

6. WHEN tous les paramètres sont valides, THE Système SHALL créer un enregistrement de
   mouvement avec la quantité positive, l'horodatage actuel et le fournisseur.

7. WHEN tous les paramètres sont valides, THE Système SHALL créer un enregistrement de lot
   dans la table dates_peremption avec la date de péremption et la quantité du lot.

8. WHEN tous les paramètres sont valides, THE Système SHALL valider la transaction
   (commit) si toutes les opérations réussissent, ou restaurer l'état précédent (rollback)
   en cas d'erreur.

#### Propriétés de Correction pour les Tests Property-Based

**Round-trip** : Pour tout mouvement de réception valide, l'opération d'insertion de lot
dans dates_peremption suivie d'une lecture du même lot par produit_id et date_peremption
doit retourner un enregistrement équivalent.

**Invariants** : Après une réception de quantité Q pour un produit P, le stock de P doit
avoir augmenté de Q par rapport à son niveau précédent.

**Métamorphique** : Le nombre d'enregistrements dans la table mouvements augmente de 1
après chaque réception réussie.

---

### Exigence 2 : Enregistrer une Sortie de Produits

**User Story** : En tant que pharmacien, je veux enregistrer les sorties de produits (ventes
ou usage interne), afin de maintenir un stock à jour et éviter les ruptures.

#### Critères d'Acceptation

1. WHEN une demande de sortie est reçue, THE Système SHALL vérifier que la quantité
   demandée est strictement positive et n'excède pas 999 999 unités.

2. WHEN une demande de sortie est reçue, THE Système SHALL vérifier que le produit existe
   dans la table stock.

3. WHEN le produit n'existe pas, THE Système SHALL afficher un message "Produit inexistant"
   et ne pas modifier le stock.

4. WHEN la quantité demandée excède le stock disponible, THE Système SHALL afficher
   "Stock insuffisant" avec les quantités concernée et disponible, sans modifier le stock.

5. WHEN tous les paramètres sont valides et le stock est suffisant, THE Système SHALL
   diminuer la quantité en stock du produit de la quantité sortie.

6. WHEN tous les paramètres sont valides, THE Système SHALL créer un enregistrement de
   mouvement avec la quantité négative, l'horodatage actuel et sans fournisseur.

7. WHEN le stock après sortie est inférieur au seuil d'alerte, THE Système SHALL afficher
   une alerte de stock bas incluant l'identifiant du produit, la quantité restante et
   le seuil déclenchant.

8. WHEN tous les paramètres sont valides, THE Système SHALL valider la transaction
   (commit) si toutes les opérations réussissent, ou restaurer l'état précédent (rollback)
   en cas d'erreur.

#### Propriétés de Correction pour les Tests Property-Based

**Idempotence** : L'enregistrement de deux sorties identiques pour le même produit doit
produire le même résultat final que la somme arithmétique des deux opérations.

**Invariants** : Après une sortie de quantité Q d'un produit P avec stock initial S ≥ Q,
le stock de P doit être égal à S - Q.

**Condition d'erreur** : WHEN une sortie avec une quantité supérieure au stock est tentée,
THE Système SHALL ne pas modifier le stock.

---

### Exigence 3 : Consulter le Stock d'un Produit

**User Story** : En tant que pharmacien, je veux consulter le stock courant d'un produit
et sa date de péremption la plus proche, afin de connaître la disponibilité et anticiper
les pertes.

#### Critères d'Acceptation

1. WHEN une demande de consultation de stock est reçue, THE Système SHALL vérifier que
   le produit existe dans la table stock.

2. WHEN le produit n'existe pas, THE Système SHALL afficher "Produit inexistant".

3. WHEN le produit existe, THE Système SHALL afficher l'identifiant du produit et la
   quantité en stock.

4. WHEN le stock est égal à zéro, THE Système SHALL afficher "Stock épuisé" et ne pas
   rechercher de date de péremption.

5. WHEN le stock est supérieur à zéro, THE Système SHALL rechercher la date de péremption
   la plus proche parmi les lots non expirés (date > CURDATE()).

6. WHEN une date de péremption valide existe, THE Système SHALL l'afficher au format
   JJ/MM/AAAA. WHEN aucune date de péremption n'est enregistrée, THE Système SHALL afficher
   "Aucune date de péremption enregistrée".

#### Propriétés de Correction pour les Tests Property-Based

**Invariants** : La quantité affichée doit correspondre exactement à la valeur dans la
table stock pour ce produit_id.

**Métamorphique** : La date de péremption affichée doit être supérieure ou égale à la
date actuelle.

**Round-trip** : Les données lues depuis la base de données doivent être formatées
correctement pour l'affichage sans altération des valeurs numériques.

---

### Exigence 4 : Déclencher une Alerte Quand un Seuil est Atteint

**User Story** : En tant que pharmacien, je veux être alerté automatiquement lorsque le
stock d'un produit descend sous un seuil critique, afin de réapprovisionner à temps.

#### Critères d'Acceptation

1. WHEN un管理员 définit un seuil d'alerte pour un produit, THE Système SHALL vérifier
   que le seuil est compris entre 0 et 1 000 000 inclus.

2. WHEN un seuil invalide est proposé, THE Système SHALL afficher un message d'erreur
   et ne pas modifier le seuil.

3. WHEN un管理员 définit un seuil pour un produit inexistant, THE Système SHALL afficher
   "Produit inexistant" et ne pas créer le produit.

4. WHEN un seuil valide est proposé pour un produit existant, THE Système SHALL mettre
   à jour la valeur seuil_alerte dans la table stock.

5. WHEN une sortie rend le stock inférieur au seuil, THE Système SHALL générer une alerte
   incluant le produit_id, le stock actuel et le seuil déclenchant.

6. WHEN une alerte de stock bas est générée, THE Système SHALL afficher le message au
   format "Stock bas pour le produit X : N unités restantes (seuil S)".

7. WHEN une demande de consultation des alertes est reçue, THE Système SHALL lister tous
   les produits dont le stock est inférieur à leur seuil d'alerte respectif (utilisant
   COALESCE pour gérer les valeurs null avec une valeur par défaut de 10).

8. WHEN aucun produit n'est en dessous de son seuil, THE Système SHALL afficher
   "Aucune alerte de stock bas".

#### Propriétés de Correction pour les Tests Property-Based

**Invariants** : Le seuil d'alerte d'un produit reste constant jusqu'à ce qu'il soit
explicitement modifié par un管理员.

**Idempotence** : La consultation des alertes ne modifie pas l'état du système.

**Métamorphique** : Le nombre de produits listés dans l'alerte est inférieur ou égal au
nombre total de produits dans la base.

**Condition d'erreur** : WHEN un seuil hors plage est proposé, THE Système SHALL ne pas
modifier le seuil existant.

---

### Exigence 5 : Gérer les Catégories de Produits (Dont les Stupéfiants)

**User Story** : En tant que responsable qualité, je veux gérer les catégories de produits
et la traçabilité stricte des stupéfiants, afin de respecter la réglementation en vigueur.

#### Critères d'Acceptation

1. WHEN un管理员 crée un nouveau produit, THE Système SHALL valider que la catégorie
   appartient à l'ensemble {médicament, stupéfiant, parapharmacie}.

2. WHEN une catégorie invalide est proposée, THE Système SHALL afficher un message
   d'erreur listant les valeurs autorisées.

3. WHEN un管理员 modifie la catégorie d'un produit, THE Système SHALL valider la nouvelle
   catégorie et mettre à jour la table stock.

4. WHEN une réception ou sortie de stupéfiant est demandée, THE Système SHALL vérifier
   que le produit est catégorisé comme stupéfiant. WHEN ce n'est pas le cas, THE Système
   SHALL afficher "Ce produit n'est pas de catégorie stupéfiant" et refuser l'opération.

5. WHEN une réception de stupéfiant est demandée, THE Système SHALL valider que l'utilisateur
   est fourni (non null, non vide, max 50 caractères).

6. WHEN une réception de stupéfiant est demandée, THE Système SHALL valider que le motif
   est fourni (non null, non vide, max 500 caractères).

7. WHEN tous les paramètres d'une réception de stupéfiant sont valides, THE Système SHALL
   enregistrer le mouvement dans la table tracabilite_stupefiants avec l'identifiant
   utilisateur, la date/heure, la quantité, le type "entrée" et le motif.

8. WHEN tous les paramètres d'une sortie de stupéfiant sont valides, THE Système SHALL
   effectuer les mêmes vérifications de stock qu'une sortie normale, puis enregistrer
   le mouvement dans tracabilite_stupefiants avec le type "sortie".

#### Propriétés de Correction pour les Tests Property-Based

**Round-trip** : Pour tout stupéfiant, la catégorie stockée en base doit pouvoir être
relue et correspondre exactement à la dernière valeur définie.

**Invariants** : Un produit appartient toujours à exactement une catégorie parmi les
trois valeurs autorisées.

**Idempotence** : Définir deux fois la même catégorie pour un produit produit le même
état qu'une seule définition.

**Condition d'erreur** : WHEN un管理员 tente de créer un produit avec une catégorie
invalide, THE Système SHALL ne pas créer le produit.

---

### Exigence 6 : Conserver l'Historique des Mouvements

**User Story** : En tant que pharmacien ou inspecteur, je veux consulter l'historique
complet des mouvements d'un produit, afin de retracer la traçabilité et répondre aux
contrôles.

#### Critères d'Acceptation

1. WHEN une demande d'historique est reçue pour un produit, THE Système SHALL vérifier
   que le produit existe.

2. WHEN le produit n'existe pas, THE Système SHALL afficher "Produit inexistant".

3. WHEN le produit existe, THE Système SHALL récupérer les 100 derniers mouvements
   triés par date décroissante (du plus récent au plus ancien).

4. WHEN le mouvement est une entrée (quantité positive), THE Système SHALL afficher
   le type "entrée", la quantité absolue, la date/heure et le fournisseur (ou "Non
   renseigné" si absent).

5. WHEN le mouvement est une sortie (quantité négative), THE Système SHALL afficher
   le type "sortie", la quantité absolue et la date/heure.

6. WHEN le produit est un stupéfiant, THE Système SHALL ajouter à chaque ligne
   l'identifiant utilisateur et le motif du mouvement tirés de la table
   tracabilite_stupefiants.

7. WHEN le produit est un stupéfiant et qu'un mouvement n'a pas d'enregistrement dans
   tracabilite_stupefiants, THE Système SHALL afficher les informations disponibles
   sans les champs utilisateur et motif.

8. WHEN aucun mouvement n'existe pour le produit, THE Système SHALL afficher
   "Aucun historique disponible".

#### Propriétés de Correction pour les Tests Property-Based

**Idempotence** : La consultation répétée de l'historique pour un même produit retourne
toujours le même ensemble de données (aucun effet de bord).

**Invariants** : Le nombre de mouvements retournés est inférieur ou égal à 100, et
trié par date décroissante.

**Round-trip** : Les dates affichées sont une reformate des timestamps stockés en base,
sans modification de la valeur temporelle.

**Métamorphique** : Pour tout produit, l'historique affiche un nombre de mouvements
inférieur ou égal au nombre total de mouvements en base pour ce produit.