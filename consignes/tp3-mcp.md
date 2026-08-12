# TP 3 — Brancher un accès, et prouver qu'il sert

> **L'objectif et les étapes sont à l'écran.** Ce fichier ne porte que ce qui ne s'y projette
> pas : les prompts à copier, les gestes exacts, la preuve attendue, et quoi faire si ça coince.
>
> Ce cas pratique se déroule en **deux temps**. Le premier est individuel, le second se fait en
> trois groupes.

---

# Premier temps — lui faire regarder l'écran

## ① Vérifier que la prise est branchée

Ouvrez `.vscode/mcp.json`. Au-dessus de chaque nom de serveur, l'éditeur affiche un petit
`Start` en gris. Celui qui vous intéresse est **`playwright`** : c'est lui qui donne un
navigateur à l'agent. Cliquez, et attendez que l'indicateur passe à `Running`.

```
Repli si l'indicateur n'apparaît pas :  Ctrl + Shift + P  →  « MCP »
```

## ② La demande

```
Ouvre web/index.html, prends-en une capture, et dis-moi ce qui
ne va pas sur cet écran.
```

Puis, une fois qu'il a répondu :

```
Maintenant écris-moi les tests qui vérifient ce que tu viens
de voir.
```

## La preuve attendue

**Regardez ce qu'il a réellement fait, pas ce qu'il raconte.** Dans le fil de la conversation,
les outils qu'il appelle sont affichés.

Vous avez fini quand vous savez répondre à ces deux questions :

1. **A-t-il ouvert la page, ou a-t-il lu le code ?** Les deux lui sont possibles. Ce n'est pas la
   même chose, et sa réponse n'a pas la même valeur selon le cas.
2. **Parmi les problèmes qu'il annonce, y en a-t-il un que vous ne retrouvez pas à l'écran ?**
   Ouvrez la page vous-même et vérifiez, ligne par ligne. C'est l'exercice, pas un supplément.

> Et la question de toujours, pour les tests qu'il vient d'écrire : **vous les avez vus passer ?**

## Si ça coince

| Ce que vous voyez | Ce que vous faites |
|---|---|
| **Il répond sans jamais ouvrir la page** | Relancez avec cette formulation : `En utilisant la prise, ouvre le fichier web/index.html du projet et dis-moi ce qui ne va pas dans cet écran de gestion de stock, du point de vue d'un utilisateur.` |
| **L'indicateur reste éteint** | `Ctrl + Shift + P` → `Developer: Reload Window`, puis reprenez au geste ①. |
| **Il dit qu'il n'a pas accès au navigateur** | Vérifiez que vous avez cliqué « Start » sur le bloc **playwright**, et pas seulement sur **filesystem**. |

---
---

# Second temps — lui faire écrire une procédure, et prouver qu'elle a servi

> **Vous avez deux choses, et elles ne se mélangent pas.**
> **Votre rôle** décide *quelle* procédure vous fabriquez. **Votre groupe** — A, B ou C — décide
> *comment* vous l'invoquez ensuite. On vous donnera les deux.

**Deux règles communes, avant tout :**

1. **Personne ne tape le fichier.** On le **demande**, en français. Celui qui ouvre un éditeur de
   texte fait un autre exercice.
2. **Le nom de la procédure est donné, pas inventé.** Il est dans votre prompt.

## ① Demander la procédure de votre rôle, en français, avec son marqueur

Remplacez `<ton prénom>` par votre prénom. C'est ce qui rendra votre preuve reconnaissable
entre toutes.

### 🟦 Développeur

```
Crée-moi une skill nommée audit-legacy, qui produit l'audit d'un
fichier de code ancien : six rubriques imposées et toujours dans
le même ordre (sécurité, robustesse, lisibilité, tests, dette,
priorités), en français, dix lignes par rubrique au maximum.
Fais-lui commencer chaque livrable par le marqueur CANARI-<ton prénom>.
```

### 🟥 Testeur / QA

```
Crée-moi une skill nommée jeu-de-tests, qui écrit pour chaque
méthode publique exactement trois cas : un cas nominal, un cas
limite et un cas d'erreur, chacun au format Étant donné / Quand /
Alors, en français.
Fais-lui commencer chaque livrable par le marqueur CANARI-<ton prénom>.
```

### 🟨 Analyste

```
Crée-moi une skill nommée demande-utilisateur, qui rédige une
demande au format « en tant que, je veux, afin de », suivie de
ses critères d'acceptation, en français et sans aucun terme
technique.
Fais-lui commencer chaque livrable par le marqueur CANARI-<ton prénom>.
```

### 🟩 Manager

```
Crée-moi une skill nommée synthese-comite, qui rédige une synthèse
de quinze lignes maximum pour un comité de pilotage : la dette
constatée, l'effort estimé, et la décision demandée au comité.
Pas de jargon technique, pas d'introduction, pas de conclusion.
Fais-lui commencer chaque livrable par le marqueur CANARI-<ton prénom>.
```

## ② Puis la consigne de votre groupe — et elle n'est pas la même pour tous

**Appliquez la vôtre à la lettre, et seulement la vôtre.** Ne faites pas ce que fait votre voisin
parce que ça vous semble plus logique : les trois consignes existent exprès, et le tableau qu'on
remplira à la fin n'a de sens que si chacun a tenu la sienne.

- **Groupe A** — rechargez la fenêtre, puis appelez votre procédure **par son nom**
- **Groupe B** — **ne rechargez pas**, et demandez une **tâche banale**, sans nommer la procédure
- **Groupe C** — comme A, mais **sur un autre modèle**

Les gestes, pour référence — vous n'utilisez que ceux que votre groupe demande :

```
① Recharger la fenêtre   Ctrl + Shift + P → Developer: Reload Window
                         « déposer une procédure ne suffit pas. L'index ne
                         se met pas à jour tout seul. »
② Invoquer par son nom   /<nom-de-la-procedure>
③ Chercher le marqueur   Ouvrir le livrable, regarder la PREMIÈRE LIGNE.
                         Le marqueur y est, ou il n'y est pas.
```

## La preuve attendue

**Le marqueur est en tête du fichier produit, ou il n'y est pas.** Il n'y a pas d'entre-deux, et
c'est tout l'intérêt.

⛔ **Ce qui ne vaut pas preuve :** que l'agent écrive « procédure appliquée » dans la conversation.
On ne lui demande pas son avis sur son propre travail.

> **Attention au piège, il est le cœur du module :** un livrable **correct**, mais **sans le
> marqueur**, signifie que votre procédure **n'a jamais été ouverte**. L'agent a fait le travail
> lui-même, et bien. C'est la fausse impression la plus dangereuse des deux jours — et c'est
> exactement ce qui s'est produit au premier essai quand cette séquence a été mise au point.

Levez la main : **ça a marché, ou pas.** On compte, et on regarde ensemble ce que le compte dit.

## Si ça coince

| Ce que vous voyez | Ce que vous faites |
|---|---|
| **Le fichier sort correct, sans marqueur** | Ce n'est **pas** un échec, et surtout ne recommencez pas : **c'est un résultat, et il compte.** Levez la main en le disant tel quel. |
| **La procédure n'apparaît pas quand vous tapez `/`** — *groupes A et C uniquement* | Vous avez sauté le rechargement. Refaites le geste ①, puis réessayez. |
| **Vous ne savez plus quelle est votre consigne** | Demandez-la, ne devinez pas. Appliquer celle du voisin fausse le comptage de toute la salle. |
| **L'agent pose des questions au lieu de créer la procédure** | Répondez-lui brièvement et laissez-le finir. Le fichier compte, pas le chemin pour y arriver. |
