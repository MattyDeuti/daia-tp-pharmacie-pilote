# La même demande, deux modes, et ce que chacun coûte

*Jour 1, avant la pause déjeuner. **20 minutes. Chacun sur son poste.***

Un fichier par profil. **Ouvrez celui de votre rôle, et un seul.**

| Fichier | Pour qui | Le cas part de… |
|---|---|---|
| `developpeur.md` | Développeur | un fichier qui existe déjà |
| `testeur-qa.md` | Testeur ou QA | un fichier qui existe déjà |
| `analyste.md` | Analyste | rien du tout |
| `manager.md` | Manager | rien du tout |

**Deux de ces cas partent d'un fichier du projet, deux partent de rien.** Le geste de vérification,
lui, sera exactement le même pour les quatre.

## Ici, le prompt vous est donné en entier

C'est la différence avec le cas pratique précédent. Là-bas, écrire la demande **était** l'exercice.
Ici, l'exercice commence **après** : ce qui compte, c'est l'écart entre ce que l'outil annonce et
ce qu'il a réellement produit — puis **ce que chaque mode a coûté**.

**Copiez le bloc, ne le retapez pas.** Deux des quatre demandes contiennent un chemin de fichier.
Un chemin retapé se casse — et il se casse **en silence** : l'outil ne trouve pas le fichier, ne le
dit pas, et vous répond quand même. Vous auriez une réponse parfaitement normale, sur rien.

## Le protocole — deux fois la même demande

> **La même demande, mot pour mot, dans les deux modes. Et vous ne relisez pas la réponse. Exprès.**

| | Mode | Ce que vous faites |
|---|---|---|
| **1** | **Ask** | Envoyez la demande. **Notez ce qu'il ANNONCE, mot pour mot.** Avant d'ouvrir quoi que ce soit |
| **2** | **Ask** | Ouvrez le dossier. Le fichier annoncé existe-t-il vraiment ? Où ? Que contient-il ? |
| **3** | — | **Relevez le coût** affiché sous la réponse |
| **4** | **Agent** | Nettoyez la conversation, basculez, et envoyez **exactement la même demande** |
| **5** | — | **Relevez le coût** à nouveau |

**Le 1 avant le 2, jamais l'inverse.** Une phrase qu'on vient de croire ne se retient pas : si
l'annonce n'est pas notée avant l'ouverture du dossier, il ne reste rien à comparer.

**Et la même demande dans les deux modes, sans une virgule de différence.** C'est la seule chose
qui rend la comparaison de coût honnête.

## Ce que vous postez dans le chat

**Vos deux coûts et leur rapport.** Une ligne, par exemple :

```
ask 1,1 / agent 2,7 · ×2,5
```

C'est la trace du cas pratique. Les rapports ne seront pas les mêmes d'un poste à l'autre, et
**c'est précisément ce qu'on va regarder** — l'écart s'explique par le modèle qui a répondu et par
ce que le mode agent a fait en plus.

## ⛔ Ne touchez pas à « Keep » ni à « Undo »

Pas avant la mise en commun. Le débrief repose sur un artefact **qui doit encore exister** au
moment où on en parle.

## Où va ce que vous produisez

Les fichiers que l'agent crée, il les met où il veut : c'est justement une des questions. Vos
notes, elles, peuvent aller dans `apprenant/a-supprimer/`.

## Si vous avez décroché dix minutes

Rien n'est perdu : le cas pratique tient dans le tableau du protocole ci-dessus, et votre fichier
de profil contient la demande. **Faites-le en mode Ask, puis en mode Agent, et postez vos deux
chiffres.** C'est tout ce qui est attendu.
