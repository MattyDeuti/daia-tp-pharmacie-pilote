# Brique 2 — la skill qui génère les tests

> **MODE : AGENT** · le sélecteur, en haut du panneau Copilot

*Voie 2. **Vous la demandez en français**, puis vous relisez ce qu'il a écrit.*

**Ce que vous fabriquez :** une **skill** — c'est-à-dire une procédure packagée, celle qu'on sort
quand la tâche l'exige — que l'outil ira chercher **tout seul**, sans que personne la nomme.

## Ce que c'est, concrètement

Un dossier et un fichier : **`.github/skills/tests-de-classe/SKILL.md`**

> 📍 **Le projet en contient déjà un exemplaire, à lire :** `.github/skills/git-workflow/SKILL.md`.
> C'est celui qui fera votre `sauvegarde et publie mon travail` tout à l'heure. Même forme, même
> frontmatter — c'est votre modèle.
>
> *(Il y en a une seconde dans le dossier, `resume-des-modifications`. Ne la prenez pas pour
> modèle : elle appartient au formateur, et sa `description` est volontairement écrite pour ne
> PAS se déclencher toute seule.)*

**Le champ qui décide de tout, c'est la `description`.** C'est **le seul texte que l'outil lit**
avant de choisir d'ouvrir votre procédure. Mal écrite, elle ne partira jamais toute seule — et
vous le verrez à l'étape ③, qui la déclenche sans la nommer.

---

## ① Écrivez votre demande — avec vos mots

**Il n'y a pas de texte à copier ici, et c'est voulu.** Le squelette est à l'écran ; le reste,
c'est vous.

**📋 À COLLER DANS LE PANNEAU**

```
Crée une skill nommée tests-de-classe, sur le modèle de
.github/skills/git-workflow/SKILL.md.

À QUOI ELLE SERT : ......................................
QUAND ELLE DOIT ÊTRE INVOQUÉE : .........................

CE QU'ELLE DOIT PRODUIRE : pour chaque méthode publique, trois cas
de test — un nominal, un limite, un d'erreur — chacun au format
préparer / agir / vérifier.

Fais-lui commencer chaque fichier produit par la ligne exacte
CANARI-<mon prénom>.
```

**Tout est là sauf deux lignes.** Ce qui est imposé vous est donné — vous n'avez à inventer que ce
que personne ne peut écrire à votre place.

### Ce qui reste imposé, et pourquoi

**Ce que la procédure fait est à vous** — générer des tests n'est qu'une proposition, et n'importe
quelle tâche que vous répétez fait l'affaire. Ce qui suit, en revanche, ne se négocie pas.

| | |
|---|---|
| **Le nom** | `tests-de-classe` |
| **L'adresse** | `.github/skills/tests-de-classe/SKILL.md` |
| **Le modèle** | `.github/skills/git-workflow/SKILL.md`, déjà dans le projet |
| **Ce qu'elle produit** | **trois cas par méthode publique** — un nominal, un limite, un d'erreur — au format **préparer / agir / vérifier** |
| **Le marqueur** | `CANARI-<votre prénom>` en tête de chaque fichier produit |

> ⚠️ **Le nom est imposé, et ce n'est pas un caprice.** Si vous aviez le profil testeur au cas
> pratique de 14h02, vous avez déjà une procédure nommée `jeu-de-tests` dans ce projet. Un nom
> distinct évite de l'écraser — **et vous saurez laquelle des deux a servi.**

### Ce que vous écrivez vous-même, et c'est là que tout se joue

**Deux lignes. Elles deviennent la `description` de votre skill** — le seul texte que l'outil lira
avant de décider de l'ouvrir.

- **À quoi elle sert** — ce qu'elle produit, en une phrase.
- **Quand elle doit être invoquée** — **la phrase que vous taperiez dans deux mois**, sans y penser
  et sans connaître le nom du fichier.

**Mal écrites, elle ne partira jamais toute seule. Et vous le verrez à l'étape ③**, qui la déclenche
sans la nommer. C'est tout l'exercice.

### Quatre indications, avant de vous lancer

- **Dites-lui d'aller lire le modèle.** Un fichier de skill a une forme réelle, qui est **dans le
  projet**. Si vous ne l'y envoyez pas, il l'invente — et il invente des champs parfaitement
  plausibles qui n'existent pas.
- **Comptez les cas.** Si vous ne dites pas *trois*, il écrit trois chemins heureux : c'est celui
  qui vient tout seul. **Le cas limite et le cas d'erreur sont les deux qui trouvent des bugs.**
- **Imposez la forme.** *Préparer / agir / vérifier* est ce qui rend deux jeux de tests comparables,
  et lisibles par quelqu'un qui ne code pas.
- **Le marqueur est votre preuve, pas une décoration.** Le prénom le rend **individuel** : on verra
  tout de suite quel poste a réellement déclenché sa procédure.

**Relisez la `description` qu'il a écrite avant de passer à la suite.** Si elle ne contient pas les
mots que **vous** emploieriez naturellement, elle ne se déclenchera pas.

> 🆘 **Si ça ne part pas**, et seulement **après avoir réécrit votre description une fois** : la
> demande complète est **à la fin de cette fiche**. Le filet est là pour que personne ne reste
> bloqué, pas pour éviter l'essai.

---

## ② Rechargez la fenêtre

**Ne sautez pas cette étape.** Tant que la fenêtre n'a pas été rechargée, l'outil n'a pas vu la
skill que vous venez de déposer.

**`Ctrl + Maj + P`** → **`Developer: Reload Window`**

---

## ③ Déclenchez-la **sans la nommer**

C'est tout le test :

**📋 À COLLER DANS LE PANNEAU**

```
#GestionStock.java Génère les tests de la méthode enregistrerReception.
```

**Vous ne nommez pas la skill.** Si sa `description` est bien écrite, l'outil doit aller la chercher
de lui-même — c'est ça, une couche qui survit au prompt.

> **Cette demande est volontairement banale, et ça se joue à un mot près.** Elle dit **sur quoi**
> travailler — le dièse désigne le fichier, comme hier après-midi. Elle ne dit **ni combien de cas,
> ni sous quelle forme** : tout ça est dans votre skill, et c'est précisément ce qu'on vérifie.
>
> ⛔ **Ne rajoutez rien.** Si vous précisez « trois cas, format préparer / agir / vérifier »,
> l'agent a tout dans la phrase : **il fait le travail lui-même sans jamais ouvrir votre
> procédure**, et vous ne saurez plus pourquoi le marqueur manque.

> Si vous aviez le profil testeur à 14h02, **vous avez maintenant deux procédures qui savent faire
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

**📋 À COLLER DANS LE PANNEAU**

```
Exécute ces tests et montre-moi la sortie complète, sans la résumer.
```

**Lisez la sortie vous-même.** S'il annonce que tout passe sans vous montrer le compte rendu
d'exécution, vous n'avez toujours rien vu passer — et **des tests qui existent ne sont pas des
tests qui passent**.

---

## 🆘 La demande complète, si vous calez

**N'y venez pas tout de suite.** Essayez avec vos mots, ratez si besoin, réécrivez votre
description une fois : **c'est le rattrapage qui enseigne.** Le filet est là pour que personne ne
reste bloqué, pas pour éviter l'essai.

**Remplacez `<mon prénom>` par le vôtre** avant de coller.

**📋 À COLLER DANS LE PANNEAU**

```
Crée une skill nommée tests-de-classe, dans .github/skills/, sur le
modèle de .github/skills/git-workflow/SKILL.md.
Elle génère les tests d'une classe Java : un cas nominal, un cas limite
et un cas d'erreur par méthode publique, format préparer / agir / vérifier.
Fais-lui commencer chaque fichier produit par le marqueur CANARI-<mon prénom>.
```

> ⚠️ **Cette version marche, et elle vous coûte quelque chose.** Elle décrit ce que la skill
> **fait** — pas **quand l'ouvrir**. C'est justement la partie que l'outil lit pour décider, et
> celle que vous seul pouviez écrire.
>
> **Si elle ne part pas toute seule à l'étape ③, c'est normal, et c'est la leçon** : ajoutez-lui
> une phrase de votre main, celle que vous taperiez dans deux mois — puis rechargez la fenêtre et
> retentez.
