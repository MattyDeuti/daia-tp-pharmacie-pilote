# Démo 6 · La brigade

*Jour 2, 13h15 → 13h20 · slide 129 · Copilot, en mode agent, session neuve*

> **C'est le texte le plus long des deux jours — vingt-deux lignes.** Il se colle en une fois
> depuis ce fichier. La version coupée en deux est plus bas, en cas de besoin.

---

## Bloc 1 · la demande, en une fois

```
Sur ce projet de gestion de stock pharmacie, constitue une brigade de
sous-agents et lance-les EN PARALLÈLE, pas l'un après l'autre.

Trois partent en même temps, tous sur le MÊME fichier :
src/main/java/GestionStock.java. Chacun écrit son propre rapport et
le commence par son marqueur.

  AGENT-SECU   → rapports/audit-securite.md
                 les failles de sécurité, de la plus grave à la moins
                 grave, avec le numéro de ligne de chacune.
  AGENT-TEST   → rapports/tests.md
                 les cas de test à écrire en priorité : un nominal, un
                 limite et un d'erreur par méthode publique.
  AGENT-METIER → rapports/regles-metier.md
                 les règles métier que ce code applique, en français,
                 une par ligne, sans aucun terme technique.

Quand les trois ont fini, un quatrième lit ces trois rapports et écrit
rapports/synthese.md, marqueur AGENT-DIR : quinze lignes maximum pour
la direction — la dette, l'effort, la décision à prendre. Pas de jargon.

Ne me demande rien.
```

**Rien ne se retire de ce texte.** Chaque élément y est pour une raison :

| | |
|---|---|
| **« EN PARALLÈLE »**, **« pas l'un après l'autre »** | c'est ce qui décide de ce qu'il va répondre |
| **« sous-agents »** | le mot doit venir de lui |
| **les marqueurs** | une preuve qui se lit dans les fichiers, sans ouvrir aucun panneau |
| **le chemin complet** de chaque rapport | sans lui, les fichiers atterrissent à la racine |
| **le fichier source nommé** | sans lui, deux exécutions ne donnent pas le même résultat |

---

## En deux messages, si le bloc entier ne passe pas

**Ça ne change rien au résultat.**

### Message 1

```
Sur ce projet de gestion de stock pharmacie, constitue une brigade de
sous-agents et lance-les EN PARALLÈLE, pas l'un après l'autre.

Trois partent en même temps, tous sur le MÊME fichier :
src/main/java/GestionStock.java. Chacun écrit son propre rapport et
le commence par son marqueur.

  AGENT-SECU   → rapports/audit-securite.md
                 les failles de sécurité, de la plus grave à la moins
                 grave, avec le numéro de ligne de chacune.
  AGENT-TEST   → rapports/tests.md
                 les cas de test à écrire en priorité : un nominal, un
                 limite et un d'erreur par méthode publique.
  AGENT-METIER → rapports/regles-metier.md
                 les règles métier que ce code applique, en français,
                 une par ligne, sans aucun terme technique.
```

### Message 2

```
Quand les trois ont fini, un quatrième lit ces trois rapports et écrit
rapports/synthese.md, marqueur AGENT-DIR : quinze lignes maximum pour
la direction — la dette, l'effort, la décision à prendre. Pas de jargon.

Ne me demande rien.
```
