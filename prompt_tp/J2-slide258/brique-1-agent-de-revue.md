# Brique 1 — un relecteur en lecture seule

*Voie 1. **Vous écrivez son fichier vous-même**, à la main, dans le dossier des agents du projet.*

**Ce que vous fabriquez :** un agent dont le métier est de **relire, et rien d'autre**.

---

## ① Écrivez son fichier

C'est le sens de la voie 1 : **vous voulez voir les champs**, et on ne voit bien que ce qu'on a
écrit soi-même. Le squelette et les champs acceptés sont dans le support du module précédent.

**Les deux points qui comptent, et ils comptent plus que le reste du fichier :**

1. **Le champ des droits, en lecture seule.** *Un relecteur qui peut corriger n'est pas un
   relecteur.* C'est toute la brique.
2. **La consigne de forme : il doit commencer par dire ce qui va bien.** S'il ne sait pas nommer ce
   qui tient, il casse ce qui marchait en voulant tout améliorer.

> ⚠️ **Le symptôme que vous allez avoir : votre agent n'apparaît pas dans la liste.**
> Neuf fois sur dix, **ce n'est pas une faute de syntaxe** — c'est un champ **réel** mal réglé qui
> le rend volontairement invisible.
>
> **Un champ inventé ne charge pas. Un champ réel mal réglé cache.** Ne cherchez pas la faute de
> frappe, regardez le champ qui rend visible.

---

## ② Faites-lui faire son travail

Une fois l'agent en place, **c'est la seule phrase que vous tapez**. Tout le reste est dans son
fichier — c'est précisément ce qui fait la différence entre un agent et un prompt.

```
Relis les modifications que je n'ai pas encore enregistrées et rends-moi une
revue. Commence par ce qui va bien, puis ce qui te gêne. Ne modifie rien.
```

---

## ③ Votre preuve — et elle se lit sur le disque

**Il rend une revue, et il n'a rien modifié.**

| Où vous regardez | Ce que vous devez voir |
|---|---|
| Sa réponse | une revue, qui **commence par ce qui va bien** |
| Vos modifications en cours | **exactement les mêmes qu'avant** qu'il parle |

**La preuve n'est pas dans sa réponse, elle est dans ce qui n'a pas bougé.** Comparez l'état de vos
modifications avant et après : c'est le même.

⛔ **Ce qui ne compte pas :** lui demander s'il a bien respecté la lecture seule. Il dira oui.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ Le fichier de l'agent, **écrit par vous**, dans le dossier des agents
- ☐ Votre agent **visible dans la liste**
- ☐ Une revue rendue, **qui commence par ce qui va bien**
- ☐ **Vos modifications intactes** — c'est la preuve

Puis la phrase commune : `sauvegarde et publie mon travail`

---

## Le défi bonus — *seulement si vous avez fini*

**Lâchez votre agent de revue sur vos propres modifications**, celles que vous venez de publier.

**Ce que ça apprend :** vous découvrez ce que votre propre relecteur dit de votre propre travail —
et vous êtes le seul de la salle à pouvoir juger s'il a raison. C'est aussi le meilleur moyen de
voir si votre consigne de forme a réellement pris.
