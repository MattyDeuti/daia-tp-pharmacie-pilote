# Brique 1 — un relecteur en lecture seule

*Voie 1. **Vous écrivez son fichier vous-même**, à la main, dans le dossier des agents du projet.*

**Ce que vous fabriquez :** un agent dont le métier est de **relire, et rien d'autre**.

---

## ① Écrivez son fichier

C'est le sens de la voie 1 : **vous voulez voir les champs**, et on ne voit bien que ce qu'on a
écrit soi-même.

> 📍 **Le squelette, les cinq champs et le symptôme classique sont dans le projet**, à trois clics
> de là où vous êtes : **`.github/agents/README.md`**. Vous n'avez rien à retrouver dans le
> support.

**Les deux points qui comptent, et ils comptent plus que le reste du fichier :**

1. **Le champ des droits, en lecture seule.** *Un relecteur qui peut corriger n'est pas un
   relecteur.* C'est toute la brique.
2. **La consigne de forme : il doit commencer par dire ce qui va bien.** S'il ne sait pas nommer ce
   qui tient, il casse ce qui marchait en voulant tout améliorer.

### Ce que vous écrivez dans le corps du fichier

Sous les trois tirets, c'est là que se joue la qualité de la revue — et donc la lisibilité de votre
preuve. **Trois choses, et elles suffisent :**

**Ce qu'il rend, à chaque fois et dans cet ordre.** ① ce qui va bien, en une ou deux phrases,
avant tout le reste · ② ce qui le gêne, un point par ligne, et pour chacun **d'abord ce qui peut
arriver concrètement**, avant toute explication technique · ③ par quoi il commencerait : **un seul
point**, et pourquoi celui-là.

**Sa façon d'écrire.** En français, **pour quelqu'un qui ne programme pas** — c'est votre
observateur qui devra juger cette revue.

**Ce qu'il ne fait jamais.** Il **ne propose jamais de corriger lui-même**, et il ne demande jamais
l'autorisation de le faire. Il constate, c'est tout. *(Il n'en a de toute façon pas le droit — mais
s'il le propose, votre preuve devient trouble.)* Et **s'il ne trouve rien qui le gêne, il le dit et
il ne remplit pas.**

> ⚠️ **Le symptôme que vous allez avoir : votre agent n'apparaît pas dans la liste.**
> Neuf fois sur dix, **ce n'est pas une faute de syntaxe** — c'est un champ **réel** mal réglé qui
> le rend volontairement invisible.
>
> **Un champ inventé ne charge pas. Un champ réel mal réglé cache.** Ne cherchez pas la faute de
> frappe, regardez le champ qui rend visible.

---

## ② Faites-lui relire la charte du projet

Une fois l'agent en place, **c'est la seule phrase que vous tapez**. Tout le reste est dans son
fichier — c'est précisément ce qui fait la différence entre un agent et un prompt.

```
Relis le fichier AGENTS.md et rends-moi une revue.
Commence par ce qui va bien, puis ce qui te gêne. Ne modifie rien.
```

> **Pourquoi ce fichier-là, et pas votre code.** `AGENTS.md` est la charte du projet, et c'est
> **celle que deux autres binômes sont en train d'écrire en ce moment même** — les sections 2 et 3.
> Votre relecteur ne relit pas un exercice : il relit le travail de l'équipe.
>
> Et il est **en français, court**. Votre observateur peut juger la revue — et c'est lui qui
> détient la preuve.

---

## ③ Votre preuve — dans la liste des fichiers modifiés

**Il rend une revue, et `AGENTS.md` n'a pas bougé.**

**Ouvrez le panneau Source Control** *(l'icône des branches, dans la barre de gauche)*. Il liste
les fichiers que vous avez modifiés et pas encore enregistrés.

| Quand | Ce que vous faites |
|---|---|
| **Avant** de lancer la revue | vous regardez la liste |
| **Après** sa réponse | vous regardez la même liste |

| Ce que vous devez voir | |
|---|---|
| Sa réponse : une revue **qui commence par ce qui va bien** | ✅ |
| **`AGENTS.md` n'est PAS apparu** dans la liste | ✅ **c'est ça, la preuve** |
| `AGENTS.md` est apparu | ⛔ il a écrit dedans : le champ des droits est mal réglé |

**La preuve n'est pas dans sa réponse, elle est dans ce qui n'a pas bougé.** Aucune commande à
taper, rien à savoir de Git.

⛔ **Ce qui ne compte pas :** lui demander s'il a bien respecté la lecture seule. Il dira oui.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ Le fichier de l'agent, **écrit par vous**, dans le dossier des agents
- ☐ Votre agent **visible dans la liste**
- ☐ Une revue rendue, **qui commence par ce qui va bien**
- ☐ **`AGENTS.md` absent de la liste des fichiers modifiés** — c'est la preuve

Puis la phrase commune : `sauvegarde et publie mon travail`

---

## Le défi bonus — *seulement si vous avez fini*

**Lâchez votre agent de revue sur votre propre travail de l'après-midi** : la procédure que vous
avez écrite au cas pratique de 14h02.

```
Relis le fichier .github/skills/<ma-procédure>/SKILL.md et rends-moi une revue.
Commence par ce qui va bien, puis ce qui te gêne. Ne modifie rien.
```

*(Remplacez `<ma-procédure>` par le nom que vous lui aviez donné.)*

**Ce que ça apprend :** vous découvrez ce que votre propre relecteur dit de votre propre travail —
et **vous êtes le seul de la salle à pouvoir juger s'il a raison**. C'est aussi le meilleur moyen
de voir si votre consigne de forme a réellement pris.

---

## 🆘 Si vous calez sur l'écriture du fichier

**Essayez d'abord à la main.** Cinq minutes à chercher un champ valent mieux qu'un fichier correct
dont vous ne sauriez rien dire — c'est tout le sens de la voie 1.

Mais si le temps passe, **voici la demande à coller**. Elle est écrite pour que l'agent aille lire
le format **dans le projet** au lieu de l'inventer :

```
Crée un agent de revue dans ce projet. Le format exact des agents est décrit
dans .github/agents/README.md : lis-le d'abord et respecte-le à la lettre.

SON PÉRIMÈTRE
- il n'a que le droit de lire, jamais celui de modifier
- il relit le fichier que je lui désigne, et rien d'autre
- je dois pouvoir l'appeler par son nom

CE QU'IL REND, À CHAQUE FOIS ET DANS CET ORDRE
1. ce qui va bien, en une ou deux phrases, avant tout le reste
2. ce qui le gêne, un point par ligne — et pour chacun, d'abord ce qui peut
   arriver concrètement, en une phrase, avant toute explication technique
3. par quoi il commencerait : un seul point, et pourquoi celui-là

SA FAÇON D'ÉCRIRE
- en français, pour quelqu'un qui ne programme pas
- il ne propose jamais de corriger lui-même, et il ne demande jamais
  l'autorisation de le faire : il constate, c'est tout
- s'il ne trouve rien qui le gêne, il le dit et il ne remplit pas

Montre-moi le fichier avant de l'écrire.
```

> ⚠️ **« Montre-moi le fichier avant de l'écrire » n'est pas une politesse.** C'est votre porte :
> vous relisez les cinq champs avant qu'ils existent. **Regardez d'abord celui des droits** — s'il
> y a autre chose que la lecture et la recherche, votre relecteur peut corriger, et votre brique
> ne prouve plus rien.
>
> **Et si un champ vous surprend, vérifiez-le avant de conclure.** Il y a plus de champs réels que
> les cinq du `README.md` : la liste complète est dans
> `apprenant/01-references/sous-agents/CHAMPS.md`. **S'il n'y est pas non plus, il est inventé** —
> c'est exactement le risque de la voie 2 : le modèle produit des champs parfaitement plausibles
> qui n'existent pas.
