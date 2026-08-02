# Les agents du projet

Ce dossier est **volontairement vide** : c'est vous qui allez le remplir pendant le TP.

## Ce qu'on y range

Un **agent**, c'est un rôle qu'on délègue : un exécutant à qui on donne une mission, un
périmètre, et surtout **des droits**. Un fichier par agent.

## La chose à comprendre avant d'en écrire un

> **Un agent n'est capable que des droits qu'on lui donne.**

Le champ qui décide de tout, c'est celui des outils autorisés. Un agent qui n'a que le droit
de **lire** ne peut rien casser, par construction : il vous rendra un rapport, jamais une
modification. Si vous lui retirez le droit d'écrire alors que vous attendiez une modification,
il vous rendra un script au lieu d'agir, et vous chercherez longtemps pourquoi.

## Les deux façons de créer le vôtre

- **Vous connaissez la structure** : vous créez le fichier à la main.
- **Vous ne la connaissez pas** : vous la demandez, en français, à votre assistant.

Les deux mènent au même fichier. La seconde va plus vite mais ajoute un risque : le modèle
peut inventer des champs qui n'existent pas et qui ont l'air parfaitement plausibles.
**Dans les deux cas, vérifiez** : lancez l'agent et regardez ce qu'il produit réellement.

## Un exemple à lire

Le dossier voisin `.github/skills/git-workflow/` contient une **skill** déjà écrite. Ce n'est
pas un agent, mais c'est le même genre d'objet : un fichier de texte, versionné dans le dépôt,
que l'assistant charge quand il en a besoin. Ouvrez-le pour voir à quoi ça ressemble.
