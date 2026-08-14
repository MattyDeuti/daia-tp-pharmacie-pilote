# Développeur — par quoi on commencerait

**Votre rôle dans ce cas pratique :** décider **par quoi on commencerait** sur ce projet-là.

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
```

**Ce que fait chaque ligne :**

- **La première désigne le fichier.** Le dièse suivi d'un nom de fichier le met sous les yeux de
  l'agent. **Sans elle, il vous répond quand même** — mais il répond dans le vide.
- **La seconde fixe la langue et la forme.** Sans elle, vous recevrez ce qu'il a l'habitude de
  produire.

**Vous ne lancez qu'une fois.** Le travail commence quand la fiche arrive.

---

## ② Lire la fiche depuis votre rôle

```
Dans cette fiche, classe les défauts par rapport gravité sur coût de
correction, et dis-moi lequel tu traiterais en premier sur CE projet.
Pour chaque défaut, indique ce que tu ne peux pas vérifier sans voir
le reste du code.
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
- ☐ **Le livrable de votre rôle** : votre ordre de traitement, et ce qui reste invérifiable
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
