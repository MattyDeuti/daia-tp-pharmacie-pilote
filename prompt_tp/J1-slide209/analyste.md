# Analyste — des tests, puis un plan

**Vous n'aurez besoin de lire aucune ligne de code.** Les deux demandes produisent des textes en
français, et ce sont eux votre matière.

---

## ① Faire générer les tests

```
Génère des tests unitaires pour #GestionStock.java, et explique en
français ce que chaque test vérifie. Écris l'explication pour
quelqu'un qui ne lira pas le code des tests : une phrase par test,
qui dit ce qui doit se passer, et ce qui ne doit pas.
```

**L'explication en français n'est pas une politesse.** C'est elle qui vous permet de valider
**sans lire le code des tests**. Votre travail : vérifier que **chaque explication correspond à
quelque chose de réel** dans ce que l'audit avait trouvé tout à l'heure.

---

## ② La seule question qui compte

> ### **Les avez-vous vus PASSER ?**

Pas « est-ce qu'il dit qu'ils passent ». Pas « combien il en a écrit ». **Les avez-vous vus
passer ?**

Si vous voulez y répondre pour de vrai :

```
Lance les tests et montre-moi la sortie complète.
```

**Trois réponses possibles, et les trois sont bonnes :**

| Ce qui arrive | Ce que vous avez |
|---|---|
| Il les lance et **ça passe** | une preuve — gardez la sortie sous les yeux |
| Il les lance et **ça échoue** | une preuve **et** du travail. C'est le meilleur cas |
| **Il ne peut pas les lancer**, et il le dit | vous savez que vous n'avez rien prouvé, **et c'est une information capitale** |

⛔ **Ce que vous n'acceptez jamais :** « les tests couvrent environ tant de pour cent ». Une
couverture annoncée est **une description, pas une mesure**.

---

## ③ Faire produire le plan de reprise

```
Produis un plan de reprise et de migration de ce projet : les phases,
leur ordre, et l'effort estimé pour chacune. Pour chaque phase, dis
en une phrase ce qu'elle change concrètement, avant tout terme
technique. Quand tu n'as pas l'information dans le fichier, écris
[à compléter]. N'invente pas.
```

**Les deux dernières lignes ne sont pas décoratives.** Un effort estimé par phase, c'est un
tableau — et **dès qu'on demande un tableau, chaque case appelle une valeur**. Si l'information
n'est pas dans ce qu'on lui a donné, il la fabrique plausible.

Ces deux lignes ne l'empêchent pas d'inventer : elles **rendent les trous visibles**. Cherchez les
`[à compléter]` : ce sont eux qui vous disent où le plan ne sait pas. **C'est votre colonne à
vous** — celle de la couverture, vue de l'autre bout.

---

## ④ Lire le plan depuis votre rôle

**Pas comme du code. Comme un plan de charge.**

> **Le plan couvre-t-il le besoin réel, ou seulement ce que le fichier laissait deviner ?**

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ Un jeu de tests, **et une réponse claire à « les avez-vous vus passer ? »**, quelle qu'elle soit
- ☐ Un plan de reprise en phases, **avec ses `[à compléter]`** s'il en a laissé
- ☐ Votre lecture du plan depuis votre rôle

---

## Les deux défis bonus — *si vous avez fini*

**Ils ne visent pas les mêmes personnes. Prenez celui qui vous parle** — le second est plus proche
de votre métier.

### Défi ① · casser le code exprès — *plutôt pour les testeurs*

**Trente secondes.**

> Modifiez **une ligne** de la méthode que vos tests sont censés couvrir, puis **relancez les
> tests**.

Regardez le résultat, et **tirez-en la conclusion vous-même**.

⚠️ **Remettez la ligne comme elle était ensuite.** Si la commande de test ne répond pas sur votre
poste, ce défi tombe — passez au second.

### Défi ② · la documentation qui ment — **plutôt le vôtre**

```
Écris la documentation de ce projet à destination d'un nouvel
arrivant : ce que fait l'application, comment elle accède aux
données, et ce qu'un développeur doit savoir avant d'y toucher.
```

Puis **vérifiez UNE SEULE affirmation** dans le code, ou faites-la vérifier. Une seule suffit —
et vous saurez tout de suite quoi en penser.
