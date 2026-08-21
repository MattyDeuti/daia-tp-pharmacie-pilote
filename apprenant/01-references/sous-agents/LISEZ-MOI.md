# Les sous-agents — un exécutant avec un périmètre et des droits

> **Vérifié le 19/08/2026** contre la documentation officielle VS Code.
> **Ces fiches ne couvrent que GitHub Copilot dans VS Code** — l'outil de tous les cas pratiques.

| Fichier | Quand l'ouvrir |
|---|---|
| **`CHAMPS.md`** | vous écrivez le fichier et vous cherchez un champ |
| **`MODELE.md`** | vous voulez un squelette à copier |
| **`PIEGES.md`** | **il n'apparaît pas**, ou il fait plus que prévu |

---

## La définition, en une phrase

> **Un sous-agent, c'est un rôle qu'on délègue : une mission, un périmètre, et surtout des
> droits.**

Et la phrase qui compte davantage :

> **Un agent n'est capable que des droits qu'on lui donne.**

Un agent qui n'a que le droit de **lire** ne peut rien casser, **par construction**. Ce n'est pas
une consigne qu'il pourrait oublier en fin de conversation : c'est une frontière qu'il ne peut pas
franchir. C'est la seule garantie dure de tout ce module.

L'inverse est vrai aussi, et c'est le piège classique : **retirez-lui le droit d'écrire alors que
vous attendiez une modification, et il vous rendra un script au lieu d'agir.** Vous chercherez
longtemps pourquoi.

---

## Skill ou sous-agent ?

| | **Skill** | **Sous-agent** |
|---|---|---|
| C'est quoi | une **procédure** — une manière de faire | un **exécutant** — un rôle avec un périmètre |
| Qui exécute | l'agent en cours, dans **votre** conversation | un agent séparé, dans **son propre** contexte |
| Ce que vous réglez | ce qu'il doit **produire** | ce qu'il a le **droit** de faire |
| Vous voyez le travail | oui, il se déroule sous vos yeux | non, vous recevez le résultat |
| Le vrai levier | la `description` (le déclenchement) | `tools` (les droits) et `model` (le déterminisme) |
| Effet sur votre contexte | il grossit de tout le travail | il ne prend que le résultat |

**En pratique :**

- « Mes audits doivent toujours avoir les six mêmes rubriques » -> **skill**
- « Je veux un relecteur qui ne **puisse pas** modifier mon code » -> **sous-agent**
- « Les deux » -> un sous-agent qui applique une skill. C'est courant et c'est propre.

> Une skill peut d'ailleurs devenir un sous-agent avec un seul champ : `context: fork`.
> Voir `../skills/CHAMPS.md`.

---

## Les deux choses qui valent le détour

### ① Le champ `tools` — la seule frontière dure

Tout le reste de ce que vous écrivez est une **consigne** : ça peut être mal compris, dilué en fin
de conversation, ou contourné. `tools` n'est pas une consigne, c'est une **capacité**. Ce qui n'y
est pas ne peut pas arriver.

C'est pourquoi la brique « agent de revue » du cas pratique collectif se prouve **par ce qui n'a
pas bougé**, et pas par ce que l'agent raconte.

### ② Le champ `model` — votre réponse au mode auto

Si votre organisation impose le **mode auto**, le routeur choisit le modèle à votre place : deux
fois la même demande peuvent partir sur deux modèles différents, donc donner deux résultats
différents. Vous perdez la reproductibilité, et c'est précisément ce qu'on ne peut pas se
permettre en production.

**Épingler le modèle au niveau du sous-agent rend le déterminisme là où il compte, sans sortir de
la politique de l'organisation.** Vous n'avez pas à désobéir : vous encapsulez.

VS Code accepte même **une liste par ordre de préférence** — il essaie le premier, puis le
suivant s'il n'est pas disponible.

---

## ⚠️ Le prix caché : le contexte séparé

Un sous-agent travaille **dans son propre contexte**. Il ne sait pas ce qui s'est dit dans votre
conversation, et vous ne voyez pas comment il a raisonné.

| Conséquence | Ce que ça donne |
|---|---|
| Il ne voit pas votre conversation | il faut **tout** lui redonner dans sa mission |
| Vous ne voyez pas son raisonnement | vous ne pouvez pas le corriger en cours de route |
| Plusieurs en parallèle | ils peuvent produire des résultats **incohérents entre eux**, chacun ayant tranché dans son coin |

**Le bénéfice de l'autre côté :** votre contexte principal ne grossit que du résultat. Sur une
tâche volumineuse, c'est ce qui vous évite d'arriver à saturation.

> **Le critère :** déléguez à un sous-agent ce dont vous n'avez besoin que du **résultat**.
> Gardez dans votre conversation ce dont vous avez besoin de suivre le **raisonnement**.

---

## Les adresses

| Portée | Où | Forme |
|---|---|---|
| **Le projet** (versionné, toute l'équipe l'a) | `.github/agents/<nom>.agent.md` | un fichier par agent |
| *(aussi accepté)* | `.claude/agents/<nom>.agent.md` | idem |
| **Vous seul** (tous vos projets) | `~/.copilot/agents/<nom>.agent.md` | idem |

> ⛔ **L'extension complète est `.agent.md`, pas `.md`.** Un fichier nommé `relecteur.md` ne
> charge pas, et **rien ne vous le signalera**.

**Dans ce projet :** `.github/agents/` attend le vôtre. Un seul fichier s'y trouve déjà,
`traducteur-metier.agent.md`, celui du formateur — **un agent réel, en lecture seule, avec ses
cinq champs remplis**. Il fait un tout autre métier que celui du TP : ouvrez-le pour voir la
forme, pas pour le recopier.

---

## Ce qui compte comme preuve

| | |
|---|---|
| `AGENTS.md` **n'apparaît pas** dans les fichiers modifiés après une revue | ✅ la lecture seule tient |
| L'agent rend une revue conforme au format demandé | ✅ le corps du fichier est suivi |
| Il dit « je n'ai rien modifié, conformément à mes droits » | ⛔ **ne prouve rien** |
| Il propose de corriger lui-même | ⚠️ **le champ `tools` est mal réglé** |

**Le panneau Source Control** (l'icône des branches, à gauche) liste ce qui a bougé. Regardez-le
avant, regardez-le après. **La preuve est dans ce qui n'a pas changé.**
