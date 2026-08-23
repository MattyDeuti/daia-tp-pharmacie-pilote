# Première étape — se connecter

> **À faire une seule fois, au tout début du premier jour. Cinq minutes.**
>
> Votre machine de formation est neuve : elle ne vous connaît pas encore. Ces cinq étapes
> lui apprennent qui vous êtes, et installent le projet. Tant qu'elles ne sont pas faites,
> l'assistant ne répondra pas.

**Faites-les dans l'ordre.** L'étape ④ est deux fois plus rapide si l'étape ① est faite avant.

---

## ① Connectez-vous à GitHub, dans le navigateur

Ouvrez le navigateur de la machine, et allez à cette adresse :

```
https://github.com/login
```

Entrez **votre identifiant (ou votre e-mail) et votre mot de passe GitHub**.

> **Vous n'avez pas de compte GitHub ?** Créez-le maintenant, sur **https://github.com/signup**.
> Comptez trois à cinq minutes : une adresse e-mail, un mot de passe, et un code à valider.
> Signalez-le au formateur, il vous laisse le temps.

> ⚠️ **Si une autre session est déjà ouverte** dans ce navigateur, déconnectez-vous et
> reconnectez-vous avec **votre** compte. Tout ce que vous ferez ensuite portera le nom du
> compte connecté ici.

---

## ② Attendez le code de vérification

**C'est normal, et c'est prévu.** GitHub ne reconnaît pas cette machine — il vous envoie un
code à six chiffres pour vérifier que c'est bien vous.

| Où il arrive | Quand |
|---|---|
| **Par e-mail**, objet en anglais commençant par `[GitHub]` | dans la minute, presque toujours |
| **Par SMS ou par application**, sur votre téléphone | si vous avez activé la double authentification |

Trois choses à savoir :

- **Regardez vos indésirables / spams.** C'est là qu'il finit une fois sur trois.
- **Votre messagerie n'est pas forcément sur cette machine.** Lisez le mail sur votre
  téléphone, ou ouvrez votre webmail dans un second onglet — les deux marchent.
- **Le code expire.** S'il ne passe plus, redemandez-en un : le lien est sur la page.

Une fois le code saisi, vous arrivez sur votre page GitHub. **Laissez cet onglet ouvert**,
il sert tout de suite à l'étape suivante.

---

## ③ Récupérez le projet

**Trois gestes, et le troisième est le plus important.**

**1. Sur le Bureau de la machine, créez un dossier.** Le nom n'a aucune importance — `formation`,
`ici`, ce que vous voulez.

**2. Ouvrez ce dossier dans VS Code** : `Fichier` → `Ouvrir le dossier…`, et choisissez-le.

**3. Ouvrez le terminal** (`Terminal` → `Nouveau terminal`) et tapez cette ligne :

```
git clone https://github.com/MattyDeuti/daia-tp-pharmacie-pilote.git
```

Une trentaine de lignes défilent, ça dure quelques secondes. **Le projet est arrivé.**

> **Rien à saisir, aucun mot de passe.** Le projet est public : n'importe qui peut le récupérer.
> Ce qui demandera un compte, c'est d'y **déposer** votre travail demain — pas de le lire
> aujourd'hui.

### ⚠️ Et maintenant le geste qui compte : rouvrez le bon dossier

Dans l'explorateur à gauche, un dossier **`daia-tp-pharmacie-pilote`** est apparu **à l'intérieur**
du vôtre. **C'est lui, le projet.**

**`Fichier` → `Ouvrir le dossier…` → `daia-tp-pharmacie-pilote`**

**Pourquoi ce geste n'est pas facultatif :** le projet transporte ses propres réglages, et VS Code
ne les lit **que** si c'est lui, le dossier ouvert. Si vous restez sur le dossier parent, tout a
l'air normal — les fichiers sont visibles, l'assistant répond — mais **il travaille sans aucune des
règles du projet, et rien à l'écran ne vous le dira.**

### Vous êtes au bon endroit quand…

En haut de l'explorateur, à gauche, vous lisez **`DAIA-TP-PHARMACIE-PILOTE`** — et **juste en
dessous**, sans rien déplier, vous voyez `.github`, `.vscode`, `apprenant`, `src`, et un fichier
`AGENTS.md`.

**Si vous voyez le nom de VOTRE dossier en haut et `daia-tp-pharmacie-pilote` en dessous, ce n'est
pas fini** : refaites `Fichier` → `Ouvrir le dossier…`.

---

## ④ Connectez-vous à Copilot

**C'est l'outil que vous utiliserez pendant les deux jours.** Il est déjà installé.

1. Ouvrez le panneau de discussion : **`Ctrl + Alt + I`**.
   *(ou l'icône Copilot, en haut de la fenêtre)*
2. Le panneau affiche un bouton **« Sign in »** — cliquez dessus.
3. VS Code demande l'autorisation d'ouvrir le navigateur : **acceptez**.
4. Le navigateur affiche **« Authorize Visual Studio Code »** — cliquez sur le bouton vert.
5. Revenez dans VS Code. Le panneau est prêt.

**Parce que vous êtes déjà connecté à GitHub depuis l'étape ①, il n'y a ni mot de passe ni
nouveau code à cette étape** — juste deux clics.

> **Si le panneau n'affiche aucun bouton de connexion :** cliquez sur l'icône de compte, tout
> en bas à gauche de la barre latérale, puis sur **« Sign in with GitHub »**.

### La preuve que ça marche

**On ne dit pas « normalement c'est bon ». On vérifie.** C'est la règle de ces deux jours, et
elle commence ici.

Dans le panneau, écrivez ceci et appuyez sur Entrée :

```
Bonjour, réponds-moi en une phrase pour confirmer que tu es bien connecté.
```

**Vous devez recevoir une réponse.** Si oui, vous avez fini.

---

## ⑤ Kiro : vous n'avez rien à faire

Vous verrez un second outil, **Kiro**, apparaître à l'écran pendant les démonstrations. Il est
installé sur votre machine, et son icône est visible.

> **Vous n'aurez ni à vous y connecter, ni à l'utiliser.** C'est le formateur qui s'en sert,
> pour vous montrer qu'un même besoin ne se traite pas de la même façon d'un outil à l'autre.
> **De votre côté, tout se fait dans VS Code, avec Copilot.**

Vous n'avez donc **aucun compte supplémentaire à créer**, et aucune connexion en attente.

---

## Ce qui peut coincer, et quoi faire

| Ce que vous voyez | Ce que ça veut dire | Quoi faire |
|---|---|---|
| Le code n'arrive pas | il est parti dans les indésirables, ou l'adresse n'est pas la bonne | regardez vos spams, puis redemandez un code |
| En haut de l'explorateur, vous lisez le nom de VOTRE dossier et non `DAIA-TP-PHARMACIE-PILOTE` | vous avez ouvert le dossier parent, pas le projet | refaites `Fichier` → `Ouvrir le dossier…` et choisissez `daia-tp-pharmacie-pilote` |
| `git clone` répond *destination path already exists* | vous avez déjà cloné une fois dans ce dossier | c'est fait, passez à la suite : ouvrez `daia-tp-pharmacie-pilote` |
| `git` n'est pas reconnu | l'outil manque sur ce poste | **signalez-le au formateur**, ne cherchez rien à installer |
| *« Your account is not eligible »* dans VS Code | le compte connecté n'a pas la licence Copilot | **signalez-le au formateur** |
| Le panneau reste vide, sans bouton | l'extension n'a pas fini de démarrer | fermez VS Code, rouvrez-le, refaites l'étape ④ |
| Le navigateur s'ouvre sur un autre compte | une session étrangère traîne | déconnectez-vous, refaites l'étape ① |
| Rien ne se passe au bout de deux minutes | inutile d'insister | **appelez le formateur** — c'est prévu, ça arrive |

**Ne cherchez pas à installer quoi que ce soit vous-même.** Tout est déjà là : Java, Maven,
Node, Git, les deux éditeurs. S'il manque quelque chose, c'est au formateur de le régler.

> ⚠️ **Deux raccourcis traînent sur le Bureau** — « Mettre a jour le TP » et « Repartir du projet
> officiel ». **Ne cliquez pas dessus.** Ils appartiennent à une ancienne façon d'installer le
> projet et travaillent ailleurs sur la machine : vous vous retrouveriez avec **deux copies** du
> kit et vous ne sauriez plus dans laquelle vous travaillez.
>
> **Pour mettre le projet à jour, une seule chose**, dans le terminal de VS Code : `git pull`.
>
> **Et si vous voulez tout reprendre à zéro** : créez un nouveau dossier sur le Bureau et refaites
> l'étape ③. Votre ancien dossier reste où il est, rien n'est perdu.

---

## Vous avez fini quand ces quatre choses sont vraies

- ☐ Votre page GitHub est ouverte dans le navigateur, **à votre nom**
- ☐ VS Code affiche **`DAIA-TP-PHARMACIE-PILOTE`** tout en haut de son explorateur — et
  `AGENTS.md` juste en dessous, sans rien déplier
- ☐ Le panneau Copilot de VS Code vous a **répondu**
- ☐ Vous n'avez rien fait pour Kiro — et c'est normal

Bonne formation !

---

> 📌 **Une seule autre chose à préparer sur ces deux jours**, et c'est pour ce soir :
> [`apprenant/consignes/preparation-dernier-tp.md`](../consignes/preparation-dernier-tp.md).
> Cinq minutes à la fin du jour 1, pour que le dernier cas pratique de demain fonctionne
> du premier coup. Rien à faire maintenant.
