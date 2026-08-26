# Les prompts des démonstrations

> **Fiche de cadrage — aucun prompt à coller ici.**

**Tout ce qui est tapé à l'écran pendant les démonstrations des deux jours, prêt à copier.**

Ce dossier ne contient **que le texte des demandes** — pas le déroulé, pas les réponses attendues.
Il sert pendant la séance, et il sert après : si vous voulez rejouer une démonstration chez vous,
la demande exacte est ici.

> 🔄 **Numéros de slide remis à jour le 23/08** sur les decks de journée v2 (jour 1 : 208 slides ·
> jour 2 : 295). Les horaires ci-dessous sont ceux du conducteur v1 et **ne valent plus** : le
> déroulé v2 a rebâti le minutage. Ils seront repris avec le conducteur v2.

## Où est quoi

| Slide | La démonstration | Le fichier |
|---|---|---|
| **J1 · 72** | Un besoin, deux outils | `J1-slide072-demo1.md` |
| **J1 · 175** | Le legacy sous audit | `J1-slide175-demo3.md` |
| **J2 · 29** | Une spécification de bout en bout | `J2-slide029-demo4.md` |
| **J2 · 95** | Mémoire et coûts, en direct | `J2-slide095-demo5.md` |
| **J2 · 136** | La brigade — *cold open, lancé sans un mot* | `J2-slide136-demo6.md` |
| **J2 · 166** | Un déclencheur, chez Copilot — *bonus* | `J2-slide166-bonus-hook.md` |
| **J2 · 180** | Brancher un accès, et le prouver | `J2-slide180-demo7.md` |
| **J2 · 232** | **L'index, montré pour de vrai** | `J2-slide232-demo9.md` |

**Le bonus du déclencheur n'est pas au conducteur.** C'est deux minutes, à sortir seulement si la
brique 4 appelle une démonstration. Il est livré désarmé et ne coûte aucun crédit.

**Deux démonstrations sont sorties du déroulé v2** et vivent dans `_retires/` : *Un parle, l'autre
fait* (fusionnée avec son cas pratique) et *Le rejeu de la brigade* (parti avec les sous-agents,
remontés au module 6). Rien n'est supprimé.

## La dernière n'a pas la même préparation que les autres

**`J2-slide232-demo9.md` demande deux gestes avant d'ouvrir la bouche** : armer le fichier, et
laisser des modifications non publiées dans le dépôt. Les deux sont expliqués dans
`formateur/demo-index/LISEZ-MOI.md`. Le déroulé minuté, lui, vit **hors du dépôt**, côté
formateur : `Big Training/demos/J2-slide232-DEMO09-lindex-montre-pour-de-vrai.md`.

C'est aussi la seule qui tourne sur un **autre modèle** — Gemini 3.5 Flash, avec Sonnet en repli.

## Le nom du fichier

Il porte **le numéro de la slide** qui ouvre la démonstration. C'est la même convention que
`apprenant/prompt_tp/`, où se trouvent les demandes des cas pratiques — à ceci près que les
dossiers des cas pratiques sont, eux, **vérifiés à chaque livraison** par le contrôle des repères.
Ici, le numéro est tenu à la main : s'il diverge, c'est un défaut.

## Pourquoi ces textes sont dans le dépôt

**Parce qu'un copier-coller depuis l'extérieur de la machine se perd.** Ici, le texte est déjà
dans le projet : on l'ouvre dans l'éditeur, on copie, on colle dans le panneau — sans jamais
sortir de la machine.

C'est la même raison qui met les demandes des cas pratiques dans `apprenant/prompt_tp/` plutôt que
sur une slide à recopier à la main.

## Une règle qui vaut pour tous ces textes

**Ils se collent tels quels.** Les précisions qui ont l'air superflues — le chemin complet d'un
fichier, le nom d'un serveur, un marqueur à écrire en tête de rapport — sont là parce que sans
elles le résultat change. C'est vrai pour vous comme pour la démonstration.

## Le bandeau, et les quatre marqueurs

Chaque fiche s'ouvre sur **un bandeau qui dit dans quel mode il faut être**, juste sous le titre.

**Et dans ces fiches, un bloc de code veut dire une seule chose : ça se copie.** Il s'affiche en
vert, et le marqueur au-dessus dit où ça va — **📋** le panneau · **📝** un fichier du projet ·
**🌐** le navigateur · **⌨️** le terminal.

**Ce qui ne se copie pas n'est plus dans un bloc** : les raccourcis clavier sont en gras, les
chemins à l'écran et les sorties système sont en tableau. En séance, on ne cherche plus le prompt
au milieu du texte — **c'est le seul vert de la page**.
