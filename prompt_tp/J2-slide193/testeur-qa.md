# Testeur ou QA — le cas limite parfait est déjà à l'écran

**Votre rôle dans ce cas pratique :** transformer ce qu'il voit en **cas de test encadrés**, en
français, lisibles par quelqu'un qui ne code pas.

---

## ⓪ Une conversation neuve

```
/clear
```

---

## ① Les deux demandes communes

Identiques pour les quatre rôles. La première, **attendez la réponse**, puis la seconde.

```
Ouvre web/index.html, prends-en une capture, et dis-moi ce qui
ne va pas sur cet écran.
```

```
Maintenant écris-moi les tests qui vérifient ce que tu viens
de voir.
```

⛔ **Vous ne lui ouvrez aucun fichier de code.** Il ne travaille que sur ce qu'il voit.

---

## ② Votre relance

**Regardez l'écran avant de coller ceci.** Il y a un produit dont la date de péremption tombe
aujourd'hui — c'est le cas limite parfait, et il est déjà là.

```
Reprends la ligne du produit qui périme aujourd'hui. Écris les
trois cas de test qui l'encadrent : hier, aujourd'hui, demain.
Au format Étant donné / Quand / Alors, en français.
```

**Ce que fait chaque partie :**

- **« la ligne du produit qui périme aujourd'hui »** l'ancre sur un cas réel, visible à l'écran.
  Sans ça, il vous écrit des tests génériques.
- **« hier, aujourd'hui, demain »** est la structure du cas limite : on encadre la frontière, on ne
  la teste pas une seule fois. **C'est votre apport de métier**, et personne d'autre dans la salle
  ne l'aurait demandé.
- **« Étant donné / Quand / Alors, en français »** rend les trois cas lisibles par l'analyste et le
  manager de votre voisinage. C'est ce qui les rend confrontables tout à l'heure.

---

## ③ Ce que vous notez

| Le cas | Est-il vraiment encadré ? | Se prouve-t-il sans code ? |
|---|---|---|
| Hier | | |
| Aujourd'hui | | |
| Demain | | |

**La question qui compte : « aujourd'hui » est-il traité comme périmé, ou comme encore valide ?**
C'est là que se cachent les bugs de date, et c'est une question métier, pas technique.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ Une capture de l'écran, prise par l'agent
- ☐ **Trois cas** au format Étant donné / Quand / Alors, en français
- ☐ Votre réponse à la question ci-dessus : **que fait le système « aujourd'hui » ?**
- ☐ **Aucun fichier de code ouvert**

---

## Le défi bonus — *seulement si vous avez fini*

Faites-lui chercher **ce qu'il n'a pas encadré** :

```
Quels autres seuils ou limites vois-tu sur cet écran, en dehors des
dates ? Pour chacun, écris le cas qui le franchit d'un cran, dans
les deux sens.
```

**Ce que ça apprend :** un écran contient toujours plus de frontières qu'on n'en voit — un seuil
d'alerte, une quantité nulle, un champ vide.
