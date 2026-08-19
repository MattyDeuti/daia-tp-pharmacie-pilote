---
name: sql-requetes-parametrees
description: "Utiliser dès que l'utilisateur veut refactorer, sécuriser, paramétrer ou corriger des requêtes SQL construites par concaténation de chaînes (Statement, executeQuery/executeUpdate avec des « + »). Mots qui doivent la déclencher : « paramétrer les requêtes », « refactore le SQL », « corrige l'injection SQL », « remplace Statement par PreparedStatement », « SQL inline », « requêtes en dur ». Transforme les requêtes SQL inline en requêtes paramétrées avec PreparedStatement, corrige la faille d'injection SQL (OWASP A03:2021) et met à jour les tests JUnit 5 / Mockito associés. Ne jamais livrer un refactor SQL sans passer par cette procédure."
argument-hint: "le fichier ou la méthode contenant les requêtes SQL à paramétrer"
user-invocable: true
---

# Skill : sql-requetes-parametrees — SQL inline → requêtes paramétrées

## Principe
Transformer les requêtes SQL construites par concaténation de chaînes (vulnérables à
l'injection SQL) en requêtes paramétrées avec `PreparedStatement`, **sans changer le
comportement métier**, puis prouver le résultat avec des tests.

## Quand l'utiliser
- Une requête `Statement` est construite avec des `+` qui insèrent des variables.
- On demande de sécuriser, corriger une injection SQL, ou « paramétrer » du SQL.
- Un rapport de sécurité (ex. [oawasp-security-alert.md](../../../oawasp-security-alert.md)) signale de la concaténation SQL.

## Règles non négociables
- Ne modifie jamais la logique métier (validations, `commit`/`rollback`, ordre des opérations) : seule la construction de la requête change.
- Respecte la stack imposée par `AGENTS.md` : Java 17, Maven, JUnit 5, Mockito — jamais Gradle ni JUnit 4.
- Réponds et commente toujours en français (`AGENTS.md`).
- N'introduis jamais de donnée patient réelle (nom, ordonnance, numéro de sécurité sociale) dans un test, un log ou un commentaire, même en exemple.
- Chaque requête refactorée doit avoir au moins un test JUnit qui prouve qu'elle est appelée avec des paramètres liés (`setString`/`setInt`/...) et non par concaténation.

## Déroulé
1. **Repérer** : chercher `createStatement()`, `executeQuery(` / `executeUpdate(` suivis d'une concaténation `+` de variables dans le fichier ciblé.
2. **Isoler chaque requête** : identifier le texte SQL, les variables interpolées, et leur type Java (`String`, `int`, date...).
3. **Remplacer `Statement` par `PreparedStatement`** :
   - Remplacer chaque valeur interpolée par `?` dans le SQL.
   - Utiliser `con.prepareStatement(sql)`.
   - Ajouter les `setString(i, ...)`, `setInt(i, ...)`, `setDate(i, ...)` dans l'ordre exact des `?`.
   - Garder telles quelles les expressions SQL qui ne dépendent pas d'une variable utilisateur (ex. `NOW()`).
4. **Préserver la structure environnante** : mêmes try/catch/finally, même gestion de transaction, même fermeture des ressources (passer en try-with-resources si cela ne change pas le comportement).
5. **Compiler** : `mvn compile` pour vérifier qu'il n'y a pas d'erreur de syntaxe.
6. **Tester** : écrire ou mettre à jour des tests JUnit 5 (Mockito pour simuler `Connection`/`PreparedStatement`/`ResultSet`) qui vérifient :
   - que le SQL envoyé contient des `?` et non des valeurs concaténées,
   - que les bons `setXxx` sont appelés, avec les bonnes valeurs, dans le bon ordre.
7. **Exécuter** : `mvn test` et montrer la sortie réelle — jamais annoncer un test réussi sans la prouver.

## Format du rapport final — imposé
1. **Requêtes corrigées** : liste des méthodes/requêtes refactorées (fichier + ligne).
2. **Faille corrigée** : rappel explicite qu'il s'agissait d'une injection SQL (OWASP Top 10 – A03:2021 Injection) et que les requêtes sont désormais paramétrées.
3. **Tests** : tests ajoutés/modifiés et résultat réel de `mvn test`.
4. **Points restants** : requêtes SQL non traitées dans le fichier (si applicable), à signaler mais pas à corriger sans demande explicite.

## Ce que tu ne fais jamais
- Changer le SGBD, le driver JDBC, ou la structure des tables.
- Ajouter un ORM ou un framework non demandé.
- Prétendre qu'un test passe sans avoir montré la sortie réelle de `mvn test`.
- Corriger d'autres fichiers que ceux visés par la demande sans le proposer d'abord.

## Exemple avant / après
```java
// Avant — concaténation (injection SQL possible)
Statement st = con.createStatement();
st.executeUpdate(
    "UPDATE stock SET quantite = " + nouveauStock + " WHERE produit_id = '" + produitId + "'");

// Après — requête paramétrée
PreparedStatement ps = con.prepareStatement(
    "UPDATE stock SET quantite = ? WHERE produit_id = ?");
ps.setInt(1, nouveauStock);
ps.setString(2, produitId);
ps.executeUpdate();
```
