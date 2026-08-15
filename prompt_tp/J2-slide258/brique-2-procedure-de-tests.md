# Brique 2 — la procédure qui génère les tests

*Voie 1. **Vous voyez les champs** de la procédure que vous déposez dans le projet.*

**Ce que vous fabriquez :** une procédure packagée — préparer, agir, vérifier — que l'outil ira
chercher **tout seul**, sans que personne la nomme.

---

## ① Demandez la procédure

**Remplacez `<mon prénom>` par le vôtre** avant de coller.

```
Crée-moi une procédure packagée qui génère les tests d'une classe Java :
un cas nominal, un cas limite et un cas d'erreur par méthode publique, au
format préparer / agir / vérifier. Fais-lui commencer chaque fichier produit
par le marqueur CANARI-<mon prénom>.
```

**Ce que fait chaque partie :**

- **« un cas nominal, un cas limite et un cas d'erreur »** nomme les trois. Sans le compte, il écrit
  trois chemins heureux — parce que c'est celui qui vient tout seul.
- **« préparer / agir / vérifier »** est la forme, et c'est elle qui rend deux jeux de tests
  comparables.
- **Le marqueur, et c'est votre preuve.** Le prénom le rend **individuel** : on verra tout de suite
  quel poste a réellement déclenché sa procédure.

---

## ② Rechargez la fenêtre

**Ne sautez pas cette étape.** Tant que la fenêtre n'a pas été rechargée, l'outil n'a pas vu la
procédure que vous venez de déposer.

---

## ③ Déclenchez-la **sans la nommer**

C'est tout le test :

```
Génère les tests de cette classe.
```

**Vous ne nommez pas la procédure.** Si elle est bien décrite, l'outil doit aller la chercher de
lui-même — c'est ça, une couche qui survit au prompt.

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

- ☐ La procédure déposée dans le projet
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
