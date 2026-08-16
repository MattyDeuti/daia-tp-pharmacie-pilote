# Analyste — traduire un écran en règles, sans une ligne de code

**Votre rôle dans ce cas pratique :** transformer ce qu'il voit en **règles métier**, formulées
comme des obligations ou des interdictions.

> 🟢 **C'est le cas pratique le plus accessible des deux jours si vous ne codez pas.** L'agent
> regarde une page d'application, comme vous le feriez. Vous n'avez aucun désavantage ici.

---

## ⓪ Une conversation neuve

```
/clear
```

---

## ① Les deux demandes communes

Identiques pour les quatre rôles. La première, **attendez la réponse**, puis la seconde.

```
Ouvre http://localhost:8000 avec le serveur playwright, prends une
capture de la fenêtre (pas de la page entière), et dis-moi ce qui
ne va pas sur cet écran.
```

```
Maintenant écris-moi les tests qui vérifient ce que tu viens
de voir.
```

**La seconde ne vous concerne pas directement** — collez-la quand même : elle produit la matière
que vous allez traduire, et elle vous servira à la confrontation.

⛔ **Vous ne lui ouvrez aucun fichier de code.** Vous n'en aurez pas besoin une seule fois.

---

## ② Votre relance

```
Traduis ce que tu viens de voir en règles métier, en français,
sans aucun terme technique. Une règle par ligne, formulée comme
une obligation ou une interdiction. Signale celles dont tu n'es
pas sûr plutôt que de choisir à ma place.
```

**Ce que fait chaque partie :**

- **« sans aucun terme technique »** est votre garde-fou. Sans lui, vous recevrez des règles
  écrites pour un développeur, et vous ne pourrez pas les faire valider par une pharmacienne.
- **« une obligation ou une interdiction »** est ce qui rend une règle utilisable. *« Le stock doit
  rester fiable »* n'est pas une règle : deux personnes n'en font pas la même chose.
- **« Signale celles dont tu n'es pas sûr »** est **la parade d'hier**, transposée. Sans elle, il
  comble les trous avec ce qui a l'air plausible, et vous ne verrez pas la différence.

---

## ③ Ce que vous notez

| La règle | Deux personnes en feraient-elles la même chose ? | Vient-elle de l'écran, ou de sa culture générale ? |
|---|---|---|
| | | |

**La troisième colonne est l'objectif.** Il va produire des règles parfaitement raisonnables **qui
ne sont écrites nulle part sur cet écran** — le bon sens d'une pharmacie en général, pas de
celle-ci. Ce sont exactement celles qu'il faut faire valider par un humain avant de les inscrire.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ Une capture de l'écran, prise par l'agent
- ☐ **Une liste de règles**, une par ligne, en français, sans jargon
- ☐ **Au moins une règle marquée « pas sûr »** par lui — ou repérée par vous
- ☐ **Au moins une règle qui ne vient pas de l'écran**
- ☐ **Aucun fichier de code ouvert**

---

## Le défi bonus — *seulement si vous avez fini*

Retournez la demande, et faites-lui chercher **ce qui manque** :

```
Quelles règles métier faudrait-il pour cet écran, mais que rien à
l'écran ne permet de deviner ? Formule-les comme des questions à
poser à la pharmacienne, pas comme des règles.
```

**Ce que ça apprend, et c'est votre métier :** un écran ne dit jamais tout. La liste des questions
à poser vaut plus que la liste des règles trouvées.
