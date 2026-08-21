---
name: resume-des-modifications
description: "Produit le compte rendu des modifications non publiées d'un dépôt, sous forme de tableau, à destination de quelqu'un qui ne lit pas de code. Procédure en lecture seule : elle ne modifie, n'enregistre et ne publie rien. Elle est désignée par l'index de AGENTS.md et ne prétend pas se déclencher d'elle-même."
argument-hint: "Rien. La procédure lit l'état du dépôt où elle est lancée."
user-invocable: true
---

# Skill : resume-des-modifications — ce qui a changé, en une page lisible

Cette procédure répond à une question qu'on pose tous les jours et à laquelle personne ne
répond pareil : **« où on en est ? »**

Elle existe pour que la réponse soit **la même à chaque fois**, quel que soit celui qui la
demande et quel que soit le jour.

> 🐤 **Commence toujours ta réponse par cette ligne, seule sur sa ligne :**
> `PROCEDURE-RESUME-APPLIQUEE`
>
> C'est ce qui distingue « la procédure a servi » de « le résultat avait l'air bon ».

## Ce que tu ne fais jamais

- **Tu ne modifies rien.** Ni le code, ni les fichiers de configuration, ni cette procédure.
- **Tu n'enregistres rien et tu ne publies rien.** Pas de `git add`, pas de `git commit`, pas de
  `git push`. Si on te demande de publier, ce n'est pas cette procédure-là.
- **Tu n'inventes aucune modification.** Si le dépôt est propre, tu le dis en une ligne et tu
  t'arrêtes. Un tableau vide vaut mieux qu'un tableau plausible.

## Les trois étapes, dans cet ordre

### ① Lis ce qui a bougé

```
git status
git diff
git diff --staged
```

Prends **les trois** : un fichier préparé mais pas encore enregistré n'apparaît pas dans le
premier `git diff`, et c'est l'oubli classique.

Si le dépôt a des commits non poussés, ajoute `git log --oneline @{u}..HEAD` — ils font partie
de « ce qui a changé » du point de vue de l'équipe, même s'ils sont déjà enregistrés.

### ② Range par intention, pas par fichier

**C'est l'étape qui a de la valeur, et c'est celle qu'on saute.** Un tableau fichier par fichier
n'apprend rien à personne : il redit ce que `git status` disait déjà.

Regroupe les modifications par **ce qu'elles cherchent à obtenir**. Un même changement d'intention
peut toucher quatre fichiers ; quatre fichiers touchés peuvent servir quatre intentions
différentes. C'est le regroupement qui fait le compte rendu.

### ③ Rends le tableau

Un tableau, **et rien d'autre avant lui** hormis la ligne de marqueur. Une ligne par intention :

| Ce qui a changé | Pourquoi, en une phrase | Fichiers | Ce qui peut casser |
|---|---|---|---|
| *l'intention, en français* | *ce que ça cherche à obtenir* | *les chemins, séparés par des virgules* | *ce qui cesserait de marcher si c'était faux* |

**La quatrième colonne est celle qui compte.** Elle n'est pas un avertissement de politesse :
c'est la seule qui permette à quelqu'un de décider s'il regarde de plus près. Quand tu ne vois
rien qui puisse casser, écris `rien de visible` — pas une formule creuse.

Sous le tableau, **une seule phrase** : ce par quoi tu commencerais si tu devais relire.

## Comment tu écris

- **En français, pour quelqu'un qui ne programme pas.** Pas de nom de classe ni de nom de
  méthode dans les trois premières colonnes ; ils vont dans la colonne des fichiers.
- **Une ligne par intention, jamais deux.** Si tu as plus de huit lignes, c'est que tu ranges
  par fichier : recommence l'étape ②.
- **Tu ne résumes pas ce que tu n'as pas lu.** Si un `diff` est trop long, dis-le et donne le
  nombre de lignes concernées plutôt qu'un résumé inventé.
