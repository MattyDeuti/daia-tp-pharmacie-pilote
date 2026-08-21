# `formateur/demo-index/` — le fichier de la démonstration du jour 2

**Ce dossier n'est pas un exercice.** Vous n'avez rien à y faire et rien à y écrire. Il contient
le `AGENTS.md` que le formateur projette pendant la démonstration de fin de journée du jour 2,
**DÉMO 09 · L'index, montré pour de vrai** (jour 2, slide 227).

Vous pouvez l'ouvrir et le lire — c'est même le meilleur modèle du kit si vous voulez écrire le
vôtre en rentrant. Il tient en moins de deux cents lignes, et c'est la seule chose qu'il faut
retenir de sa forme.

| Fichier | Ce que c'est |
|---|---|
| `AGENTS.md` | **le fichier de la démonstration** — canari en tête, contexte, trois règles dures, l'index |

Les deux fichiers que son index désigne vivent, eux, à leur vraie place dans le projet :

| Fichier | Ce que c'est |
|---|---|
| `.github/skills/resume-des-modifications/SKILL.md` | **la procédure** que l'index fait ouvrir |
| `.github/agents/traducteur-metier.agent.md` | **l'agent** que l'index fait lancer |

---

## Note pour le formateur

### Pourquoi ce fichier n'est pas déjà à la racine

**Parce que le `AGENTS.md` de la racine appartient aux apprenants.** C'est le squelette à
sections qu'ils remplissent au cas pratique de fin de jour 2 — et celui qu'ils vident au cas
pratique du canari, le jour 1. Si la version de la démonstration s'y installait, les deux cas
pratiques n'auraient plus de sens.

D'où la manœuvre : on la copie le temps de la démonstration, on la retire après.

### Armer — avant la démonstration, jamais pendant

```powershell
Copy-Item formateur\demo-index\AGENTS.md AGENTS.md -Force
```

Puis **rechargez la fenêtre de l'éditeur** (`Ctrl + Maj + P` → *Developer: Reload Window*) et
**ouvrez une conversation neuve**. Sans ces deux gestes, l'outil travaille encore avec l'ancien
fichier et le canari ne sort pas.

> ⚠️ **Si l'outil du jour ne lit pas `AGENTS.md`** mais son propre nom de fichier, copiez-la
> aussi sous ce nom-là — `GEMINI.md`, `CLAUDE.md`, ou `.github/copilot-instructions.md` selon
> l'outil. **C'est à vérifier au drill, pas en séance.** Le même contenu marche dans les trois
> cas : c'est justement ce que dit le temps 5.

### Désarmer — juste après, avant de toucher à quoi que ce soit

```powershell
git checkout -- AGENTS.md
git status
```

Le `git status` n'est pas de la précaution excessive : **le fichier de la racine ne doit jamais
partir dans un commit.** S'il y arrivait, tous les apprenants récupéreraient une charte déjà
remplie au prochain `git pull`, et les deux cas pratiques qui s'appuient dessus tomberaient.

### Les trois marqueurs, et ce que chacun prouve

C'est ce qui rend la démonstration démontrable. Les trois sont visibles à l'écran, dans cet ordre.

| Marqueur | Où il apparaît | Ce qu'il prouve |
|---|---|---|
| `CHARTE-PHARMASTOCK-LUE` | première ligne de **la toute première réponse** | le fichier a été relu **avant** qu'on demande quoi que ce soit |
| `PROCEDURE-RESUME-APPLIQUEE` | en tête du compte rendu | la procédure a réellement été ouverte, pas devinée |
| `AGENT-TRADUCTEUR-METIER` | en tête de la version métier | l'agent a réellement été lancé |

**Aucun des trois n'a été nommé dans la demande.** C'est tout le propos : montrez-les en
remontant le fil, dans cet ordre, pendant le temps 3.

### Le déroulé

**Il est dans `demos/J2-slide227-DEMO09-lindex-montre-pour-de-vrai.md`**, avec les six temps
minutés, les demandes exactes, ce qu'on montre, et les plans B. Les demandes seules, prêtes à
coller, sont dans `formateur/prompt_demo/J2-slide227-demo9.md`.

### Ce que la démonstration coûte en préparation

Le dépôt doit avoir **des modifications non publiées au moment du temps 3** — sinon le compte
rendu est vide et il n'y a rien à traduire. Trois lignes changées dans un fichier de code
suffisent, et il ne faut surtout pas les enregistrer.

**C'est la seule condition matérielle de la démonstration**, et c'est celle qu'on oublie.
