# TP 4 — Quatre briques, un seul dépôt

> **L'objectif et les étapes sont à l'écran.** Ce fichier ne porte que ce qui ne s'y projette
> pas : le prompt de votre brique, votre preuve, et quoi faire si ça coince.
>
> **Une brique chacun. Pas la même.** À la fin, elles atterrissent toutes dans le même dépôt.

## Comment vous êtes organisés

**Une brique chacun, et elle vous est attribuée en séance.** Vous n'avez rien à choisir : les
quatre doivent être prises, et les sections 2 et 3 de la charte doivent être remplies toutes les
deux, sinon la fusion à quatre ne démontre plus rien.

Aucune brique n'exige le métier qui lui a donné son nom, et **les deux dernières ne demandent pas
une ligne de code**.

**Chacun sur son poste, et sur sa propre branche** — elle porte votre prénom et elle a été créée
avant la séance. Vous gardez votre preuve vous-même : personne ne la note à votre place.

**Trois règles pour les quatre briques :**

1. **Donnez-lui un exemple** de ce que vous appelez un bon résultat. Sans exemple, il vous rendra
   la convention générique d'Internet, pas la vôtre.
2. **On ne corrige pas le code du projet.** Ce n'est pas l'exercice.
3. **Une brique, pas deux.** Si vous finissez tôt, vous ne prenez pas celle du voisin : vous
   passez au défi bonus, en bas de cette page.

---

## ① Écrire ou demander votre brique

Deux voies vous sont ouvertes. **Personne ne corrigera votre choix** — c'est une préférence, pas
une compétence.

- **Voie 1** — vous voulez *voir les champs* du fichier produit
- **Voie 2** — vous préférez *décrire en français* ce que vous voulez

---

### 🟦 Développeur — *voie 1* — un relecteur en lecture seule

Vous fabriquez un agent dont le métier est de relire, et **rien d'autre**.

> **Écrivez son fichier vous-même, à la main**, dans le dossier des agents du dépôt. C'est le sens
> de la voie 1 : vous voulez **voir les champs**, et on ne voit bien que ce qu'on a écrit soi-même.
> **Le squelette, les cinq champs et le symptôme classique sont dans le projet**, à trois clics :
> `.github/agents/README.md`.
>
> **Si vous calez, demandez-le à l'agent dans le chat** — mais essayez d'abord. Cinq minutes à
> chercher un champ valent mieux qu'un fichier correct dont vous ne sauriez rien dire.
> *(La demande toute prête est à la fin de votre fiche, dans `apprenant/prompt_tp/J2-slide214-couche-equipe/`.)*

Il doit porter **deux choses**, et ce sont elles qu'on regardera.

1. **Le champ des droits, réglé en lecture seule.** Un relecteur qui peut corriger n'est pas un
   relecteur.
2. **Une consigne de forme** : commencer par dire ce qui va bien, avant ce qui gêne.

Puis vous l'utilisez **sur la charte du projet** :

```
Relis le fichier AGENTS.md et rends-moi une revue.
Commence par ce qui va bien, puis ce qui te gêne. Ne modifie rien.
```

> **Pourquoi ce fichier-là.** C'est celui que **deux autres personnes sont en train d'écrire** en
> ce moment même — les sections 2 et 3. Votre relecteur lit la charte de l'équipe, pas un exercice.
> Et il est en français, court : **n'importe qui peut juger la revue**, y compris quelqu'un qui
> n'écrit pas de code.

**Votre preuve : il rend une revue, et `AGENTS.md` n'a pas bougé.** Elle ne se lit pas dans sa
réponse, elle se lit **dans la liste des fichiers modifiés** — le panneau Source Control, à gauche.

Regardez-le **avant** de lancer la revue. Regardez-le **après**. **`AGENTS.md` n'y est pas apparu.**
Aucune commande à taper, rien à savoir de Git.

> 🔴 **Le symptôme que vous aurez sans doute :** votre agent n'apparaît pas dans la liste. Neuf
> fois sur dix ce n'est **pas** une faute d'écriture, c'est **un champ réel mal réglé**. Levez la
> main, ça se débloque en dix secondes — et c'est une leçon, pas une perte de temps.

---

### 🟥 Testeur / QA — *voie 2* — la skill qui génère les tests

Vous fabriquez une **skill** — une procédure packagée — dans `.github/skills/tests-de-classe/SKILL.md`.
**Le projet en contient déjà un exemplaire à lire :** `.github/skills/git-workflow/SKILL.md`, celui
qui fera votre publication tout à l'heure. C'est votre modèle.

**Il n'y a pas de texte tout prêt ici, et c'est voulu.** Le squelette, et le reste est à vous :

```
Crée une skill nommée tests-de-classe, sur le modèle de
.github/skills/git-workflow/SKILL.md.

À QUOI ELLE SERT : ......................................
QUAND ELLE DOIT ÊTRE INVOQUÉE : .........................

CE QU'ELLE DOIT PRODUIRE : pour chaque méthode publique, trois cas
de test — un nominal, un limite, un d'erreur — chacun au format
préparer / agir / vérifier.

Fais-lui commencer chaque fichier produit par la ligne exacte
CANARI-<mon prénom>.
```

**Les deux lignes à trous deviennent la `description`**, le seul texte que l'outil lit avant de
décider d'ouvrir votre skill. « Quand elle doit être invoquée », c'est **la phrase que vous
taperiez dans deux mois**, sans y penser et sans connaître le nom du fichier.

> ⚠️ **Le nom `tests-de-classe` est imposé.** Si vous aviez le profil testeur au cas pratique de
> 14h02, vous avez déjà `jeu-de-tests` dans ce projet : un nom distinct évite de l'écraser, **et
> vous saurez laquelle des deux a servi.**

> 🆘 **La demande complète est à la fin de votre fiche**, dans `apprenant/prompt_tp/J2-slide214-couche-equipe/`. N'y allez
> qu'après avoir réécrit votre description une fois.

Puis, pour la déclencher — **sans jamais la nommer, et sans rien ajouter** :

```
#GestionStock.java Génère les tests de la méthode enregistrerReception.
```

Elle dit **sur quoi** travailler, jamais **comment** : le combien et la forme sont dans votre skill.
Si vous les remettez dans la phrase, l'agent fait le travail lui-même et vous n'aurez pas de canari.

**Trois gestes qui ne concernent que vous :**

- **Relisez sa `description`** : c'est **le seul texte** que l'outil lit avant de décider d'ouvrir
  votre skill. Mal écrite, elle ne partira jamais toute seule
- **Rechargez la fenêtre** après l'avoir déposée — sinon elle n'existe pas encore pour l'outil
  (`Ctrl + Maj + P` → `Developer: Reload Window`)
- **Nommez-la** si la tâche a l'air banale : dans le doute, un agent fait le travail lui-même

**Votre preuve : le marqueur, en tête du fichier de tests produit.** Jamais « procédure
appliquée » écrit dans la conversation.

> ⚠️ **Un fichier de tests correct SANS le marqueur signifie que votre procédure n'a jamais été
> ouverte.** Le résultat peut être bon quand même. C'est le piège du module, et il compte comme
> résultat : dites-le tel quel.

---

### 🟨 Analyste — *voie 2, zéro ligne de code* — les règles métier

**Il n'y a pas de texte tout prêt ici, et c'est voulu.** Le squelette, et **la règle est à vous** :

```
Dans le fichier AGENTS.md, section 2 « Règles métier », ajoute notre règle.
En français, sans jargon technique, formulée comme une obligation ou une
interdiction.

LA RÈGLE : ...............................................
..........................................................

Termine-la exactement par : (règle métier RM-<mon prénom>)
N'écris nulle part ailleurs que dans la section 2.
```

**Le sujet est imposé** : la **traçabilité des produits classés stupéfiants** — aucune écriture sans
journal, et le journal doit nommer **qui, quand, quelle quantité, pour quelle ordonnance**.

**La formulation est à vous, et c'est tout l'exercice.** Traquez les mots qui se discutent —
*« autant que possible »*, *« sauf si »*, *« éviter de »*. **Une règle qui se discute n'est pas une
règle**, et c'est le seul défaut qui la fera céder.

Puis vous lui tendez un piège :

```
Ajoute une méthode qui enregistre une sortie de stock de morphine.
```

**Votre preuve : il refuse ou ajoute le journal de lui-même — et il cite `RM-<votre prénom>`.**
La charte contient **déjà** un exemple de règle sur les stupéfiants : un refus seul ne prouve donc
pas que c'est **la vôtre** qui a agi. **Votre formule maison, si.**

⛔ **Ce qui ne compte pas :** lui demander s'il a bien lu la charte. On ne prend pas un agent à
témoin de sa propre obéissance.

> 🆘 **Une règle toute rédigée est à la fin de votre fiche**, dans `apprenant/prompt_tp/J2-slide214-couche-equipe/`. N'y
> allez qu'après un essai.

---

### 🟩 Manager — *voie 2* — les règles de gouvernance

**Il n'y a pas de texte tout prêt ici, et c'est voulu.** Le squelette, et **l'interdit est à vous** :

```
Dans le fichier AGENTS.md, section 3 « Règles de gouvernance », ajoute notre
interdit. Sans condition et sans exception.

L'INTERDIT : .............................................
..........................................................

Termine-le exactement par : (règle maison RG-<mon prénom>)
N'écris nulle part ailleurs que dans la section 3.
```

**Le sujet est imposé** : l'agent ne doit **jamais** créer de fichier à la racine, **ni**
restructurer l'arborescence de lui-même — il doit **le proposer d'abord et attendre votre réponse**.

**La formulation est à vous, et c'est tout l'exercice.** Deux pièges : les mots qui se discutent
(*« éviter de »*, *« autant que possible »*, *« sauf si nécessaire »*), et l'oubli de
**« et attendre ma réponse »** — sans ces mots, il vous « propose »… et il enchaîne. **Trois mots
séparent une politesse d'une porte.**

**`RG-<votre prénom>` est votre marqueur**, et c'est lui qui rendra votre brique visible par toute
la salle : cette formule n'existe nulle part ailleurs.

Puis vous lui demandez le geste interdit :

```
Réorganise l'arborescence du projet pour qu'elle soit plus propre.
```

**Votre preuve n'est pas qu'il refuse.** Un « je ne peux pas faire ça » poli ne suffit pas. On
cherche un refus qui **nomme le risque** et **demande votre accord explicite** — et, si tout va
bien, qui **cite `RG-<votre prénom>`**. Là, il n'a pas seulement refusé : il a cité la ligne que
vous venez d'écrire.

---

## ② Vérifier au canari

**Personne ne passe à la publication sans sa preuve.**

| Votre rôle | Ce qui vaut preuve |
|---|---|
| 🟦 Développeur | il rend une revue, et **`AGENTS.md` n'apparaît pas** dans les fichiers modifiés |
| 🟥 Testeur / QA | **le marqueur** est en tête du fichier de tests produit |
| 🟨 Analyste | la règle **tient** face au piège, et il cite **`RM-<votre prénom>`** |
| 🟩 Manager | il **refuse en citant `RG-<votre prénom>`**, nomme le risque et attend votre accord |

## ③ Publier — sans taper une seule commande

Vous ne tapez aucune commande Git. Vous le **demandez**, et c'est la même phrase pour les quatre
rôles :

```
sauvegarde et publie mon travail
```

L'outil se saisit tout seul de la procédure qui est dans le dépôt — **personne ne l'a installée,
elle était dans le dossier qu'on vous a donné.**

Ce qu'il va faire : une branche dédiée, il vous montre ce qu'il s'apprête à enregistrer, **il
demande votre validation et il attend**, puis il pousse et propose la mise en commun.

**Ce que vous gardez, c'est la validation.** Lisez avant de dire oui : c'est votre porte.

> **L'adresse du dépôt de destination vous sera donnée en séance** : elle dépend des comptes avec
> lesquels vous vous êtes connectés ce matin.

## ④ Relire, puis fusionner

**Tant que les quatre propositions ne sont pas parties, personne ne peut fusionner.** C'est la
première fois de ces deux jours que vous dépendez les uns des autres — et c'est exactement à ça
que sert un dépôt partagé.

Vous relisez la proposition **de quelqu'un d'autre**, pas la vôtre. Vous cherchez une seule chose :
**sa preuve est-elle là ?** Ce n'est pas une revue de code, c'est une revue de preuve.

Puis vous fusionnez.

## ⑤ Récupérer

À la fin, les quatre briques sont sur le serveur — et **aucune copie ouverte dans cette salle ne
le sait encore**. C'est le dernier geste de la formation, et il se fait ensemble.

---

## Si ça coince

| Ce que vous voyez | Ce que vous faites |
|---|---|
| **Vous n'obtenez pas votre preuve** | **Votre brique part quand même**, et on le dit à voix haute : elle existe, on ne sait pas encore si elle agit. C'est exactement la différence qu'on apprend depuis deux jours. On ne bloque jamais la mise en commun sur une preuve manquante. |
| **Votre agent ou votre procédure n'apparaît nulle part** | Rechargez la fenêtre. Si ça persiste, levez la main : c'est presque toujours un champ réel mal réglé, pas une faute d'écriture. |
| **La publication échoue** | Ne tapez pas de commande Git pour compenser. Levez la main : le problème est du côté des accès, pas du vôtre. |
| **Vous finissez en avance** | Vous ne prenez pas le rôle du voisin : vous passez au défi bonus ci-dessous. |

---

## Défi bonus

**Retournez votre brique contre vous-même.**

Lancez-la sur **vos propres modifications** — celles que vous venez de faire, pas celles du
projet. L'agent de revue relit votre travail, la procédure de tests s'applique à ce que vous avez
produit, la règle métier se confronte à ce que vous avez écrit.

C'est aussi, accessoirement, la façon la plus rapide d'obtenir votre preuve si elle vous manque
encore.
