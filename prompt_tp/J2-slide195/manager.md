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

## ① Demandez la procédure

**Remplacez `PRENOM` par votre prénom** avant de coller.

```
Crée une skill nommée synthese-comite dans le fichier
.github/skills/synthese-comite/SKILL.md, sur le modèle de
.github/skills/git-workflow/SKILL.md : même frontmatter, avec
seulement name, description, argument-hint et user-invocable.
Elle rédige une synthèse de quinze lignes maximum pour un comité de
pilotage : la dette constatée, l'effort estimé, et la décision demandée
au comité. Pas de jargon technique, pas d'introduction, pas de
conclusion.
Fais-lui commencer chaque livrable par la ligne exacte CANARI-PRENOM.
```

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
