# TP 1 — Auditer du code que personne ici n'a écrit

> **L'objectif et les étapes sont à l'écran.** Ce fichier ne porte que ce qui ne s'y projette
> pas : les prompts à copier, la preuve que vous avez fini, et quoi faire si ça coince.
>
> Ce cas pratique se déroule en **deux temps**, séparés par une pause. Ne prenez pas d'avance
> sur le second : le débrief du premier en fait partie.

---

# Premier temps — l'audit

## Avant de commencer, trois choses

**① Une conversation neuve.** Tapez `/clear`. Sans ça, votre audit hérite de tout ce que vous avez
demandé ce matin, et vous ne saurez plus ce qui vient du code et ce qui vient d'avant.

**② On audite, on ne fait pas réimplémenter.** Vous ne lui demandez aucune correction. Une demande
de correction, c'est un chantier — et un chantier coûte cher à tout le monde.

**③ Vous travaillez depuis votre rôle, et un seul.** Personne ne fait le travail d'un autre. *Si
vous ne vous reconnaissez dans aucun des quatre, prenez celui dont vous validez les livrables au
quotidien.*

> **Vous n'avez pas besoin de lire les sept cents lignes du fichier. L'outil les lit.** Votre
> travail commence quand la fiche arrive, et il n'est pas plus facile que celui de votre voisin
> développeur : il est différent.

## ① Lancer l'audit

Copiez ce prompt tel quel. Le `#` sert à **désigner le fichier** à l'agent : ne le retirez pas,
et ne changez pas l'orthographe du nom.

```
#GestionStock.java
Audite ce fichier et produis une fiche en français : les défauts
trouvés, leur gravité, et ce qu'il faudrait corriger en premier.
```

**Une demande, pas dix.** Vous lancez l'audit **une fois**, et ensuite vous **lisez**.

> Si vous avez fini de lancer au bout de deux minutes, c'est normal. **Le travail commence quand
> la fiche est là.**

## ② Puis la question de votre rôle — celle-là et pas une autre

Vous en posez **une seule**. Ce n'est pas la même pour tout le monde, et c'est voulu : à la mise
en commun, chacun aura vu le même code sous un angle différent.

### 🟦 Développeur

```
Dans cette fiche, classe les défauts par rapport gravité sur coût de
correction, et dis-moi lequel tu traiterais en premier sur CE projet.
Pour chaque défaut, indique ce que tu ne peux pas vérifier sans voir
le reste du code.
```

### 🟥 Testeur / QA

```
Parmi les défauts de cette fiche, lesquels sais-tu reproduire par un
cas de test, et avec quelles données d'entrée ? Pour chacun, dis ce
qui doit ÉCHOUER. Si tu ne sais pas le reproduire, dis-le au lieu
d'inventer un test.
```

### 🟨 Analyste

```
Cette fiche audite un module de gestion de stock de pharmacie, avec
de la traçabilité de produits sensibles et des dates de péremption.
Qu'est-ce qu'elle ne traite pas et que le métier exigerait ? Ne
propose pas de correction : liste seulement ce qui manque, et dis
sur quoi tu n'as pas assez d'information.
```

### 🟩 Manager

```
Reformule cette fiche d'audit en cinq lignes pour un comité qui n'est
pas technique : ce qui est risqué, ce que ça coûte de ne rien faire,
et la décision que je dois leur demander. Pas de jargon. Quand tu
n'as pas l'information dans la fiche, écris [à compléter] plutôt que
de l'estimer.
```

## La preuve attendue

Vous avez fini le premier temps quand vous pouvez dire trois choses à votre voisin :

1. **un défaut qu'il a trouvé** et que vous n'auriez pas vu seul
2. **un endroit où il dit ne pas pouvoir se prononcer** — c'est le plus intéressant, et c'est ce
   que vos quatre prompts demandent tous, chacun à sa manière
3. **un défaut qu'il a manqué**, ou une nuance qu'il a écrasée

Si vous ne pouvez pas produire le point 2, c'est que vous avez lu la fiche comme un résultat au
lieu de la lire comme une proposition. Relisez-la avec cette question : *sur quoi s'avance-t-il
sans pouvoir le vérifier ?*

## Si ça coince

| Ce que vous voyez | Ce que vous faites |
|---|---|
| **Le `#` ne propose aucun fichier** | Ouvrez `src/main/java/GestionStock.java` dans l'éditeur, puis remplacez la première ligne du prompt par : `audite le fichier de gestion de stock qui est ouvert` |
| **La fiche sort en anglais** | C'est un résultat, pas une panne. **Ne relancez pas pour la faire traduire** : ça coûte une deuxième requête et on en reparlera. |
| **L'outil ne répond pas du tout** | Levez la main. Ne relancez pas trois fois : vous videriez votre quota sans rien obtenir. |

## Défi bonus

**À ne prendre que si vous avez fini les trois points de la preuve**, et pas avant.

```
#schema_extensions.sql
Audite ce fichier avec la même grille que le précédent. Puis
compare les deux fiches : qu'est-ce que la première voit et que la
seconde ne peut pas voir, et inversement ?
```

---
---

# Second temps — les tests et le plan de reprise

> **Deux demandes, dans cet ordre. La première produit de la matière, la seconde produit une
> décision.** D'abord les tests, parce qu'on ne peut pas planifier une reprise sans savoir ce qui
> est vérifiable. Ensuite le plan, parce que c'est lui qui se remonte.
>
> **On fait produire, on ne fait pas réimplémenter :** vous ne lui demandez pas d'appliquer le plan.

## ① Les deux demandes, dans cet ordre

```
Génère des tests unitaires pour #GestionStock.java, et
explique en français ce que chaque test vérifie.
```

```
Produis un plan de reprise et de migration de ce projet :
les phases, leur ordre, et l'effort estimé pour chacune.
Quand tu n'as pas l'information dans le fichier, écris
[à compléter]. N'invente pas.
```

## ② Puis la seule question qui tranche

```
Lance les tests et montre-moi la sortie complète.
```

## La preuve attendue

**Des tests écrits ne sont pas des tests qui passent.** Vous avez fini quand vous avez vu la
sortie complète de l'exécution — pas le résumé qu'en fait l'agent, la sortie.

Et vous savez répondre à : **combien de tests ont échoué, et est-ce que c'est grave ?**

> Des tests qui échouent ne sont pas un ratage de votre part. Le code de ce projet est
> volontairement imparfait. Un test rouge sur un vrai défaut est un bon test.

Pour le plan de reprise, la preuve est ailleurs : **comptez les `[à compléter]`**. Un plan qui
n'en contient aucun sur un projet qu'il ne connaît qu'à moitié devrait vous inquiéter.

## Si ça coince

| Ce que vous voyez | Ce que vous faites |
|---|---|
| **La compilation ou l'exécution échoue** | Ne cherchez pas à réparer. Notez le message et passez à la lecture du plan : c'est là qu'est la matière du débrief. |
| **L'agent affirme que les tests passent sans les avoir lancés** | C'est la trouvaille du jour. Gardez la phrase exacte, on la lit ensemble. |
| **Il part corriger le code tout seul** | Arrêtez-le. On ne lui a pas demandé ça, et ce qu'il fait EN PLUS est justement le sujet. |

## Les deux défis bonus

Ils ne visent pas le même profil. Prenez celui qui vous parle, ou les deux.

### ① Casser le code exprès — trente secondes

C'est le geste le plus court de la journée.

> **Modifiez une ligne** de la méthode que vos tests sont censés couvrir, puis **relancez les
> tests.**

**S'ils restent au vert, vous ne testez rien.** Vert ne veut pas dire couvert.

*Ce défi n'existe que si la chaîne de construction répond chez vous. Si elle ne répond pas,
passez au second sans vous acharner.*

### ② La documentation qui ment

```
Écris la documentation de ce projet à destination d'un nouvel
arrivant : ce que fait l'application, comment elle accède aux
données, et ce qu'un développeur doit savoir avant d'y toucher.
```

**Puis vérifiez UNE SEULE affirmation dans le code.** Une seule suffit.

Une documentation générée décrit le code **tel qu'il devrait être**, pas tel qu'il est. Regardez
ce qu'elle raconte des accès aux données, et allez voir.

> Une documentation fausse est pire qu'une documentation absente : personne ne va relire le code
> pour la contredire.
