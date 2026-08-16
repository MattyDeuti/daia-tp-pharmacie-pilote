# Manager — la procédure qui rédige une synthèse de comité

**Ce que vous fabriquez :** une procédure nommée `synthese-comite`, qui produit **toujours le même
format de note** — quinze lignes, la dette, l'effort, la décision demandée.

> 🟢 **Zéro ligne de code.** Et c'est probablement la procédure la plus directement réutilisable
> chez vous lundi, parce que la synthèse de comité, vous en écrivez toutes les semaines.

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

- **« quinze lignes maximum »** est le plafond, et c'est lui qui rend la note lisible. Sans lui,
  vous recevrez trois pages que personne ne lira en séance.
- **« la décision demandée au comité »** est la partie que tout le monde oublie. Une note qui décrit
  sans demander ne sert à rien : le comité repart sans avoir tranché.
- **« pas d'introduction, pas de conclusion »** supprime les deux paragraphes de politesse que les
  modèles produisent par réflexe. Ils occupent le tiers de votre plafond.
- **Le marqueur** est votre preuve, et la seule.

---

## ② Rechargez la fenêtre

**Ne sautez pas cette étape.** Tant que la fenêtre n'a pas été rechargée, l'outil n'a pas vu la
procédure que vous venez de déposer.

---

## ③ Déclenchez-la **sans la nommer**

```
Fais-moi la synthèse de l'état du fichier GestionStock.java.
```

**Vous ne dites pas « avec synthese-comite ».** Si la procédure est bien décrite, l'outil doit
aller la chercher tout seul.

---

## ④ Cherchez le marqueur

**Ouvrez le livrable produit.** Pas la réponse du chat.

| Ce que vous voyez | Ce que ça veut dire |
|---|---|
| `CANARI-<votre prénom>` en première ligne | ✅ **La procédure a servi** |
| Une synthèse impeccable, **sans** marqueur | ⛔ **Elle n'a jamais été ouverte** |
| « skill appliquée » dans le chat | ⛔ **Ça ne prouve rien** |

**Si le marqueur manque**, une seule reprise autorisée :

```
Refais cette synthèse en utilisant la skill synthese-comite.
```

Et **notez que la première fois n'a pas marché**.

---

## ⑤ Regardez d'où sortent les chiffres

C'est le seul contrôle qui compte sur ce livrable.

| Le chiffre | Qui le lui a donné ? |
|---|---|
| L'effort estimé | |
| Le coût, s'il en donne un | |
| Le délai, s'il en donne un | |

**Il va produire un effort en jours-homme.** Personne ne lui a donné la taille de votre équipe, ni
son coût, ni sa vélocité. **Le chiffre est plausible et il est inventé** — et c'est précisément le
genre de nombre qui, une fois en comité, devient un engagement.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ La procédure `synthese-comite` déposée dans le projet
- ☐ Une synthèse **ouverte sous vos yeux**, quinze lignes maximum
- ☐ **Le marqueur en première ligne** — ou la note « pas au premier essai »
- ☐ **Au moins un chiffre dont vous savez qu'il a été inventé**

---

## Le défi bonus — *seulement si vous avez fini*

Inscrivez la parade **dans la procédure**, pour qu'elle vaille pour toutes vos synthèses futures :

```
Modifie la skill synthese-comite pour qu'elle écrive [à compléter]
à la place de tout chiffre qu'on ne lui a pas fourni, au lieu de
l'estimer.
```

**Ce que ça apprend, et c'est le sommet du module :** une parade écrite une fois dans une procédure
protège **toutes les notes suivantes**, y compris celles que vous écrirez sans y penser. C'est la
différence entre une bonne pratique et un dispositif.
