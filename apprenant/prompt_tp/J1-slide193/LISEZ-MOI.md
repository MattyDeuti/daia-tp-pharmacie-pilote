# Auditer la base existante, chacun depuis son rôle

*Jour 1, milieu d'après-midi. Chacun sur son poste. **Copilot en mode Agent.***

Un fichier par rôle. **Ouvrez celui du vôtre, et un seul.** Si vous ne vous reconnaissez dans
aucun des quatre, prenez **celui dont vous validez les livrables au quotidien**.

| Fichier | Pour qui | Ce qu'il valide dans la fiche d'audit |
|---|---|---|
| `developpeur.md` | Développeur | **par quoi on commencerait** |
| `testeur-qa.md` | Testeur ou QA | **ce qui serait testable**, et comment |
| `analyste.md` | Analyste | **la couverture** — ce qui manque, pas ce qui est là |
| `manager.md` | Manager | **ce qui remonte, et ce qui se décide** |

**Personne ne fait le travail d'un autre.** C'est ce qui rendra la confrontation avec votre voisin
utile, tout à l'heure.

## L'audit se produit tout seul. C'est sa LECTURE qui est le travail.

Vous ne validez pas du code. **Vous validez que ce qui a été trouvé couvre ce qui compte.** C'est
votre métier, pas celui de la machine.

La production prend dix minutes et part toute seule. Ce qui prend du temps, c'est de trouver, dans
une fiche parfaitement crédible, **les deux endroits où elle ne l'est pas**. La production est le
prétexte ; la lecture est la compétence.

## ⛔ On audite, on ne fait pas réimplémenter

**Vous ne lui demandez jamais de corriger le code.** Pas pendant ce cas pratique.

Ce n'est pas une question de sécurité : une demande de correction, c'est **un chantier**, et un
chantier coûte cher — en temps, et en consommation, pour tout le monde dans la salle.

## Le geste à ne pas sauter

**Avant de commencer, une conversation neuve : tapez `/clear`.**

Ce n'est pas une politesse. Sans ça, votre audit répondra en se souvenant de la question que vous
lui avez posée tout à l'heure, et **vous ne saurez plus ce qui vient du fichier**.

Chez Copilot, c'est bien `/clear` — pas seulement le bouton de nouvelle conversation.

## Ce que chaque fichier contient

Les quatre suivent le même déroulé, dans le même ordre :

1. `/clear`
2. **Lancer l'audit** — deux lignes, identiques pour tous les rôles
3. **Lire la fiche depuis votre rôle** — c'est là que les quatre fichiers diffèrent
4. **Annoter** — quatre colonnes, et deux d'entre elles sont l'objectif
5. **Confronter avec votre voisin**

Puis la liste de ce que vous devez pouvoir montrer à la fin, et un défi bonus si vous finissez tôt.
