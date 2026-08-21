# Bonus · Un déclencheur, chez Copilot

*Jour 2, module 6, après la slide 161 · **deux minutes** · Copilot, en mode agent*

> **La carte d'identité dit « le bouton d'audit d'hier en était un — c'était Kiro ».**
> Cette démo donne l'équivalent côté Copilot, pour que la brique 4 ne reste pas une slide.
>
> **Elle ne coûte aucun crédit** : l'action est un script, pas une IA. C'est exactement la
> phrase de votre note orateur — *l'action peut être une IA, et ça coûte, ou un simple script,
> et c'est gratuit.*

---

## Ce qui est livré, et c'est désarmé

| Fichier | Rôle |
|---|---|
| `.github/hooks/journal-agent.json` | le déclencheur — **livré inerte** |
| `.github/hooks/journal-agent.ps1` | l'action : une ligne dans un journal |

**Le fichier est inerte tant que sa clé ne s'appelle pas exactement `hooks`.** Il est livré avec
`hooks_DESARME`, donc rien ne part chez les participants pendant leurs cas pratiques.

---

## ① Armer, devant eux

Ouvrez `.github/hooks/journal-agent.json` et **retirez `_DESARME` du nom de la clé** :

```
"hooks_DESARME": {        →        "hooks": {
```

Sauvegardez, puis **rechargez la fenêtre** — `Ctrl + Maj + P` → `Developer: Reload Window`.

> **C'est l'interrupteur dessiné sur la carte d'identité.** Un mot, et le déclencheur est armé.
> Faites-le à l'écran : c'est le geste le plus parlant de la démo.

---

## ② Demander n'importe quoi

Une demande banale suffit — le déclencheur n'écoute pas ce que vous dites, il écoute ce que
**l'agent fait** :

```
Combien de methodes publiques y a-t-il dans src/main/java/GestionStock.java ?
```

---

## ③ La preuve

**Un fichier `journal-agent.txt` apparaît à la racine du projet.** Ouvrez-le :

```
14:22:07   read_file                    GestionStock.java
14:22:08   grep_search
14:22:09   read_file                    GestionStock.java
```

| Ce qu'on montre | Ce que ça prouve |
|---|---|
| Le fichier **n'existait pas** avant | personne ne l'a créé à la main |
| Il s'est rempli **pendant** que l'agent travaillait | le déclencheur est parti seul |
| **Le champ de saisie est resté vide** | c'est le dessin de la carte d'identité, en vrai |

**La phrase à dire :** « Personne n'a rien tapé. Le jour où on vous demande ce que la machine a
touché, la réponse existe déjà. » — c'est la carte « il laisse une trace » de la slide 163.

---

## ④ Désarmer, avant de rendre la main

Remettez `hooks_DESARME`, sauvegardez, rechargez. **Ne l'oubliez pas** : sinon le journal
continue de se remplir pendant le cas pratique de 15h11, et les participants verront un fichier
inconnu apparaître dans leur dépôt.

Vous pouvez supprimer `journal-agent.txt` : il est ignoré par git, il ne partira pas dans leur
mise en commun.

---

## Le principe, si on vous le demande

> **QUAND l'agent fait quelque chose, ALORS ma commande s'exécute.**

### Les huit moments

| Événement | Il part quand… |
|---|---|
| `SessionStart` | vous envoyez le tout premier message d'une session |
| `UserPromptSubmit` | vous envoyez un message |
| `PreToolUse` | **avant** que l'agent lance un outil |
| `PostToolUse` | **après** qu'un outil a réussi |
| `PreCompact` | avant que la conversation soit compactée |
| `SubagentStart` | un sous-agent démarre |
| `SubagentStop` | un sous-agent termine |
| `Stop` | l'agent s'arrête |

**Aucun n'est un événement fichier.** Ce sont tous des moments de la **session de l'agent** —
c'est la phrase qui tranche de la slide 163 : *Kiro déclenche sur ce que VOUS faites, Copilot sur
ce que l'AGENT fait.*

### Ce que la commande peut être

**N'importe quoi que la machine sait exécuter** : un script PowerShell, un `.bat`, `npx prettier`,
`mvn test`, un appel réseau. Copilot ne fournit que le moment ; le reste est à vous.

> ⚠️ **C'est une exécution de code sur votre poste, avec vos droits.** Un déclencheur qui arrive
> par `git pull` s'exécutera chez vous sans rien demander. À dire en salle : **on lit un fichier
> de hook avant de l'accepter**, comme on lit un script d'installation.

### Le déclencheur peut répondre, pas seulement observer

L'événement arrive en JSON sur l'entrée standard. Ce que la commande écrit en sortie peut
infléchir la suite :

| Ce que le script renvoie | Effet |
|---|---|
| `permissionDecision: "deny"` *(PreToolUse)* | l'outil **ne s'exécute pas**, avec votre raison |
| `decision: "block"` + `reason` *(Stop)* | l'agent **ne s'arrête pas** et repart au travail |
| `additionalContext` *(SessionStart)* | du contexte injecté avant qu'il commence |
| rien du tout | il observe et se tait — **c'est notre journal** |

Les codes de sortie comptent aussi : `0` = la sortie est lue · `2` = erreur bloquante montrée au
modèle · tout autre = simple avertissement.

**C'est ce qui rend les quatre cartes de la slide 163 possibles** — refuser avant d'agir, ne pas
partir sans les tests, laisser une trace, démarrer renseigné.

---

## Les trois limites, à dire si on vous les demande

**① Il n'existe aucun événement « fichier ».** Les déclencheurs de Copilot sont des moments de la
**session de l'agent** : démarrage, message envoyé, avant un outil, après un outil, sous-agent
terminé, arrêt. Pas la sauvegarde, pas le disque.

> ⛔ **Ne dites pas que Copilot sait déclencher à la sauvegarde.** Il ne sait pas, et quelqu'un
> le cherchera en rentrant. C'est déjà écrit dans votre note orateur de la slide 163.

**② Le filtre déclaratif ne marche pas.** La doc est explicite : les `matcher` sont analysés puis
**ignorés**, le déclencheur part sur **tous** les appels d'outil. Si vous voulez ne réagir qu'à
une création de fichier, c'est le **script** qui doit trier, en lisant `tool_name` — ce que fait
le nôtre.

**③ L'action est une commande, pas un prompt.** Kiro sait dire « demande ça à l'agent »
(`askAgent`). Copilot exécute un script. C'est la raison de fond pour laquelle **on ne branche
pas une IA sur ce déclencheur** : il partirait à chaque appel d'outil.

> **La question qui viendra, et la réponse :** « Est-ce qu'on peut lancer un sous-agent
> automatiquement à chaque fichier créé ? » — Non, et vous n'en voulez pas. Le déclencheur part
> sur **chaque** appel d'outil : ce serait un sous-agent par lecture de fichier. C'est votre
> slide 164, mot pour mot : *un déclencheur dont l'action est une IA, c'est une facture à chaque
> Ctrl+S.*

---

## Si rien ne se passe

| Symptôme | Cause |
|---|---|
| Aucun `journal-agent.txt` | la fenêtre n'a pas été rechargée après la modification |
| Toujours rien | la clé ne s'appelle pas exactement `hooks` |
| Toujours rien | `Developer: Show Agent Debug Logs` dit si le déclencheur a été chargé et exécuté |
| Des lignes `evenement-illisible` | le script a bien tourné mais n'a pas su lire l'événement — la démo tient quand même |

*Les hooks sont en préversion et une politique d'entreprise peut les désactiver. Si rien ne
charge sur la VM, c'est la première chose à vérifier — et ça se dit très bien en salle.*
