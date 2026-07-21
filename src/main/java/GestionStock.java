import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GestionStock {

    // Constantes de connexion à la base de données
    private static final String URL = "jdbc:mysql://localhost:3306/pharmacie";
    private static final String USER = "admin";
    private static final String PASS = "admin123";

    // ============================================
    // Requirement 1: Réception de Marchandises
    // ============================================

    /**
     * Enregistre une réception de marchandise.
     * Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8
     */
    public void enregistrerReception(String produitId, int quantite, String datePeremption, String fournisseur) throws Exception {
        // Validation des paramètres
        String erreur = validerQuantite(quantite);
        if (erreur != null) {
            System.out.println(erreur);
            return;
        }
        erreur = validerDatePeremption(datePeremption);
        if (erreur != null) {
            System.out.println(erreur);
            return;
        }
        erreur = validerFournisseur(fournisseur);
        if (erreur != null) {
            System.out.println(erreur);
            return;
        }

        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
            con.setAutoCommit(false);

            // Vérifier si le produit existe, le créer si nécessaire
            if (!produitExiste(con, produitId)) {
                Statement stCreate = con.createStatement();
                stCreate.executeUpdate(
                    "INSERT INTO stock (produit_id, quantite, categorie, seuil_alerte) VALUES (" +
                    "'" + produitId + "', 0, 'médicament', 10)");
            }

            // Mettre à jour la quantité dans la table stock
            int stockActuel = getStockCourant(con, produitId);
            int nouveauStock = stockActuel + quantite;
            Statement stUpdate = con.createStatement();
            stUpdate.executeUpdate(
                "UPDATE stock SET quantite = " + nouveauStock + " WHERE produit_id = '" + produitId + "'");

            // Insérer une entrée dans la table mouvements
            Statement stMvt = con.createStatement();
            stMvt.executeUpdate(
                "INSERT INTO mouvements (produit_id, quantite, date_mouvement, fournisseur) VALUES (" +
                "'" + produitId + "', " + quantite + ", NOW(), '" + fournisseur + "')");

            // Insérer une entrée dans la table dates_peremption
            Statement stDate = con.createStatement();
            stDate.executeUpdate(
                "INSERT INTO dates_peremption (produit_id, date_peremption, quantite_lot) VALUES (" +
                "'" + produitId + "', '" + datePeremption + "', " + quantite + ")");

            con.commit();
            System.out.println("Réception enregistrée pour le produit " + produitId + " : +" + quantite + " unités");
        } catch (Exception e) {
            if (con != null) {
                con.rollback();
            }
            throw e;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    // ============================================
    // Requirement 2: Sortie de Stock avec Prévention de Stock Négatif
    // ============================================

    /**
     * Enregistre une sortie de stock avec prévention de stock négatif.
     * Requirements: 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8
     */
    public void enregistrerSortie(String produitId, int quantite) throws Exception {
        // Validation de la quantité
        String erreur = validerQuantite(quantite);
        if (erreur != null) {
            System.out.println(erreur);
            return;
        }

        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
            con.setAutoCommit(false);

            // Vérifier que le produit existe
            if (!produitExiste(con, produitId)) {
                System.out.println("Produit inexistant");
                return;
            }

            // Vérifier que le stock est suffisant
            int stockActuel = getStockCourant(con, produitId);
            if (quantite > stockActuel) {
                System.out.println("Stock insuffisant : disponible " + stockActuel + ", demandé " + quantite);
                return;
            }

            // Diminuer la quantité dans la table stock
            int nouveauStock = stockActuel - quantite;
            Statement stUpdate = con.createStatement();
            stUpdate.executeUpdate(
                "UPDATE stock SET quantite = " + nouveauStock + " WHERE produit_id = '" + produitId + "'");

            // Insérer une entrée dans la table mouvements (quantité négative)
            Statement stMvt = con.createStatement();
            stMvt.executeUpdate(
                "INSERT INTO mouvements (produit_id, quantite, date_mouvement) VALUES (" +
                "'" + produitId + "', " + (-quantite) + ", NOW())");

            // Vérifier si stock < seuil_alerte après sortie
            Statement stSeuil = con.createStatement();
            ResultSet rsSeuil = stSeuil.executeQuery(
                "SELECT seuil_alerte FROM stock WHERE produit_id = '" + produitId + "'");
            rsSeuil.next();
            int seuil = rsSeuil.getInt("seuil_alerte");
            if (rsSeuil.wasNull()) {
                seuil = 10; // Valeur par défaut
            }

            if (nouveauStock < seuil) {
                afficherAlerteStockBas(produitId, nouveauStock, seuil);
            }

            con.commit();
            System.out.println("Sortie enregistrée pour le produit " + produitId + " : -" + quantite + " unités");
        } catch (Exception e) {
            if (con != null) {
                con.rollback();
            }
            throw e;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    // ============================================
    // Requirement 3: Consultation du Stock et Date de Péremption
    // ============================================

    /**
     * Consulte le stock courant et la date de péremption la plus proche.
     * Requirements: 3.1, 3.2, 3.3, 3.4, 3.5, 3.6
     */
    public void consulterStock(String produitId) throws Exception {
        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASS);

            // Vérifier si le produit existe
            if (!produitExiste(con, produitId)) {
                System.out.println("Produit inexistant");
                return;
            }

            // Récupérer la quantité courante
            int quantite = getStockCourant(con, produitId);
            System.out.print("Produit: " + produitId + ", Quantité: " + quantite);

            if (quantite == 0) {
                System.out.println(" - Stock épuisé");
                return;
            }

            // Rechercher la date de péremption la plus proche
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(
                "SELECT MIN(date_peremption) as date_proche FROM dates_peremption " +
                "WHERE produit_id = '" + produitId + "' AND date_peremption > CURDATE()");

            if (rs.next()) {
                java.sql.Date dateProche = rs.getDate("date_proche");
                if (dateProche != null) {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    System.out.println(", Date de péremption la plus proche: " + sdf.format(dateProche));
                } else {
                    System.out.println(" - Aucune date de péremption enregistrée");
                }
            } else {
                System.out.println(" - Aucune date de péremption enregistrée");
            }
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    // ============================================
    // Requirement 4: Alerte Stock Bas avec Seuil Paramétrable
    // ============================================

    /**
     * Affiche tous les produits en alerte de stock bas.
     * Requirements: 4.2, 4.3, 4.4, 4.6
     */
    public void afficherAlertesStock() throws Exception {
        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASS);

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(
                "SELECT produit_id, quantite, seuil_alerte FROM stock " +
                "WHERE quantite < COALESCE(seuil_alerte, 10)");

            boolean alerteTrouvee = false;
            while (rs.next()) {
                String produitId = rs.getString("produit_id");
                int quantite = rs.getInt("quantite");
                int seuil = rs.getInt("seuil_alerte");
                if (rs.wasNull()) {
                    seuil = 10;
                }
                System.out.println("Produit " + produitId + " : stock " + quantite + ", seuil " + seuil);
                alerteTrouvee = true;
            }

            if (!alerteTrouvee) {
                System.out.println("Aucune alerte de stock bas");
            }
        } catch (Exception e) {
            System.out.println("Erreur lors de la consultation des alertes");
            throw e;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    /**
     * Définit le seuil d'alerte pour un produit.
     * Requirements: 4.1
     */
    public void definirSeuilAlerte(String produitId, int seuil) throws Exception {
        // Validation du seuil
        if (seuil < 0 || seuil > 1000000) {
            System.out.println("Seuil invalide : doit être entre 0 et 1000000");
            return;
        }

        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASS);

            // Vérifier que le produit existe
            if (!produitExiste(con, produitId)) {
                System.out.println("Produit inexistant");
                return;
            }

            Statement st = con.createStatement();
            st.executeUpdate(
                "UPDATE stock SET seuil_alerte = " + seuil + " WHERE produit_id = '" + produitId + "'");

            System.out.println("Seuil d'alerte défini à " + seuil + " pour le produit " + produitId);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    // ============================================
    // Requirement 5: Gestion des Catégories et Traçabilité des Stupéfiants
    // ============================================

    /**
     * Crée un nouveau produit avec une catégorie.
     * Requirements: 5.1, 5.2
     */
    public void creerProduit(String produitId, String categorie) throws Exception {
        // Validation de la catégorie
        if (categorie == null || 
            (!categorie.equals("médicament") && !categorie.equals("stupéfiant") && !categorie.equals("parapharmacie"))) {
            System.out.println("Catégorie invalide : valeurs autorisées sont médicament, stupéfiant, parapharmacie");
            return;
        }

        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASS);

            // Vérifier que le produit n'existe pas déjà
            if (produitExiste(con, produitId)) {
                System.out.println("Le produit existe déjà");
                return;
            }

            Statement st = con.createStatement();
            st.executeUpdate(
                "INSERT INTO stock (produit_id, quantite, categorie, seuil_alerte) VALUES (" +
                "'" + produitId + "', 0, '" + categorie + "', 10)");

            System.out.println("Produit " + produitId + " créé avec la catégorie " + categorie);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    /**
     * Modifie la catégorie d'un produit.
     * Requirements: 5.1, 5.2
     */
    public void modifierCategorie(String produitId, String nouvelleCategorie) throws Exception {
        // Validation de la catégorie
        if (nouvelleCategorie == null || 
            (!nouvelleCategorie.equals("médicament") && !nouvelleCategorie.equals("stupéfiant") && !nouvelleCategorie.equals("parapharmacie"))) {
            System.out.println("Catégorie invalide : valeurs autorisées sont médicament, stupéfiant, parapharmacie");
            return;
        }

        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASS);

            // Vérifier que le produit existe
            if (!produitExiste(con, produitId)) {
                System.out.println("Produit inexistant");
                return;
            }

            Statement st = con.createStatement();
            st.executeUpdate(
                "UPDATE stock SET categorie = '" + nouvelleCategorie + "' WHERE produit_id = '" + produitId + "'");

            System.out.println("Catégorie du produit " + produitId + " modifiée en " + nouvelleCategorie);
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    /**
     * Enregistre une réception de stupéfiant avec traçabilité.
     * Requirements: 5.3, 5.4, 5.5, 5.6, 5.7
     */
    public void enregistrerReceptionStupéfiant(String produitId, int quantite, String datePeremption, 
                                                String fournisseur, String utilisateur, String motif) throws Exception {
        // Validation de l'utilisateur
        if (utilisateur == null || utilisateur.isEmpty() || utilisateur.length() > 50) {
            System.out.println("Identifiant utilisateur invalide");
            return;
        }
        // Validation du motif
        if (motif == null || motif.isEmpty() || motif.length() > 500) {
            System.out.println("Utilisateur et motif requis pour les stupéfiants");
            return;
        }

        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
            con.setAutoCommit(false);

            // Vérifier que le produit est de catégorie stupéfiant
            if (!estStupéfiant(con, produitId)) {
                System.out.println("Ce produit n'est pas de catégorie stupéfiant");
                return;
            }

            // Validation des autres paramètres
            String erreur = validerQuantite(quantite);
            if (erreur != null) {
                System.out.println(erreur);
                return;
            }
            erreur = validerDatePeremption(datePeremption);
            if (erreur != null) {
                System.out.println(erreur);
                return;
            }
            erreur = validerFournisseur(fournisseur);
            if (erreur != null) {
                System.out.println(erreur);
                return;
            }

            // Mettre à jour le stock
            int stockActuel = getStockCourant(con, produitId);
            int nouveauStock = stockActuel + quantite;
            Statement stUpdate = con.createStatement();
            stUpdate.executeUpdate(
                "UPDATE stock SET quantite = " + nouveauStock + " WHERE produit_id = '" + produitId + "'");

            // Insérer le mouvement
            Statement stMvt = con.createStatement();
            stMvt.executeUpdate(
                "INSERT INTO mouvements (produit_id, quantite, date_mouvement, fournisseur) VALUES (" +
                "'" + produitId + "', " + quantite + ", NOW(), '" + fournisseur + "')");

            // Récupérer l'ID du mouvement inséré
            Statement stId = con.createStatement();
            ResultSet rsId = stId.executeQuery("SELECT LAST_INSERT_ID()");
            rsId.next();
            int mouvementId = rsId.getInt(1);

            // Insérer la date de péremption
            Statement stDate = con.createStatement();
            stDate.executeUpdate(
                "INSERT INTO dates_peremption (produit_id, date_peremption, quantite_lot) VALUES (" +
                "'" + produitId + "', '" + datePeremption + "', " + quantite + ")");

            // Insérer la traçabilité stupéfiant
            Statement stTrace = con.createStatement();
            stTrace.executeUpdate(
                "INSERT INTO tracabilite_stupefiants (mouvement_id, produit_id, utilisateur, date_heure, quantite, type_mouvement, motif) VALUES (" +
                mouvementId + ", '" + produitId + "', '" + utilisateur + "', NOW(), " + quantite + ", 'entrée', '" + motif + "')");

            con.commit();
            System.out.println("Réception de stupéfiant enregistrée pour le produit " + produitId + " : +" + quantite + " unités");
        } catch (Exception e) {
            if (con != null) {
                con.rollback();
            }
            throw e;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    /**
     * Enregistre une sortie de stupéfiant avec traçabilité.
     * Requirements: 5.3, 5.4, 5.5, 5.6, 5.7
     */
    public void enregistrerSortieStupéfiant(String produitId, int quantite, String utilisateur, String motif) throws Exception {
        // Validation de l'utilisateur
        if (utilisateur == null || utilisateur.isEmpty() || utilisateur.length() > 50) {
            System.out.println("Identifiant utilisateur invalide");
            return;
        }
        // Validation du motif
        if (motif == null || motif.isEmpty() || motif.length() > 500) {
            System.out.println("Utilisateur et motif requis pour les stupéfiants");
            return;
        }
        // Validation de la quantité
        String erreur = validerQuantite(quantite);
        if (erreur != null) {
            System.out.println(erreur);
            return;
        }

        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
            con.setAutoCommit(false);

            // Vérifier que le produit est de catégorie stupéfiant
            if (!estStupéfiant(con, produitId)) {
                System.out.println("Ce produit n'est pas de catégorie stupéfiant");
                return;
            }

            // Vérifier le stock
            int stockActuel = getStockCourant(con, produitId);
            if (quantite > stockActuel) {
                System.out.println("Stock insuffisant : disponible " + stockActuel + ", demandé " + quantite);
                return;
            }

            // Mettre à jour le stock
            int nouveauStock = stockActuel - quantite;
            Statement stUpdate = con.createStatement();
            stUpdate.executeUpdate(
                "UPDATE stock SET quantite = " + nouveauStock + " WHERE produit_id = '" + produitId + "'");

            // Insérer le mouvement
            Statement stMvt = con.createStatement();
            stMvt.executeUpdate(
                "INSERT INTO mouvements (produit_id, quantite, date_mouvement) VALUES (" +
                "'" + produitId + "', " + (-quantite) + ", NOW())");

            // Récupérer l'ID du mouvement inséré
            Statement stId = con.createStatement();
            ResultSet rsId = stId.executeQuery("SELECT LAST_INSERT_ID()");
            rsId.next();
            int mouvementId = rsId.getInt(1);

            // Insérer la traçabilité stupéfiant
            Statement stTrace = con.createStatement();
            stTrace.executeUpdate(
                "INSERT INTO tracabilite_stupefiants (mouvement_id, produit_id, utilisateur, date_heure, quantite, type_mouvement, motif) VALUES (" +
                mouvementId + ", '" + produitId + "', '" + utilisateur + "', NOW(), " + quantite + ", 'sortie', '" + motif + "')");

            con.commit();
            System.out.println("Sortie de stupéfiant enregistrée pour le produit " + produitId + " : -" + quantite + " unités");
        } catch (Exception e) {
            if (con != null) {
                con.rollback();
            }
            throw e;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    // ============================================
    // Requirement 6: Consultation de l'Historique des Mouvements
    // ============================================

    /**
     * Consulte l'historique des mouvements d'un produit.
     * Requirements: 6.1, 6.2, 6.3, 6.4, 6.5, 6.6
     */
    public void consulterHistorique(String produitId) throws Exception {
        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASS);

            // Vérifier que le produit existe
            if (!produitExiste(con, produitId)) {
                System.out.println("Produit inexistant");
                return;
            }

            // Vérifier si le produit est stupéfiant
            boolean estStup = estStupéfiant(con, produitId);

            // Récupérer les 100 derniers mouvements
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(
                "SELECT m.date_mouvement, m.quantite, m.fournisseur, ts.utilisateur, ts.motif " +
                "FROM mouvements m " +
                "LEFT JOIN tracabilite_stupefiants ts ON m.id = ts.mouvement_id " +
                "WHERE m.produit_id = '" + produitId + "' " +
                "ORDER BY m.date_mouvement DESC LIMIT 100");

            boolean mouvementTrouve = false;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

            while (rs.next()) {
                mouvementTrouve = true;
                Date dateMvt = rs.getTimestamp("date_mouvement");
                int quantite = rs.getInt("quantite");
                String fournisseur = rs.getString("fournisseur");
                String utilisateur = rs.getString("utilisateur");
                String motif = rs.getString("motif");

                String type = quantite > 0 ? "entrée" : "sortie";
                int quantiteAbs = Math.abs(quantite);

                StringBuilder sb = new StringBuilder();
                sb.append(sdf.format(dateMvt)).append(" - ");
                sb.append(type).append(" : ").append(quantiteAbs).append(" unités");

                if (quantite > 0) {
                    // Entrée : afficher le fournisseur
                    if (fournisseur != null && !fournisseur.isEmpty()) {
                        sb.append(", Fournisseur: ").append(fournisseur);
                    } else {
                        sb.append(", Fournisseur: Non renseigné");
                    }
                }

                if (estStup && utilisateur != null) {
                    sb.append(", Utilisateur: ").append(utilisateur);
                    sb.append(", Motif: ").append(motif);
                }

                System.out.println(sb.toString());
            }

            if (!mouvementTrouve) {
                System.out.println("Aucun historique disponible");
            }
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    // ============================================
    // Méthodes Helper Privées
    // ============================================

    /**
     * Vérifie si un produit existe dans la table stock.
     * Requirements: 1.3, 2.4, 3.3
     */
    private boolean produitExiste(Connection con, String produitId) throws Exception {
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(
            "SELECT 1 FROM stock WHERE produit_id = '" + produitId + "'");
        return rs.next();
    }

    /**
     * Retourne la quantité en stock d'un produit.
     * Requirements: 2.1, 2.2
     */
    private int getStockCourant(Connection con, String produitId) throws Exception {
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(
            "SELECT quantite FROM stock WHERE produit_id = '" + produitId + "'");
        if (rs.next()) {
            return rs.getInt("quantite");
        }
        return -1; // Produit inexistant
    }

    /**
     * Vérifie si un produit est de catégorie stupéfiant.
     * Requirements: 5.3, 5.4
     */
    private boolean estStupéfiant(Connection con, String produitId) throws Exception {
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(
            "SELECT categorie FROM stock WHERE produit_id = '" + produitId + "'");
        if (rs.next()) {
            String categorie = rs.getString("categorie");
            return "stupéfiant".equals(categorie);
        }
        return false;
    }

    /**
     * Affiche une alerte de stock bas formatée.
     * Requirements: 2.7, 4.5
     */
    private void afficherAlerteStockBas(String produitId, int quantite, int seuil) {
        System.out.println("Stock bas pour le produit " + produitId + " : " + quantite + " unités restantes (seuil " + seuil + ")");
    }

    /**
     * Valide une quantité.
     * Requirements: 1.4
     */
    private String validerQuantite(int quantite) {
        if (quantite <= 0 || quantite > 999999) {
            return "Quantité invalide";
        }
        return null;
    }

    /**
     * Valide une date de péremption.
     * Requirements: 1.5, 1.6
     */
    private String validerDatePeremption(String date) {
        if (date == null || date.isEmpty()) {
            return "Date de péremption invalide";
        }
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            sdf.setLenient(false);
            Date parsedDate = sdf.parse(date);
            Date today = new Date();
            if (parsedDate.before(today)) {
                return "Date de péremption invalide";
            }
        } catch (Exception e) {
            return "Date de péremption invalide";
        }
        return null;
    }

    /**
     * Valide un fournisseur.
     * Requirements: 1.7
     */
    private String validerFournisseur(String fournisseur) {
        if (fournisseur == null || fournisseur.isEmpty() || fournisseur.length() > 200) {
            return "Fournisseur invalide";
        }
        return null;
    }
}
