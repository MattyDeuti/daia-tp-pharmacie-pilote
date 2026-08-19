# Mon agent ne marche pas — le diagnostic

> **Le symptôme le plus fréquent : « mon agent n'apparaît pas dans la liste. »**
>
> **Neuf fois sur dix, ce n'est pas une faute de syntaxe.** C'est un champ **réel** mal réglé qui
> le rend volontairement invisible. Ne cherchez pas la virgule : relisez la liste ci-dessous.
>
> > **Un champ inventé ne charge pas. Un champ réel mal réglé cache.**

---

## L'arbre, dans cet ordre

```
Mon agent n'apparaît pas
        |
        v
① Avez-vous rechargé la fenêtre ?
   NON -> Ctrl+Maj+P -> Developer: Reload Window
   OUI |
       v
② Le fichier finit-il bien par « .agent.md » ?
   NON -> « relecteur.md » ne charge pas.  Il faut « relecteur.agent.md »
   OUI |
       v
③ Est-il bien dans .github/agents/ ?
   NON -> .github/skills/ est l'autre dossier, et il ne charge pas d'agents
   OUI |
       v
④ Avez-vous « user-invocable: false » ?
   OUI -> vous l'avez rendu invisible vous-même
   NON |
       v
⑤ Avez-vous « target: github-copilot » alors que vous êtes dans VS Code ?
   OUI -> vous l'avez réservé à l'autre environnement
   NON -> voir « Il existe mais il ne fait rien »
```

---

## Cas A — il n'apparaît pas

| # | La cause | Le contrôle |
|---|---|---|
| **1** | fenêtre non rechargée | `Developer: Reload Window` |
| **2** | extension incomplète | `.agent.md`, pas `.md` |
| **3** | `name` contient une majuscule, un point ou un espace | minuscules, chiffres et tirets |
| **4** | `user-invocable: false` | vous l'avez caché |
| **5** | `target: github-copilot` | il est réservé au cloud, invisible dans VS Code |
| **6** | mauvais dossier | `.github/agents/`, pas `.github/skills/` |
| **7** | `name` ≠ ce que vous cherchez dans la liste | il est là, sous un autre nom |

> ⛔ **Aucune de ces sept erreurs ne produit de message.** Le chargement échoue **en silence**.

**Le contrôle qui tranche :** enlevez tout le frontmatter sauf `name` et `description`, rechargez.
S'il apparaît, la cause est dans un des champs que vous venez de retirer — remettez-les un par un.

---

## Cas B — il apparaît, mais un autre agent ne peut pas l'appeler

Vous avez un orchestrateur, et le sous-agent n'est jamais sollicité.

| Cause | Correction |
|---|---|
| L'appelant n'a pas `agent` dans ses `tools` | ajoutez `"agent"` — **sans lui, il ne peut déléguer à personne** |
| L'appelant a `agents: []` | c'est le blocage total. Nommez les agents autorisés |
| L'appelé a `disable-model-invocation: true` | il est explicitement soustrait à l'appel automatique |
| L'appelé n'est pas dans la liste `agents` de l'appelant | ajoutez-l'y : la liste est nominative |

> **Ces quatre champs sont des garde-fous, pas des bugs.** Ils font exactement ce qu'ils
> annoncent. La question n'est pas « comment les contourner » mais « lequel ai-je posé sans le
> vouloir ».

---

## Cas C — il existe mais il ne fait rien de ce que j'attends

### Il me rend un script au lieu d'agir

**C'est le piège classique, et il n'y a qu'une cause : il n'a pas `edit`.**

Il ne dira pas « je n'ai pas le droit ». Il fera ce qu'il peut faire : produire le texte de la
modification et vous laisser l'appliquer. Ajoutez `"edit"` à `tools` — **et assumez-le**.

### Il me dit « voici la commande à lancer »

Même mécanique : il n'a pas `execute`. Même arbitrage.

### Il modifie des fichiers que je ne voulais pas

Le corps du fichier disait « ne touche qu'au fichier désigné » — mais **c'est une consigne, pas
une frontière**. Les consignes se diluent.

**La seule vraie parade : retirez `edit`.** Il n'existe pas de réglage plus fin par chemin — le
champ `tools` ouvre ou ferme la capacité d'écrire, il ne la restreint pas à un dossier.

Vos deux options, et il n'y en a pas de troisième :

| Option | Ce que ça donne |
|---|---|
| `tools: ["read", "search"]` | il **ne peut pas** écrire. Il vous rendra le texte de la modification |
| `tools: [..., "edit"]` | il peut écrire **partout**. C'est à vous de relire avant de valider |

> **C'est précisément pour ça que la validation humaine n'est pas négociable dès que `edit` est
> ouvert.** Il n'y a plus de garde-fou technique derrière vous.

### Il ignore les règles du corps en fin de conversation

Le contexte est saturé. Les règles du corps sont chargées **au début** : plus la conversation
s'allonge, moins elles pèsent. `/clear` et relancez.

> **C'est l'argument le plus fort en faveur de `tools`** : lui ne se dilue pas.

### Un petit modèle ignore tout

Les modèles légers suivent mal les consignes structurées. **Testez sur un modèle plus capable
avant de conclure que votre fichier est mauvais** — souvent il ne l'est pas. Et si le résultat
doit être reproductible, épinglez le modèle avec `model`.

---

## Cas D — plusieurs agents se contredisent

Ce n'est pas un bug, c'est **le prix du contexte séparé**. Chacun travaille dans le sien, sans
savoir ce que les autres ont décidé.

| Parade | Effet |
|---|---|
| Leur faire **écrire leur état** dans un fichier partagé | ils se lisent au lieu de deviner |
| Un orchestrateur qui **signale explicitement les désaccords** | vous voyez le conflit au lieu d'une fausse unanimité |
| **Séquencer** au lieu de paralléliser | plus lent, mais chacun voit le résultat du précédent |
| Épingler le **même modèle** pour tous | supprime une source de divergence |

> ⛔ **Le pire cas n'est pas le désaccord visible, c'est l'orchestrateur qui tranche seul** et vous
> rend une synthèse lisse. Vous ne saurez jamais qu'il y a eu conflit. **Écrivez-lui explicitement
> de remonter les contradictions.**

---

## Ce qui ne compte jamais comme preuve

| | |
|---|---|
| « Je n'ai rien modifié, conformément à mes droits » | ⛔ **rien** |
| « J'ai bien respecté la lecture seule » | ⛔ **rien** |
| Vous lui demandez s'il a bien lu la charte, il dit oui | ⛔ **rien** |
| Le panneau **Source Control** ne montre aucun fichier modifié | ✅ **la preuve** |
| Il propose de corriger lui-même | ⚠️ **`tools` est mal réglé** — même s'il ne le fait pas |

**Le panneau Source Control** (l'icône des branches, à gauche) liste ce qui a bougé. Regardez-le
avant, regardez-le après.

> **La preuve n'est pas dans ce qu'il dit. Elle est dans ce qui n'a pas changé.**

---

## Le réflexe qui débloque le plus vite

**Partez du minimum, et ajoutez un champ à la fois.**

Le dossier `.github/agents/` de ce projet est vide : vous n'avez pas d'exemplaire à dupliquer.
Alors commencez par **deux champs seulement** :

```markdown
---
name: essai
description: "Un agent d'essai."
---

Réponds simplement « je suis là ».
```

Rechargez. **S'il apparaît, le format est bon** — et tout ce qui cassera ensuite viendra d'un
champ que vous venez d'ajouter. S'il n'apparaît pas, le problème est dans l'adresse ou
l'extension, pas dans vos réglages.

Écrire les treize champs d'un coup, c'est cumuler l'incertitude sur le format **et** sur le
contenu. Vous ne saurez pas laquelle des deux vous bloque.

> Côté skill, vous avez en revanche un exemplaire qui tourne : `.github/skills/git-workflow/`.
> Pour une skill, dupliquez-le plutôt que de partir de zéro.
