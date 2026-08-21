# Développeur — votre cas

**Le sujet :** la méthode qui enregistre une réception de marchandises dans le code legacy du
projet — `enregistrerReception`, au début de `src/main/java/GestionStock.java`.

**Avant de commencer :** ouvrez ce fichier et placez-vous sur la méthode. Sans ça, « cette
méthode » ne désigne rien.

---

## ① Le prompt sec — *fourni*

Copiez-collez tel quel. **Une phrase, on n'ajoute rien.**

```
Refactorise cette méthode d'enregistrement de réception de marchandises.
```

➜ Collez la réponse dans `apprenant/a-supprimer/approche-1-sec.md`, puis on vide la
conversation.

---

## ② Le prompt contextualisé — *à vous d'écrire*

Même méthode, même objectif. Cette fois, vous **dites ce que la machine ne peut pas deviner** :
d'où vient ce code, les règles qu'il doit respecter, ce que vous attendez en retour, et sous
quelle forme.

Des pistes si vous séchez : une réception, c'est un produit, une quantité, une date de
péremption, un fournisseur — et une pharmacie a des règles sur chacun. Un stupéfiant ne suit pas
le même circuit. Il n'y a aucun test automatisé sur ce code. Enfin, vous avez sûrement une idée
de ce que la reprise a le droit de changer, et de ce qu'elle n'a pas le droit de casser.

➜ `apprenant/a-supprimer/approche-2-contexte.md`, puis on vide.

---

## ③ Le même que ②, plus la demande de questions — *à vous d'écrire*

**Ne réécrivez pas votre prompt.** Reprenez ② mot pour mot, et ajoutez au bout de quoi lui
interdire de proposer quoi que ce soit tout de suite, et l'obliger à **vous interroger d'abord**.

C'est le geste vu en démo. À contexte égal, c'est la seule chose qui change entre ② et ③ : c'est
précisément pour ça qu'on peut lire ce qu'elle apporte.

➜ `apprenant/a-supprimer/approche-3-questions.md` : ici, ce sont **les questions** qu'on garde. Écrivez
dessous **celle à laquelle vous n'aviez pas pensé.**
