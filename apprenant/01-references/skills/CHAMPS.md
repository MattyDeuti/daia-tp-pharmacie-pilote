# Les champs d'une skill — référence exhaustive

> **Vérifié le 19/08/2026** contre la documentation officielle VS Code.
> **Cette fiche ne couvre que GitHub Copilot dans VS Code** — l'outil de tous les cas pratiques.
> Le lien de contrôle est en bas de page : **allez-y avant de croire ce tableau.**

---

## Anatomie du fichier

```markdown
---
name: audit-legacy
description: "..."
---

# Skill : audit-legacy
La procédure elle-même.
```

Le bloc entre les trois tirets s'appelle le **frontmatter**. C'est la fiche d'identité.
**Les trois tirets font partie du fichier** — sans eux, tout le haut est lu comme du texte
ordinaire et aucun champ n'est pris en compte.

---

## Les six champs — GitHub Copilot / VS Code

| Champ | Obligatoire | Valeurs | Limite | Ce qu'il fait |
|---|---|---|---|---|
| `name` | **oui** | minuscules, chiffres, tirets | **64 car.** | l'identifiant de la skill |
| `description` | **oui** | texte libre | **1024 car.** | **le seul texte lu avant de décider de l'ouvrir** |
| `argument-hint` | non | texte libre | — | l'aide de saisie affichée quand vous l'appelez en `/` |
| `user-invocable` | non | `true` (défaut) / `false` | — | à `false`, elle disparaît du menu `/` |
| `disable-model-invocation` | non | `false` (défaut) / `true` | — | à `true`, elle **ne part plus jamais toute seule** : uniquement en `/` |
| `context` | non | `inline` (défaut) / `fork` | — | ⚠️ **expérimental** — voir plus bas |

### ⛔ Le piège du champ `name`

> **Interdits : les barres obliques, les deux-points, les points, les préfixes de espace de noms.**
> Un caractère invalide provoque un **échec de chargement silencieux**. Aucun message. La skill
> n'existe simplement pas.

`audit-legacy` ✅ · `Audit Legacy` ⛔ · `equipe/audit` ⛔ · `audit.legacy` ⛔

**Et `name` doit être identique au nom du dossier.** C'est la première cause du symptôme
« ma skill n'apparaît pas ».

### 🔬 Le champ `context: fork`

Expérimental, mais il vaut d'être connu parce qu'il **transforme votre skill en sous-agent** :
elle s'exécute dans un contexte dédié, et **seul son résultat final revient** dans votre
conversation.

| | `inline` (défaut) | `fork` |
|---|---|---|
| Où ça s'exécute | dans **votre** conversation | dans un contexte séparé |
| Ce que vous voyez | tout le déroulé | le résultat, c'est tout |
| Effet sur votre contexte | il grossit de tout le travail | il ne prend que le résultat |

**C'est le réglage qui préserve votre fenêtre de contexte** sur une procédure bavarde. Le prix :
vous ne voyez plus comment elle a raisonné, donc vous ne pouvez plus corriger en cours de route.

---

## Où le fichier doit vivre

**Un dossier par skill. Le fichier s'appelle toujours `SKILL.md`, en majuscules.**

```
.github/skills/audit-legacy/SKILL.md
```

| Portée | Emplacements acceptés |
|---|---|
| **Le projet** (versionné, toute l'équipe l'a) | `.github/skills/` · `.claude/skills/` · `.agents/skills/` |
| **Vous seul** (tous vos projets) | `~/.copilot/skills/` · `~/.claude/skills/` · `~/.agents/skills/` |

> **À nom identique, la skill du projet l'emporte sur la vôtre.** C'est voulu : l'équipe prime
> sur l'individu. Et c'est une cause classique de « chez moi ça marche autrement ».

**Dans ce projet, c'est `.github/skills/`.** Un exemplaire qui tourne : `.github/skills/git-workflow/SKILL.md`.

---

## Comment une skill est réellement déclenchée

Trois étages, et c'est ce qui explique tout le reste :

```
   ①  AU DÉMARRAGE
      L'outil charge UNIQUEMENT le `name` et la `description`
      de chaque skill.  Le corps n'est pas lu.
                        |
                        v
   ②  VOUS TAPEZ UNE DEMANDE
      Il compare votre phrase aux `description`.
                        |
              +---------+---------+
              |                   |
         ça correspond        ça ne correspond pas
              |                   |
              v                   v
      il charge le CORPS     elle ne s'ouvre JAMAIS
      entier du SKILL.md     et rien ne vous le signale
              |
              v
   ③  LES FICHIERS ANNEXES
      scripts, modèles, documentation : chargés seulement
      si le corps y renvoie explicitement.
```

**Deux conséquences directes :**

1. **Le corps peut être long, ça ne coûte rien tant que la skill ne part pas.** C'est tout
   l'intérêt par rapport à `AGENTS.md`, qui est payé à chaque conversation.
2. **Une skill excellente avec une mauvaise `description` est une skill qui n'existe pas.** Vous
   aurez un résultat correct — produit par l'agent seul — et vous croirez qu'elle a servi.

---

## L'anatomie d'une `description` qui se déclenche

C'est **90 % du travail**. Celle de `git-workflow`, dans ce projet, part vraiment. Elle empile
cinq briques :

| Brique | Rôle | Extrait réel du projet |
|---|---|---|
| **① L'injonction** | à l'impératif, sans attendre d'être nommée | « À UTILISER SYSTÉMATIQUEMENT POUR TOUTE ACTION GIT, sans attendre qu'on te la nomme » |
| **② Les intentions** | les verbes de ce que veut l'utilisateur | « enregistrer, sauvegarder, publier, envoyer, partager, versionner » |
| **③ Les mots littéraux** | **entre guillemets, vos vrais mots** | « sauvegarde », « publie », « mets sur GitHub », « ouvre une PR » |
| **④ Le périmètre** | ce que la procédure couvre | « le commit, la branche, le push, la pull request, la revue » |
| **⑤ L'interdiction** | ferme la porte de côté | « ne lance jamais `git commit` sans être passé par cette procédure » |

**La brique ③ est celle qu'on oublie, et c'est la plus efficace.** L'outil rapproche votre phrase
de la description. Si vos vrais mots y sont **littéralement**, le rapprochement se fait.

### Le test des deux mois

> Vous revenez sur ce projet dans deux mois. Vous ne vous souvenez ni du nom de la skill, ni de
> son existence. **Quelle phrase tapez-vous ?**
>
> Celle-là va dans la `description`, entre guillemets.

### Trop large, trop étroit

| Description | Ce qui se passe |
|---|---|
| « Aide au développement » | se déclenche sur **tout**, pollue toutes vos conversations |
| « Procédure d'audit de fichier » | ne se déclenche sur **rien** : aucun mot d'utilisateur dedans |
| « Utiliser dès que l'utilisateur veut auditer, analyser ou comprendre un fichier ancien. Mots déclencheurs : "audite", "analyse ce fichier", "qu'est-ce que fait ce code" » | ✅ |

**Vous avez 1024 caractères. Servez-vous-en.** Une description de huit mots est un gâchis.

---

## Le corps du fichier

Chargé **seulement si la description a déclenché**. Donc soyez précis, pas économe.

| Section | Ce qu'on y met |
|---|---|
| **Le principe directeur** | une phrase : à quoi ça sert, dans quel esprit |
| **Les règles non négociables** | ce qui ne se discute pas, à l'impératif |
| **Le déroulé** | des étapes numérotées, dans l'ordre |
| **Le format de sortie** | **la section la plus rentable** : le gabarit exact du livrable |
| **Ce qu'elle ne fait jamais** | les portes fermées |

### Pourquoi le format de sortie est la section la plus rentable

Deux audits produits à quinze jours d'écart ne sont comparables que s'ils ont **les mêmes
rubriques dans le même ordre**. Sans gabarit imposé, chaque exécution réinvente son plan et vous
ne pouvez rien diffuser.

**Posez aussi un plafond** — « dix lignes par rubrique au maximum ». Sans lui, une rubrique mange
tout le rapport.

> ⚠️ **Une forme imposée se remplit toujours.** Lancez votre audit sur un fichier sans test : la
> rubrique « tests » sortira quand même, remplie de quelque chose de plausible. **Écrivez-le
> explicitement** : « si une rubrique n'a rien à dire, écris *sans objet* et passe à la suivante. »

### Les fichiers annexes

Une skill peut être un dossier, pas seulement un fichier :

```
audit-legacy/
├── SKILL.md          <- obligatoire
├── scripts/          <- du code exécutable
├── references/       <- de la documentation longue
└── assets/           <- des modèles, des gabarits
```

**Ils ne sont chargés que si `SKILL.md` y renvoie explicitement**, en lien relatif :
`[le gabarit](./assets/rapport.md)`. Sans le lien, le fichier existe et n'est jamais lu.

C'est le troisième étage de la divulgation progressive — **et c'est là qu'on range ce qui est
volumineux**, pour ne le payer que le jour où ça sert.

---

## Vérifier par vous-même

**① Testez le silence.** Ajoutez `couleur-preferee: bleu` dans une skill qui marche, rechargez,
relancez. Rien ne change : **les champs inconnus sont ignorés sans erreur**. Donc l'absence
d'erreur ne prouve rien.

**② Testez un champ par son effet, jamais par sa présence.** Mettez `user-invocable: false`,
rechargez, tapez `/` : si la skill est toujours listée, le champ n'est pas actif chez vous.

**③ La documentation à jour**, pour ce qui aura changé depuis le 19/08/2026 :

- <https://code.visualstudio.com/docs/agent-customization/agent-skills>

> ⛔ **Ne demandez jamais « as-tu bien pris en compte ma skill ? ».** Il dira oui, avec une
> explication détaillée et convaincante, qu'il l'ait lue ou non. **La preuve, c'est le canari.**
