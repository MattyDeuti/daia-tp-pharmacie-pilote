# TP 2 — Du besoin à la fonctionnalité, sans sauter d'étape

> 📋 **LES PROMPTS DES TROIS PHASES SONT DANS `prompt_tp/J2-slide043/`.**
> Ce fichier-ci porte la discipline, les portes et la preuve attendue ; les demandes à copier sont
> là-bas, dans `les-trois-phases.md`.
>
> ⚠️ **Ils n'ont pas encore été éprouvés sur la machine de formation.** Le formateur les valide
> avant la séance. **S'il dit autre chose à voix haute le jour J, c'est lui qui a raison** — et
> pensez à cliquer sur « Mettre à jour le TP » au démarrage.

> **L'objectif et les étapes sont à l'écran.** Ce fichier ne porte que ce qui ne s'y projette pas.

---

## Ce que vous fabriquez

Trois documents, dans cet ordre, dans un dossier `spec/` que vous créez :

| Phase | Le document | Ce qu'il contient |
|---|---|---|
| **1 · le QUOI** | `spec/exigences.md` | ce que la fonctionnalité doit faire — **et pas une ligne de code** |
| **2 · le COMMENT** | `spec/conception.md` | comment on s'y prend, à partir des exigences validées |
| **3 · les TÂCHES** | `spec/taches.md` | la liste numérotée, chaque tâche traçable vers une exigence |

## La règle, et c'est tout le cas pratique

**Entre chaque phase, il y a une porte. C'est vous.**

Dans l'outil qu'on vous a montré ce matin, cette porte est un bouton : vous validez un document,
et rien ne s'exécute. **Dans le vôtre, ce bouton n'existe pas.** Vous le remplacez par un geste
délibéré : vous relisez, vous complétez, et vous dites explicitement à l'agent que la phase est
validée avant de lui demander la suivante.

C'est moins confortable. C'est aussi ce qui se transfère : un bouton qu'on n'a pas ne s'emporte
pas, une discipline si.

**Qui tient quoi : trois portes, trois personnes différentes.**

Pas de rôle attribué, pas de métier requis. Vous vous répartissez les trois portes comme vous
voulez — la seule chose qui compte, c'est que **ce ne soit jamais la même main trois fois**.

| Porte | Le geste, et il ne demande pas de lire du code |
|---|---|
| **1 · le QUOI** | Reprenez le besoin de départ **phrase par phrase** : chacune a-t-elle son critère ? Puis lisez un critère en commençant par « je vais devoir prouver que » — si la phrase ne se termine pas, il n'est pas testable. |
| **2 · le COMMENT** | Pour chaque brique proposée, demandez **à quel besoin de la phase 1 elle répond**. Celles qui ne répondent à rien sortent : l'agent propose volontiers la version idéale d'un projet qui n'est pas le vôtre. |
| **3 · les TÂCHES** | Prenez **trois renvois au hasard** et vérifiez que les exigences citées existent vraiment. C'est le geste le plus simple des trois, et celui qui trouve le plus de défauts. |

**Une seule personne tape par groupe, et ce n'est pas toujours la même.** Celui qui tient la porte
de la phase est **celui qui parle**, pas forcément celui qui a le clavier.

## La preuve attendue

Vous avez fini quand vous pouvez montrer **trois fichiers dans `spec/`** et répondre à ces
questions :

1. **Chaque tâche renvoie-t-elle à une exigence ?** Une tâche orpheline est soit du travail
   inventé, soit une exigence qu'on a oublié d'écrire.
2. **Y a-t-il une exigence qu'aucune tâche ne couvre ?** C'est la question inverse, et c'est celle
   qu'on oublie.
3. **Qu'avez-vous corrigé entre la phase 1 et la phase 2 ?** Si la réponse est « rien », vous avez
   probablement franchi la porte sans la tenir.

Puis vous implémentez **une tâche, une seule**, en supervisé — et **vous ouvrez le fichier
produit**. Le compte rendu de l'agent n'est pas une preuve.

## Si ça coince

| Ce que vous voyez | Ce que vous faites |
|---|---|
| **Il se met à coder pendant la phase 1** | Arrêtez-le et redemandez le document seul. Ce débordement est le sujet du module, pas un incident : notez-le. |
| **Il enchaîne les trois phases tout seul** | Même chose. Vous n'avez pas tenu la porte : reprenez à la phase que vous n'avez pas validée. |
| **Vous n'avez pas le temps d'aller au bout** | Les trois documents comptent plus que l'implémentation. Sacrifiez la tâche, jamais une phase. |
