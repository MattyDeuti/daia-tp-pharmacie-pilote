# Démo 8 · Le rejeu de la brigade

*Jour 2, 15h00 → 15h15 · slide 220 · Copilot*

---

## Rien n'est relancé

**Aucune demande n'est tapée pendant ce créneau.** On rouvre la conversation du cold open de
13h15 et on relit ce qui s'y trouve déjà.

Les deux phrases à ramener au premier plan et à surligner sont celles de l'agent lui-même :

```
… je préparerai quatre rapports distincts en parallèle …
… rédiger les quatre rapports en parallèle …
```

Et ce qu'on montre dans la trace, écrit par le système :

```
Routed to MAI-Code-1-Flash          ← une seule fois
Reviewed 2 files
Created 5 reports                   ← en une seule étape
```

Si la brigade a dû être relancée, sa demande est dans `J2-slide129-demo6.md`.

---

## Au pré-vol · lire les horodatages des rapports

À exécuter dans un terminal PowerShell, **hors séance**, pour savoir ce que la commande répond
avant de décider si elle a sa place à l'écran.

```
Get-ChildItem "rapports\" | Select-Object Name,Length,LastWriteTime
```

Quatre horodatages décalés disent une écriture à la chaîne. Quatre identiques diraient l'inverse.
