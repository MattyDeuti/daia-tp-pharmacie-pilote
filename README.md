# TP — Gestion de stock pharmacie

Bienvenue ! Ce projet est votre terrain d'exercice pour la formation
**« Développeur Augmenté par l'IA »**.

## C'est quoi ?

Une application de gestion de stock pour une pharmacie, écrite « à l'ancienne » :
un code **legacy volontairement imparfait**, comme on en rencontre dans la vraie vie.
Il fonctionne, mais il cache des défauts (sécurité, robustesse, lisibilité...).

**Ces défauts sont là exprès : ne les corrigez pas à la main.** Tout l'objet des TP
est de faire travailler votre assistant IA dessus, et d'apprendre à vérifier ce
qu'il affirme.

## La règle d'or de la formation

> **Vous n'avez pas besoin de lire le code.** L'IA le lit pour vous.
> Votre travail : lui donner une mission claire, puis **exiger des preuves**
> (un fichier créé, un test qui s'exécute, un rapport) — jamais se contenter
> d'un « c'est fait ! » sur parole.

Développeurs, testeurs, analystes : les TP se font en binôme, chacun y a sa place.

## Contenu du projet

**Tout ce qui vous concerne est dans `apprenant/`.** Le reste, c'est le projet sur lequel vous
allez travailler, et la configuration que vos outils lisent.

| Où | Quoi |
|---|---|
| `apprenant/00-pour_commencer/` | **À lire en premier** : se connecter à GitHub, puis à Copilot |
| `apprenant/consignes/` | Les énoncés des TP, dans l'ordre |
| `apprenant/prompt_tp/` | Les prompts à copier-coller, **un sous-dossier par cas pratique** |
| `apprenant/a-supprimer/` | Votre brouillon jetable des deux jours |
| `src/main/java/GestionStock.java` | Le code legacy (701 lignes, Java + SQL) |
| `db/schema_extensions.sql` | Le schéma de base de données associé |
| `src/test/java/` | Vide pour l'instant : **c'est vous** (et votre IA) qui le remplirez |
| `formateur/` | Le matériel du formateur — les prompts de ses démonstrations, si vous voulez les rejouer |

## La couche : ce qui survit au prompt

Un prompt meurt avec votre session. Tout ce que vous avez expliqué ce matin est perdu ce soir,
perdu pour votre collègue, et perdu quand vous changez d'outil. **La couche, c'est ce qui
survit** : des fichiers de texte, versionnés dans ce dépôt comme le code, que votre assistant
charge tout seul.

| Où | Quoi | Quand ça agit |
|---|---|---|
| `AGENTS.md` | **La charte** : les contraintes qui valent toujours | à chaque demande, automatiquement |
| `.github/skills/` | **Les skills** : une procédure packagée, réutilisable | quand la tâche s'y prête, ou sur appel |
| `.github/agents/` | **Les agents** : un rôle délégué, avec ses droits | quand vous le déléguez |
| `.vscode/mcp.json` | **Les accès** : les prises qu'on branche à l'assistant | quand il a besoin de l'outil |

`AGENTS.md` et le dossier des agents sont **volontairement à trous** : ce sont eux que vous
remplirez pendant le TP « la couche de l'équipe ».

## Brancher un accès (MCP)

Le dossier contient déjà la configuration : **`.vscode/mcp.json` est prêt tel quel**, le chemin
du projet s'y calcule tout seul. Vous n'avez rien à modifier.

La preuve que ça marche n'est jamais ce que l'assistant vous répond. C'est **un outil qui
s'exécute et qui vous demande son approbation**.

## Par où commencer ?

1. **Commencez par [`apprenant/00-pour_commencer/`](apprenant/00-pour_commencer/PREMIERE-ETAPE.md)** :
   se connecter à GitHub, puis à Copilot. Cinq minutes, une seule fois, et rien ne marche avant.
2. Ouvrez ce dossier dans **VS Code**. C'est le seul outil que vous manipulerez des deux jours.
3. Ouvrez `apprenant/consignes/` et suivez le TP annoncé.
4. Tout est déjà installé sur votre machine de formation (Java, Maven, Node, Git).

Bonne formation !
