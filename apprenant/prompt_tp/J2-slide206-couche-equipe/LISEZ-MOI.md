# La couche de l'équipe, en quatre briques

> **MODE : AGENT** · le sélecteur, en haut du panneau Copilot

*Jour 2, fin d'après-midi. **25 minutes.** Le seul cas pratique collectif des deux jours — et
pourtant chacun travaille sur son poste, avec sa propre branche. Copilot, plus le navigateur pour
la mise en commun.*

## Avant tout : le projet sur votre poste

**Si le projet n'est pas encore sur votre machine** — ouvrez VS Code, `Terminal` → `Nouveau
terminal`, et collez **cette ligne**. Peu importe d'où vous la tapez, le chemin est absolu.

```
git clone https://github.com/MattyDeuti/daia-tp-pharmacie-pilote.git C:\Work\daia-tp-pharmacie-pilote; code C:\Work\daia-tp-pharmacie-pilote
```

Elle récupère le projet **et** ouvre VS Code au bon endroit — vous n'avez aucun dossier à créer,
et aucun `Ouvrir le dossier…` à faire.

**Vous êtes au bon endroit quand** l'explorateur, à gauche, affiche **`DAIA-TP-PHARMACIE-PILOTE`**
tout en haut — et juste en dessous, sans rien déplier : `.github`, `.vscode`, `apprenant`, `src`,
et un fichier `AGENTS.md`.

> **Si le projet est déjà là**, une seule ligne suffit, dans le dossier du projet : `git pull`.
>
> **Si le terminal répond `code n'est pas reconnu`** : le clone a quand même marché. Faites
> `Fichier` → `Ouvrir le dossier…` → `C:\Work\daia-tp-pharmacie-pilote`.
>
> **Si `C:\Work` est refusé** (`Access is denied`), remplacez les deux `C:\Work` par `$HOME`.

> ⚠️ **Le clone ne demande aucun compte** — le projet est public en lecture. C'est **publier** qui
> en demande un. Si `gh auth login` n'est pas encore fait, c'est dans
> `apprenant/consignes/preparation-dernier-tp.md`, et ça se fait **avant** le cas pratique.

---

**Vous choisissez votre brique, et vous choisissez ce que vous mettez dedans.** Prenez celle qui
vous servira lundi matin.

Chaque fichier de ce dossier propose un sujet tout prêt. **Ce n'est pas une consigne, c'est un
filet** : si rien ne vous vient en trente secondes, prenez celui qui est écrit et avancez. Sinon,
le sujet est le vôtre — votre dépôt, vos contraintes, ce qui vous encombre vraiment.

Aucune brique n'exige le métier qui lui a donné son nom, et **les deux dernières ne demandent pas
une ligne de code**.

| Le fichier à ouvrir | La brique | La voie | Sa preuve |
|---|---|---|---|
| `brique-1-agent-de-revue.md` | un relecteur en lecture seule | **1** — vous voyez les champs | il relit `AGENTS.md` et **ne l'a pas modifié** |
| `brique-2-procedure-de-tests.md` | une skill qui génère les tests | **2** — en français | **le canari** dans le fichier produit |
| `brique-3-regles-metier.md` | la section 2 de la charte | **2** — en français | la règle tient face au piège, **et il cite `RM-<prénom>`** |
| `brique-4-gouvernance.md` | la section 3 de la charte | **2** — en français | il **refuse en citant `RG-<prénom>`** |

## Votre branche, vous n'avez pas à vous en occuper

**Vous n'en créez aucune et vous n'en choisissez pas le nom.** Au moment de publier, l'outil la
crée pour vous et la nomme `travail-<votre identifiant GitHub>` — donc un nom unique, qui dit à
qui appartient le travail. Vous n'avez aucune commande à taper.

**La seule chose qui doit être vraie, c'est que vous soyez connecté à GitHub.** Si vous ne l'êtes
pas, l'outil s'arrêtera avant d'avoir rien fait et vous dira quoi lancer. C'est ce qui a manqué au
pilote : sur neuf personnes, trois seulement avaient réussi à publier, et deux s'étaient heurtées
à un refus d'accès. **Si ce message apparaît, dites-le tout de suite** — ça ne dépend pas de vous.

## Les deux voies, et personne ne corrigera votre choix

- **Voie 1** — vous écrivez le fichier vous-même, parce que vous voulez **voir les champs**
- **Voie 2** — vous décrivez en français ce que vous voulez

C'est une préférence, pas une compétence. **Ce que vous choisissez raconte votre rapport à
l'outil**, et c'est le sujet du débrief.

## ⛔ Ce qui ne compte jamais comme preuve

**Demander à l'agent s'il a bien lu la charte.** Il répondra oui, avec une explication détaillée et
convaincante, qu'il ait lu ou non.

**On ne prend pas un agent au mot. On lui tend un piège et on regarde ce qu'il fait.** Chaque brique
a le sien, et il est écrit dans son fichier.

## Le geste commun aux quatre — publier

Quand votre brique est prête **et prouvée**, une seule phrase, la même pour tout le monde :

**📋 À COLLER DANS LE PANNEAU**

```
sauvegarde et publie mon travail
```

**Personne ne tape de commande.** L'outil se saisit tout seul de la procédure qui est dans le
projet — personne ne l'a installée, elle était dans le dossier qu'on vous a donné.

Ce qu'il va faire : il crée votre branche et s'y place, il vous montre ce qu'il s'apprête à
enregistrer, **il demande votre validation et il attend**, puis il pousse et propose la mise en
commun.

**Ce que vous gardez, c'est la validation. Lisez avant de dire oui : c'est votre porte.**

> **Le dépôt de destination est déjà celui de votre projet.** Vous n'avez aucune adresse à saisir.

## Ce que vous postez dans le chat

**Le nom de la branche que l'outil a créée.** Rien d'autre — il commence par `travail-`.

C'est la trace du cas pratique : elle prouve que votre travail est parti, elle se lit en un coup
d'œil, et elle ne demande à personne de partager son écran.

## Le point de synchronisation

**Tant que tout le monde n'a pas publié, personne ne peut fusionner.** C'est la première fois de
ces deux jours que vous dépendez les uns des autres — et c'est exactement à ça que sert un dépôt
partagé.

## Si vous avez décroché dix minutes

Reprenez ici, dans cet ordre, et rien n'est perdu :

1. **Choisissez une brique** dans le tableau ci-dessus — les deux dernières sont les plus rapides à reprendre, elles ne demandent pas une ligne de code
2. **Votre branche** n'est pas votre affaire : l'outil la crée au moment de publier
3. **Ouvrez le fichier de votre brique** dans ce dossier : il contient le sujet, la demande et la preuve
4. **Publiez** avec la phrase ci-dessus, et postez le nom de la branche qu'il a créée

Vous n'avez besoin de rien de ce qui s'est dit pendant votre absence.
