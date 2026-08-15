# Les trois phases, les trois portes

> ⚠️ **PROMPTS NON ÉPROUVÉS.** Voir l'encadré du `LISEZ-MOI` de ce dossier.

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

> 🧪 **Là où le mode Plan mérite d'être essayé, c'est à l'étape ④** — implémenter une tâche. C'est
> sa forme naturelle : il propose, vous approuvez, il exécute. **À tester au pré-vol**, pas en
> salle : le comportement exact dépend de la version installée.

---

## ⓪ Une conversation neuve

```
/clear
```

Puis **créez un dossier `spec/`** à la racine du projet.

---

## ① Phase 1 · le QUOI

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

### 🚪 La porte 1 — et ce n'est pas un bouton

**Relisez avant de valider.** Le geste :

> **Reprenez le besoin de départ, phrase par phrase.** Chacune a-t-elle son exigence ?
> Puis lisez un critère à voix haute en commençant par **« je vais devoir prouver que »**. Si la
> phrase ne se termine pas, le critère n'est pas testable.

**Complétez ce qui manque**, en le lui demandant. Puis, et seulement puis :

```
J'ai relu les exigences, elles sont validées. Passe à la conception.
```

---

## ② Phase 2 · le COMMENT

**Ce n'est pas la même personne qui tient cette porte.**

```
Temps 2. À partir de spec/exigences.md uniquement, écris
spec/conception.md : comment on s'y prend. Pour chaque décision, dis
à quelle exigence elle répond.
Le module doit rester indépendant du code existant : tu ne modifies
aucun fichier existant. N'écris aucun code. Arrête-toi là.
```

**Ce que fait chaque partie :**

- **« à partir de spec/exigences.md uniquement »** l'empêche de repartir du besoin brut et de
  réinventer ce que vous venez de valider.
- **« dis à quelle exigence elle répond »** est ce qui vous permettra de trier. Une décision qui ne
  répond à rien est du confort.
- **« tu ne modifies aucun fichier existant »** est **la contrainte du scénario**. Sans elle,
  l'agent part refactoriser le code existant et vous passez le cas pratique à le retenir.

> ⏳ **C'est la phase la plus longue à produire.** Ne croyez pas que ça a planté. Pendant qu'il
> écrit, **relisez la phase 1** : vous avez du temps gratuit.

### 🚪 La porte 2

> **Pour chaque brique proposée, demandez à quel besoin de la phase 1 elle répond.** Celles qui ne
> répondent à rien sortent — l'agent propose volontiers la version idéale d'un projet qui n'est pas
> le vôtre.

Puis :

```
Conception validée. Passe aux tâches.
```

---

## ③ Phase 3 · les TÂCHES

**Troisième personne.**

```
Temps 3. À partir de spec/exigences.md et spec/conception.md, écris
spec/taches.md : la liste numérotée des tâches, dans l'ordre où on
les fait. Chaque tâche renvoie explicitement aux exigences qu'elle
sert. N'écris aucun code. Arrête-toi là.
```

### 🚪 La porte 3 — et c'est la plus facile à tenir sans lire de code

> **Prenez trois renvois au hasard et vérifiez que les exigences citées existent vraiment.**
> C'est le geste le plus simple des trois, et **celui qui trouve le plus de défauts**.

⚠️ **Le piège attendu, et il est vécu :** une tâche qui renvoie à « l'exigence 1.8 » alors que
l'exigence 1 n'a que cinq critères. **Tracé n'est pas vrai.** Un renvoi se suit, il ne se croit pas.

**Les deux autres questions, si vous avez le temps :**

- **Couverture** — y a-t-il une exigence qu'aucune tâche ne couvre ? *(c'est celle qu'on oublie)*
- **Cohérence** — l'ordre tient-il debout ?

---

## ④ Une tâche, une seule

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
- ☐ **Les trois portes franchies par trois personnes différentes**
- ☐ **Ce que vous avez dû corriger avant d'accepter** — pour chaque porte, au moins une chose
- ☐ **Un fichier produit ouvert**, et son contenu regardé

**Un groupe qui n'a que les trois premiers points a réussi le cas pratique.**

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
