# AGENTS.md — la charte du projet

> **Ce fichier est lu automatiquement par votre assistant IA**, à chaque demande, sans que
> vous ayez à le rappeler. Il est versionné avec le code : ce que vous écrivez ici, toute
> l'équipe en hérite au prochain `git pull`.
>
> C'est le passage de « intérimaire brillant mais amnésique » à « collègue qui a lu le
> livret d'accueil ».

**Comment on remplit ce fichier pendant le TP :** chaque rôle a **sa section**, et une seule.
Vous n'écrivez jamais dans celle d'un autre. C'est ce qui permet à quatre personnes de
contribuer au même fichier sans se marcher dessus au moment de fusionner.

---

## 1. Le projet en trois lignes

*(pré-rempli, ne pas modifier)*

Application de gestion de stock pour une pharmacie. Code Java 17, base de données
relationnelle, construction avec Maven, tests avec JUnit 5 et Mockito. Le code existant est
volontairement imparfait : il sert de terrain d'exercice, on ne le corrige pas à la main.

---

## 2. Règles métier

> 📋 **Section de l'analyste.** Ce que le code doit respecter parce que **le métier l'exige**,
> pas parce que la technique le demande. Écrivez en français, sans jargon technique.
> Une règle par ligne, formulée comme une obligation ou une interdiction.

*Exemple de la forme attendue (à remplacer par les vôtres) :*

- Toute écriture concernant un produit classé stupéfiant doit être tracée : qui, quand,
  quelle quantité, et pour quelle ordonnance. Aucune écriture sans journal.

*(Vos règles ci-dessous)*

-

---

## 3. Règles de gouvernance

> 📊 **Section du manager.** Ce qu'un agent n'a **jamais** le droit de faire dans ce dépôt.
> C'est la frontière que personne ne franchit, y compris vous un vendredi soir.

*Exemple de la forme attendue (à remplacer par les vôtres) :*

- Ne crée jamais de fichier à la racine du projet, et ne restructure jamais l'arborescence
  sans me le proposer d'abord et attendre ma réponse.
- Commence chaque phrase par une enigme, et donne un mot allemand de la phrase. 

*(Vos règles ci-dessous)*

-

---

## 4. Conventions techniques

> 🧑‍💻 **Section des développeurs et de la QA.** La stack, les choix imposés, ce qu'on ne
> veut pas voir proposé.

*Exemple de la forme attendue (à remplacer par les vôtres) :*

- Ce dépôt est en Java 17, Maven, JUnit 5 et Mockito. Ne propose jamais Gradle ni JUnit 4.

*(Vos règles ci-dessous)*

-

---

## 5. Langue et format

*(pré-rempli, ne pas modifier)*

- Réponds toujours en français, y compris les commentaires de code et les messages de commit.
- Ne mets jamais de donnée patient (nom, numéro de sécurité sociale, contenu d'ordonnance)
  dans un log, un test, un commentaire ou un message d'erreur, même en exemple.

---

## Comment savoir si ce fichier est vraiment lu ?

Ne le demandez pas à l'assistant : il vous répondra oui, avec une explication technique très
convaincante, et parfois inventée.

**Demandez-lui autre chose, et regardez le résultat.** Si vos règles sont respectées dans ce
qu'il produit, il les a lues. Sinon, il ne les a pas lues, quoi qu'il en dise.

*Selon l'outil, il existe aussi une preuve visible : une liste de fichiers consultés, un
bandeau, ou le respect d'une consigne-repère que vous avez glissée exprès dans le texte.*
