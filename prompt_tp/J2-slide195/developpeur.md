# Développeur — la procédure d'audit d'un fichier ancien

**Ce que vous fabriquez :** une procédure nommée `audit-legacy`, qui rend **toujours le même
rapport, dans le même ordre**, sur n'importe quel fichier ancien.

---

## ⓪ Une conversation neuve

```
/clear
```

---

## ① Demandez la procédure

**Remplacez `PRENOM` par votre prénom** avant de coller.

```
Crée une skill nommée audit-legacy dans le fichier
.github/skills/audit-legacy/SKILL.md, sur le modèle de
.github/skills/git-workflow/SKILL.md : même frontmatter, avec
seulement name, description, argument-hint et user-invocable.
Elle produit l'audit d'un fichier de code ancien : six rubriques
imposées et toujours dans le même ordre (sécurité, robustesse,
lisibilité, tests, dette, priorités), en français, dix lignes par
rubrique au maximum.
Fais-lui commencer chaque livrable par la ligne exacte CANARI-PRENOM.
```

**Ce que fait chaque partie :**

- **« six rubriques imposées et toujours dans le même ordre »** est ce qui transforme un prompt en
  procédure. Deux audits produits à deux semaines d'écart deviennent **comparables**.
- **« dix lignes par rubrique au maximum »** est le plafond. Sans lui, la rubrique « dette » mange
  tout le rapport.
- **« en français »** parce que le rapport sera lu par des gens qui ne codent pas.
- **Le marqueur** est votre preuve, et la seule.

---

## ② Rechargez la fenêtre

**Ne sautez pas cette étape.** Tant que la fenêtre n'a pas été rechargée, l'outil n'a pas vu la
procédure que vous venez de déposer.

---

## ③ Déclenchez-la **sans la nommer**

C'est le test, et c'est là que ça se joue :

```
Audite le fichier GestionStock.java.
```

**Vous ne dites pas « avec audit-legacy ».** Si la procédure existe et qu'elle est bien décrite,
l'outil doit aller la chercher tout seul.

---

## ④ Cherchez le marqueur

**Ouvrez le livrable produit.** Pas la réponse du chat — le fichier.

| Ce que vous voyez | Ce que ça veut dire |
|---|---|
| `CANARI-<votre prénom>` en première ligne | ✅ **La procédure a servi.** C'est la preuve |
| Un audit correct, **sans** marqueur | ⛔ **Elle n'a jamais été ouverte.** Il a fait le travail lui-même |
| « skill appliquée » écrit dans le chat | ⛔ **Ça ne prouve rien.** Une IA qui dit avoir lu n'a rien prouvé |

**Si le marqueur manque**, une seule reprise autorisée : nommez la procédure explicitement.

```
Refais cet audit en utilisant la skill audit-legacy.
```

Et **notez que la première fois n'a pas marché** — c'est ça qu'on va compter.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ La procédure `audit-legacy` déposée dans le projet
- ☐ Un livrable d'audit **ouvert sous vos yeux**
- ☐ **Le marqueur en première ligne** — ou la note « pas au premier essai »
- ☐ Les six rubriques présentes, **dans l'ordre demandé**

---

## Le défi bonus — *seulement si vous avez fini*

**Relancez la même procédure sur l'autre fichier du projet :**

```
Audite le fichier db/schema_extensions.sql.
```

**Ce que ça montre :** les six rubriques sortent quand même, y compris celles qui n'ont rien à dire
sur ce fichier-là. **Une forme imposée se remplit toujours** — c'est le piège d'hier, et votre
propre procédure vient de le reproduire. Regardez ce qu'elle a écrit sous « tests ».
