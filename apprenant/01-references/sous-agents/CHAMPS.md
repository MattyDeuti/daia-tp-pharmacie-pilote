# Les champs d'un sous-agent — référence exhaustive

> **Vérifié le 19/08/2026** contre la documentation officielle VS Code.
> **Cette fiche ne couvre que GitHub Copilot dans VS Code** — l'outil de tous les cas pratiques.
> Le lien de contrôle est en bas de page.

---

## Anatomie du fichier

```markdown
---
name: relecteur
description: "..."
tools: ["read", "search"]
model: Claude Opus 4.5
---

Vous êtes un relecteur. Vous constatez, vous ne corrigez jamais.
```

**Le corps est plafonné à 30 000 caractères.** Au-delà, il est refusé.

**Adresse :** `.github/agents/<nom>.agent.md` — **un fichier par agent**, et l'extension complète
est bien `.agent.md`.

*Sont aussi acceptés `.claude/agents/` (projet) et `~/.copilot/agents/` (vous seul, tous vos
projets). D'autres emplacements sont configurables par le réglage `chat.agentFilesLocations`.*

---

## Tous les champs

| Champ | Oblig. | Valeurs | Ce qu'il fait |
|---|---|---|---|
| `name` | non | texte | le nom affiché. **Sans lui, c'est le nom du fichier** |
| `description` | non | texte | ce qu'il fait — sert au choix, et s'affiche dans le champ de saisie |
| `argument-hint` | non | texte | l'aide de saisie |
| `tools` | non | liste | **la frontière dure.** Voir plus bas |
| `agents` | non | liste ou `*` | **quels sous-agents celui-ci a le droit d'appeler.** `[]` = aucun |
| `model` | non | texte **ou liste** | le modèle imposé. Une liste = **ordre de préférence** |
| `user-invocable` | non | `true` (défaut) / `false` | à `false`, il disparaît de la liste déroulante |
| `disable-model-invocation` | non | `false` (défaut) / `true` | à `true`, **aucun autre agent ne peut l'appeler** |
| `target` | non | `vscode` / `github-copilot` | l'environnement. **Omis = les deux** |
| `mcp-servers` | non | objets | des serveurs MCP propres à cet agent |
| `handoffs` | non | objets | **des boutons de passage de relais.** Voir plus bas |
| `hooks` | non | objet | 🔬 **préversion** — commandes déclenchées automatiquement |
| `infer` | ⛔ | — | **obsolète.** Remplacé par `user-invocable` + `disable-model-invocation` |

---

## Les trois champs qui comptent vraiment

### `tools` — la seule frontière dure

Tout le reste de ce que vous écrivez est une **consigne** : ça peut être mal compris, dilué en fin
de conversation, ou contourné. `tools` n'est pas une consigne, c'est une **capacité**. Ce qui n'y
est pas ne peut pas arriver.

#### La syntaxe

| Ce que vous voulez | Ce que vous écrivez |
|---|---|
| **Tout** | omettre le champ, ou `tools: ["*"]` |
| **Rien** | `tools: []` |
| Une sélection | `tools: ["read", "search"]` |
| Un outil MCP précis | `tools: ["playwright/browser_navigate"]` |
| Tout un serveur MCP | `tools: ["playwright/*"]` |
| Un outil d'extension | `tools: ["azure.mon-extension/mon-outil"]` |

#### Les alias — insensibles à la casse

| Alias | Équivalents acceptés | Ce que ça ouvre |
|---|---|---|
| `read` | `Read`, `NotebookRead` | lire des fichiers |
| `search` | `Grep`, `Glob` | chercher des fichiers ou du texte |
| `edit` | `Edit`, `MultiEdit`, `Write`, `NotebookEdit` | **modifier des fichiers** |
| `execute` | `shell`, `Bash`, `powershell` | **exécuter des commandes** |
| `web` | `WebSearch`, `WebFetch` | **sortir du projet** |
| `agent` | `custom-agent`, `Task` | **appeler un autre agent** |
| `todo` | `TodoWrite` | gérer une liste de tâches |

*VS Code expose aussi des noms plus granulaires (`codebase`, `editFiles`, `runCommands`,
`runTests`, `problems`, `changes`, `findTestFiles`, `usages`…). **Les alias ci-dessus sont plus
sûrs** : ils sont stables et couvrent les mêmes capacités.*

#### Les quatre paliers — la seule chose à retenir

| Palier | Alias | Ce qu'il peut faire | Réglage conseillé |
|---|---|---|---|
| **1. Lire** | `read` | constater | passe tout seul |
| **2. Chercher** | `search` | parcourir le projet | passe tout seul |
| **3. Écrire** | `edit` | **modifier vos fichiers** | qu'il demande |
| **4. Exécuter / sortir** | `execute`, `web` | **lancer des commandes, sortir du projet** | qu'il demande |

> **`tools: ["read", "search"]` est un agent en lecture seule.** Il constate, il ne modifie rien,
> **par construction**. C'est le réglage à garder tant que vous n'avez pas une raison écrite de
> faire autrement.

> ⛔ **L'erreur symétrique, tout aussi fréquente :** vous attendez une modification et vous ne lui
> avez pas donné `edit`. **Il vous rendra un script à exécuter vous-même** au lieu d'agir, sans
> jamais dire qu'il n'en avait pas le droit.

---

### `model` — une liste de repli

```yaml
model: ['Claude Opus 4.5', 'GPT-5.2']
```

Il essaie le premier ; si indisponible, il passe au suivant.

**C'est ce qui rend l'épinglage robuste.** Avec un seul modèle et lui saturé, votre agent repart
silencieusement dans le comportement par défaut — et vous perdez la reproductibilité sans le
savoir. La liste ferme cette porte.

> **Si votre organisation impose le mode auto**, c'est ici que se joue le compromis : vous ne
> sortez pas de la politique maison, vous créez une **poche de déterminisme** là où le résultat
> doit être reproductible.

---

### `agents` — qui a le droit d'appeler qui

C'est le champ qui **empêche la cascade**. Un agent avec `agents: []` ne peut déléguer à personne :
il fait son travail lui-même ou il échoue.

Sans ce garde-fou, un orchestrateur peut en lancer un qui en lance un autre, et vous perdez la
main sur ce qui tourne — **et sur ce que ça consomme**.

| Valeur | Effet |
|---|---|
| `agents: []` | il ne peut appeler personne |
| `agents: ["relecteur", "testeur"]` | **nominatif** : uniquement ces deux-là |
| `agents: "*"` | tout est ouvert, y compris en cascade |

> ⚠️ **`agent` doit aussi être dans ses `tools`.** Les deux champs travaillent ensemble : `tools`
> ouvre la capacité de déléguer, `agents` dit à qui. L'un sans l'autre ne fait rien.

---

## Les `handoffs` — le passage de relais

Un bouton proposé à la fin du travail, pour enchaîner sur un autre agent :

```yaml
handoffs:
  - label: Implémenter le plan
    agent: implementation
    prompt: Implémente le plan ci-dessus.
    send: false
    model: GPT-5.2 (copilot)
```

| Sous-champ | Ce qu'il fait |
|---|---|
| `label` | le texte du bouton |
| `agent` | l'agent de destination |
| `prompt` | le texte envoyé |
| `send` | `false` (défaut) = le texte est pré-rempli, **vous validez** · `true` = **envoi automatique** |
| `model` | le modèle pour cette étape-là |

> ⚠️ **`send: true` retire une porte de validation.** C'est exactement le geste dont on a parlé :
> l'agent propose, l'humain valide. Gardez `false` tant que vous n'avez pas une raison écrite de
> faire autrement.

---

## Vérifier par vous-même

**① Testez le silence.** Ajoutez `couleur-preferee: bleu` dans un agent qui marche, rechargez.
Rien ne change : **les champs inconnus sont ignorés sans erreur.** L'absence d'erreur ne prouve
rien.

**② Testez un champ par son effet, jamais par sa présence.** Le seul contrôle qui vaut : réglez-le
pour **empêcher** quelque chose, puis demandez cette chose. S'il la fait quand même, le champ
n'est pas actif chez vous.

**Pour `tools`, la preuve est dans le panneau Source Control : le fichier n'a pas bougé.**

**③ La documentation à jour**, pour ce qui aura changé depuis le 19/08/2026 :

- <https://code.visualstudio.com/docs/agent-customization/custom-agents>
