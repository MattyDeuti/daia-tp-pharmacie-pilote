# Testeur ou QA — ce qui serait testable

**Votre rôle dans ce cas pratique :** déterminer **ce qui serait testable** dans ce que l'audit a
trouvé, et comment.

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
- **Les trois dernières fixent le lecteur, et c'est ce qui rend la fiche exploitable par tout le
  monde.** Sans elles, elle est écrite pour un développeur — noms de bibliothèques, termes anglais
  — et elle se termine par une proposition de tout corriger à votre place.

**Vous ne lancez qu'une fois.** Le travail commence quand la fiche arrive.

---

## ② Lire la fiche depuis votre rôle

```
Parmi les défauts de cette fiche, lesquels sais-tu reproduire par un
cas de test, et avec quelles données d'entrée ? Pour chacun, dis ce
qui doit ÉCHOUER. Si tu ne sais pas le reproduire, dis-le au lieu
d'inventer un test. Décris les cas en français, n'écris aucun code.
```

⛔ **On audite, on ne fait pas réimplémenter.** Vous ne lui demandez pas de corriger le code, et
vous ne lui faites pas écrire les tests ici — c'est la phase d'après.

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
- ☐ **Le livrable de votre rôle** : la liste de ce qui est reproductible, et ce qui doit échouer
- ☐ **Aucune correction lancée**

---

## Les défis bonus — *seulement si vous avez fini*

**Deux au choix.** Prenez celui qui vous tente.

### Défi ① · croiser deux audits

Lancez le même audit sur l'autre fichier du projet :

```
#schema_extensions.sql
Audite ce fichier avec la même grille que le précédent. Puis
compare les deux fiches : qu'est-ce que la première voit et que la
seconde ne peut pas voir, et inversement ?
```

### Défi ② · fabriquer le déclencheur

Vous venez de taper cette demande **une fois**. De quoi auriez-vous besoin pour la relancer la
semaine prochaine sans la retaper ?

```
Fabrique-moi, dans ce projet, de quoi relancer cet audit sans avoir
à retaper la demande. Explique-moi ensuite comment m'en servir.
```

**Puis regardez ce qu'il a créé, et relisez-le avant d'approuver.**

⚠️ **Il peut inventer des éléments qui n'existent pas et qui ont l'air parfaitement plausibles.**
C'est le piège de la journée, retourné contre lui-même. **Donc vous le vérifiez en le lançant, pas
en le lisant** — c'est votre réflexe de métier.
