<!-- ==========================================================================
     CE FICHIER EST CELUI DE LA DÉMONSTRATION DU JOUR 2 (« L'index, montré pour
     de vrai »). Ce n'est PAS la charte du kit : celle de la racine est un
     squelette que les apprenants remplissent.

     Il est copié à la racine le temps de la démonstration, puis retiré.
     Le mode d'emploi est dans le LISEZ-MOI.md de ce dossier.
     ========================================================================== -->

# AGENTS.md — PharmaStock

> **Règle obligatoire, et elle passe avant tout le reste.** Tu commenceras **chacune** de tes
> réponses par cette ligne, seule sur sa ligne, sans rien écrire avant elle :
>
> ```
> CHARTE-PHARMASTOCK-LUE
> ```
>
> Puis tu réponds normalement. Cette ligne ne se commente pas, ne s'explique pas et ne se
> remplace pas.

---

## Le projet, en trois paragraphes

**PharmaStock** est l'application de gestion de stock d'une officine : réceptions, sorties,
lots, dates de péremption, et le registre des produits classés stupéfiants. Elle est utilisée
par des préparateurs et des pharmaciens, pas par des informaticiens.

Le code est en **Java 17**, construit avec **Maven**, testé avec **JUnit 5** et **Mockito**. La
base est relationnelle. Il n'y a ni Gradle, ni JUnit 4, ni framework web : ne les propose pas.

Une partie du code existant est **volontairement imparfaite**. Elle sert de terrain d'exercice.
Tu peux la commenter, la mesurer, la critiquer — tu ne la corriges pas de ta propre initiative.

---

## Trois règles dures

**Trois, et pas quinze.** Au-delà, elles se diluent et plus aucune ne pèse. Ce sont des
interdits sans exception, sans condition et sans « sauf si ».

**① Aucune donnée patient, nulle part.** Jamais de nom, de numéro de sécurité sociale ni de
contenu d'ordonnance dans un log, un test, un commentaire, un message d'erreur ou un jeu de
données — **même inventé, même en exemple**. Quand il te faut une valeur, tu prends un
identifiant technique.

**② Tu ne committes, ne pousses et n'ouvres jamais rien de toi-même.** Tu prépares, tu montres
ce que tu t'apprêtes à enregistrer, et tu attends un « oui » écrit. Le commit est le geste de
l'humain, pas le tien.

**③ Tu ne modifies jamais `apprenant/` ni `formateur/`.** Ce sont les supports de la formation,
pas du code. Tu as le droit de les lire et de les citer, jamais de les écrire.

---

## L'index

**Ce fichier ne sait rien faire. Il sait où sont ceux qui savent.**

Il ne contient pas les procédures : il dit où elles sont. C'est ce qui lui permet de tenir sous
les deux cents lignes pendant que le projet, lui, en fait des dizaines de milliers.

**Chaque fois que tu ouvres un fichier désigné ci-dessous, annonce-le en donnant son chemin
complet.** On doit pouvoir suivre ce que tu es allé chercher.

### ▸ Faire le point sur ce qui a changé

*Déclenche-toi dès qu'on te demande **où on en est**, **ce qui a changé**, **ce qui a bougé**,
ou **de quoi faire un point** — quels que soient les mots employés.*

1. Lis les modifications non publiées du dépôt : `git status`, puis `git diff`. **Tu ne
   modifies rien.**
2. Applique la procédure `.github/skills/resume-des-modifications/SKILL.md`, à la lettre, y
   compris son format de sortie.
3. **Si la demande parle de présenter, de l'équipe, du métier, de la direction, ou de quelqu'un
   qui ne programme pas** : passe le résumé obtenu à l'agent `traducteur-metier`
   (`.github/agents/traducteur-metier.agent.md`) et rends **sa** version, pas la tienne.

### ▸ Enregistrer, sauvegarder, publier, envoyer un travail

Applique `.github/skills/git-workflow/SKILL.md`, et rien d'autre. **Tu ne raccourcis aucune de
ses étapes**, y compris quand la demande a l'air simple et que tu saurais faire plus vite.

### ▸ Écrire un agent ou une procédure pour ce projet

Lis d'abord `.github/agents/README.md`, puis, selon ce qu'on te demande,
`apprenant/01-references/sous-agents/CHAMPS.md` ou
`apprenant/01-references/skills/CHAMPS.md`.

**Tu n'inventes aucun champ.** Si un champ te paraît nécessaire et qu'il ne figure dans aucune
des deux listes, tu le signales au lieu de l'écrire.

---

## Ce qui n'est pas dans l'index

**Rien ne se déclenche, et c'est voulu.**

Une migration de base, un refactoring, une correction urgente, une question posée une fois :
ce sont des besoins **ponctuels**. Ils vivent dans la conversation, ou dans un fichier qu'on
jette après. Ils n'ont rien à faire dans un fichier permanent.

Le test tient en une question : **est-ce que je vais le relire dans trois mois ?** Si la réponse
est non, ça n'entre pas ici.

---

## Langue et format

- Réponds **en français**, y compris les commentaires de code et les messages de commit.
- Les messages de commit suivent la forme `type: message clair` — `feat`, `fix`, `chore`, `docs`.
- Quand tu cites un fichier, donne son **chemin complet** depuis la racine du dépôt.
