# Les skills — une procédure qui survit à la conversation

> **Vérifié le 19/08/2026** contre la documentation officielle VS Code, et contre un fichier qui
> tourne réellement dans ce projet (`.github/skills/git-workflow/SKILL.md`).
> **Ces formats bougent** — `CHAMPS.md` dit comment recontrôler.

| Fichier | Quand l'ouvrir |
|---|---|
| **`CHAMPS.md`** | vous écrivez le haut du fichier et vous cherchez un champ |
| **`MODELE.md`** | vous voulez un squelette à copier |
| **`PIEGES.md`** | vous l'avez écrite et **elle ne part pas** |

---

## La définition, en une phrase

> **Un prompt meurt quand vous fermez la fenêtre. Une skill est relue par l'outil la prochaine
> fois, sans que personne la nomme.**

C'est toute la différence, et c'est aussi tout l'intérêt : ce que vous écrivez une fois, vous et
l'équipe le récupérez à chaque `git pull`.

---

## Le fait qui décide de tout

Une skill n'est **pas** chargée en permanence. L'outil ne voit d'elle, au départ, qu'**une seule
chose** : son champ `description`.

```
      Vous tapez une demande
                |
                v
   L'outil lit UNIQUEMENT les `description`
   de toutes les skills disponibles
                |
        +-------+-------+
        |               |
   ça correspond ?   ça ne correspond pas ?
        |               |
        v               v
   il ouvre le      elle ne s'ouvre JAMAIS,
   fichier entier   et vous ne le saurez pas
```

**Conséquence, et c'est le cœur du sujet :** une skill au contenu excellent avec une `description`
médiocre est une skill qui n'existe pas. Vous aurez un résultat correct — produit par l'agent
lui-même, sans jamais l'ouvrir — et vous croirez qu'elle a servi.

C'est pourquoi tous les cas pratiques passent par un **canari** : une ligne-repère que seule la
skill peut produire. Sans lui, aucune preuve.

---

## Skill ou sous-agent ? Le critère

Les deux sont des fichiers de texte versionnés que l'outil charge à la demande. La différence est
ailleurs :

| | **Skill** | **Sous-agent** |
|---|---|---|
| C'est quoi | une **procédure** — une manière de faire | un **exécutant** — un rôle avec un périmètre |
| Qui l'exécute | l'agent en cours, dans **votre** conversation | un agent séparé, dans **son propre** contexte |
| Ce que vous réglez | ce qu'il **doit produire**, et comment | ce qu'il a le **droit** de faire |
| Vous voyez le travail | oui, il se déroule sous vos yeux | non, vous recevez le résultat |
| Le vrai levier | la `description` (le déclenchement) | le champ des **droits**, et le **modèle** |

**En pratique :**

- « Je veux que mes audits aient toujours les six mêmes rubriques » -> **skill**
- « Je veux un relecteur qui ne puisse pas modifier mon code » -> **sous-agent**
- « Je veux les deux » -> un sous-agent **qui applique** une skill. C'est courant, et c'est propre.

> ⚠️ **Le prix caché du sous-agent :** il travaille dans un contexte séparé. Il ne sait pas ce qui
> s'est dit dans votre conversation, et vous ne voyez pas comment il a raisonné. Lancez-en
> plusieurs en parallèle et ils peuvent produire des résultats **incohérents entre eux**, chacun
> ayant décidé dans son coin. Une skill n'a pas ce problème : elle s'exécute dans votre contexte.

---

## L'adresse, et elle ne se devine pas

```
.github/skills/<nom-de-votre-skill>/SKILL.md
```

Trois pièges d'adresse, dans l'ordre de fréquence :

1. **Un dossier par skill.** Le fichier s'appelle toujours `SKILL.md`, en majuscules. Ce n'est pas
   `audit-legacy.md` posé en vrac : c'est `audit-legacy/SKILL.md`.
2. **Le nom du dossier et le champ `name` doivent dire la même chose.**
3. **Après création, rechargez la fenêtre.** Tant que ce n'est pas fait, l'outil ne l'a pas vue.
   `Ctrl + Maj + P` -> `Developer: Reload Window`.

---

## Ce qui compte comme preuve, et ce qui n'en est pas une

| | |
|---|---|
| Le **canari** apparaît dans le livrable | ✅ la skill a été ouverte |
| Le livrable est bon, **sans** canari | ⛔ elle n'a jamais été ouverte — l'agent a fait le travail seul |
| L'agent écrit « skill appliquée » dans le chat | ⛔ ne prouve **rien** |
| Vous lui demandez « tu as bien utilisé ma skill ? » et il dit oui | ⛔ ne prouve **rien** |

**Ce n'est pas la qualité du résultat qui prouve qu'une procédure a servi.**
