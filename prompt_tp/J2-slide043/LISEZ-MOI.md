# Du besoin à la fonctionnalité : votre propre spécification

*Jour 2, fin de matinée. **En groupe, autour d'un seul écran.** Copilot en mode Agent.*

**Un seul fichier ici, et c'est volontaire.** Ce cas pratique ne se fait pas chacun dans son coin :
il y a **un écran par groupe**, et plusieurs personnes autour. Tout le monde travaille sur la même
spécification.

| Fichier | Ce qu'il contient |
|---|---|
| `les-trois-phases.md` | les trois demandes, les trois validations, et le lancement d'une tâche |

**Le besoin de départ est déjà dans le premier bloc.** Vous n'avez rien à recopier depuis l'écran :
un seul copier-coller et la phase 1 part.

**Le mode : Agent.** Pas Ask, pas Plan — la raison est expliquée en tête de `les-trois-phases.md`.

## La seule règle

**Les trois validations sont faites par trois personnes différentes.**

Qui fait quoi, c'est vous qui voyez. Mais **ce n'est jamais la même main trois fois de suite**, et
celui qui valide une phase est **celui qui parle**, pas forcément celui qui a le clavier.

## Pourquoi cette règle existe

Sans elle, le plus à l'aise avec l'outil prend le clavier à la deuxième minute et ne le rend plus.
Les autres regardent. **Et ce cas pratique ne porte pas sur la production — il porte sur le fait de
dire non au bon moment.**

## La porte, c'est vous

Dans l'outil qu'on vous a montré ce matin, la validation d'une phase est **un bouton**. Dans le
vôtre, **ce bouton n'existe pas**.

Vous le remplacez par un geste délibéré : **vous relisez, vous complétez, et vous dites
explicitement à l'agent que la phase est validée** avant de lui demander la suivante.

C'est moins confortable. C'est aussi ce qui se transfère : **un bouton qu'on n'a pas ne s'emporte
pas, une discipline si.**

## Ce que vous fabriquez

Trois documents, dans cet ordre, dans un dossier `spec/` que vous créez :

| Phase | Le document | Ce qu'il contient |
|---|---|---|
| **1 · le QUOI** | `spec/exigences.md` | ce que la fonctionnalité doit faire — **et pas une ligne de code** |
| **2 · le COMMENT** | `spec/conception.md` | comment on s'y prend, à partir des exigences validées |
| **3 · les TÂCHES** | `spec/taches.md` | la liste numérotée, chaque tâche traçable vers une exigence |

Puis **une tâche, une seule**, en supervisé — et **vous ouvrez le fichier produit**.

## ⛔ On cadre et on valide. On ne fait pas tout réimplémenter.

Si votre groupe finit la phase 3 et lance **une** tâche, le cas pratique est réussi. **Personne
n'est en retard.**
