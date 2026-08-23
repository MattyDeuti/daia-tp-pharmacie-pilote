# Testeur ou QA — la procédure qui écrit trois cas par méthode

> **MODE : AGENT** · le sélecteur, en haut du panneau Copilot

**Ce que vous fabriquez :** une procédure nommée `jeu-de-tests`, qui produit **exactement trois cas
par méthode publique** — jamais deux, jamais dix.

---

## ⓪ Une conversation neuve

**📋 À COLLER DANS LE PANNEAU**

```
/clear
```

---

## ① Écrivez la demande — avec vos mots

**Il n'y a pas de texte à copier ici.** Le nom de la procédure est imposé, son cahier des
charges aussi. **Les deux lignes du milieu, c'est vous qui les écrivez** — et ce sont elles
qui décident de tout.

**📋 À COLLER DANS LE PANNEAU**

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

- **« exactement trois »** est votre apport de métier. Sans le compte, il écrit trois cas nominaux
  et zéro cas d'erreur — parce que le chemin heureux est celui qui vient tout seul.
- **« un cas limite et un cas d'erreur »** nomme les deux qu'on oublie. Ce sont les seuls qui
  trouvent des bugs.
- **« Étant donné / Quand / Alors, en français »** rend les cas lisibles par l'analyste et le
  manager. C'est ce qui les rend discutables en réunion.
- **Le marqueur** est votre preuve, et la seule.

---

## ② Rechargez la fenêtre

**Ne sautez pas cette étape.** Tant que la fenêtre n'a pas été rechargée, l'outil n'a pas vu la
procédure que vous venez de déposer.

---

## ③ Déclenchez-la **sans la nommer**

**📋 À COLLER DANS LE PANNEAU**

```
Écris les tests de la classe GestionStock.
```

**Vous ne dites pas « avec jeu-de-tests ».** Si la procédure est bien décrite, l'outil doit aller
la chercher tout seul.

---

## ④ Cherchez le marqueur

**Ouvrez le fichier produit.** Pas la réponse du chat.

| Ce que vous voyez | Ce que ça veut dire |
|---|---|
| `CANARI-<votre prénom>` en première ligne | ✅ **La procédure a servi** |
| Des tests corrects, **sans** marqueur | ⛔ **Elle n'a jamais été ouverte.** C'est le piège du module |
| « skill appliquée » dans le chat | ⛔ **Ça ne prouve rien** |

> ⚠️ **Ce cas est arrivé pour de vrai, et le résultat était bon quand même.** C'est exactement ce
> qui rend le piège dangereux : rien dans la qualité du livrable ne vous alerte.

**Si le marqueur manque**, une seule reprise autorisée :

**📋 À COLLER DANS LE PANNEAU**

```
Refais ces tests en utilisant la skill jeu-de-tests.
```

Et **notez que la première fois n'a pas marché**.

---

## ⑤ Comptez, avant de lever la main

| Méthode publique | 3 cas ? | Le cas d'erreur est-il un vrai cas d'erreur ? |
|---|---|---|
| | | |

**La troisième colonne est celle qui compte.** Un « cas d'erreur » qui vérifie qu'une valeur
correcte fonctionne n'est pas un cas d'erreur — et c'est fréquent.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ La procédure `jeu-de-tests` déposée dans le projet
- ☐ Un fichier de tests **ouvert sous vos yeux**
- ☐ **Le marqueur en première ligne** — ou la note « pas au premier essai »
- ☐ **Le compte** : trois cas par méthode, et pas autre chose

---

## Le défi bonus — *seulement si vous avez fini*

**Généré n'est pas vert.** Vous avez des tests ; personne ne les a vus passer.

**📋 À COLLER DANS LE PANNEAU**

```
Exécute ces tests et montre-moi la sortie complète, sans la résumer.
```

**Puis lisez la sortie vous-même.** S'il vous annonce que tout passe sans vous montrer le compte
rendu d'exécution, vous n'avez toujours rien vu passer — et c'est la question de la journée.

---

## Le second défi bonus — **régler l'approbation**

*Celui-ci n'a rien à taper dans le chat. C'est un réglage, et c'est de la gouvernance.*

Depuis la démonstration de tout à l'heure, chaque appel d'outil vous demande votre accord.
**Vous allez décider lesquels continuent de le faire, et lesquels passent tout seuls.**

### Le geste

**`Ctrl + Maj + P`** → **`Chat: Manage Tool Approval`**

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
