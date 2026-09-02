# AGENTS.md — la charte du projet

> **Ce fichier est lu automatiquement par votre assistant IA**, à chaque demande, sans que
> vous ayez à le rappeler. Il est versionné avec le code : ce que vous écrivez ici, toute
> l'équipe en hérite au prochain `git pull`.
>
> C'est le passage de « intérimaire brillant mais amnésique » à « collègue qui a lu le
> livret d'accueil ».

**Comment on remplit ce fichier pendant le TP :** chaque rôle a **sa section**, et une seule.
Vous n'écrivez jamais dans celle d'un autre. C'est ce qui permet à quatre personnes de
contribuer au même fichier sans se marcher dessus au moment de fusionner.

---

## 1. Le projet en trois lignes

*(pré-rempli, ne pas modifier)*

Application de gestion de stock pour une pharmacie. Code Java 17, base de données
relationnelle, construction avec Maven, tests avec JUnit 5 et Mockito. Le code existant est
volontairement imparfait : il sert de terrain d'exercice, on ne le corrige pas à la main.

---

## 2. Règles métier
> 📋 **Section de l'analyste.** Ce que le code doit respecter parce que **le métier l'exige**,
> pas parce que la technique le demande. Écrivez en français, sans jargon technique.
> Une règle par ligne, formulée comme une obligation ou une interdiction.

*Exemple de la forme attendue (à remplacer par les vôtres) :*

- Toute écriture concernant un produit classé stupéfiant doit être tracée : qui, quand,
  quelle quantité, et pour quelle ordonnance. Aucune écriture sans journal.

*(Vos règles ci-dessous)*

-

---

## 3. Règles de gouvernance

> 📊 **Section du manager.** Ce qu'un agent n'a **jamais** le droit de faire dans ce dépôt.
> C'est la frontière que personne ne franchit, y compris vous un vendredi soir.

*Exemple de la forme attendue (à remplacer par les vôtres) :*

- Ne crée jamais de fichier à la racine du projet, et ne restructure jamais l'arborescence
  sans me le proposer d'abord et attendre ma réponse.

*(Vos règles ci-dessous)*

-

---

## 4. Conventions techniques

> 🧑‍💻 **Section des développeurs et de la QA.** La stack, les choix imposés, ce qu'on ne
> veut pas voir proposé.

*Exemple de la forme attendue (à remplacer par les vôtres) :*

- Ce dépôt est en Java 17, Maven, JUnit 5 et Mockito. Ne propose jamais Gradle ni JUnit 4.

*(Vos règles ci-dessous)*

-

---

## 5. Langue et format

*(pré-rempli, ne pas modifier)*

- Réponds toujours en français, y compris les commentaires de code et les messages de commit.
- Ne mets jamais de donnée patient (nom, numéro de sécurité sociale, contenu d'ordonnance)
  dans un log, un test, un commentaire ou un message d'erreur, même en exemple.

---

## Comment savoir si ce fichier est vraiment lu ?

Ne le demandez pas à l'assistant : il vous répondra oui, avec une explication technique très
convaincante, et parfois inventée.

**Demandez-lui autre chose, et regardez le résultat.** Si vos règles sont respectées dans ce
qu'il produit, il les a lues. Sinon, il ne les a pas lues, quoi qu'il en dise.

*Selon l'outil, il existe aussi une preuve visible : une liste de fichiers consultés, un
bandeau, ou le respect d'une consigne-repère que vous avez glissée exprès dans le texte.*

---

## 6. Sous-agent : revue-de-code

> 📎 **But :** Décrire la règle et la procédure pour qu'un sous-agent `revue-de-code` soit
> automatiquement créé et configuré afin de réaliser une revue de code ciblée sur le
> différentiel git courant. Toutes les instructions ci-dessous sont en français.

- **Déclencheur :** la phrase exacte `Créer sous-agent revue-de-code` ou l'équivalent
  explicite donné par l'utilisateur. Le message doit préciser la portée (ex : branch, PR).
- **Emplacement du sous-agent :** `apprenant/sous-agents/revue-de-code/` (à créer par l'agent).

Procédure que le sous-agent doit exécuter (automatique, étape par étape) :

1. **Pré-vérifications** : s'assurer que `git` est disponible et que l'utilisateur a bien
  committé ou stashed ses modifications locales. Si des modifications non-committées
  existent, demander à l'utilisateur s'il souhaite `commit`, `stash` ou annuler avant
  de continuer.
2. **Synchronisation** : exécuter `git fetch --no-tags --prune` pour récupérer les refs
  distantes sans pousser de changement.
3. **Détermination de la base de comparaison** : préférer `origin/main`, sinon
  `origin/master`, sinon demander explicitement à l'utilisateur quelle branche comparer.
4. **Calcul du différentiel** : produire un diff lisible avec contexte (ex. :
  `git diff --unified=3 origin/<base>...HEAD`) et une liste de fichiers modifiés
  (`git diff --name-only origin/<base>...HEAD`).
5. **Analyse automatisée** : pour chaque fichier modifié, produire en français :
  - un résumé du changement ;
  - les risques potentiels (regressions, sécurité, performance, confidentialité) ;
  - les points d'amélioration (lisibilité, tests manquants, conventions) ;
  - une classification de la gravité : `blocker`, `major`, `minor`.
6. **Checklist de revue** : vérifier automatiquement :
  - présence/impact sur tests unitaires et d'intégration ;
  - utilisation de patterns interdits ou dangereux ;
  - paramètres de sécurité et gestion des données sensibles ;
  - conformité aux conventions du dépôt (style, noms, API publiques).
7. **Propositions concrètes** : fournir des extraits de patchs suggérés (hunks) et
  expliquer les changements proposés en français. Ne pas appliquer ces patchs sans
  confirmation explicite de l'utilisateur.
8. **Sortie et artefacts** : générer un rapport structuré en Markdown (résumé global,
  commentaires par fichier, TODOs) et, si demandé, déposer les artefacts sous
  `apprenant/sous-agents/revue-de-code/out/`.

Contraintes et interdictions :

- **Ne jamais** committer, pusher, créer ou fusionner une branche/PR sans confirmation
  explicite et distincte de l'utilisateur.
- **Ne jamais** inclure dans le rapport ou dans les commentaires des données patient
  ou sensibles ; si de telles données apparaissent dans le diff, les signaler et
  les anonymiser avant toute restitution.
- **Respecter la compétence `git-workflow`** : toute action impliquant commits/push/PR
  doit suivre la procédure décrite dans la compétence `git-workflow` et demander
  confirmation à l'utilisateur.

Format d'appel et attentes :

- **Phrase d'appel recommandée :** "Créer sous-agent revue-de-code" suivi d'une
  précision sur la base de comparaison (ex. `contre origin/main`).
- **Langue :** toutes les sorties et questions du sous-agent seront en français.
- **Validation utilisateur :** avant toute modification du dépôt, le sous-agent doit
  présenter son rapport et demander explicitement l'autorisation pour appliquer
  ou suggérer des patchs.

---
