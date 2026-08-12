# TP 4 — Quatre briques, un seul dépôt

> **L'objectif et les étapes sont à l'écran.** Ce fichier ne porte que ce qui ne s'y projette
> pas : le prompt de votre rôle, votre preuve, et quoi faire si ça coince.
>
> **Une brique chacun. Pas la même.** À la fin, elles atterrissent toutes dans le même dépôt.

## Comment vous êtes organisés

**Un binôme par rôle.** Prenez **le rôle de votre métier**, pas celui qui vous fait envie.

Dans le binôme : **un pilote, un observe et note la preuve.** L'observateur n'est pas un
spectateur — c'est lui qui pourra dire, à la fin, si la brique a agi.

**Trois règles pour les quatre rôles :**

1. **Donnez-lui un exemple** de ce que vous appelez un bon résultat. Sans exemple, il vous rendra
   la convention générique d'Internet, pas la vôtre.
2. **On ne corrige pas le code du projet.** Ce n'est pas l'exercice.
3. **Une brique, pas deux.** Si vous finissez tôt, vous ne prenez pas le rôle du voisin : vous
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
>
> **Si vous calez, demandez-le à l'agent dans le chat** — mais essayez d'abord. Cinq minutes à
> chercher un champ valent mieux qu'un fichier correct dont vous ne sauriez rien dire.

Il doit porter **deux choses**, et ce sont elles qu'on regardera.

1. **Le champ des droits, réglé en lecture seule.** Un relecteur qui peut corriger n'est pas un
   relecteur.
2. **Une consigne de forme** : commencer par dire ce qui va bien, avant ce qui gêne.

Puis vous l'utilisez :

```
Relis les modifications que je n'ai pas encore enregistrées et rends-moi une
revue. Commence par ce qui va bien, puis ce qui te gêne. Ne modifie rien.
```

**Votre preuve : il rend une revue, et il n'a rien modifié.** La vérification se fait **sur le
disque**, pas sur sa parole — la liste de vos modifications est identique avant et après.

> 🔴 **Le symptôme que vous aurez sans doute :** votre agent n'apparaît pas dans la liste. Neuf
> fois sur dix ce n'est **pas** une faute d'écriture, c'est **un champ réel mal réglé**. Levez la
> main, ça se débloque en dix secondes — et c'est une leçon, pas une perte de temps.

---

### 🟥 Testeur / QA — *voie 1* — la procédure qui génère les tests

Remplacez `<mon prénom>` par votre prénom.

```
Crée-moi une procédure packagée qui génère les tests d'une classe Java :
un cas nominal, un cas limite et un cas d'erreur par méthode publique, au
format préparer / agir / vérifier. Fais-lui commencer chaque fichier produit
par le marqueur CANARI-<mon prénom>.
```

Puis, pour la déclencher : `Génère les tests de cette classe.`

**Deux gestes qui ne concernent que vous :**

- **Rechargez la fenêtre** après avoir déposé la procédure — sinon elle n'existe pas encore pour
  l'outil (`Ctrl + Shift + P` → `Developer: Reload Window`)
- **Nommez-la** si la tâche a l'air banale : dans le doute, un agent fait le travail lui-même

**Votre preuve : le marqueur, en tête du fichier de tests produit.** Jamais « procédure
appliquée » écrit dans la conversation.

> ⚠️ **Un fichier de tests correct SANS le marqueur signifie que votre procédure n'a jamais été
> ouverte.** Le résultat peut être bon quand même. C'est le piège du module, et il compte comme
> résultat : dites-le tel quel.

---

### 🟨 Analyste — *voie 2, zéro ligne de code* — les règles métier

```
Dans le fichier AGENTS.md, section 2 « Règles métier », ajoute nos règles.
En français, sans jargon technique, une règle par ligne, formulée comme une
obligation ou une interdiction. La première : toute écriture concernant un
produit classé stupéfiant doit être tracée (qui, quand, quelle quantité, pour
quelle ordonnance), et aucune écriture sans journal.
N'écris nulle part ailleurs que dans la section 2.
```

Puis vous lui tendez un piège :

```
Ajoute une méthode qui enregistre une sortie de stock de morphine.
```

**Votre preuve : soit il refuse, soit il ajoute le journal de lui-même. Les deux comptent.**

⛔ **Ce qui ne compte pas :** lui demander s'il a bien lu la charte. On ne prend pas un agent à
témoin de sa propre obéissance.

---

### 🟩 Manager — *voie 2* — les règles de gouvernance

```
Dans le fichier AGENTS.md, section 3 « Règles de gouvernance », ajoute nos
interdits. Un par ligne, sans condition et sans exception. Le premier :
ne crée jamais de fichier à la racine du projet, et ne restructure jamais
l'arborescence sans me le proposer d'abord et attendre ma réponse.
N'écris nulle part ailleurs que dans la section 3.
```

**Votre marqueur, et c'est lui qui rendra votre brique visible par toute la salle :** glissez
dans votre règle une formule qui n'existe nulle part ailleurs. Terminez la première ligne par
`… sans me le proposer d'abord et attendre ma réponse (règle maison RG-<votre prénom>).`

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
| 🟦 Développeur | il rend une revue **et n'a rien modifié** |
| 🟥 Testeur / QA | **le marqueur** est en tête du fichier de tests produit |
| 🟨 Analyste | la règle **tient** face à la demande piège |
| 🟩 Manager | il **refuse en citant** la règle |

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

Vous relisez la proposition **d'un autre binôme**, pas la vôtre. Vous cherchez une seule chose :
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
