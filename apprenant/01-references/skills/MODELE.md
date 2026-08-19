# Squelettes de skill — à copier

> Trois modèles, du plus court au plus complet. **Commencez par le minimal** : il suffit dans
> neuf cas sur dix, et les champs en trop sont autant d'occasions de se tromper.
>
> Adresse : `.github/skills/<le-nom>/SKILL.md` — **le dossier porte le nom, le fichier s'appelle
> toujours `SKILL.md`.**

---

## ① Le minimal — deux champs, et ça marche

```markdown
---
name: audit-legacy
description: "Utiliser dès que l'utilisateur veut auditer, analyser, examiner ou comprendre un fichier de code ancien. Mots qui doivent la déclencher : « audite », « analyse ce fichier », « qu'est-ce que fait ce code », « fais le point sur ». Produit un rapport à six rubriques toujours dans le même ordre."
---

# Skill : audit-legacy

## Principe
Tu produis toujours le même rapport, dans le même ordre, quel que soit le fichier.
Un rapport comparable vaut mieux qu'un rapport exhaustif.

## Règles non négociables
- **Tu ne modifies aucun fichier.** Tu constates, tu ne corriges pas.
- **Si une rubrique n'a rien à dire, tu écris « sans objet »** et tu passes à la suivante.
- **Dix lignes maximum par rubrique.**
- Tu écris en français, pour quelqu'un qui ne programme pas.

## Format de sortie — imposé
1. À quoi sert ce fichier
2. Ce qui peut casser
3. Ce qui est dupliqué
4. Ce qui n'est pas testé
5. Dette technique
6. Par quoi commencer — un seul point, et pourquoi celui-là

## Ce que tu ne fais jamais
- Proposer de corriger toi-même.
- Annoncer un test comme passé sans en montrer la sortie réelle.
```

**Deux champs suffisent.** Tout le reste du fichier est de la procédure, pas de la configuration.

---

## ② Le complet — les six champs

```markdown
---
name: audit-legacy
description: "..."
argument-hint: "le chemin du fichier à auditer"
user-invocable: true
disable-model-invocation: false
context: inline
---
```

| Ce que vous réglez | Le cas où vous y touchez |
|---|---|
| `argument-hint` | vous voulez qu'on sache quoi lui passer quand on tape `/audit-legacy` |
| `user-invocable: false` | la skill est un rouage interne, vous ne voulez pas la voir dans le menu `/` |
| `disable-model-invocation: true` | ⚠️ **elle ne partira plus jamais toute seule.** Uniquement en `/` |
| `context: fork` | la procédure est bavarde et vous voulez **protéger votre contexte** |

> ⛔ **`disable-model-invocation: true` annule tout l'intérêt d'une skill** si vous ne le voulez
> pas explicitement. Réservez-le aux procédures dangereuses qu'on ne doit jamais déclencher par
> accident.

---

## ③ Le modèle « procédure » — à remplir

Copiez, remplacez ce qui est entre chevrons, supprimez les commentaires.

```markdown
---
name: <nom-en-minuscules-avec-tirets>
description: "Utiliser dès que l'utilisateur veut <INTENTION 1>, <INTENTION 2> ou <INTENTION 3>. Mots qui doivent la déclencher : « <VOTRE MOT 1> », « <VOTRE MOT 2> », « <VOTRE PHRASE ENTIÈRE> ». Produit <LE LIVRABLE, en une ligne>. Ne jamais <L'INTERDICTION> sans passer par cette procédure."
argument-hint: "<ce qu'on lui passe>"
---

# Skill : <nom>

## Principe
<Une phrase. À quoi ça sert et dans quel esprit.>

## Règles non négociables
- **<La règle qui ne se discute pas.>**
- **Si une rubrique n'a rien à dire, écris « sans objet ».**
- **<Le plafond : N lignes par section.>**

## Déroulé
1. <Première étape.>
2. <Deuxième étape.>
3. <Troisième étape.>

## Format de sortie — imposé
<Le gabarit exact. C'est la section la plus rentable du fichier.>

## Ce que tu ne fais jamais
- <La porte fermée.>
- Prétendre avoir fait quelque chose sans en montrer la preuve réelle.
```

---

## Le canari — pendant les cas pratiques

Tant que vous êtes en formation, ajoutez cette ligne dans **Règles non négociables** :

```
- **Commence chaque livrable par la ligne exacte : CANARI-<VOTREPRENOM>**
```

**Remplacez `<VOTREPRENOM>` par votre prénom, en clair.** Si vous écrivez « ton prénom »,
l'assistant comprend que ça désigne **le sien** et vous obtiendrez `CANARI-GitHub Copilot`.

C'est **la seule preuve** que la skill a été ouverte. Un livrable correct sans canari signifie
qu'elle n'a jamais servi.

> **Retirez-le avant de publier** une skill destinée à durer. Un canari en production, c'est une
> ligne parasite en tête de chaque rapport.

---

## Les trois gestes après avoir écrit le fichier

| Ordre | Le geste | Sans lui |
|---|---|---|
| **1** | vérifier que `name` == nom du dossier | la skill ne charge pas |
| **2** | **recharger la fenêtre** — `Ctrl + Maj + P` -> `Developer: Reload Window` | l'outil ne l'a pas encore vue |
| **3** | déclencher **sans la nommer**, puis chercher le canari | vous ne savez pas si elle sert |

**L'étape 3 est le vrai test.** Si vous devez taper `/audit-legacy` pour qu'elle parte, votre
`description` est à réécrire — pas votre procédure.
