# Démo 6 · La brigade

> **MODE : AGENT** · le sélecteur, en haut du panneau Copilot

*Jour 2, 13h05 → 13h10 · slide 131 · Copilot, en mode agent, session neuve*

> **C'est le texte le plus long des deux jours — vingt-deux lignes.** Il se colle en une fois
> depuis ce fichier. La version coupée en deux est plus bas, en cas de besoin.

---

## Bloc 1 · la demande, en une fois

**📋 À COLLER DANS LE PANNEAU**

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

**📋 À COLLER DANS LE PANNEAU**

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

**📋 À COLLER DANS LE PANNEAU**

```
Quand les trois ont fini, un quatrième lit ces trois rapports et écrit
rapports/synthese.md, marqueur AGENT-DIR : quinze lignes maximum pour
la direction — la dette, l'effort, la décision à prendre. Pas de jargon.

Ne me demande rien.
```

---

## Bonus · un modèle différent par sous-agent

*À sortir si quelqu'un demande « et on peut choisir quelle IA fait quoi ? » — la question
tombe presque à chaque fois, juste après la brigade.*

**Ce que ça prouve :** on n'assigne pas un modèle à une conversation, on l'assigne **tâche par
tâche**. C'est la réponse concrète à qui vous impose le mode automatique.

### Le geste

**Lancez la conversation sur un petit modèle**, puis collez :

**📋 À COLLER DANS LE PANNEAU**

```
Lance un sous-agent avec GPT-5 mini pour compter le nombre de methodes
publiques dans src/main/java/GestionStock.java, et me rendre uniquement
le chiffre.

Ne fais pas ce travail toi-meme : delegue-le.
```

| | |
|---|---|
| **« Lance un sous-agent avec `<modèle>` »** | la demande de modèle se fait en français, dans le prompt |
| **« Ne fais pas ce travail toi-même »** | sans elle, l'agent principal fait le comptage et vous croyez que ça a marché |
| **une tâche minuscule** | on démontre le mécanisme, pas la puissance : ça doit coûter presque rien |

### La preuve, dans cet ordre

| | Ce qu'on regarde |
|---|---|
| **1** | **Un onglet séparé s'ouvre**, avec un cadenas. Pas d'onglet = pas de sous-agent |
| **2** | **Le modèle est écrit dans cet onglet.** C'est la preuve |
| **3** | **Survolez la section du sous-agent** dans la réponse : ses crédits s'affichent, à lui seul |

⛔ **Ne demandez jamais au sous-agent quel modèle il est.** Les modèles se trompent très souvent
sur leur propre identité, et il répondra avec assurance. **La preuve est dans l'interface, pas
dans le texte.**

### ⛔ La règle qui va les surprendre

> **Le modèle demandé ne peut pas dépasser le palier de coût du modèle principal.**
> On descend, jamais on monte.

Si vous demandez plus cher, **le sous-agent ne démarre pas** : il répond en listant les modèles
disponibles. Personne ne devine ça, et tout le monde fait l'erreur — lancer sa session sur un
petit modèle pour économiser, puis réclamer le gros pour la partie difficile.

**La règle à leur laisser :** on ouvre la conversation sur le modèle le plus cher dont on aura
besoin, puis on **délègue vers le bas** — les petits modèles dans les sous-agents, pour les
tâches mécaniques.

*Si le refus se produit en direct, ne le rattrapez pas : c'est la meilleure démonstration de la
journée. Rejouez-le aussitôt à l'envers — conversation sur un gros modèle, sous-agent sur un
petit — et le contraste entre les deux essais fait la démonstration complète.*

### Si rien ne se passe du tout

Ni onglet, ni refus : l'agent principal n'a pas le droit de déléguer. Vérifiez que l'outil
`agent` est disponible — sans lui, il fait la tâche lui-même **sans jamais dire qu'il n'avait
pas le droit**.
