---
name: rapport-couverture-tests
description: "À utiliser dès que l'utilisateur veut connaître, générer, produire ou consulter la couverture de tests (test coverage) du projet. Mots qui doivent la déclencher : « couverture de tests », « rapport de couverture », « coverage », « quel pourcentage du code est testé », « génère un rapport de couverture », « jacoco », « quelles classes ne sont pas testées ». Produit un rapport à six rubriques toujours dans le même ordre, basé sur une exécution réelle de Maven/JaCoCo — jamais sur des chiffres estimés. INTERDICTION : ne jamais annoncer un pourcentage de couverture sans avoir réellement exécuté la commande Maven correspondante."
argument-hint: "Rien à préciser, ou un module/une classe en particulier (ex. « couverture de GestionStock »)."
user-invocable: true
---

# Skill : rapport-couverture-tests — Rapport de couverture de tests Maven/JaCoCo

## Principe directeur
Tu produis toujours le même rapport, dans le même ordre, basé sur une exécution **réelle**
de la suite de tests. Un rapport comparable d'une fois sur l'autre vaut mieux qu'un rapport
exhaustif mais irrégulier. Ce projet est en **Java 17 / Maven / JUnit 5 / Mockito** — l'outil
de couverture est **JaCoCo** (`jacoco-maven-plugin`), rien d'autre.

## Règles non négociables
- **Tu ne modifies jamais le code métier legacy** (`src/main/java`) pour faire monter un
  chiffre. Le code legacy est volontairement imparfait : il sert de terrain d'exercice, on ne
  le corrige pas à la main pour ce TP.
- **Tu n'inventes aucun pourcentage.** Chaque chiffre du rapport doit venir d'une sortie réelle
  de commande Maven ou du fichier `target/site/jacoco/jacoco.csv` généré par cette exécution.
  Si tu ne peux pas exécuter Maven, tu le dis clairement et tu t'arrêtes — tu ne complètes pas
  à l'estime.
- **La seule modification d'outillage autorisée sans validation préalable** est l'ajout du
  plugin `jacoco-maven-plugin` dans `pom.xml` s'il est absent (voir déroulé, étape 1). Toute
  autre modification de `pom.xml` ou de structure de projet est proposée d'abord, jamais faite
  directement.
- **Aucune donnée patient** (nom, ordonnance, numéro de sécurité sociale) dans le rapport, même
  en exemple — conformément aux règles du projet.
- **Si une rubrique n'a rien à dire** (aucune classe testée, par exemple), tu écris
  « sans objet » et tu passes à la suivante — tu ne la remplis pas avec du plausible.
- **Quinze lignes maximum par rubrique.** Si un tableau dépasse 20 lignes, regroupe par
  package et cite seulement les 10 classes les moins couvertes en détail.

## Déroulé
1. **Vérifier l'outillage.** Ouvre `pom.xml` et cherche `jacoco-maven-plugin` dans `<build><plugins>`.
   - S'il est absent, ajoute-le avec les deux exécutions standard (`prepare-agent` avant les
     tests, `report` après) :
     ```xml
     <plugin>
       <groupId>org.jacoco</groupId>
       <artifactId>jacoco-maven-plugin</artifactId>
       <version>0.8.12</version>
       <executions>
         <execution>
           <id>prepare-agent</id>
           <goals><goal>prepare-agent</goal></goals>
         </execution>
         <execution>
           <id>report</id>
           <phase>test</phase>
           <goals><goal>report</goal></goals>
         </execution>
       </executions>
     </plugin>
     ```
   - Explique en une phrase que c'est un ajout d'outillage de mesure, pas une modification du
     code métier.
2. **Exécuter réellement la suite de tests** : `mvn test` (ou `mvn -q test` pour moins de bruit).
   Montre le résultat réel (nombre de tests passés/échoués). Si des tests échouent, signale-le
   dans le rapport — la couverture d'un build cassé est à interpréter avec prudence.
3. **Localiser les rapports générés** :
   - `target/site/jacoco/index.html` (rapport humain, à ouvrir dans un navigateur)
   - `target/site/jacoco/jacoco.csv` (données brutes, une ligne par classe)
   - Colonnes du CSV : `GROUP,PACKAGE,CLASS,INSTRUCTION_MISSED,INSTRUCTION_COVERED,BRANCH_MISSED,BRANCH_COVERED,LINE_MISSED,LINE_COVERED,COMPLEXITY_MISSED,COMPLEXITY_COVERED,METHOD_MISSED,METHOD_COVERED`
4. **Calculer les pourcentages** à partir du CSV : `% = COVERED / (COVERED + MISSED) * 100`,
   pour les lignes (`LINE_*`) et les branches (`BRANCH_*`), au global et par classe.
5. **Rédiger le rapport** selon le format imposé ci-dessous.

## Format de sortie — imposé
1. **Résumé de l'exécution** — commande lancée, nombre de tests passés/échoués, date/heure.
2. **Couverture globale** — % de lignes couvertes, % de branches couvertes, sur l'ensemble du
   module.
3. **Couverture par classe** — tableau (classe, % lignes, % branches), trié du moins couvert
   au plus couvert.
4. **Classes à risque** — classes à moins de 50 % de lignes couvertes, ou 0 % (aucun test).
   Si aucune, écris « sans objet ».
5. **Recommandations priorisées** — trois points maximum, classés par impact, sans réécrire le
   code toi-même.
6. **Où consulter le détail** — chemin vers `target/site/jacoco/index.html`.

## Ce que tu ne fais jamais
- Annoncer un pourcentage de couverture sans avoir montré la commande Maven réellement exécutée
  et sa sortie.
- Modifier `src/main/java` pour « aider » la couverture à monter.
- Supprimer ou affaiblir des tests existants pour simplifier le rapport.
- Prétendre avoir généré un rapport HTML sans vérifier que le fichier existe réellement sur
  disque après l'exécution.
