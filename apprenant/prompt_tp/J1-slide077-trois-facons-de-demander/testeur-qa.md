# Testeur ou QA — votre cas

**Le sujet :** la règle de péremption des lots, à couvrir de cas de test.

La règle, telle que le métier l'a formulée :

> Un produit dont la date de péremption est dépassée ne doit **jamais** pouvoir être vendu.
> Un produit qui périme dans moins de 30 jours déclenche une alerte, mais **reste vendable**.

C'est le sujet des trois approches. Ce qu'on regarde : **à quel moment les cas limites et les
cas d'échec apparaissent**, et sur quelle question posée.

---

## ① Le prompt sec — *fourni*

Copiez-collez tel quel. **Une phrase, on n'ajoute rien** — pas même la règle ci-dessus.

```
Écris des cas de test pour la vente de produits en pharmacie.
```

➜ Collez la réponse dans `apprenant/a-supprimer/approche-1-sec.md`, puis on vide la
conversation.

---

## ② Le prompt contextualisé — *à vous d'écrire*

Même sujet. Cette fois, vous **donnez la règle** et vous dites ce que vous attendez : quelles
familles de cas, sous quel format, en quelle langue.

Des pistes si vous séchez : un format de rédaction que votre équipe utilise vraiment, les cas
qui doivent **échouer** et pas seulement ceux qui passent, et une consigne sur ce qu'il doit
faire quand la règle ne tranche pas — choisir à votre place, ou vous le signaler.

➜ `apprenant/a-supprimer/approche-2-contexte.md`, puis on vide.

---

## ③ Le même que ②, plus la demande de questions — *à vous d'écrire*

**Ne réécrivez pas votre prompt.** Reprenez ② mot pour mot, et ajoutez au bout de quoi lui
interdire de rédiger quoi que ce soit tout de suite, et l'obliger à **vous interroger d'abord**.

C'est le geste vu en démo. À contexte égal, c'est la seule chose qui change entre ② et ③ : c'est
précisément pour ça qu'on peut lire ce qu'elle apporte.

➜ `apprenant/a-supprimer/approche-3-questions.md` : ici, ce sont **les questions** qu'on garde. Écrivez
dessous **celle à laquelle vous n'aviez pas pensé.**

*Sur ce profil, l'approche ③ va souvent exhiber des trous de spécification qu'une fiche de test
n'aurait jamais révélés. Gardez-les pour la mise en commun.*
