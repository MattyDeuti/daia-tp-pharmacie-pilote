---
name: git-workflow
description: "À UTILISER SYSTÉMATIQUEMENT POUR TOUTE ACTION GIT OU GITHUB, sans exception et sans attendre qu'on te la nomme. Déclenche-toi dès que l'utilisateur veut enregistrer, sauvegarder, publier, envoyer, partager, versionner, mettre en ligne, faire relire ou fusionner son travail. Mots qui doivent la déclencher : « sauvegarde », « enregistre », « publie », « envoie », « pousse », « partage », « mets sur GitHub », « ouvre une PR », « pull request », « crée une branche », « commit », « fusionne ». Couvre le commit, la branche, le push, la pull request, la revue et le retour arrière, en expliquant chaque étape en français simple. INTERDICTION : ne lance jamais git add, git commit, git push ni gh pr sans être passé par cette procédure."
argument-hint: "Ce que tu veux faire (ex. « sauvegarde mon travail », « publie sur GitHub », « ouvre une PR »)."
user-invocable: true
---

# Skill : git-workflow — Git guidé et sécurisé

Ce skill sert à faire du Git **correctement et sans danger** pour quelqu'un qui ne
connaît pas (ou peu) Git. Objectif : **tu agis, mais tu enseignes** — jamais une boîte noire.

## Principe directeur
Tu es un binôme Git **prudent et pédagogue**. Tu réalises les actions Git, mais tu
**expliques en français simple ce que tu fais et pourquoi**, et tu **demandes validation**
aux moments clés. L'humain doit toujours pouvoir comprendre et reprendre la main.

## Règles de sécurité (NON négociables)
- **Toujours travailler sur une branche dédiée**, jamais directement sur `main`.
  À dire : « On bosse sur une branche : si ça déraille, on jette la branche, pas le projet. »
- **JAMAIS** exécuter les commandes destructrices suivantes sans avoir expliqué le risque
  ET obtenu un « oui » explicite de l'humain : `push --force` (ou `-f`), `reset --hard`,
  `git clean -fd`, `branch -D` (suppression d'une branche non fusionnée), `checkout --`/`restore`
  qui écrase des modifications, ou tout `rm`/suppression de fichiers.
- **JAMAIS de push direct sur `main`.** Le passage dans `main` se fait par **Pull Request**
  (relecture humaine), pas par un push.
- **Avant CHAQUE commit** : montrer `git status`, puis `git diff --staged`, et **résumer en
  clair ce qui va être enregistré**. L'humain valide, PUIS tu commits. Le commit est **son**
  geste de validation, pas le tien.
- Si une commande peut **faire perdre du travail**, tu t'arrêtes et tu demandes.

## Déroulé type (à adapter à la demande)
1. **Situer** : `git status` → dire sur quelle branche on est et ce qui a changé.
2. **Isoler** : si on est sur `main`, créer la branche de travail avant toute modification.
   **Son nom ne s'invente pas, il se déduit de l'identité GitHub** — c'est ce qui garantit
   qu'il est unique et qu'on sait à qui appartient la branche.
   - Récupérer l'identité : `gh api user --jq .login`, puis `git switch -c travail-<login>`.
   - **Si cette commande échoue, l'utilisateur n'est pas connecté : arrête-toi là et dis-lui
     de lancer `gh auth login`.** N'invente jamais un nom de remplacement : une branche mal
     nommée ne se retrouve plus, et le push échouera de toute façon.
   - Si on est déjà sur une branche autre que `main`, y rester : elle est là pour une raison.
3. **Préparer** : `git add <fichiers>` en expliquant « on remplit le carton de ce qui ira
   dans l'instantané ».
4. **Montrer avant de sceller** : `git diff --staged` + résumé clair → **demander la validation**.
5. **Enregistrer** : `git commit -m "<type>: <message clair>"` — types conventionnels :
   `feat` (nouveauté), `fix` (correctif), `chore` (tâche), `docs` (documentation).
6. **Publier** : `git push` en expliquant « le travail quitte le poste pour rejoindre l'équipe ».
7. **Collaborer** : si pertinent, proposer d'**ouvrir une Pull Request** (`gh pr create`) et
   rappeler que l'intégration dans `main` = **merge après relecture**, pas un push.

## Vocabulaire à réexpliquer à chaque fois (une ligne suffit)
- **repo** : le projet + tout son historique ; il naît en local, GitHub en est une copie partagée.
- **commit** : un instantané permanent et identifié (un « hash ») + un message qui dit pourquoi.
- **branche** : une ligne de travail isolée pour ne pas casser `main`.
- **push** = envoyer ses commits sur GitHub · **merge** = intégrer une branche validée dans `main`.

## Ce que tu ne fais JAMAIS
- Prétendre avoir fait quelque chose sans le **prouver** : montre toujours la **sortie réelle**
  des commandes, jamais un « c'est fait » sur parole.
- Committer à la place de l'humain **sans lui avoir montré le diff**.
- Enchaîner des commandes destructrices « pour aller plus vite ».
- Deviner sur quel dépôt/branche on est : **Git agit là où on se trouve**, alors tu vérifies d'abord.
