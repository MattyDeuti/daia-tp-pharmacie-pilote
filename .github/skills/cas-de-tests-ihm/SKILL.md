---
name: cas-de-tests-ihm
description: "À utiliser dès que l'utilisateur veut générer, lister, écrire ou compléter des cas de tests pour une interface graphique, un écran, un formulaire ou une IHM. Mots qui doivent la déclencher : « cas de tests pour l'interface », « scénarios de test IHM », « teste l'écran », « génère les cas de test de l'interface graphique », « cas nominaux et cas d'erreur », « teste le formulaire ». Produit une liste de cas de tests structurée, couvrant systématiquement le fonctionnement nominal ET les cas provoquant des messages d'erreur, basée sur une lecture réelle du code de l'écran — jamais sur des suppositions. INTERDICTION : ne jamais lister un cas de test sans l'avoir rattaché à un champ, un bouton ou un message qui existe réellement dans le code de l'écran."
argument-hint: "L'écran ou le formulaire à couvrir (ex. « le formulaire d'ajout de médicament de PharmaStock »)."
user-invocable: true
---

# Skill : cas-de-tests-ihm — Cas de tests pour interface graphique (nominal + erreurs)

## Principe directeur
Tu produis une liste de cas de tests **exhaustive et structurée** pour un écran donné,
toujours selon le même gabarit. Chaque cas doit couvrir **soit** le fonctionnement normal
(cas nominal), **soit** le déclenchement volontaire d'un message d'erreur ou d'un refus de
saisie (cas d'erreur) — jamais les deux mélangés dans un même cas.

## Règles non négociables
- **Tu lis d'abord le code réel de l'écran** ([web/index.html](../../../web/index.html) pour
  l'écran PharmaStock, ou le fichier indiqué par l'utilisateur) avant d'écrire le moindre cas.
  Tu identifies les champs, leurs contraintes (`required`, `type`, valeurs par défaut), les
  boutons, et les messages (`message-ajout`, `message-recherche`, etc.) réellement présents
  dans le code.
- **Tu ne modifies jamais le code de l'écran.** Cette skill ne fait que lire et produire des
  cas de tests — elle ne corrige rien, même si elle révèle un défaut.
- **Chaque cas de test doit couvrir exactement un comportement** : soit un chemin nominal
  (saisie valide, résultat attendu positif), soit un déclencheur d'erreur (saisie invalide ou
  manquante, message d'erreur attendu). Jamais les deux dans le même cas.
- **Tu couvres systématiquement les deux catégories** pour chaque champ ou action identifiée :
  au moins un cas nominal ET au moins un cas d'erreur quand un contrôle de saisie existe. Si un
  champ n'a aucune validation dans le code (donc aucune erreur possible), tu l'indiques
  explicitement au lieu d'inventer un message qui n'existe pas.
- **Aucune donnée patient réaliste** (nom de patient, numéro de sécurité sociale, contenu
  d'ordonnance réel) dans les données d'exemple — utilise des valeurs de démonstration
  clairement fictives, cohérentes avec le jeu d'essai déjà présent dans le code de l'écran.
- **Si une rubrique du gabarit n'a rien à dire**, écris « sans objet » plutôt que de la
  remplir avec du plausible.

## Déroulé
1. **Identifier l'écran cible.** Si l'utilisateur ne précise rien, prends
   [web/index.html](../../../web/index.html) (écran PharmaStock).
2. **Inventorier les éléments interactifs réels** : pour chaque `<input>`, `<select>`,
   `<button>` ou `<form>`, note son `id`, son type, ses attributs de contrainte (`required`,
   `type=number`, valeur par défaut) et la zone de message associée (`.msg`, `role="status"`).
3. **Repérer les règles de validation dans le JavaScript** : conditions `if` qui produisent un
   message d'erreur (ex. « Nom, lot et date de péremption sont obligatoires. »), et noter le
   texte exact du message tel qu'il apparaît dans le code — ne pas le reformuler.
4. **Repérer aussi ce qui n'est PAS validé** (silence du code) : une action sans contrôle est
   un cas nominal potentiellement surprenant (ex. quantité négative acceptée sans erreur) — à
   signaler comme tel dans la colonne résultat attendu, sans le présenter comme un bug corrigé.
5. **Rédiger la liste de cas de tests** selon le format imposé ci-dessous, en alternant ou en
   regroupant clairement cas nominaux et cas d'erreur par fonctionnalité (ajout, recherche,
   retrait, etc.).
6. **Proposer, sans l'exécuter d'office**, de rejouer ces cas avec l'outil de pilotage du
   navigateur si l'utilisateur le demande — cette skill s'arrête à la production de la liste.

## Format de sortie — imposé
Pour chaque fonctionnalité de l'écran (ex. « Ajouter un médicament », « Rechercher »), produis :

1. **Fonctionnalité** — son nom, et les éléments du DOM concernés (`id` réels).
2. **Cas nominaux** — tableau : `ID cas | Données saisies | Étapes | Résultat attendu`.
3. **Cas d'erreur** — tableau : `ID cas | Données saisies | Étapes | Message d'erreur attendu`
   (le texte exact trouvé dans le code, entre guillemets).
4. **Comportements non validés par le code** — ce que le code accepte sans contrôle, présenté
   comme un cas nominal « limite » et non comme un bug à corriger. Si tout est validé, écris
   « sans objet ».

Termine par un **récapitulatif** : nombre total de cas nominaux, nombre total de cas d'erreur.

## Ce que tu ne fais jamais
- Inventer un message d'erreur qui n'existe pas dans le code de l'écran.
- Mélanger un cas nominal et un cas d'erreur dans la même ligne de tableau.
- Modifier le code de l'écran pour ajouter une validation manquante — tu listes le comportement
  observé, tu ne le corriges pas.
- Utiliser une donnée patient réaliste, même en exemple.
