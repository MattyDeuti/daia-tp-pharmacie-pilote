# Les agents du projet

Ce dossier est **volontairement vide** : c'est vous qui allez le remplir pendant le TP.

## Ce qu'on y range

Un **agent**, c'est un rôle qu'on délègue : un exécutant à qui on donne une mission, un
périmètre, et surtout **des droits**. Un fichier par agent.

## La chose à comprendre avant d'en écrire un

> **Un agent n'est capable que des droits qu'on lui donne.**

Le champ qui décide de tout, c'est celui des outils autorisés. Un agent qui n'a que le droit
de **lire** ne peut rien casser, par construction : il vous rendra un rapport, jamais une
modification. Si vous lui retirez le droit d'écrire alors que vous attendiez une modification,
il vous rendra un script au lieu d'agir, et vous chercherez longtemps pourquoi.

## Les deux façons de créer le vôtre

- **Vous connaissez la structure** : vous créez le fichier à la main.
- **Vous ne la connaissez pas** : vous la demandez, en français, à votre assistant.

Les deux mènent au même fichier. La seconde va plus vite mais ajoute un risque : le modèle
peut inventer des champs qui n'existent pas et qui ont l'air parfaitement plausibles.
**Dans les deux cas, vérifiez** : lancez l'agent et regardez ce qu'il produit réellement.

## L'adresse exacte

Un fichier par agent, **dans ce dossier**, nommé d'après l'agent :

```
.github/agents/<nom-de-votre-agent>.agent.md
```

Le nom du fichier et le champ `name` doivent dire **la même chose**. C'est la première cause
du symptôme « mon agent n'apparaît pas ».

## Les cinq champs essentiels

| Champ | À quoi il sert | Ce qui se passe si vous le ratez |
|---|---|---|
| `name` | le nom sous lequel l'agent apparaît | il n'apparaît pas, ou pas sous le nom attendu |
| `description` | **le seul texte lu avant de décider** de l'ouvrir | il existe et ne part jamais tout seul |
| `argument-hint` | ce que vous êtes censé lui passer | rien de grave, c'est une aide de saisie |
| `tools` | **la frontière dure** : ce qu'il a le droit de faire | sans droit d'écrire, il rend un script au lieu d'agir |
| `user-invocable` | à `true`, vous pouvez l'appeler par son nom | à `false`, il existe mais reste hors de la liste |

> **Ces cinq-là suffisent pour écrire votre premier agent.** Il en existe d'autres — dont `model`,
> qui impose le modèle qui l'exécute, et `agents`, qui décide qui il a le droit d'appeler.
> **La liste complète est dans `apprenant/01-references/sous-agents/CHAMPS.md`**, avec les
> squelettes et le diagnostic quand ça ne marche pas.

## Le squelette

Recopiez-le et remplacez ce qui est entre chevrons. Les trois tirets du haut et du bas font
partie du fichier : c'est eux qui délimitent la fiche d'identité.

```markdown
---
name: <nom-de-votre-agent>
description: "<ce qu'il fait, et quand s'en servir. À l'impératif, avec les mots que vous employez vraiment.>"
argument-hint: "<ce que vous lui passez, par exemple le fichier à traiter>"
tools: [read, search]
user-invocable: true
---

<Vous êtes qui, vous faites quoi, et surtout ce que vous ne faites pas.
Deux ou trois phrases suffisent.>
```

`tools: [read, search]` est un agent **en lecture seule** : il constate, il ne modifie rien.
C'est le réglage à garder tant que vous n'avez pas une raison de faire autrement.

> ⚠️ **Le symptôme sera « mon agent n'apparaît pas »**, et neuf fois sur dix ce n'est pas une
> faute de syntaxe : c'est un **champ réel mal réglé** — le nom, ou la visibilité. On ne cherche
> pas une virgule, on relit la liste ci-dessus.

## Un exemple à lire

Le dossier voisin `.github/skills/git-workflow/` contient une **skill** déjà écrite. Ce n'est
pas un agent, mais c'est le même genre d'objet : un fichier de texte, versionné dans le dépôt,
que l'assistant charge quand il en a besoin. Ouvrez-le pour voir à quoi ça ressemble.
