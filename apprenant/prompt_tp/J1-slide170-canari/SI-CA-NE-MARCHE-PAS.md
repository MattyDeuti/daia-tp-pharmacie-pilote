# Votre règle ne ressort pas : six causes, dans l'ordre

> **MODE : AGENT** · le sélecteur, en haut du panneau Copilot

**Les six ont été rencontrées en séance.** Aucune n'est mystérieuse, et les connaître, c'est savoir
diagnostiquer n'importe quelle charte qui ne prend pas — pas seulement celle d'aujourd'hui.

Regardez-les dans cet ordre : les deux premières règlent la majorité des cas.

---

## ① La règle n'est pas assez impérative

**C'est la cause la plus fréquente, de loin.**

Une phrase polie — « merci de commencer tes réponses par… » — est comprise comme une préférence.
Écrivez-la comme une obligation :

**📝 À ÉCRIRE DANS LE FICHIER**

```
Règle obligatoire : tu devras commencer chacune de tes réponses par « … ».
```

---

## ② Le fichier n'a pas été sauvegardé

**L'agent lit le disque, pas votre écran.** Un fichier modifié et non enregistré n'existe pas pour
lui.

Vérifiez aussi que la fenêtre a été **rechargée** après l'enregistrement : la charte est chargée au
démarrage de la conversation, pas en cours de route.

---

## ③ Le fichier était ouvert dans votre éditeur

**Et là, c'est l'inverse : votre test a « réussi » sans rien prouver.**

Un fichier ouvert dans un onglet est joint automatiquement au message. La règle est bien passée —
mais parce que vous la lui avez tendue à la main, pas parce qu'il est allé la chercher.

**Fermez l'onglet et refaites le test.** C'est le même piège que celui du fichier joint, vu ce
matin.

---

## ④ Un autre fichier du projet la contredit

Un `README` qui annonce « support de formation », une consigne ailleurs dans le projet, une autre
charte : il suffit d'une phrase qui va dans l'autre sens pour que la vôtre soit ignorée.

---

## ⑤ Le modèle est trop petit

Un petit modèle suit mal les instructions molles. Si vous êtes en mode automatique, vous ne
choisissez pas le modèle qui répond.

**Basculez explicitement sur un modèle plus capable et refaites le test.**

---

## ⑥ Le réglage de lecture est désactivé

Certains éditeurs ont un paramètre qui autorise — ou non — la lecture du fichier de charte. S'il
est resté désactivé, rien de ce que vous écrivez ne sera lu.

C'est rare, et c'est la dernière chose à regarder.

---

## Et si les six sont écartées

Dites-le. Deux choses valent alors le coup d'œil, et elles ne sont pas confirmées :

- **la mise en forme du fichier** — un participant a rapporté qu'un titre collé au texte suivant,
  sans ligne vide entre les deux, empêchait la lecture. Ce n'est pas vérifié ;
- **la surface du test** — une charte orientée production de code peut être parfaitement chargée et
  ne rien changer au formatage du chat. Dans ce cas la règle est là, mais votre test regarde au
  mauvais endroit.

## Ce qui ne compte jamais comme diagnostic

**Demander à l'agent pourquoi il n'a pas suivi la règle.**

Il fabriquera une explication technique cohérente et fausse. Un modèle n'a aucun accès fiable à son
propre fonctionnement — c'est la forme la plus dangereuse du « le chat décrit, le système prouve »,
parce que l'explication a l'air compétente.
