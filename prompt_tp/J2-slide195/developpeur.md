# Développeur — la procédure d'audit d'un fichier ancien

**Ce que vous fabriquez :** une procédure nommée `audit-legacy`, qui rend **toujours le même
rapport, dans le même ordre**, sur n'importe quel fichier ancien.

---

## ⓪ Une conversation neuve

```
/clear
```

---

## ① Écrivez la demande — avec vos mots

**Il n'y a pas de texte à copier ici.** Le nom de la procédure est imposé, son cahier des
charges aussi. **Les deux lignes du milieu, c'est vous qui les écrivez** — et ce sont elles
qui décident de tout.

```
Crée une skill nommée %s.

À QUOI ELLE SERT : ......................................

QUAND ELLE DOIT ÊTRE INVOQUÉE : .........................

Fais-lui commencer chaque livrable par la ligne exacte
CANARI-PRENOM.
```

**Ce que la procédure doit produire**, et là-dessus vous n'avez pas le choix :
%s.

**Ce que vous écrivez vous-même :**

- **À quoi elle sert** — ce qu'elle produit, en une phrase.
- **Quand elle doit être invoquée** — la phrase que vous taperiez dans deux mois, sans y
  penser et sans connaître le nom du fichier.

> Ces deux lignes deviennent le champ que l'outil lit — **le seul** — avant de décider
> d'ouvrir votre procédure. Mal écrites, elle ne partira jamais toute seule. **Vous le
> verrez à l'étape ③**, qui la déclenche sans la nommer.

**Remplacez `PRENOM` par votre prénom.**

> 🆘 **Si ça ne part pas**, et seulement après avoir réécrit votre description une fois :
> ouvrez **`LA-TRICHE.md`**, dans ce dossier. Il donne la demande complète et les trois
> pièges que personne ne devine.

**Ce que fait chaque partie :**

- **« six rubriques imposées et toujours dans le même ordre »** est ce qui transforme un prompt en
  procédure. Deux audits produits à deux semaines d'écart deviennent **comparables**.
- **« dix lignes par rubrique au maximum »** est le plafond. Sans lui, la rubrique « dette » mange
  tout le rapport.
- **« en français »** parce que le rapport sera lu par des gens qui ne codent pas.
- **Le marqueur** est votre preuve, et la seule.

---

## ② Rechargez la fenêtre

**Ne sautez pas cette étape.** Tant que la fenêtre n'a pas été rechargée, l'outil n'a pas vu la
procédure que vous venez de déposer.

---

## ③ Déclenchez-la **sans la nommer**

C'est le test, et c'est là que ça se joue :

```
Audite le fichier GestionStock.java.
```

**Vous ne dites pas « avec audit-legacy ».** Si la procédure existe et qu'elle est bien décrite,
l'outil doit aller la chercher tout seul.

---

## ④ Cherchez le marqueur

**Ouvrez le livrable produit.** Pas la réponse du chat — le fichier.

| Ce que vous voyez | Ce que ça veut dire |
|---|---|
| `CANARI-<votre prénom>` en première ligne | ✅ **La procédure a servi.** C'est la preuve |
| Un audit correct, **sans** marqueur | ⛔ **Elle n'a jamais été ouverte.** Il a fait le travail lui-même |
| « skill appliquée » écrit dans le chat | ⛔ **Ça ne prouve rien.** Une IA qui dit avoir lu n'a rien prouvé |

**Si le marqueur manque**, une seule reprise autorisée : nommez la procédure explicitement.

```
Refais cet audit en utilisant la skill audit-legacy.
```

Et **notez que la première fois n'a pas marché** — c'est ça qu'on va compter.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ La procédure `audit-legacy` déposée dans le projet
- ☐ Un livrable d'audit **ouvert sous vos yeux**
- ☐ **Le marqueur en première ligne** — ou la note « pas au premier essai »
- ☐ Les six rubriques présentes, **dans l'ordre demandé**

---

## Le défi bonus — *seulement si vous avez fini*

**Relancez la même procédure sur l'autre fichier du projet :**

```
Audite le fichier db/schema_extensions.sql.
```

**Ce que ça montre :** les six rubriques sortent quand même, y compris celles qui n'ont rien à dire
sur ce fichier-là. **Une forme imposée se remplit toujours** — c'est le piège d'hier, et votre
propre procédure vient de le reproduire. Regardez ce qu'elle a écrit sous « tests ».

---

## Le second défi bonus — **régler l'approbation**

*Celui-ci n'a rien à taper dans le chat. C'est un réglage, et c'est de la gouvernance.*

Depuis la démonstration de tout à l'heure, chaque appel d'outil vous demande votre accord.
**Vous allez décider lesquels continuent de le faire, et lesquels passent tout seuls.**

### Le geste

```
Ctrl + Maj + P   →   Chat: Manage Tool Approval
```

La liste des outils s'ouvre, **groupés par serveur**. Dépliez `playwright` : vous pouvez cocher
outil par outil, ou cocher le serveur entier pour tout accorder d'un coup.

### La règle que je vous propose, et que vous avez le droit de refuser

| Ce que l'outil fait | Ce que je conseille |
|---|---|
| il **lit** | peut passer tout seul |
| il **écrit** un fichier | qu'il demande |
| il **exécute** une commande | qu'il demande |
| il **sort du projet** — le web, un navigateur | qu'il demande |

**Ce sont les quatre paliers de droits vus tout à l'heure**, appliqués à l'approbation.

### Ce qu'on vous demandera

Pas votre réglage : **votre raison**. « J'ai tout coché » est une réponse acceptable, à
condition de pouvoir la défendre devant les autres. C'est exactement la conversation qu'une
équipe doit avoir **avant** de lâcher un agent sur son projet, pas après.

> **Le dialogue d'approbation offre quatre portées, et elles n'engagent pas la même chose :**
> cet appel-ci · cette session · **ce projet** · toutes les fois à venir.
> La troisième s'écrit dans le projet, donc **elle engage toute l'équipe**. La quatrième vaut
> partout, pour toujours, y compris sur les dépôts que vous n'avez pas encore ouverts.

> **Pour revenir en arrière**, à connaître et à garder : `Chat: Reset Tool Confirmations`
> efface toutes les approbations que vous avez accordées.
