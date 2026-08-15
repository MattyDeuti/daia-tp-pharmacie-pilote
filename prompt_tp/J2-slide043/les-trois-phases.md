# Les trois phases, les trois portes

**Une seule personne tape à la fois, et ce n'est pas toujours la même.**

---

## Le mode : **Agent** pour les trois phases

**Pas Ask** — il ne peut pas écrire de fichier, et vous en produisez trois.

**Pas Plan non plus, et c'est un choix**, pour deux raisons :

1. **Ce que vous fabriquez, ce sont trois fichiers réels sur le disque.** Un plan qui vit dans le
   panneau n'est pas un artefact qu'on ouvre, qu'on annote et qu'on garde. Toute la journée
   d'hier tenait sur une phrase : *on ouvre l'artefact, toujours.*
2. **Le mode Plan mettrait sa porte à lui.** Or ce cas pratique porte exactement sur l'inverse :
   **quand l'outil ne fournit pas de porte, c'est vous qui la tenez.** Une porte fournie par le
   produit vous priverait de l'exercice.

> 🧪 **Là où le mode Plan a sa place, c'est à l'étape ⑤** — implémenter une tâche. C'est sa forme
> naturelle : il propose, vous approuvez, il exécute. Essayez-le à ce moment-là si vous voulez
> comparer.

---

## ⓪ Une conversation neuve

```
/clear
```

Puis **créez un dossier `spec/`** à la racine du projet.

---

## ① Phase 1 · le premier jet

**Tout est dans le bloc ci-dessous, le besoin compris.** Un seul copier-coller, rien à aller
chercher ailleurs.

```
Nous voulons ajouter au projet un module d'alertes de péremption,
moderne, qui coexiste avec le code existant sans en dépendre.

À partir d'une liste de lots (produit, quantité, date de péremption),
il signale les lots déjà périmés et ceux qui le seront bientôt.

On va procéder en trois temps, et tu t'arrêtes après chacun :
  temps 1 — les exigences, dans spec/exigences.md
  temps 2 — la conception, dans spec/conception.md
  temps 3 — les tâches, dans spec/taches.md

Fais le temps 1, et lui seul. Écris les exigences dans
spec/exigences.md : ce que la fonctionnalité doit faire, numérotées,
avec pour chacune ses critères d'acceptation.
N'écris aucun code. Ne crée aucun autre fichier. Arrête-toi là.
Quand une information te manque, écris [à compléter] plutôt que de
choisir à ma place.
```

**Ce que fait chaque partie :**

- **« sans en dépendre »** est la contrainte du scénario, et le garde-fou. Sans elle, l'agent va
  toucher au code existant et vous passerez le cas pratique à le retenir.
- **Les trois temps annoncés d'avance** sont ce qui donne un sens à « arrête-toi là ». Sans eux,
  l'agent ne sait pas qu'il y a une suite, et il essaie de tout faire d'un coup pour bien faire.
- **« numérotées »** rendra la traçabilité possible au temps 3. Sans numéros, aucune tâche ne peut
  renvoyer à rien.
- **« avec ses critères d'acceptation »** est la moitié qu'on oublie. Une exigence sans critère ne
  se recette pas.
- **« N'écris aucun code. Arrête-toi là. »** — **c'est le point de rupture le plus probable de ce
  cas pratique.** Surveillez-le : s'il commence à écrire du Java, arrêtez-le et redemandez le
  document seul. **Notez-le**, c'est le sujet du module, pas un incident.
- **« écris [à compléter] »** est la parade d'hier. Sans elle, il choisit un seuil d'alerte tout
  seul, et personne ne le lui a donné.

### ⛔ STOP. On ne valide rien.

**Quand le fichier est écrit, vous vous arrêtez et vous ne touchez plus à rien.**

Deux choses à faire, et rien d'autre :

1. **Ouvrez `spec/exigences.md`** et lisez-le.
2. **Comptez.** Combien d'exigences ? Combien de critères d'acceptation en tout ? **Écrivez les
   deux nombres**, on va vous les demander.

**Puis levez les yeux.** On se retrouve tous ensemble avant d'aller plus loin.

---

## ② Phase 1 · le second jet

*Après la mise en commun.*

**Vous n'allez pas corriger la spécification. Vous allez la refaire**, avec **l'ordre inversé** —
et comparer les deux résultats.

Au premier jet, il a écrit d'abord. Cette fois, **il demande d'abord.**

#### ① Recollez le même besoin, avec la fin changée

**Une conversation neuve d'abord** (`/clear`), puis :

```
Nous voulons ajouter au projet un module d'alertes de péremption,
moderne, qui coexiste avec le code existant sans en dépendre.

À partir d'une liste de lots (produit, quantité, date de péremption),
il signale les lots déjà périmés et ceux qui le seront bientôt.

On va procéder en trois temps, et tu t'arrêtes après chacun :
  temps 1 — les exigences, dans spec/exigences.md
  temps 2 — la conception, dans spec/conception.md
  temps 3 — les tâches, dans spec/taches.md

Avant d'écrire quoi que ce soit, pose-moi 10 questions pour être sûr
de bien comprendre ce que je souhaite. Numérote-les.
N'écris aucun fichier et ne rédige aucune exigence tant que je n'ai
pas répondu : pose tes questions, puis attends.

Une fois que j'aurai répondu, tu feras le temps 1 et lui seul :
écrire les exigences dans spec/exigences.md, numérotées, avec pour
chacune ses critères d'acceptation. N'écris aucun code, ne crée aucun
autre fichier. Quand une information te manque, écris [à compléter]
plutôt que de choisir à ma place.
```

**Le besoin et les trois temps ne bougent pas d'un mot.** Ce qui change, c'est la fin :

- **« Avant d'écrire quoi que ce soit »** ouvre la phrase. **Sa place décide de l'ordre** — placée à
  la fin, elle arrive trop tard : il a déjà écrit.
- **« puis attends »** est ce qui l'empêche de poser ses questions **et d'y répondre lui-même dans
  la foulée**. C'est son réflexe.
- **Le futur — « tu feras » —** repousse l'écriture après vos réponses, au lieu de la commander
  tout de suite.

#### ② Répondez — c'est là qu'est le travail

Ses questions vont porter sur des choses que **vous seuls** pouvez trancher. En tête :

> **Combien de jours avant la péremption faut-il alerter ?**

Sept ? Trente ? Quatre-vingt-dix pour un produit sensible ? **Aucune machine ne peut répondre à
votre place** — ce n'est pas une question technique, c'est une règle de votre métier.

🟢 **C'est le meilleur moment du cas pratique pour qui ne code pas.** Vous êtes ici strictement à
égalité, et probablement en avance.

**Répondez à tout dans un seul message**, et ajoutez la mise en quarantaine à la fin :

```
Voilà mes réponses :
1. …
2. …

Écris maintenant spec/exigences.md à partir de ça, et de rien d'autre.
Si tu penses qu'il manque quelque chose que je n'ai pas demandé, ne
l'ajoute pas aux exigences : mets-le dans une section « Suggestions,
hors périmètre » à la fin du fichier.
```

**Quand vous ne savez pas, dites-le** : *« je ne sais pas, mets [à compléter] »*. C'est une réponse
valable, et souvent la plus honnête.

**Le dernier paragraphe est un geste à emporter.** Vous ne lui interdisez pas d'avoir des idées —
**vous lui interdisez de les mélanger avec vos exigences.** Ce qui est dans la section du bas ne
deviendra jamais une tâche, ni du code, ni un engagement.

---

### 🚪 La porte 1 — et ce n'est pas un bouton

**Une seule question, et elle se répond en une minute :**

> **Est-ce que tout ce qui est écrit vient de ce que vous avez répondu ?**

Tout ce qui n'en vient pas est une décision qu'il a reprise à son compte. Elle descend dans
« Suggestions, hors périmètre », ou elle disparaît.

**Comparez aussi les deux nombres** — ceux du premier jet, et ceux de maintenant.

```
J'ai relu les exigences, elles sont validées. Passe au temps 2.
```

> **Celui qui prononce cette phrase n'est pas celui qui prononcera la suivante.**

---

## ③ Phase 2 · le COMMENT

**Ce n'est pas la même personne qui tient cette porte.**

```
Temps 2. À partir de spec/exigences.md uniquement, écris
spec/conception.md : comment on s'y prend.
Le module doit rester indépendant du code existant : tu ne modifies
aucun fichier existant. N'écris aucun code. Arrête-toi là.
```

**Ce que fait chaque partie :**

- **« à partir de spec/exigences.md uniquement »** l'empêche de repartir du besoin brut et de
  réinventer ce que vous venez de valider.
- **« tu ne modifies aucun fichier existant »** est **la contrainte du scénario**. Sans elle,
  l'agent part refactoriser le code existant et vous passez le cas pratique à le retenir.

> 🔍 **La traçabilité ne se demande pas ici.** Elle se demande à la porte, juste en dessous, dans
> un message à elle. Noyée au milieu de ce bloc, **elle passe à la trappe** : il écrit une
> conception qui suit bien les exigences, mais qui ne les cite nulle part. Une consigne au milieu
> d'un paragraphe se dilue ; seule, elle s'applique.

### 🚪 La porte 2 — elle ne se lit pas, elle se demande

**Vous n'allez pas relire dix pages.** Vous allez lui faire fabriquer les renvois, puis en vérifier
trois. Quarante secondes.

#### ① Demandez la traçabilité, dans un message à elle

```
Reprends spec/conception.md. Pour chaque décision, dis à quelle
exigence elle répond, en citant son numéro.
Si une décision ne répond à aucune exigence, dis-le au lieu d'inventer
un renvoi.
```

**La seconde phrase est le test.** Elle lui laisse une sortie honnête. S'il la prend, tant mieux.
S'il ne la prend pas, vous allez le voir à l'étape suivante.

#### ② Suivez trois renvois, au hasard

**Ouvrez `spec/exigences.md`** et vérifiez, pour trois décisions prises au hasard :

> **L'exigence citée existe-t-elle ? Et dit-elle bien ce que la conception prétend ?**

⚠️ **Ce sont deux questions, pas une.** Un numéro qui existe ne prouve rien : ce qui compte, c'est
que son contenu justifie vraiment la décision.

🎯 **Le signal qui trahit un faux renvoi, et il est facile à repérer** : quand le lien est vrai,
la phrase est **sèche** — *« répond à l'exigence 3 »*. Quand il est faux, elle **s'excuse** :
*« et implicite sur… »*, *« en particulier la partie sur… »*. **Un renvoi qui a besoin d'un adverbe
pour tenir n'en est pas un.**

#### ③ Arbitrez les orphelines — on ne supprime pas, on tranche

Une décision sans exigence n'est pas forcément mauvaise : elle est **sans mandat**. Deux sorties, et
c'est vous qui choisissez :

- **elle est utile** → on ajoute l'exigence qui manque ;
- **elle est du confort** → elle descend en « Suggestions, hors périmètre ».

Puis :

```
Conception validée. Passe aux tâches.
```

---

## ④ Phase 3 · les TÂCHES

**Troisième personne.**

```
Temps 3. À partir de spec/exigences.md et spec/conception.md, écris
spec/taches.md : la liste numérotée des tâches, dans l'ordre où on
les fait. N'écris aucun code. Arrête-toi là.
```

**Ici non plus, la traçabilité ne se demande pas dans le même souffle** — elle se dilue. Elle a son
message, à la porte.

### 🚪 La porte 3 — et c'est la plus facile à tenir sans lire de code

#### ① Demandez les renvois

```
Reprends spec/taches.md. Pour chaque tâche, cite les numéros des
exigences qu'elle sert.
Si une tâche ne sert aucune exigence, dis-le au lieu d'inventer un
renvoi.
```

#### ② Suivez-en trois, au hasard

> **L'exigence citée existe-t-elle ? Et dit-elle bien ce que la tâche prétend ?**

C'est le geste le plus simple des trois portes, et **celui qui trouve le plus de défauts**.

⚠️ **Le piège attendu, et il est vécu :** une tâche qui renvoie à « l'exigence 1.8 » alors que
l'exigence 1 n'a que cinq critères. **Tracé n'est pas vrai.** Un renvoi se suit, il ne se croit pas.

🎯 **Le même signal qu'à la porte 2** : un renvoi vrai est sec ; un renvoi faux s'excuse.

#### ③ Les deux autres questions, si vous avez le temps

- **Couverture** — y a-t-il une exigence qu'**aucune** tâche ne couvre ? *(c'est celle qu'on oublie)*
- **Cohérence** — l'ordre tient-il debout ?

---

## ⑤ Une tâche, une seule

**Pas le bouton qui lance tout.**

```
Implémente la tâche 1, et elle seule. Montre-moi ce que tu vas écrire
avant de l'écrire, et attends ma réponse.
```

Puis **ouvrez le fichier produit**. Pas le compte rendu — le fichier.

> **L'artefact, c'est le fichier lui-même, pas le compte rendu qui en parle.**

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ **Trois fichiers** dans `spec/`
- ☐ **Les deux nombres du premier jet**, et ceux du second
- ☐ **Les trois portes franchies par trois personnes différentes**
- ☐ **Ce que vous avez dû corriger avant d'accepter** — pour chaque porte, au moins une chose
- ☐ **Un fichier produit ouvert**, et son contenu regardé

**Un groupe qui n'a que les quatre premiers points a réussi le cas pratique.**

---

## Si ça coince

| Ce que vous voyez | Ce que vous faites |
|---|---|
| **Il code pendant la phase 1** | Arrêtez-le, redemandez le document seul. **Notez-le** : c'est le sujet du module |
| **Il enchaîne les trois phases tout seul** | Vous n'avez pas tenu la porte. Reprenez à la phase que vous n'avez pas validée |
| **Il touche au code existant** | Relisez votre besoin de départ à voix haute. Qu'est-ce qu'il interdit ? |
| **Vous n'irez pas au bout** | **Les trois documents comptent plus que l'implémentation.** Sacrifiez la tâche, jamais une phase |

---

## Le défi bonus — *seulement si les trois portes sont franchies*

**Relancez la phase des tâches avec un autre modèle**, sur la **même** spécification, et comparez
les deux plans.

⛔ **On relance le PLAN, pas l'implémentation.** Une implémentation rejouée coûte le prix du cas
pratique entier.

**Ce que ça apprend :** si deux plans divergent sur la même spécification, **ce n'est pas l'IA qui
a tort, c'est la spécification qui est ambiguë**. La divergence devient un instrument de mesure —
et ça marche aussi entre deux humains, sans IA.

*Si votre sélecteur de modèle ne propose qu'un seul nom, c'est normal, et c'est déjà une
information.*
