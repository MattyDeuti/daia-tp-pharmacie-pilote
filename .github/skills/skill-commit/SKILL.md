---
name: skill-commit
description: "Génère un message de commit à partir du diff Git réel (pas un message générique), puis committe après validation. À UTILISER quand l'utilisateur dit « commit mon code », « fais un commit », « génère un message de commit », « committe avec un message qui correspond au diff ». Analyse git diff --staged pour déduire le type de changement (feat/fix/chore/docs/refactor/test) et rédiger un résumé fidèle à ce qui a changé, en français."
argument-hint: "Optionnel : précisions sur le commit à faire (ex. « committe juste le fichier X »)."
user-invocable: true
---

# Skill : skill-commit — message de commit dérivé du diff

Ce skill sert à produire un message de commit **qui décrit ce que le diff contient vraiment**,
pas une formule générique du type « mise à jour du code ». Le message est **déduit du contenu
réel des changements**, montré à l'utilisateur, puis validé avant d'être scellé.

## Principe directeur
Le message de commit doit être **une conséquence du diff**, jamais une supposition. Si le diff
ne permet pas de déduire clairement l'intention, il faut le dire et demander une précision au
lieu d'inventer.

## Déroulé

1. **Situer** : `git status` pour voir la branche courante et les fichiers modifiés.
   - Si la branche est `main`, prévenir l'utilisateur et proposer de créer une branche dédiée
     avant de continuer (ne jamais commit directement sur `main` sans son accord).

2. **Préparer le contenu** :
   - S'il y a déjà des fichiers indexés (`git diff --staged` non vide), travailler sur ceux-là.
   - Sinon, lister les fichiers modifiés (`git status`) et demander lesquels indexer, sauf si
     l'utilisateur a déjà précisé un périmètre. Ne jamais indexer aveuglément des fichiers qui
     ressemblent à des secrets ou de la config locale (`.env`, `*.pem`, clés, identifiants).

3. **Lire le diff réel** : `git diff --staged`. C'est la seule source du message — ne pas se
   fier aux noms de fichiers seuls, lire le contenu des changements.

4. **Déduire le message** à partir du diff :
   - **Type** (préfixe conventionnel, cohérent avec le reste du dépôt) : `feat` (nouveauté),
     `fix` (correctif), `chore` (tâche/config), `docs` (documentation), `refactor`, `test`.
   - **Résumé** : une ligne courte en français, qui décrit ce qui change concrètement (le
     comportement ou le fichier impacté), pas comment on l'a fait.
   - Si plusieurs changements sans rapport sont mélangés dans le même diff, le signaler et
     proposer de les séparer en plusieurs commits plutôt que d'écrire un message fourre-tout.

5. **Montrer avant de sceller** : afficher le résumé du diff (fichiers + nature du changement)
   et le message proposé. Demander la validation explicite de l'utilisateur — proposer une
   correction si le message ne convient pas.

6. **Commit** : `git commit -m "<type>: <message>"` seulement après validation.

7. **Publier (optionnel)** : proposer `git push` seulement si demandé ou si l'utilisateur
   confirme vouloir publier ; ne jamais pousser sur `main` sans passer par une Pull Request.

## Règles de sécurité (non négociables)
- Ne jamais écrire de donnée patient (nom, ordonnance, numéro de sécurité sociale) dans un
  message de commit, même en exemple.
- Ne jamais indexer ou committer un fichier de secrets/configuration locale sans confirmation
  explicite.
- Ne jamais `git commit` sans avoir montré le diff et obtenu la validation de l'utilisateur.
- Ne jamais `push --force`, `reset --hard`, ni pousser directement sur `main`.

## Ce que ce skill ne fait jamais
- Écrire un message générique (« update », « fix stuff », « corrections diverses ») quand le
  diff permet de dire mieux.
- Deviner l'intention si le diff est ambigu : il demande plutôt une précision.
- Committer sans validation humaine du message proposé.
