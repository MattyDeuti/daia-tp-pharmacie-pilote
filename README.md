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

| Où | Quoi |
|---|---|
| `src/main/java/GestionStock.java` | Le code legacy (701 lignes, Java + SQL) |
| `db/schema_extensions.sql` | Le schéma de base de données associé |
| `consignes/` | Les énoncés des TP, dans l'ordre |
| `prompt_tp/` | Les prompts à copier-coller, **un sous-dossier par cas pratique** |
| `a-supprimer/` | Votre brouillon jetable des deux jours |
| `src/test/java/` | Vide pour l'instant : **c'est vous** (et votre IA) qui le remplirez |

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
| `.vscode/mcp.json` · `.kiro/settings/mcp.json` | **Les accès** : les prises qu'on branche à l'assistant | quand il a besoin de l'outil |

`AGENTS.md` et le dossier des agents sont **volontairement à trous** : ce sont eux que vous
remplirez pendant le TP « la couche de l'équipe ».

## Brancher un accès (MCP)

Le dossier contient déjà la configuration, désactivée. Pour l'activer :

- **Dans VS Code / Copilot** : `.vscode/mcp.json` est prêt tel quel, le chemin du projet s'y
  calcule tout seul.
- **Dans Kiro** : ouvrez `.kiro/settings/mcp.json`, remplacez
  `REMPLACER_PAR_LE_CHEMIN_COMPLET_DU_PROJET` par le chemin de ce dossier sur votre machine,
  puis passez `"disabled"` à `false`. Le rechargement se fait à chaud.

La preuve que ça marche n'est jamais ce que l'assistant vous répond. C'est **un outil qui
s'exécute et qui vous demande son approbation**.

## Par où commencer ?

1. Ouvrez ce dossier dans l'outil indiqué par le formateur (VS Code ou Kiro).
2. Ouvrez `consignes/` et suivez le TP annoncé.
3. Tout est déjà installé sur votre machine de formation (Java, Maven, Node, Git).

Bonne formation !
