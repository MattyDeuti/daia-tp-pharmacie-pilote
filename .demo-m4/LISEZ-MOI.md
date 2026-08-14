# `.demo-m4/` — le support de la démonstration du formateur

**Ce dossier n'est pas un exercice.** Vous n'avez rien à y faire, rien à y écrire, rien à en
retirer. Il contient ce que le formateur projette pendant la démonstration du jour 2 sur la
spécification, et il est livré avec le kit pour qu'il l'ait sous la main.

Vous pouvez l'ouvrir et le lire si le sujet vous intéresse — c'est tout.

| Fichier | Ce que c'est |
|---|---|
| `requirements.md` | **le QUOI** — 6 exigences, avec leurs critères d'acceptation |
| `design.md` | **le COMMENT** — architecture, modèle de données, algorithmes |
| `tasks.md` | **QUI FAIT QUOI, DANS QUEL ORDRE** — 31 tâches en 8 phases |
| `.config.kiro` | l'identifiant technique de la spécification d'origine |

## Ce qu'il faut savoir si vous le lisez

Chaque tâche porte le renvoi vers les exigences qu'elle sert :

```
- [ ] 3. Créer la classe Lot (model/Lot.java)
  - _Exigences : 1.7, 3.5_
```

**C'est ça, la traçabilité** : on part d'une tâche, on remonte à l'exigence, et on vérifie qu'elle
existe et qu'elle dit bien ce que la tâche prétend. Ça se fait **sans lire une ligne de code**.

## Note pour le formateur

Ces documents sont **inertes**, et c'est volontaire : ils ne sont **pas** sous `.kiro/specs/`, donc
aucun outil ne les verra comme une spécification exécutable. Rien ici ne peut être lancé, et rien
ne peut réécrire le code du projet.

**C'est la précaution qui compte.** Ces 31 tâches reconstruisent `GestionStock.java` et
`schema_extensions.sql` — le legacy du kit **a été produit par cette spécification**. Vivante dans
le dépôt de travail, un « lancer toutes les tâches » réécrirait le support de tous les autres
modules.

**Pour les rendre manipulables** — clic sur les portes, lancement d'une tâche — il faut les
recopier sous `.kiro/specs/gestion-stock-pharmacie/` dans une **copie jetable du kit**, jamais dans
le dépôt de la salle. Le `.config.kiro` est là pour ça.

**Origine** : produits le 14/08/2026 dans Kiro, flux *requirements-first*, modèle MiniMax M2.1.
**22 min 40 s et 6,82 crédits** — d'où l'intérêt de les garder plutôt que de les refaire.
La version d'origine reste sur la branche `spec-demo-m4`, hors de `main`.
