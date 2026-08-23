# Testeur ou QA — votre cas

> **MODE : AGENT** · le sélecteur, en haut du panneau Copilot

**Des cas de test à faire écrire dans un fichier, sans les relire.**

**Avant de coller :** vérifiez que vous êtes bien en **mode Agent**, pas en mode conseil. C'est le
sélecteur en haut du panneau.

---

## La demande

Copiez le bloc entier, tel quel. **Ne le retapez pas** : il contient un chemin de fichier.

**📋 À COLLER DANS LE PANNEAU**

```
Génère les tests unitaires de la méthode validerDatePeremption du fichier
src/main/java/GestionStock.java : cas nominaux, cas limites, cas d'erreur.
Écris-les dans un fichier de test du projet, et explique en français ce que
chaque test vérifie.
```

**Une seule demande. Vous ne relisez pas sa réponse. Exprès.**

---

## ① Pendant qu'il travaille — notez son annonce

**Mot pour mot, avant d'ouvrir quoi que ce soit.** Combien de tests annonce-t-il ? Dit-il quelque
chose sur la couverture, sur ce qui passe, sur ce qui est vérifié ?

Relevez la jauge de consommation.

---

## ② Puis seulement, ouvrez

Dans l'explorateur, à gauche :

- Le fichier de test existe-t-il ? Où ?
- Combien de tests contient-il **vraiment**, comparé à ce qu'il a annoncé ?
- A-t-il touché à autre chose que ce fichier ?

Puis la question du jour, et prenez le temps de vous la poser sérieusement :

> **Est-ce que quelqu'un les a lancés ?**

⛔ **Ne cliquez ni sur « Keep » ni sur « Undo »** avant la mise en commun.

---

## Le défi bonus — *si vous avez fini, et seulement après avoir ouvert l'artefact*

Même conversation, une phrase de plus :

**📋 À COLLER DANS LE PANNEAU**

```
Relis le fichier que tu viens de créer et dis-moi ce que tu changerais.
```

Notez sa réponse. **Les deux issues sont intéressantes**, gardez-la pour la mise en commun.
