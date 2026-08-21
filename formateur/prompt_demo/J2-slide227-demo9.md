# Démo 9 · L'index, montré pour de vrai

*Jour 2, fin d'après-midi · slide 227 · **Gemini 3.5 Flash**, session neuve, à la racine du kit ·
repli : Sonnet, même projet, même fichier*

> **Avant d'ouvrir la bouche : le fichier est-il armé ?**
> `Copy-Item formateur\demo-index\AGENTS.md AGENTS.md -Force`, puis *Reload Window*, puis
> **conversation neuve**. Le mode d'emploi complet est dans `formateur/demo-index/LISEZ-MOI.md`.
>
> **Et le dépôt doit avoir des modifications non publiées** — trois lignes changées quelque part
> dans le code, pas enregistrées. Sinon le temps 3 n'a rien à résumer.

---

## Temps 1 · le fichier, à l'écran

**Rien à taper.** On ouvre `AGENTS.md` à la racine et on descend dedans en le commentant : le
canari en tête, le contexte, les trois règles dures, l'index. Trois minutes.

La phrase à lire à voix haute, elle est écrite dans le fichier :

> *Ce fichier ne sait rien faire. Il sait où sont ceux qui savent.*

---

## Temps 2 · le canari, au premier message

**Une question quelconque. C'est tout l'intérêt : on ne demande rien de spécial.**

```
Bonjour. En deux phrases, ce projet sert à quoi ?
```

**Ce qu'on attend :** la réponse commence par `CHARTE-PHARMASTOCK-LUE`, seule sur sa ligne.

⛔ **Ne pas demander « as-tu lu la charte ? ».** C'est exactement ce qu'on a interdit à la salle
pendant deux jours.

---

## Temps 3 · la demande banale

**Le sommet de la démonstration. Cette phrase se colle telle quelle, sans un mot de plus.**

```
Fais le point sur ce qui a changé, et prépare-moi de quoi le présenter
à l'équipe demain matin.
```

> **Relisez-la avant de l'envoyer : il n'y a aucun nom propre dedans.** Ni le nom du fichier, ni
> celui de la procédure, ni celui de l'agent. C'est ce qui donne son sens à la punchline qui suit.

**Ce qu'on attend, dans cet ordre, et c'est la preuve :**

| | Ce qui doit apparaître |
|---|---|
| 1 | `CHARTE-PHARMASTOCK-LUE` |
| 2 | l'annonce des fichiers ouverts, **avec leur chemin** |
| 3 | `PROCEDURE-RESUME-APPLIQUEE`, puis le tableau |
| 4 | `AGENT-TRADUCTEUR-METIER`, puis la version métier |

**Le geste de preuve :** on remonte le fil et on montre les trois marqueurs dans l'ordre. Puis on
se tait.

---

## Temps 4 · le contre-exemple

**Annoncer AVANT de l'envoyer qu'on attend que rien ne se déclenche.** Sinon la salle croit à un
raté.

```
Il faut qu'on migre la base vers un autre moteur. Par où on commence ?
```

**Ce qu'on attend :** le canari sort — le fichier a bien été relu — **et rien d'autre ne se
déclenche.** Ni procédure, ni agent. Il répond de lui-même, comme n'importe quel assistant.

Puis on remonte dans `AGENTS.md`, à la section **« Ce qui n'est pas dans l'index »**, et on la lit
à l'écran. **Le fichier avait annoncé ce comportement.**

---

## Temps 5 · la bascule

**Rien à taper, et la meilleure preuve est derrière eux.**

Il y a vingt-cinq minutes, toute la salle a tapé `sauvegarde et publie mon travail` — et une
procédure que **personne n'avait installée** s'est saisie du travail sur chaque poste. Elle était
dans le dossier qu'on leur a donné : `.github/skills/git-workflow/SKILL.md`.

C'est ça, la bascule, et ils l'ont déjà vécue sans la nommer.

---

## Temps 6 · le clear qui ne coûte rien

**Montrer la jauge de contexte AVANT.** Sans le chiffre à l'écran, le moment ne prouve rien.

```
/clear
```

**Montrer la jauge APRÈS.** Puis recoller **exactement** la demande du temps 3, mot pour mot :

```
Fais le point sur ce qui a changé, et prépare-moi de quoi le présenter
à l'équipe demain matin.
```

**Ce qu'on attend :** les trois marqueurs reviennent, dans le même ordre. Comportement identique,
avec une fraction du contexte.

---

## Après — désarmer, tout de suite

```powershell
git checkout -- AGENTS.md
git status
```

**Le `AGENTS.md` de la racine ne doit jamais partir dans un commit :** c'est le squelette que les
apprenants remplissent.
