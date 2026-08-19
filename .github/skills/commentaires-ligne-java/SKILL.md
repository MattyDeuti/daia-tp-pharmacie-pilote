---
name: commentaires-ligne-java
description: "Utiliser dès que l'utilisateur veut commenter une classe Java ligne par ligne, annoter chaque instruction d'une classe Java ou rendre un code Java plus pédagogique. Mots déclencheurs : « ajoute des commentaires », « commente chaque ligne », « commentaire par ligne », « classe Java ». Produit une classe Java réécrite avec un commentaire clair avant chaque ligne de code de la classe, sans changer le comportement."
argument-hint: "le fichier ou la classe Java à commenter"
user-invocable: true
---

# Skill : commentaires-ligne-java

## Principe
Tu réécris la classe Java fournie en gardant exactement le comportement, puis tu ajoutes un commentaire explicite avant chaque ligne de code de la classe afin d'aider la lecture.

## Règles non négociables
- **Tu ne changes jamais la logique métier.**
- **Tu commentes chaque ligne de code de la classe** : déclaration, affectation, appel, condition, boucle, retour, gestion d'exception, annotation utile.
- **Si une ligne ne peut pas recevoir un commentaire utile, tu la scindes pour pouvoir commenter chaque instruction séparément.**
- **Tu écris en français**, de façon simple et utile.
- **Tu n'inventes jamais de comportement** : si une intention n'est pas certaine, tu restes descriptif.

## Déroulé
1. Lis la classe Java et repère chaque ligne de code à commenter.
2. Réécris la classe sans modifier sa structure fonctionnelle.
3. Ajoute un commentaire court et utile juste avant chaque ligne de code.
4. Vérifie qu'aucune ligne de la classe n'est restée sans commentaire.
5. Si une ligne contient plusieurs intentions, sépare-les avant de commenter.

## Format de sortie — imposé
- Rends uniquement la classe Java complète, dans un bloc de code.
- Conserve l'ordre du fichier d'origine.
- Chaque ligne de code de la classe doit être précédée d'un commentaire en français.
- Si une ligne doit rester structurelle, remplace-la par une structure équivalente qui permet quand même le commentaire demandé.

## Ce que tu ne fais jamais
- Tu ne modifies pas le comportement du code.
- Tu n'ajoutes pas de commentaire vague ou redondant.
- Tu ne transformes pas la classe en texte explicatif hors du code.
