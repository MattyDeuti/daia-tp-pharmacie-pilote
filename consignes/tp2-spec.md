# TP 2 — Du besoin à la fonctionnalité, sans sauter d'étape

> ⚠️ **CONSIGNE INCOMPLÈTE À CE JOUR.** La discipline, les portes et la preuve attendue
> ci-dessous sont arrêtées. **Les prompts exacts des trois phases ne le sont pas encore** : ils
> seront ajoutés après le drill du chemin Copilot, et vous les récupérerez en cliquant sur
> « Mettre à jour le TP » au démarrage. Si vous lisez encore cet encadré le jour du cas pratique,
> les prompts vous seront donnés en séance.

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

**Qui mène quoi :**

- **Phase 1** — tout le monde. C'est le moment où l'analyste et le manager pèsent le plus.
- **Phase 2** — les développeurs mènent, les autres challengent.
- **Phase 3** — on vérifie la couverture et la traçabilité **avant** de lancer quoi que ce soit.

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
