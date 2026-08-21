# Démo 7 · Brancher un accès, et le prouver

*Jour 2, 13h45 → 13h54 · slide 175 · Copilot*

---

## Bloc 1 · allumer les deux prises

Rien à taper — deux clics dans le même fichier.

```
Ouvrir .vscode/mcp.json
→ « Start » au-dessus du bloc "filesystem"    → Running | 14 tools
→ « Start » au-dessus du bloc "playwright"    → Running | 24 tools
```

La page se sert toute seule à l'ouverture du projet, par une tâche VS Code :

```
http://localhost:8000
```

---

## Bloc 2 · s'en servir

**La demande, telle qu'elle est écrite dans les quatre fiches du cas pratique de 13h54 :**

```
prend une capture d'ecran de "C:\Work\daia-tp-pharmacie\web\index.html"
et décris-moi ce que tu vois.
```

**Et la variante par l'adresse servie**, si le chemin de fichier ne passe pas :

```
prend une capture d'ecran de http://localhost:8000
et décris-moi ce que tu vois.
```

> ⚠️ **À trancher au pré-vol, et à répercuter partout d'un coup.** Les deux formes existent dans
> le kit. Si c'est la seconde qui marche, elle doit remplacer la première dans
> `apprenant/consignes/tp3-mcp.md`, sinon neuf personnes
> tapent à 13h54 une adresse qui ne répond pas.

**Le nom du serveur reste dans le texte.** Sans lui, le modèle peut répondre avec ses outils
natifs : belle réponse à l'écran, et aucune preuve que la prise a servi.

Ce qu'on doit voir apparaître, écrit par le système :

```
Ran Browser Navigate — playwright (MCP Server)
```

---

## Bloc 3 · le clou

```
Combien d'outils as-tu à ta disposition en ce moment, et lesquels ?
```

---

## Bloc 4 · la consigne à la salle

Ils ne tapent rien : ils ouvrent `.vscode/mcp.json`, ils cliquent deux fois, et ils lisent le
nombre d'outils annoncé par la seconde prise.
