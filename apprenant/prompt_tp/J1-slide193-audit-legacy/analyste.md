# Analyste — est-ce que ça couvre ce qui compte

> **MODE : AGENT** · le sélecteur, en haut du panneau Copilot

**Votre rôle dans ce cas pratique :** valider **la couverture** de l'audit. Vous cherchez **ce qui
manque**, pas ce qui est là.

---

## ⓪ Une conversation neuve

**📋 À COLLER DANS LE PANNEAU**

```
/clear
```

Sans ça, l'audit répond en se souvenant de votre question précédente, et vous ne saurez plus ce
qui vient du fichier.

---

## ① Lancer l'audit

Copiez ces **deux lignes** dans le panneau, telles quelles.

**📋 À COLLER DANS LE PANNEAU**

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

**📋 À COLLER DANS LE PANNEAU**

```
Cette fiche audite un module de gestion de stock de pharmacie, avec
de la traçabilité de produits sensibles et des dates de péremption.
Qu'est-ce qu'elle ne traite pas et que le métier exigerait ? Ne
propose pas de correction : liste seulement ce qui manque, et dis
sur quoi tu n'as pas assez d'information. Écris en langage métier,
sans terme technique.
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

## ④ Poster votre compte dans le chat

Deux nombres, une ligne :

> **combien de défauts vous avez retenus · combien d'entre eux tenaient à l'AUTRE fichier**

C'est la trace du cas pratique, et c'est elle qui sert au débrief. Le second nombre est le plus
intéressant des deux : il mesure ce qu'un audit à fichier unique ne pouvait pas voir.

Lisez ceux des autres au passage. La question qui vaut le détour est toujours la même :
**« qu'ont-ils retenu que je n'avais pas vu ? »**

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ Une fiche d'audit sous vos yeux
- ☐ **Deux annotations** : une recommandation hors de proportion, une affirmation invérifiable
- ☐ **Le livrable de votre rôle** : votre note de couverture — ce qui manque, et sur quoi
  l'information est insuffisante
- ☐ **Aucune correction lancée**

---

## Les défis bonus — *seulement si vous avez fini*

**Deux au choix.** Prenez celui qui vous tente — **le premier est le plus proche de votre métier.**

### Défi ① · croiser deux audits

Lancez le même audit sur l'autre fichier du projet :

**📋 À COLLER DANS LE PANNEAU**

```
#schema_extensions.sql
Audite ce fichier avec la même grille que le précédent. Puis
compare les deux fiches : qu'est-ce que la première voit et que la
seconde ne peut pas voir, et inversement ?
```

### Défi ② · fabriquer le déclencheur

Vous venez de taper cette demande **une fois**. De quoi auriez-vous besoin pour la relancer la
semaine prochaine sans la retaper ?

**📋 À COLLER DANS LE PANNEAU**

```
Fabrique-moi, dans ce projet, de quoi relancer cet audit sans avoir
à retaper la demande. Explique-moi ensuite comment m'en servir.
```

**Puis regardez ce qu'il a créé, et relisez-le avant d'approuver.**

⚠️ **Il peut inventer des éléments qui n'existent pas et qui ont l'air parfaitement plausibles.**
C'est le piège de la journée, retourné contre lui-même. **Donc vous le vérifiez en le lançant, pas
en le lisant.**
