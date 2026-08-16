# Manager — classer par risque, et trancher le premier

**Votre rôle dans ce cas pratique :** ordonner ce qu'il a trouvé **par risque pour une pharmacie**,
et désigner ce qui se corrige en premier.

---

## ⓪ Une conversation neuve

```
/clear
```

---

## ① Les deux demandes communes

Identiques pour les quatre rôles. La première, **attendez la réponse**, puis la seconde.

```
Ouvre http://localhost:8000 avec le serveur playwright, prends une
capture de la fenêtre (pas de la page entière), et dis-moi ce qui
ne va pas sur cet écran.
```

```
Maintenant écris-moi les tests qui vérifient ce que tu viens
de voir.
```

**La seconde ne vous concerne pas directement** — collez-la quand même. Elle vous servira à la
confrontation, et elle produit la question de la fin : *ces tests, vous les avez vus passer ?*

⛔ **Vous ne lui ouvrez aucun fichier de code.** Vous n'en aurez pas besoin.

---

## ② Votre relance

```
Classe ces anomalies par risque pour une pharmacie, de la plus
grave à la moins grave, et dis-moi laquelle doit être corrigée
en premier et pourquoi. Cinq lignes maximum, pas de jargon.
```

**Ce que fait chaque partie :**

- **« pour une pharmacie »** est le mot qui change tout. Sans lui, il classe par gravité
  technique — et une faille technique majeure peut être sans conséquence ici, pendant qu'un
  affichage de date trompeur en a d'énormes.
- **« et pourquoi »** vous donne l'argument à porter en comité. Un classement sans raison ne se
  défend pas.
- **« Cinq lignes maximum »** est ce qui rend la réponse utilisable. Sans plafond, vous recevrez
  deux pages.

---

## ③ Ce que vous notez

| Son classement | Le vôtre | L'écart, et sa cause |
|---|---|---|
| 1. | 1. | |
| 2. | 2. | |

**Faites votre propre classement AVANT de lire le sien.** Trente secondes suffisent, et c'est la
seule façon de voir l'écart au lieu de l'adopter.

**L'écart est la matière du débrief**, pas le classement lui-même.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ Une capture de l'écran, prise par l'agent
- ☐ **Son classement en cinq lignes**, sans jargon
- ☐ **Votre classement**, fait avant de lire le sien
- ☐ **Une phrase sur l'écart** entre les deux
- ☐ **Aucun fichier de code ouvert**

---

## Le défi bonus — *seulement si vous avez fini*

Demandez-lui le **coût de ne rien faire**, et regardez d'où sortent ses chiffres :

```
Pour la première anomalie de ton classement, dis-moi ce que ça
coûte de ne pas la corriger. Quand tu n'as pas l'information,
écris [à compléter] plutôt que de l'estimer.
```

⚠️ **C'est la parade d'hier, et elle sert ici exactement pareil.** Sans elle, vous obtiendrez un
chiffre en euros, parfaitement crédible, que **personne ne lui a donné**. Avec elle, vous obtenez
la liste de ce qu'il vous reste à aller chercher — ce qui est infiniment plus utile en comité.
