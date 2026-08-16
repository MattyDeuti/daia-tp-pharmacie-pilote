# Testeur ou QA — la procédure qui écrit trois cas par méthode

**Ce que vous fabriquez :** une procédure nommée `jeu-de-tests`, qui produit **exactement trois cas
par méthode publique** — jamais deux, jamais dix.

---

## ⓪ Une conversation neuve

```
/clear
```

---

## ① Demandez la procédure

**Remplacez `PRENOM` par votre prénom** avant de coller.

```
Crée une skill nommée jeu-de-tests dans le fichier
.github/skills/jeu-de-tests/SKILL.md, sur le modèle de
.github/skills/git-workflow/SKILL.md : même frontmatter, avec
seulement name, description, argument-hint et user-invocable.
Elle écrit pour chaque méthode publique exactement trois cas : un cas
nominal, un cas limite et un cas d'erreur, chacun au format
Étant donné / Quand / Alors, en français.
Fais-lui commencer chaque livrable par la ligne exacte CANARI-PRENOM.
```

**Ce que fait chaque partie :**

- **« exactement trois »** est votre apport de métier. Sans le compte, il écrit trois cas nominaux
  et zéro cas d'erreur — parce que le chemin heureux est celui qui vient tout seul.
- **« un cas limite et un cas d'erreur »** nomme les deux qu'on oublie. Ce sont les seuls qui
  trouvent des bugs.
- **« Étant donné / Quand / Alors, en français »** rend les cas lisibles par l'analyste et le
  manager. C'est ce qui les rend discutables en réunion.
- **Le marqueur** est votre preuve, et la seule.

---

## ② Rechargez la fenêtre

**Ne sautez pas cette étape.** Tant que la fenêtre n'a pas été rechargée, l'outil n'a pas vu la
procédure que vous venez de déposer.

---

## ③ Déclenchez-la **sans la nommer**

```
Écris les tests de la classe GestionStock.
```

**Vous ne dites pas « avec jeu-de-tests ».** Si la procédure est bien décrite, l'outil doit aller
la chercher tout seul.

---

## ④ Cherchez le marqueur

**Ouvrez le fichier produit.** Pas la réponse du chat.

| Ce que vous voyez | Ce que ça veut dire |
|---|---|
| `CANARI-<votre prénom>` en première ligne | ✅ **La procédure a servi** |
| Des tests corrects, **sans** marqueur | ⛔ **Elle n'a jamais été ouverte.** C'est le piège du module |
| « skill appliquée » dans le chat | ⛔ **Ça ne prouve rien** |

> ⚠️ **Ce cas est arrivé pour de vrai, et le résultat était bon quand même.** C'est exactement ce
> qui rend le piège dangereux : rien dans la qualité du livrable ne vous alerte.

**Si le marqueur manque**, une seule reprise autorisée :

```
Refais ces tests en utilisant la skill jeu-de-tests.
```

Et **notez que la première fois n'a pas marché**.

---

## ⑤ Comptez, avant de lever la main

| Méthode publique | 3 cas ? | Le cas d'erreur est-il un vrai cas d'erreur ? |
|---|---|---|
| | | |

**La troisième colonne est celle qui compte.** Un « cas d'erreur » qui vérifie qu'une valeur
correcte fonctionne n'est pas un cas d'erreur — et c'est fréquent.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ La procédure `jeu-de-tests` déposée dans le projet
- ☐ Un fichier de tests **ouvert sous vos yeux**
- ☐ **Le marqueur en première ligne** — ou la note « pas au premier essai »
- ☐ **Le compte** : trois cas par méthode, et pas autre chose

---

## Le défi bonus — *seulement si vous avez fini*

**Généré n'est pas vert.** Vous avez des tests ; personne ne les a vus passer.

```
Exécute ces tests et montre-moi la sortie complète, sans la résumer.
```

**Puis lisez la sortie vous-même.** S'il vous annonce que tout passe sans vous montrer le compte
rendu d'exécution, vous n'avez toujours rien vu passer — et c'est la question de la journée.
