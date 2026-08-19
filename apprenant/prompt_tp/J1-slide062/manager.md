# Manager — votre cas

**Le sujet :** une synthèse de risque **en dix lignes**, destinée à un comité de pilotage.
**Aucune ligne de code dans ce cas.**

La situation :

> Vous pilotez la reprise du module de gestion de stock d'une pharmacie : code écrit il y a
> longtemps, sans tests automatisés, maintenu par une seule personne. Une échéance
> réglementaire tombe dans trois mois — la traçabilité des stupéfiants.
> Votre comité se réunit une fois par mois. Huit personnes, dont la moitié n'est pas technique.

C'est le sujet des trois approches. Ce qu'on regarde : **la synthèse est-elle décidable** ? Et
l'outil a-t-il demandé **qui décide**, et **quelle décision est attendue** ?

---

## ① Le prompt sec — *fourni*

Copiez-collez tel quel. **Une phrase, on n'ajoute rien** — pas même la situation ci-dessus.

```
Fais-moi une synthèse des risques du projet.
```

➜ L'observateur colle la réponse dans `apprenant/a-supprimer/approche-1-sec.md`, puis on vide la
conversation.

**Le piège de ce profil : la première réponse a l'air propre, donc on l'accepte.** La question à
lui poser avant de passer à la suite : *est-ce que ce texte permet à mon comité de décider
quelque chose ?*

---

## ② Le prompt contextualisé — *à vous d'écrire*

Même sujet. Cette fois, vous **posez la situation, le destinataire et la décision attendue**, et
vous imposez le format.

Des pistes si vous séchez : à qui ce texte est adressé et ce que ces gens savent déjà, la
décision que vous leur demandez de prendre, la longueur exacte, ce que chaque ligne doit
contenir — et ce que vous ne voulez pas voir : le jargon, l'introduction, la conclusion.

**Les dix lignes ne sont pas un détail.** C'est le format qu'un outil rate systématiquement
quand on ne le lui impose pas : c'est là que l'écart se voit le mieux.

➜ `apprenant/a-supprimer/approche-2-contexte.md`, puis on vide.

---

## ③ Le même que ②, plus la demande de questions — *à vous d'écrire*

**Ne réécrivez pas votre prompt.** Reprenez ② mot pour mot, et ajoutez au bout de quoi lui
interdire de rédiger quoi que ce soit tout de suite, et l'obliger à **vous interroger d'abord**.

C'est le geste vu en démo. À contexte égal, c'est la seule chose qui change entre ② et ③ : c'est
précisément pour ça qu'on peut lire ce qu'elle apporte.

➜ `apprenant/a-supprimer/approche-3-questions.md` : ici, ce sont **les questions** qu'on garde. Écrivez
dessous **celle à laquelle vous n'aviez pas pensé.**
