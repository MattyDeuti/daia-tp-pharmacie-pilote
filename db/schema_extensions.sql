-- ============================================
-- Script DDL - Extensions du schéma pharmacie
-- ============================================
-- Phase 1: Infrastructure base de données
-- Requirements: 1.1, 1.2, 2.5, 3.2, 4.1, 5.1, 5.2, 5.3, 5.5, 6.1
-- ============================================

-- ============================================
-- Task 1.1: Extensions de la table stock
-- Requirements: 4.1, 5.1, 5.2
-- ============================================

-- Ajout des colonnes categorie et seuil_alerte à la table stock
ALTER TABLE stock 
ADD COLUMN categorie VARCHAR(20) DEFAULT 'médicament',
ADD COLUMN seuil_alerte INT DEFAULT 10;

-- Ajout de la contrainte CHECK sur la catégorie
-- Les valeurs autorisées sont: médicament, stupéfiant, parapharmacie
ALTER TABLE stock 
ADD CONSTRAINT chk_categorie 
CHECK (categorie IN ('médicament', 'stupéfiant', 'parapharmacie'));

-- ============================================
-- Task 1.2: Table des mouvements
-- Requirements: 1.1, 2.5, 6.1
-- ============================================

-- Table des mouvements (entrées et sorties de stock)
CREATE TABLE mouvements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produit_id VARCHAR(50) NOT NULL,
    quantite INT NOT NULL,  -- Positif pour entrée, négatif pour sortie
    date_mouvement DATETIME DEFAULT CURRENT_TIMESTAMP,
    fournisseur VARCHAR(200),
    FOREIGN KEY (produit_id) REFERENCES stock(produit_id)
);

-- ============================================
-- Task 1.3: Table des dates de péremption
-- Requirements: 1.2, 3.2
-- ============================================

-- Table des dates de péremption par lot
CREATE TABLE dates_peremption (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produit_id VARCHAR(50) NOT NULL,
    date_peremption DATE NOT NULL,
    quantite_lot INT DEFAULT 0,  -- Quantité restante dans ce lot
    FOREIGN KEY (produit_id) REFERENCES stock(produit_id)
);

-- Index pour optimiser la recherche de date la plus proche
CREATE INDEX idx_peremption_produit_date 
ON dates_peremption(produit_id, date_peremption);

-- ============================================
-- Task 1.4: Table de traçabilité des stupéfiants
-- Requirements: 5.3, 5.5
-- ============================================

-- Table de traçabilité renforcée pour les stupéfiants
CREATE TABLE tracabilite_stupefiants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mouvement_id INT NOT NULL,
    produit_id VARCHAR(50) NOT NULL,
    utilisateur VARCHAR(50) NOT NULL,
    date_heure DATETIME DEFAULT CURRENT_TIMESTAMP,
    quantite INT NOT NULL,
    type_mouvement VARCHAR(10) NOT NULL,  -- 'entrée' ou 'sortie'
    motif VARCHAR(500) NOT NULL,
    FOREIGN KEY (mouvement_id) REFERENCES mouvements(id),
    FOREIGN KEY (produit_id) REFERENCES stock(produit_id)
);

-- Index pour les requêtes d'audit
CREATE INDEX idx_tracabilite_produit_date 
ON tracabilite_stupefiants(produit_id, date_heure);
