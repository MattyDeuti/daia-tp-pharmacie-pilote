# Ma skill ne part pas — le diagnostic

> **Le symptôme est toujours le même** : vous demandez quelque chose, vous obtenez une réponse
> correcte, et **le canari n'y est pas**. L'agent a fait le travail lui-même, bien, sans jamais
> ouvrir votre procédure.
>
> **Une réponse correcte n'est pas une preuve.** C'est le piège central de ce module.

---

## L'arbre, dans cet ordre

Ne sautez pas d'étape : les causes sont classées par fréquence réelle, pas par gravité.

```
Le canari n'apparaît pas
        |
        v
① Avez-vous rechargé la fenêtre depuis que le fichier existe ?
   NON -> Ctrl+Maj+P -> Developer: Reload Window.  C'est fini 9 fois sur 10.
   OUI |
       v
② La skill apparaît-elle quand vous tapez « / » dans le chat ?
   NON -> le fichier n'est pas chargé : voir « Elle n'existe pas » ci-dessous
   OUI |
       v
③ Elle part si vous l'appelez explicitement par « /nom » ?
   NON -> le fichier est trouvé mais son corps échoue : voir « Elle part et ne fait rien »
   OUI |
       v
④ Elle est trouvée et elle marche. C'est donc la DESCRIPTION.
   -> voir « Elle existe et ne part pas toute seule »
```

---

## Cas A — « Elle n'existe pas » *(absente du menu `/`)*

Le fichier n'est pas chargé du tout. Cinq causes, par fréquence :

| # | La cause | Le contrôle |
|---|---|---|
| **1** | **`name` ≠ nom du dossier** | `.github/skills/audit-legacy/` doit contenir `name: audit-legacy` |
| **2** | **Caractère interdit dans `name`** | pas de `/`, `:`, `.`, ni d'espace, ni de majuscule, ni d'accent |
| **3** | **Le fichier n'est pas `SKILL.md`** | en majuscules, exactement. Pas `Skill.md`, pas `audit-legacy.md` |
| **4** | **Pas de dossier intermédiaire** | c'est `skills/audit-legacy/SKILL.md`, pas `skills/SKILL.md` |
| **5** | **`user-invocable: false`** | vous l'avez rendue invisible vous-même |

> ⛔ **Aucune de ces cinq erreurs ne produit de message.** Le chargement échoue **en silence**.
> C'est pour ça qu'on ne cherche pas une faute de frappe : on relit la liste.

**Le contrôle qui tranche en dix secondes :** dupliquez `.github/skills/git-workflow/`, renommez
le dossier, changez `name` en conséquence, rechargez. Si la copie apparaît et pas la vôtre, le
problème est dans votre fichier, pas dans votre installation.

---

## Cas B — « Elle existe et ne part pas toute seule » *(le cas le plus fréquent)*

Elle est dans le menu `/`, elle marche quand vous la nommez, mais elle ne se déclenche jamais
d'elle-même. **Votre `description` ne contient pas vos mots.**

| Ce que vous avez écrit | Ce qu'il faut écrire |
|---|---|
| « Procédure d'audit de fichier » | « Utiliser dès que l'utilisateur veut auditer, analyser ou comprendre un fichier ancien. Mots déclencheurs : "audite", "analyse ce fichier", "qu'est-ce que fait ce code" » |
| « Génère des tests » | « Utiliser dès qu'on demande d'écrire, générer, compléter ou couvrir des tests. Mots : "écris des tests", "teste cette méthode", "couvre ce fichier" » |

**Les trois corrections, dans l'ordre d'efficacité :**

1. **Ajoutez vos mots littéraux entre guillemets.** C'est la correction qui règle la majorité des
   cas à elle seule.
2. **Commencez par une injonction à l'impératif** : « À utiliser dès que… », « Déclenche-toi
   quand… ». Une description descriptive se déclenche moins qu'une description impérative.
3. **Servez-vous des 1024 caractères.** Une description de huit mots est un gâchis.

> **Le test des deux mois** : vous revenez sur ce projet dans deux mois, vous avez oublié
> l'existence de la skill. Quelle phrase tapez-vous ? **Celle-là va dans la description.**

### La cause n°2, plus vicieuse : la tâche a l'air banale

Même avec une bonne description, **si la demande semble triviale, l'agent fait le travail
lui-même** plutôt que d'aller chercher une procédure. C'est un arbitrage de sa part, pas un bug.

**La parade** : renforcez l'injonction dans la description — « SYSTÉMATIQUEMENT », « sans
exception », « même si la tâche paraît simple » — et ajoutez une interdiction explicite :
« ne produis jamais d'audit sans passer par cette procédure ».

### La cause n°3 : `disable-model-invocation: true`

Vous l'avez mis, et il fait exactement ce qu'il annonce : **plus aucun déclenchement automatique.**
Enlevez-le.

---

## Cas C — « Elle part et ne fait rien de ce que j'ai demandé »

Le corps est chargé, mais il n'est pas suivi.

| Symptôme | Cause | Correction |
|---|---|---|
| Les rubriques ne sont pas dans l'ordre | pas de gabarit imposé | écrivez le **format de sortie** exact |
| Une rubrique mange tout le rapport | pas de plafond | « dix lignes maximum par rubrique » |
| Des rubriques inventées se remplissent | **une forme imposée se remplit toujours** | « si une rubrique n'a rien à dire, écris *sans objet* » |
| Les règles sautent en fin de conversation | le contexte est saturé | `/clear`, puis relancez |
| Un petit modèle ignore les consignes | les modèles légers suivent mal les règles | testez sur un modèle plus capable avant de conclure |

> ⚠️ **Le dernier point mérite un test avant tout diagnostic.** Un même fichier peut être
> parfaitement suivi par un modèle et ignoré par un autre. **Ce n'est pas votre fichier qui est
> en cause, c'est le modèle.** Changez-en une fois avant de réécrire quoi que ce soit.

---

## Cas D — elle se déclenche **trop**

Elle part sur des demandes qui n'ont rien à voir et pollue vos conversations.

| Correction | Effet |
|---|---|
| **Restreignez la description** | enlevez les verbes trop généraux : « aider », « améliorer », « travailler » |
| **Nommez ce qu'elle ne couvre pas** | « Ne pas utiliser pour les fichiers de configuration ni pour la documentation. » |
| **`disable-model-invocation: true`** | la solution radicale : elle ne part plus qu'en `/` |

---

## Ce qui ne compte jamais comme preuve

| | |
|---|---|
| « skill appliquée » écrit dans le chat | ⛔ **rien** |
| Vous demandez « tu as bien utilisé ma skill ? », il dit oui | ⛔ **rien** |
| Le livrable est excellent | ⛔ **rien** — l'agent sait faire sans vous |
| **Le canari est en première ligne du livrable** | ✅ **c'est la seule preuve** |

> **On ne prend pas un agent au mot. On lui tend un piège et on regarde ce qu'il fait.**

---

## Les deux réflexes qui débloquent le plus vite

1. **Rechargez la fenêtre.** Neuf fois sur dix.
2. **Dupliquez une skill qui marche** et modifiez-la, plutôt que d'écrire depuis zéro. Le fichier
   `.github/skills/git-workflow/SKILL.md` de ce projet est un exemplaire qui tourne : il vous
   donne une base dont vous savez qu'elle charge.
