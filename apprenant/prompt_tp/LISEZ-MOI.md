# `apprenant/prompt_tp/` — les prompts à copier-coller

> **Fiche de cadrage — aucun prompt à coller ici.**

**Un sous-dossier par cas pratique**, et **son nom est écrit sur la slide** qui annonce le cas
pratique, en haut à droite, sous la durée : `LES PROMPTS À COPIER`. Vous n'avez rien à deviner —
vous recopiez ce qui est affiché.

> **Le nom se lit en deux parties** : `J1-slide170-canari` = jour 1, slide 170, le canari. Le
> numéro est celui de la slide qui annonce le cas pratique dans le support de la journée, et il
> est vérifié à chaque livraison — si un jour il ne colle plus, c'est un défaut, pas une
> approximation. Le nom du dossier est toujours affiché sur la slide : vous n'avez rien à deviner.

### Jour 1

| Dossier | Le cas pratique | Durée | Ce que vous postez dans le chat |
|---|---|---|---|
| `J1-slide077-trois-facons-de-demander/` | Un seul sujet, trois façons de le demander | 25 min | le coût des trois approches |
| `J1-slide126-ask-vs-agent/` | La même demande, deux modes, et ce que chacun coûte | 20 min | vos deux coûts, et leur rapport |
| `J1-slide170-canari/` | Écrivez une règle, et prouvez qu'elle est lue | 25 min | votre formule, et si elle est passée |
| `J1-slide194-audit-legacy/` | Auditer la base existante, chacun depuis son rôle | 45 min | vos défauts trouvés, et combien tenaient à l'autre fichier |

### Jour 2

| Dossier | Le cas pratique | Durée | Ce que vous postez dans le chat |
|---|---|---|---|
| `J2-slide049-specification/` | Du besoin à la fonctionnalité : votre propre spécification | 25 min | le nombre de tâches sans exigence en face |
| `J2-slide181-votre-procedure/` | Demandez votre procédure, et comptez | 30 min | le nom de votre procédure, et si elle part toute seule |
| `J2-slide206-couche-equipe/` | La couche de l'équipe, en quatre briques | 25 min | le nom de votre branche |

**Deux moments n'ont pas de dossier ici, et c'est normal : ils se font sans outil.**
L'auto-évaluation du début du jour 1 et celle de la clôture. Elles se jouent sur papier, et ce sont
**les deux moments où ceux qui ne codent pas sont à égalité complète**.

**Si le dossier annoncé n'est pas là**, mettez le projet à jour — dans le terminal de VS Code :

```
git pull
```

Les prompts évoluent jusqu'au dernier moment.

## Comment repérer un prompt, dans n'importe quel fichier

**Sous le titre, un bandeau dit dans quel mode il faut être.** Il vaut pour tout le fichier, sauf
quand un prompt indique le sien.

**Et un bloc de code veut dire une seule chose : ça se copie.** Il s'affiche en vert, et le
marqueur juste au-dessus dit où ça va.

| Le marqueur | Où ça va |
|---|---|
| **📋 À COLLER DANS LE PANNEAU** | le panneau de discussion de l'assistant |
| **📝 À ÉCRIRE DANS LE FICHIER** | un fichier du projet, que vous modifiez vous-même |
| **🌐 À OUVRIR DANS LE NAVIGATEUR** | une adresse |
| **⌨️ À TAPER DANS LE TERMINAL** | une commande |

**Tout le reste n'est jamais dans un bloc** : un raccourci clavier, un chemin à suivre à l'écran,
une ligne que vous devez seulement voir apparaître — c'est en gras, ou dans un tableau.
**Rien à copier hors des blocs verts.**

## Trois règles valables pour les sept

**① Chacun sur son poste.** Aucun cas pratique ne suppose que vous soyez deux devant un écran, ni
que vous voyiez celui d'un voisin. La formation se donne en visio, avec une partie de la salle
ensemble et le reste dispersé — les sept exercices sont écrits pour ça.

**② La trace passe par le chat.** Chaque cas pratique se termine par **un chiffre ou un nom**, posté
dans le chat de la classe virtuelle. C'est ce qui permet de débriefer sans partage d'écran, et c'est
la seule chose qui est attendue de vous.

**③ Chaque énoncé se reprend seul.** Si vous décrochez dix minutes — un appel, une coupure, un poste
qui bloque — le fichier `LISEZ-MOI.md` du dossier se termine par ce qu'il faut faire pour reprendre.
Vous n'aurez besoin de rien de ce qui s'est dit pendant votre absence.

## Ce que vous trouverez dedans, et ce que vous n'y trouverez pas

Ces fichiers portent **ce qui ne se projette pas** : le sujet de votre cas, et les prompts en
blocs copiables. Un clic vaut mieux qu'une saisie.

**L'objectif, les étapes et le temps restent à l'écran.** Les fichiers d'ici ne les répètent pas.

Et surtout : **tous les prompts ne sont pas fournis.** Quand un exercice consiste précisément à
formuler une demande, le fichier vous donne le point de départ et s'arrête là. C'est écrit
noir sur blanc à chaque fois.

## À ne pas confondre

| Dossier | Quoi |
|---|---|
| `apprenant/prompt_tp/` | ce que vous **copiez** : les prompts de départ |
| `apprenant/a-supprimer/` | ce que vous **collez** : vos résultats, votre brouillon des deux jours |
| `apprenant/consignes/` | les énoncés des TP qui travaillent sur le code de ce projet |
