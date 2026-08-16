# Préparation du dernier TP

> **À faire une fois, à la fin de la première journée.** Cinq minutes, et le dernier cas
> pratique de demain après-midi fonctionnera du premier coup.
>
> Le dernier TP est le seul où **vos quatre travaux se rejoignent dans un même projet en
> ligne**. Pour ça, il faut que ce projet vous reconnaisse. C'est tout ce qu'on prépare ici.

---

## ① Donnez votre identifiant GitHub au formateur

**Ce n'est pas votre e-mail. C'est votre nom d'utilisateur**, celui qui apparaît dans l'adresse
de votre page GitHub.

Pour le retrouver : allez sur **https://github.com**, et regardez **en haut à droite**. Votre
identifiant est écrit sous votre photo quand vous cliquez dessus. Vous pouvez aussi ouvrir :

```
https://github.com/settings/profile
```

L'identifiant est le mot affiché à côté de « Username ».

> **Vous n'avez pas de compte GitHub ?** Créez-le maintenant sur **https://github.com/signup**.
> Comptez trois à cinq minutes : il faut une adresse e-mail, un mot de passe, et **valider un
> code reçu par e-mail**. Faites-le ce soir, pas demain à 15 h.

---

## ② Acceptez l'invitation

Le formateur vous ajoute au projet. Vous recevez un e-mail, et l'invitation est aussi visible
ici — **connectez-vous d'abord avec votre compte** :

```
https://github.com/MattyDeuti/daia-tp-pharmacie-pilote/invitations
```

Cliquez sur **Accept**.

> ⚠️ **Tant que l'invitation n'est pas acceptée, rien ne fonctionnera demain.** Vous pourrez
> lire le projet, mais pas y déposer votre travail. L'invitation expire au bout de sept jours.

---

## ③ Faites reconnaître votre compte par votre poste

**Dans le terminal de votre éditeur**, tapez :

```
gh auth login
```

Répondez dans cet ordre — les flèches et Entrée suffisent, il n'y a rien à taper :

| La question | Votre réponse |
|---|---|
| *Where do you use GitHub?* | **GitHub.com** |
| *What is your preferred protocol?* | **HTTPS** |
| *Authenticate Git with your GitHub credentials?* | **Yes** |
| *How would you like to authenticate?* | **Login with a web browser** |

Il affiche alors **un code à huit caractères**. Notez-le, appuyez sur **Entrée** : votre
navigateur s'ouvre. Collez le code, et validez.

> ⚠️ **Le seul vrai piège.** Avant de valider dans le navigateur, **vérifiez en haut à droite
> que vous êtes bien connecté avec VOTRE compte.** Si une autre session est ouverte, c'est elle
> qui sera enregistrée sur votre poste, et votre travail de demain portera le nom de
> quelqu'un d'autre.

---

## ④ Prouvez que c'est fait

**On ne dit pas « normalement c'est bon ». On vérifie.** C'est la règle de ces deux jours, et
elle s'applique aussi ici.

```
gh auth status
```

Vous devez lire **`Logged in to github.com account`** suivi de **votre** identifiant.

```
git remote -v
```

Vous devez voir **deux lignes** contenant `daia-tp-pharmacie-pilote`.

---

## Ce qui peut coincer, et quoi faire

| Ce que vous voyez | Ce que ça veut dire | Quoi faire |
|---|---|---|
| `fatal: not a git repository` | vous n'êtes pas dans le dossier du projet | `cd C:\Work\daia-tp-pharmacie` puis recommencez |
| `You are not logged into any GitHub hosts` | l'étape ③ n'est pas faite ou n'a pas abouti | refaites `gh auth login` |
| `gh` n'est pas reconnu | l'outil manque sur ce poste | **signalez-le au formateur**, ne cherchez pas à l'installer |
| `git remote -v` affiche autre chose que `-pilote` | votre projet pointe sur le mauvais dépôt | voir la commande ci-dessous |

**Si le projet pointe au mauvais endroit**, une seule ligne, depuis le dossier du projet :

```
git remote set-url origin https://github.com/MattyDeuti/daia-tp-pharmacie-pilote.git
```

---

## Vous avez fini quand ces trois choses sont vraies

- ☐ Le formateur a votre identifiant GitHub
- ☐ L'invitation est **acceptée** (le dépôt apparaît dans votre liste sur github.com)
- ☐ `gh auth status` affiche **votre** identifiant

Rien d'autre n'est à préparer. À demain.
