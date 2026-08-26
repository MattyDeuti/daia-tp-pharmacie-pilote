# Demandez votre procédure, et comptez

> **MODE : AGENT** · le sélecteur, en haut du panneau Copilot

*Jour 2, début d'après-midi, juste après le cas pratique de l'écran. Chacun sur son poste.
**Copilot en mode Agent.***

**Vous ne fabriquez pas un prompt. Vous fabriquez une procédure qui survit à la conversation.**

C'est toute la différence du module : un prompt meurt quand vous fermez la fenêtre ; une procédure
posée dans le projet est **relue par l'outil la prochaine fois**, sans que personne la nomme.

| Fichier | Pour qui | La procédure qu'il demande |
|---|---|---|
| `developpeur.md` | Développeur | `audit-legacy` — six rubriques imposées, toujours dans le même ordre |
| `testeur-qa.md` | Testeur ou QA | `jeu-de-tests` — trois cas par méthode publique |
| `analyste.md` | Analyste | `demande-utilisateur` — le format « en tant que, je veux, afin de » |
| `manager.md` | Manager | `synthese-comite` — quinze lignes pour un comité de pilotage |

## Ce que vous écrivez, et ce qui vous est donné

Le **nom** de votre procédure est imposé, et son **cahier des charges** aussi : ils sont dans
votre fichier de rôle. **Ce que vous écrivez vous-même, ce sont deux lignes** — à quoi elle sert,
et quand elle doit être invoquée.

Ces deux lignes deviennent le seul texte que l'outil lira avant de décider d'ouvrir votre
procédure. **C'est tout l'exercice** : à l'étape ③ vous la déclenchez **sans la nommer**, et elle
ne partira que si vous l'avez bien annoncée.

> 🆘 **`LA-TRICHE.md`**, dans ce dossier, donne la demande complète. **N'y allez pas tout de
> suite.** Essayez avec vos mots, ratez si besoin, réécrivez une fois — c'est le rattrapage qui
> enseigne. Le filet est là pour que personne ne reste bloqué, pas pour éviter l'essai.

## Deux défis bonus, si vous finissez avant

Ils sont **à la fin de votre fichier de rôle**. Le premier fait écrire une parade dans la
procédure elle-même. Le second ne se tape pas dans le chat : c'est un **réglage**, et c'est de la
gouvernance.

**`Ctrl + Maj + P`** → **`Chat: Manage Tool Approval`**

Vous y décidez **quels appels d'outils passent tout seuls et lesquels vous demandent**. Ce qu'on
vous demandera ensuite n'est pas votre réglage : c'est **votre raison**.

## Le canari, et c'est tout l'exercice

Chaque demande se termine par la même ligne :

**📋 À COLLER DANS LE PANNEAU**

```
Fais-lui commencer chaque livrable par la ligne exacte CANARI-PRENOM.
```

**Remplacez `PRENOM` par votre prénom.** Ce n'est pas décoratif : c'est ce qui rend la preuve
**individuelle**. On verra tout de suite quel poste a réellement déclenché sa procédure.

> La formulation d'origine disait « ton prénom ». **L'assistant comprenait que ça désignait le
> sien** et écrivait `CANARI-GitHub Copilot`. Si vous oubliez de remplacer `PRENOM`, ce n'est
> pas grave : le marqueur sort quand même, il n'est simplement plus individuel.

## ⛔ Ce qui ne compte pas comme preuve

**Un livrable correct sans le marqueur** signifie que votre procédure **n'a jamais été ouverte**.
L'agent a fait le travail lui-même, et il l'a bien fait.

C'est la fausse impression à démonter : **ce n'est pas la qualité du résultat qui prouve qu'une
procédure a servi. C'est le canari.**

## Les deux gestes qui débloquent

1. **Rechargez la fenêtre** après avoir déposé la procédure. Sans ça, l'outil ne l'a pas encore vue.
2. **Si la tâche a l'air banale, nommez la procédure explicitement.** Dans le doute, l'agent fait
   le travail lui-même — et vous n'aurez pas de canari.

## À la fin, on compte

**Vous levez la main : ça a marché, ou pas.** On regarde ensemble ce que le compte dit. Un « pas »
vaut autant qu'un « oui » — c'est même souvent plus instructif.
