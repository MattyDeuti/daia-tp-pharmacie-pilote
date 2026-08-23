# La triche

> **MODE : AGENT** · le sélecteur, en haut du panneau Copilot

*À n'ouvrir que si votre procédure ne part pas — et pas avant d'avoir essayé avec vos mots.*

---

## Pourquoi ce fichier existe, et pourquoi il ne faut pas l'ouvrir tout de suite

L'exercice n'est pas d'obtenir un fichier. **L'exercice est d'écrire les deux lignes qui décident
si votre procédure sera trouvée** : à quoi elle sert, et quand elle doit être invoquée. C'est
exactement le champ que l'outil lit — le seul — avant de décider d'ouvrir votre procédure.

Si vous copiez la demande ci-dessous sans avoir essayé, vous obtiendrez un fichier qui marche et
vous n'aurez rien appris de ce que le module cherche à vous montrer. **Essayez d'abord. Ratez, même.
C'est le rattrapage qui enseigne.**

Ouvrez-le si :

- votre procédure ne se déclenche pas quand vous l'appelez sans la nommer, **et** que vous avez
  déjà réécrit votre description une fois ;
- ou si le fichier n'a pas atterri au bon endroit et que vous ne voyez pas pourquoi.

---

## Les trois choses qui font échouer une demande, et personne ne les devine

**① L'adresse.** Une procédure rangée ailleurs que dans `.github/skills/<son-nom>/SKILL.md`
**n'est jamais chargée**. Le fichier existe, il est bien écrit, et il ne sert à rien : le marqueur
ne peut pas ressortir. C'est la panne la plus frustrante, parce que rien ne la signale.

**② Le format.** Un fichier de procédure a un en-tête à champs imposés. Le modèle en invente
volontiers d'autres, qui ont l'air parfaitement plausibles — vus en préparation : `version`,
`author`, `language`, `marker`. **Aucun des quatre n'existe.** Le plus sûr est de lui donner un
modèle à recopier : le projet en contient un, `.github/skills/git-workflow/SKILL.md`.

**③ Le marqueur.** Écrivez `CANARI-` suivi de votre prénom. Si vous laissez `PRENOM`, ça marche
quand même, la preuve est simplement moins individuelle.

---

## Les quatre demandes, complètes

**Remplacez `PRENOM` par votre prénom.**

### 🟦 Développeur — `audit-legacy`

**📋 À COLLER DANS LE PANNEAU**

```
Crée une skill nommée audit-legacy dans le fichier
.github/skills/audit-legacy/SKILL.md, sur le modèle de
.github/skills/git-workflow/SKILL.md : même frontmatter, avec
seulement name, description, argument-hint et user-invocable.
Elle produit l'audit d'un fichier de code ancien : six rubriques
imposées et toujours dans le même ordre (sécurité, robustesse,
lisibilité, tests, dette, priorités), en français, dix lignes par
rubrique au maximum.
Décris-la de façon qu'elle se déclenche quand on demande d'auditer,
de relire ou d'expliquer un fichier ancien, sans la nommer.
Fais-lui commencer chaque livrable par la ligne exacte CANARI-PRENOM.
```

### 🟥 Testeur / QA — `jeu-de-tests`

**📋 À COLLER DANS LE PANNEAU**

```
Crée une skill nommée jeu-de-tests dans le fichier
.github/skills/jeu-de-tests/SKILL.md, sur le modèle de
.github/skills/git-workflow/SKILL.md : même frontmatter, avec
seulement name, description, argument-hint et user-invocable.
Elle écrit pour chaque méthode publique exactement trois cas : un cas
nominal, un cas limite et un cas d'erreur, chacun au format
Étant donné / Quand / Alors, en français.
Décris-la de façon qu'elle se déclenche quand on demande des tests
ou des cas de test, sans la nommer.
Fais-lui commencer chaque livrable par la ligne exacte CANARI-PRENOM.
```

### 🟨 Analyste — `demande-utilisateur`

**📋 À COLLER DANS LE PANNEAU**

```
Crée une skill nommée demande-utilisateur dans le fichier
.github/skills/demande-utilisateur/SKILL.md, sur le modèle de
.github/skills/git-workflow/SKILL.md : même frontmatter, avec
seulement name, description, argument-hint et user-invocable.
Elle rédige une demande au format « en tant que, je veux, afin de »,
suivie de ses critères d'acceptation, en français et sans aucun
terme technique.
Décris-la de façon qu'elle se déclenche quand on demande de rédiger
un besoin, une demande ou une user story, sans la nommer.
Fais-lui commencer chaque livrable par la ligne exacte CANARI-PRENOM.
```

### 🟩 Manager — `synthese-comite`

**📋 À COLLER DANS LE PANNEAU**

```
Crée une skill nommée synthese-comite dans le fichier
.github/skills/synthese-comite/SKILL.md, sur le modèle de
.github/skills/git-workflow/SKILL.md : même frontmatter, avec
seulement name, description, argument-hint et user-invocable.
Elle rédige une synthèse de quinze lignes maximum pour un comité de
pilotage : la dette constatée, l'effort estimé, et la décision
demandée au comité. Pas de jargon technique, pas d'introduction,
pas de conclusion.
Décris-la de façon qu'elle se déclenche quand on demande une synthèse
ou une note pour un comité, sans la nommer.
Fais-lui commencer chaque livrable par la ligne exacte CANARI-PRENOM.
```

---

## Après avoir triché, faites quand même la comparaison

Ouvrez le fichier obtenu et lisez **la ligne `description`**. Comparez-la à celle que vous aviez
écrite vous-même.

**C'est là qu'est la leçon du créneau**, et elle vaut mieux que le fichier : une procédure ne se
déclenche pas parce qu'elle est bien faite, elle se déclenche parce qu'elle est **bien annoncée**.
