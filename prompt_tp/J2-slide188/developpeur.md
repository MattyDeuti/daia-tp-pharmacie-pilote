# Développeur — lui faire avouer ce qu'il ne peut pas savoir

**Votre rôle dans ce cas pratique :** séparer ce qu'il a **vu** de ce qu'il **suppose**.

---

## ⓪ Une conversation neuve

```
/clear
```

---

## ① Les deux demandes communes

Elles sont identiques pour les quatre rôles. Collez la première, **attendez la réponse**, puis
collez la seconde.

```
Ouvre http://localhost:8000 avec le serveur playwright, prends-en
une capture, et dis-moi ce qui ne va pas sur cet écran.
```

```
Maintenant écris-moi les tests qui vérifient ce que tu viens
de voir.
```

**Ce que fait la première :** elle lui donne **une image**, pas du code. Tout ce qu'il dira ensuite
vient de ce qu'il a regardé.

**Ce que fait la seconde :** elle transforme un constat en quelque chose de vérifiable. C'est le
geste du module 3, appliqué à un écran.

⛔ **Vous ne lui ouvrez aucun fichier de code.** S'il en lit un de lui-même, c'est visible sur la
ligne d'appel au-dessus de sa réponse — notez-le, c'est de la matière de débrief.

---

## ② Votre relance

```
Pour chacune des anomalies que tu as vues, dis-moi si le test que
tu proposes échoue aujourd'hui. Si tu ne peux pas le savoir sans
exécuter, dis-le au lieu de l'affirmer.
```

**C'est la demande la plus utile des deux jours pour un développeur**, et elle tient en une
phrase : *dis-le au lieu de l'affirmer*.

Un test qui « vérifie » une anomalie **devrait échouer** tant que l'anomalie est là. S'il vous
annonce que ses tests passent, il vient de vous dire, sans le savoir, qu'ils ne testent rien.

---

## ③ Ce que vous notez

| Ce qu'il a vu à l'écran | Ce qu'il a supposé sans le voir | A-t-il reconnu sa limite ? |
|---|---|---|
| | | |

**La troisième colonne est l'objectif.** Une réponse qui dit « je ne peux pas le savoir sans
exécuter » vaut mieux qu'une réponse confiante et fausse — et c'est exactement ce que la relance
cherche à provoquer.

---

## Vous avez fini quand vous pouvez montrer ceci

- ☐ Une capture de l'écran, prise par l'agent
- ☐ Sa liste d'anomalies
- ☐ Ses tests, et **sa réponse à la relance**
- ☐ **Au moins une ligne où il reconnaît qu'il ne peut pas savoir** — ou, à défaut, une affirmation
  que vous savez invérifiable

---

## Le défi bonus — *seulement si vous avez fini*

Demandez-lui de **classer ses propres anomalies** entre « vues à l'écran » et « déduites » :

```
Reprends ta liste et sépare-la en deux : ce que tu as réellement vu
sur la capture, et ce que tu as déduit sans le voir. Si tu ne peux
pas trancher pour une ligne, mets-la dans la seconde colonne.
```

**Ce que ça apprend :** la frontière n'est pas toujours là où vous la placiez.
