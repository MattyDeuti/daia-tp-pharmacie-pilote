# Analyste — est-ce que ça couvre ce qui compte

**Votre rôle dans ce cas pratique :** valider **la couverture** de l'audit. Vous cherchez **ce qui
manque**, pas ce qui est là.

---

## ⓪ Une conversation neuve

```
/clear
```

Sans ça, l'audit répond en se souvenant de votre question précédente, et vous ne saurez plus ce
qui vient du fichier.

---

## ① Lancer l'audit

Copiez ces **deux lignes** dans le panneau, telles quelles.

```
#GestionStock.java
Audite ce fichier et produis une fiche en français : les défauts
trouvés, leur gravité, et ce qu'il faudrait corriger en premier.
Écris pour quelqu'un qui ne programme pas : pour chaque défaut, dis
d'abord ce qui peut arriver concrètement, en une phrase, avant tout
terme technique. Ne corrige rien, et ne propose pas de le faire.
```

**Ce que fait chaque partie :**

- **La première ligne désigne le fichier.** Le dièse suivi d'un nom de fichier le met sous les yeux
  de l'agent. **Sans elle, il vous répond quand même** — mais il répond dans le vide.
- **Les deux suivantes fixent la langue et la forme du livrable.** Sans elles, vous recevrez ce
  qu'il a l'habitude de produire.
- **Les trois dernières fixent le lecteur, et ce sont les vôtres.** Sans elles, la fiche est écrite
  pour un développeur — noms de bibliothèques, termes anglais — et vous ne pourriez pas en valider
  la couverture.

**Vous ne lancez qu'une fois.** Le travail commence quand la fiche arrive.

**Vous n'avez pas besoin de lire une ligne de code** pour faire votre part. La fiche est en
français, et c'est elle que vous auditez.

---

## ② Lire la fiche depuis votre rôle

```
Cette fiche audite un module de gestion de stock de pharmacie, avec
de la traçabilité de produits sensibles et des dates de péremption.
Qu'est-ce qu'elle ne traite pas et que le métier exigerait ? Ne
propose pas de correction : liste seulement ce qui manque, et dis
sur quoi tu n'as pas assez d'information.
```

⛔ **On audite, on ne fait pas réimplémenter.** Vous ne lui demandez pas de corriger le code.

---

## ③ Annoter la fiche — quatre colonnes

| Ce qu'il a trouvé | Ce qui manque | Ce qui est hors de proportion | Ce qui est faux |
|---|---|---|---|
| | | | |

**Les deux dernières colonnes sont celles qui comptent, et c'est votre objectif : en trouver au
moins une de chaque.**

Une fiche d'audit produite par une IA contient presque toujours **des recommandations dimensionnées
pour une grande entreprise** — pour une pharmacie, ce n'est pas la même chose — et **au moins une
affirmation que vous ne pouvez pas vérifier**.

---

## ④ Confronter avec votre voisin

Une seule question :

> **« Qu'a-t-il trouvé que vous n'aviez pas vu ? »**

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ Une fiche d'audit sous vos yeux
- ☐ **Deux annotations** : une recommandation hors de proportion, une affirmation invérifiable
- ☐ **Le livrable de votre rôle** : votre note de couverture — ce qui manque, et sur quoi
  l'information est insuffisante
- ☐ **Aucune correction lancée**

---

## Le défi bonus — *seulement si vous avez fini*

**Croiser deux audits.** Lancez le même audit sur l'autre fichier :

```
#schema_extensions.sql
Audite ce fichier avec la même grille que le précédent. Puis
compare les deux fiches : qu'est-ce que la première voit et que la
seconde ne peut pas voir, et inversement ?
```
