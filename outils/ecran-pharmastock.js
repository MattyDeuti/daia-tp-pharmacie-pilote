/**
 * Sert l'ecran PharmaStock sur http://localhost:8000
 *
 * POURQUOI CE FICHIER EXISTE
 * Le serveur MCP de pilotage du navigateur (`@playwright/mcp`) REFUSE le protocole
 * `file://`. Ouvrir `web/index.html` directement echoue donc, et l'agent part alors
 * dans des contournements : demarrer un serveur Python (absent de la machine),
 * encoder la page en base64... Constate le 16/08/2026.
 *
 * La page est donc servie en HTTP. Ce script n'utilise QUE les modules livres avec
 * Node : aucun paquet a telecharger, rien a mettre en cache, rien qui puisse manquer
 * le jour J.
 *
 * COMMENT ON LE LANCE
 * On ne le lance pas a la main : la tache VS Code « Ecran PharmaStock » s'en charge
 * a l'ouverture du projet. Voir `.vscode/tasks.json`.
 */

const http = require('node:http');
const fs = require('node:fs');
const path = require('node:path');

const PORT = 8000;
const RACINE = path.join(__dirname, '..', 'web');

const TYPES = {
  '.html': 'text/html; charset=utf-8',
  '.css': 'text/css; charset=utf-8',
  '.js': 'text/javascript; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.svg': 'image/svg+xml',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.ico': 'image/x-icon',
};

const serveur = http.createServer((req, res) => {
  // On ne sert que ce qui est sous `web/` : le `..` d'une URL ne sort pas du dossier.
  const demande = decodeURIComponent(req.url.split('?')[0]);
  const relatif = demande === '/' ? 'index.html' : demande.replace(/^\/+/, '');
  const cible = path.join(RACINE, relatif);

  if (!cible.startsWith(RACINE)) {
    res.writeHead(403).end('Hors du dossier web/');
    return;
  }

  fs.readFile(cible, (err, contenu) => {
    if (err) {
      res.writeHead(404, { 'Content-Type': 'text/plain; charset=utf-8' });
      res.end('Introuvable : ' + relatif);
      return;
    }
    res.writeHead(200, {
      'Content-Type': TYPES[path.extname(cible).toLowerCase()] || 'application/octet-stream',
      'Cache-Control': 'no-store',
    });
    res.end(contenu);
  });
});

serveur.on('error', (err) => {
  if (err.code === 'EADDRINUSE') {
    console.log('');
    console.log('  L\'ecran PharmaStock tourne deja sur http://localhost:' + PORT);
    console.log('  Rien a faire : la page est disponible.');
    console.log('');
    process.exit(0);
  }
  throw err;
});

serveur.listen(PORT, () => {
  console.log('');
  console.log('  ================================================');
  console.log('   Ecran PharmaStock  ->  http://localhost:' + PORT);
  console.log('  ================================================');
  console.log('');
  console.log('  C\'est l\'adresse a donner a l\'agent.');
  console.log('  Laissez cette fenetre ouverte pendant la formation.');
  console.log('');
});
