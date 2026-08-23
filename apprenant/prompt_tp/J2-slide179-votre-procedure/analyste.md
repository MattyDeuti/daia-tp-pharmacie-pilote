# Analyste — la procédure qui rédige une demande utilisateur

> **MODE : AGENT** · le sélecteur, en haut du panneau Copilot

**Ce que vous fabriquez :** une procédure nommée `demande-utilisateur`, qui rédige **toujours au
même format** — « en tant que, je veux, afin de », suivi des critères d'acceptation.

> 🟢 **Zéro ligne de code, du début à la fin.** Votre procédure est aussi structurante que celle du
> développeur d'à côté, et elle sera relue par l'outil exactement de la même façon.

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

- **Le format imposé** est ce qui rend deux demandes comparables, écrites à deux mois d'écart par
  deux personnes différentes. C'est exactement ce qu'une procédure sert à figer.
- **« suivie de ses critères d'acceptation »** est la moitié qu'on oublie. Une demande sans
  critères ne se recette pas.
- **« sans aucun terme technique »** est votre garde-fou : la demande doit pouvoir être validée par
  la pharmacienne, pas par le développeur.
- **Le marqueur** est votre preuve, et la seule.

---

## ② Rechargez la fenêtre

**Ne sautez pas cette étape.** Tant que la fenêtre n'a pas été rechargée, l'outil n'a pas vu la
procédure que vous venez de déposer.

---

## ③ Déclenchez-la **sans la nommer**

**📋 À COLLER DANS LE PANNEAU**

```
Rédige la demande pour une alerte quand un lot approche de sa date
de péremption.
```

**Vous ne dites pas « avec demande-utilisateur ».** Si la procédure est bien décrite, l'outil doit
aller la chercher tout seul.

---

## ④ Cherchez le marqueur

**Ouvrez le livrable produit.** Pas la réponse du chat.

| Ce que vous voyez | Ce que ça veut dire |
|---|---|
| `CANARI-<votre prénom>` en première ligne | ✅ **La procédure a servi** |
| Une demande bien écrite, **sans** marqueur | ⛔ **Elle n'a jamais été ouverte** |
| « skill appliquée » dans le chat | ⛔ **Ça ne prouve rien** |

**Si le marqueur manque**, une seule reprise autorisée :

**📋 À COLLER DANS LE PANNEAU**

```
Refais cette demande en utilisant la skill demande-utilisateur.
```

Et **notez que la première fois n'a pas marché**.

---

## ⑤ Relisez les critères d'acceptation

C'est là que se joue votre métier, pas dans le format.

| Le critère | Deux personnes en feraient-elles la même chose ? | D'où vient-il ? |
|---|---|---|
| | | |

**« Approche de sa date de péremption » ne veut rien dire tant qu'on n'a pas dit combien de
jours.** Regardez s'il a choisi un nombre tout seul — et lequel. Personne ne le lui a donné.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ La procédure `demande-utilisateur` déposée dans le projet
- ☐ Une demande **ouverte sous vos yeux**, au format imposé
- ☐ **Le marqueur en première ligne** — ou la note « pas au premier essai »
- ☐ **Au moins un critère dont vous avez repéré qu'il a été inventé**

---

## Le défi bonus — *seulement si vous avez fini*

Ajoutez la parade d'hier **dans la procédure elle-même**, et pas dans la demande :

**📋 À COLLER DANS LE PANNEAU**

```
Modifie la skill demande-utilisateur pour qu'elle écrive [à compléter]
partout où une valeur chiffrée serait nécessaire mais n'a pas été
fournie, au lieu de la choisir.
```

**Ce que ça apprend, et c'est le sommet du module :** une parade écrite dans une procédure
s'applique **à toutes les demandes suivantes**, sans que personne ait à y penser. C'est la
différence entre une bonne pratique et un dispositif.

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
