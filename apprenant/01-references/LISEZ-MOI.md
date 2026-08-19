# `apprenant/01-references/` — les fiches de référence

> **Vérifié le 19/08/2026**, sur ce projet, pour **GitHub Copilot dans VS Code** — l'outil de
> tous les cas pratiques.
> **Ces formats bougent.** La dernière section de ce fichier dit comment recontrôler en
> soixante secondes, sans attendre la prochaine formation.

**Ce dossier ne se lit pas en entier.** On l'ouvre quand on bute sur un champ, pendant un cas
pratique, et on le referme. Ce n'est pas un chapitre du support : c'est le classeur qu'on garde
ouvert à côté.

| Vous cherchez | Ouvrez |
|---|---|
| une **procédure** que l'outil relit tout seul la prochaine fois | `skills/` |
| un **exécutant** à qui on donne un périmètre et des droits | `sous-agents/` |

**Les deux dossiers ont la même structure :**

| Fichier | Quand |
|---|---|
| `LISEZ-MOI.md` | à quoi ça sert, et **skill ou sous-agent ?** |
| `CHAMPS.md` | **tous les champs**, avec ce qui casse si vous les ratez |
| `MODELE.md` | des squelettes à copier |
| `PIEGES.md` | ça ne marche pas, et l'outil ne dit pas pourquoi |

---

## Avant les champs : où va quoi

C'est la seule décision qui compte, et elle se prend **avant** d'ouvrir le moindre fichier de
référence. Elle tient en une question : **ça sert à combien de conversations ?**

| Ça s'applique à… | Ça vit dans | Vous le payez |
|---|---|---|
| **toutes** vos conversations | `AGENTS.md` | à **chaque** conversation, même celles qui n'en ont rien à faire |
| **certaines** conversations | une **skill** ou un **sous-agent** | seulement quand ça sert |
| **une seule** conversation | rien du tout — un prompt | une fois |

### Pourquoi ça compte autant

`AGENTS.md` est injecté **en entier, avant votre premier message**, à chaque nouvelle
conversation. Une procédure d'audit de quarante lignes rangée là-dedans est payée aussi quand
vous demandez seulement « explique-moi cette fonction ».

Une skill, elle, ne se charge **que quand elle se déclenche**.

D'où la règle, et c'est la seule à retenir de ce dossier :

> **`AGENTS.md` ne contient pas les compétences. Il dit qu'elles existent.**
> Trois lignes dans le fichier permanent, deux cents dans la skill qui ne se charge qu'à l'usage.

**Ce qu'il ne faut pas faire :**

```markdown
# AGENTS.md

## Audit d'un fichier ancien
Avant d'analyser un fichier, tu dois :
1. Lister ses dépendances
2. Identifier les fichiers SQL associés
3. Charger le schéma de base
...  (40 lignes, payées à chaque conversation)
```

**Ce qu'il faut faire :**

```markdown
# AGENTS.md

## Compétences disponibles
- Audit d'un fichier ancien -> skill `audit-legacy`
- Vérification de tests     -> skill `jeu-de-tests`
- Enregistrer / publier     -> skill `git-workflow`
```

Les quarante lignes sont toujours là. Elles sont juste **ailleurs**, et elles ne coûtent plus rien
tant que personne n'audite.

### Le troisième étage n'est pas un échec

Si votre besoin ne concerne **qu'une seule fois** — une migration ponctuelle, un refactoring qu'on
ne refera pas — il ne va **nulle part**. Ni dans `AGENTS.md`, ni dans une skill. C'est un prompt,
et c'est très bien ainsi. Fabriquer une procédure pour un geste unique, c'est payer un
investissement qui ne sera jamais amorti.

---

## Les adresses exactes

Une erreur d'adresse ne produit **aucun message d'erreur**. Le fichier est simplement ignoré, en
silence, et vous chercherez ailleurs.

| Quoi | Où, exactement |
|---|---|
| La charte du projet | `AGENTS.md`, à la racine |
| Une skill | `.github/skills/<nom>/SKILL.md` — **un dossier par skill**, le fichier s'appelle toujours `SKILL.md` |
| Un sous-agent | `.github/agents/<nom>.agent.md` — **un fichier par agent**, extension complète |

> ⚠️ **Côté VS Code, `AGENTS.md` n'est lu que si un réglage l'autorise.** Il est déjà versionné
> dans ce projet (`.vscode/settings.json`, clé `chat.useAgentsMdFile`). Sans lui, Copilot ignore
> la charte **sans rien afficher**.

---

## Ce qui existe déjà dans ce projet, et qui marche

À ouvrir avant d'écrire le vôtre. Ce ne sont pas des maquettes : ça tourne.

| Fichier | Ce que c'est |
|---|---|
| `.github/skills/git-workflow/SKILL.md` | une skill complète, avec une `description` qui se déclenche vraiment |
| `.github/agents/README.md` | le tableau des champs d'un agent Copilot, écrit pour ce projet |

---

## Recontrôler les champs en soixante secondes

**C'est la compétence qui survivra à ces deux jours.** Un tableau de champs périme ; savoir le
recontrôler, non.

**① Demandez à l'outil ce qu'il reconnaît, pas ce qui existe.**

```
Dans cette version de l'outil, quels champs de frontmatter sont réellement
reconnus dans un fichier SKILL.md ? Ne me liste que ceux que tu peux
justifier, et dis-moi explicitement lesquels tu n'es pas sûr de connaître.
```

**② Puis vérifiez pour de vrai : mettez un champ bidon dans un fichier qui marche.**

Ajoutez `couleur-preferee: bleu` dans une skill existante, rechargez, relancez. Si tout continue
comme avant, les champs inconnus sont **ignorés en silence** — ce qui veut dire qu'un champ inventé
ne provoquera jamais d'erreur, et que **l'absence d'erreur ne prouve rien**.

C'est le vrai enseignement : **on ne valide pas un fichier de configuration en constatant qu'il ne
plante pas. On le valide en constatant qu'il agit.**

> ⛔ **Ce qui ne compte jamais comme vérification :** demander à l'assistant « est-ce que tu as
> bien pris en compte mon fichier ? ». Il dira oui, avec une explication technique convaincante,
> qu'il l'ait lu ou non. **On lui tend un piège, on ne lui pose pas la question.**

**③ Les sources officielles**, à recontrôler quand ce dossier aura vieilli :

| | |
|---|---|
| Skills | <https://code.visualstudio.com/docs/agent-customization/agent-skills> |
| Sous-agents | <https://code.visualstudio.com/docs/agent-customization/custom-agents> |
