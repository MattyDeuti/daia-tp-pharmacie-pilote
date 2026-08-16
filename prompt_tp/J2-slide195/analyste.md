# Analyste — la procédure qui rédige une demande utilisateur

**Ce que vous fabriquez :** une procédure nommée `demande-utilisateur`, qui rédige **toujours au
même format** — « en tant que, je veux, afin de », suivi des critères d'acceptation.

> 🟢 **Zéro ligne de code, du début à la fin.** Votre procédure est aussi structurante que celle du
> développeur d'à côté, et elle sera relue par l'outil exactement de la même façon.

---

## ⓪ Une conversation neuve

```
/clear
```

---

## ① Demandez la procédure

**Remplacez `PRENOM` par votre prénom** avant de coller.

```
Crée une skill nommée demande-utilisateur dans le fichier
.github/skills/demande-utilisateur/SKILL.md, sur le modèle de
.github/skills/git-workflow/SKILL.md : même frontmatter, avec
seulement name, description, argument-hint et user-invocable.
Elle rédige une demande au format « en tant que, je veux, afin de »,
suivie de ses critères d'acceptation, en français et sans aucun
terme technique.
Fais-lui commencer chaque livrable par la ligne exacte CANARI-PRENOM.
```

**Ce que fait chaque partie :**

- **Le format imposé** est ce qui rend deux demandes comparables, écrites à deux mois d'écart par
  deux personnes différentes. C'est exactement ce qu'une procédure sert à figer.
- **« suivie de ses critères d'acceptation »** est la moitié qu'on oublie. Une demande sans
  critères ne se recette pas.
- **« sans aucun terme technique »** est votre garde-fou : la demande doit pouvoir être validée par
  la pharmacienne, pas par le développeur.
- **Le marqueur** est votre preuve, et la seule.

---

## ② Rechargez la fenêtre

**Ne sautez pas cette étape.** Tant que la fenêtre n'a pas été rechargée, l'outil n'a pas vu la
procédure que vous venez de déposer.

---

## ③ Déclenchez-la **sans la nommer**

```
Rédige la demande pour une alerte quand un lot approche de sa date
de péremption.
```

**Vous ne dites pas « avec demande-utilisateur ».** Si la procédure est bien décrite, l'outil doit
aller la chercher tout seul.

---

## ④ Cherchez le marqueur

**Ouvrez le livrable produit.** Pas la réponse du chat.

| Ce que vous voyez | Ce que ça veut dire |
|---|---|
| `CANARI-<votre prénom>` en première ligne | ✅ **La procédure a servi** |
| Une demande bien écrite, **sans** marqueur | ⛔ **Elle n'a jamais été ouverte** |
| « skill appliquée » dans le chat | ⛔ **Ça ne prouve rien** |

**Si le marqueur manque**, une seule reprise autorisée :

```
Refais cette demande en utilisant la skill demande-utilisateur.
```

Et **notez que la première fois n'a pas marché**.

---

## ⑤ Relisez les critères d'acceptation

C'est là que se joue votre métier, pas dans le format.

| Le critère | Deux personnes en feraient-elles la même chose ? | D'où vient-il ? |
|---|---|---|
| | | |

**« Approche de sa date de péremption » ne veut rien dire tant qu'on n'a pas dit combien de
jours.** Regardez s'il a choisi un nombre tout seul — et lequel. Personne ne le lui a donné.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ La procédure `demande-utilisateur` déposée dans le projet
- ☐ Une demande **ouverte sous vos yeux**, au format imposé
- ☐ **Le marqueur en première ligne** — ou la note « pas au premier essai »
- ☐ **Au moins un critère dont vous avez repéré qu'il a été inventé**

---

## Le défi bonus — *seulement si vous avez fini*

Ajoutez la parade d'hier **dans la procédure elle-même**, et pas dans la demande :

```
Modifie la skill demande-utilisateur pour qu'elle écrive [à compléter]
partout où une valeur chiffrée serait nécessaire mais n'a pas été
fournie, au lieu de la choisir.
```

**Ce que ça apprend, et c'est le sommet du module :** une parade écrite dans une procédure
s'applique **à toutes les demandes suivantes**, sans que personne ait à y penser. C'est la
différence entre une bonne pratique et un dispositif.
