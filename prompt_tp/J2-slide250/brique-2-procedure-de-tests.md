# Brique 2 — la skill qui génère les tests

*Voie 2. **Vous la demandez en français**, puis vous relisez ce qu'il a écrit.*

**Ce que vous fabriquez :** une **skill** — c'est-à-dire une procédure packagée, celle qu'on sort
quand la tâche l'exige — que l'outil ira chercher **tout seul**, sans que personne la nomme.

## Ce que c'est, concrètement

Un dossier et un fichier :

```
.github/skills/tests-de-classe/SKILL.md
```

> 📍 **Le projet en contient déjà un exemplaire, à lire :** `.github/skills/git-workflow/SKILL.md`.
> C'est celui qui fera votre `sauvegarde et publie mon travail` tout à l'heure. Même forme, même
> frontmatter — c'est votre modèle.

**Le champ qui décide de tout, c'est la `description`.** C'est **le seul texte que l'outil lit**
avant de choisir d'ouvrir votre procédure. Mal écrite, elle ne partira jamais toute seule — et
vous le verrez à l'étape ③, qui la déclenche sans la nommer.

---

## ① Demandez la skill

**Remplacez `<mon prénom>` par le vôtre** avant de coller.

```
Crée une skill nommée tests-de-classe, dans .github/skills/, sur le
modèle de .github/skills/git-workflow/SKILL.md.
Elle génère les tests d'une classe Java : un cas nominal, un cas limite
et un cas d'erreur par méthode publique, format préparer / agir / vérifier.
Fais-lui commencer chaque fichier produit par le marqueur CANARI-<mon prénom>.
```

> ⚠️ **Le nom `tests-de-classe` est imposé, et ce n'est pas un caprice.** Si vous aviez le profil
> testeur au cas pratique de 14h13, vous avez déjà une procédure nommée `jeu-de-tests` dans ce
> projet. Un nom distinct évite de l'écraser — **et vous saurez laquelle des deux a servi.**

**Ce que fait chaque partie :**

- **« sur le modèle de `git-workflow/SKILL.md` »** lui donne la forme réelle, prise **dans le
  projet**, au lieu de la lui faire inventer. C'est la ligne qui évite les champs plausibles qui
  n'existent pas.
- **« un cas nominal, un cas limite et un cas d'erreur »** nomme les trois. Sans le compte, il écrit
  trois chemins heureux — parce que c'est celui qui vient tout seul.
- **« préparer / agir / vérifier »** est la forme, et c'est elle qui rend deux jeux de tests
  comparables.
- **Le marqueur, et c'est votre preuve.** Le prénom le rend **individuel** : on verra tout de suite
  quel poste a réellement déclenché sa procédure.

**Relisez sa `description` avant de passer à la suite.** Si elle ne contient pas les mots que
**vous** taperiez dans deux mois sans y penser, elle ne se déclenchera pas toute seule.

---

## ② Rechargez la fenêtre

**Ne sautez pas cette étape.** Tant que la fenêtre n'a pas été rechargée, l'outil n'a pas vu la
skill que vous venez de déposer.

```
Ctrl + Maj + P   →   Developer: Reload Window
```

---

## ③ Déclenchez-la **sans la nommer**

C'est tout le test :

```
Génère les tests de cette classe.
```

**Vous ne nommez pas la skill.** Si sa `description` est bien écrite, l'outil doit aller la chercher
de lui-même — c'est ça, une couche qui survit au prompt.

> Si vous aviez le profil testeur à 14h13, **vous avez maintenant deux procédures qui savent faire
> des tests** dans ce projet. Regardez laquelle il ouvre : le prénom du canari vous le dira. C'est
> une question de `description`, pas de qualité.

---

## ④ Votre preuve — le canari, et rien d'autre

**Ouvrez le fichier de tests produit.** Pas la réponse du chat.

| Ce que vous voyez | Ce que ça veut dire |
|---|---|
| `CANARI-<votre prénom>` en tête du fichier | ✅ **La procédure a servi** |
| Des tests corrects, **sans** marqueur | ⛔ **Elle n'a jamais été ouverte** |
| « procédure appliquée » écrit dans le chat | ⛔ **Ça ne prouve rien** |

> ⚠️ **Le piège le plus dangereux du module, et il est arrivé pour de vrai :** un fichier de tests
> **correct**, sans marqueur. **Le résultat était bon quand même.** Rien dans la qualité du livrable
> ne vous alerte — c'est pour ça qu'on met un canari.

**Si le marqueur manque**, une seule reprise : **nommez la procédure explicitement**. Dans le doute,
l'agent fait le travail lui-même. Et **notez que la première fois n'a pas marché**.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ La skill déposée dans le projet : `.github/skills/tests-de-classe/SKILL.md`
- ☐ Un fichier de tests **ouvert sous vos yeux**
- ☐ **Le marqueur en tête** — ou la note « pas au premier essai »
- ☐ Trois cas par méthode publique, **dont un vrai cas d'erreur**

Puis la phrase commune : `sauvegarde et publie mon travail`

---

## Le défi bonus — *seulement si vous avez fini*

**Généré n'est pas vert.** Vous avez des tests ; personne ne les a vus passer.

```
Exécute ces tests et montre-moi la sortie complète, sans la résumer.
```

**Lisez la sortie vous-même.** S'il annonce que tout passe sans vous montrer le compte rendu
d'exécution, vous n'avez toujours rien vu passer — et **des tests qui existent ne sont pas des
tests qui passent**.
