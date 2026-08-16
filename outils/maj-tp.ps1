# Met le kit de TP a jour, ou le remet a la version officielle du depot.
# Appele par les deux raccourcis du Bureau :
#
#   « Mettre a jour le TP »            -> sans option
#      Prend les nouveautes du depot en GARDANT le travail en cours. Git sait
#      fusionner tant que les nouveautes et le travail ne touchent pas les memes
#      fichiers, et c'est le cas ici : le formateur pousse des consignes, la salle
#      ecrit des livrables. La remise a neuf n'arrive qu'apres un echec reel.
#
#   « Repartir du projet officiel »    -> avec -Neuf
#      Remplace le dossier par la version EXACTE du depot, quoi qu'il contienne.
#      C'est le geste de debut de session, et celui qui remet un poste d'aplomb
#      entre deux groupes.
#
# Aucun des deux ne supprime jamais rien : un dossier remplace est deplace,
# horodate, et son chemin s'affiche a l'ecran.
#
# Installation sur la machine (une seule fois, avant le clonage de l'image) :
#   Get-Content outils\maj-tp.ps1 -Encoding UTF8 | Set-Content C:\Work\_maj-tp.ps1 -Encoding UTF8

param([switch]$Neuf)

$ErrorActionPreference = 'Stop'
$cible = 'C:\Work\daia-tp-pharmacie'
# Depot de SESSION, pas le kit source : la salle y a le droit d'ecrire, et il se
# jette et se recree entre deux sessions. Le kit source, daia-tp-pharmacie, reste
# en lecture seule pour tout le monde. Decide le 16/08.
$url = 'https://github.com/MattyDeuti/daia-tp-pharmacie-pilote.git'
$installe = 'C:\Work\_maj-tp.ps1'

# On ne DEPLACE jamais le dossier : sur Windows, un dossier ouvert dans l'editeur ou
# servant de repertoire courant a une console est verrouille, et Move-Item echoue avec
# « le fichier est utilise par un autre processus ». C'est la situation NORMALE d'un
# participant le jour J. Constate sur la VM le 12/08, sur ce geste precisement.
#
# On copie leur travail, puis on remet le dossier a l'etat du depot SUR PLACE. Git le
# fait tres bien avec un editeur ouvert, et trois choses survivent au passage : le
# raccordement « equipe » du module 7 (un reset ne touche pas aux depots distants), le
# cache Maven de target/ (ignore par git), et la session VS Code.
function RemettreANeuf {
    $archive = 'C:\Work\_ancien-tp-' + (Get-Date -Format 'yyyyMMdd-HHmm')

    New-Item -ItemType Directory -Path $archive -Force | Out-Null
    Get-ChildItem $cible -Force |
        Where-Object { $_.Name -ne '.git' } |
        ForEach-Object { Copy-Item $_.FullName -Destination $archive -Recurse -Force }

    Push-Location $cible
    try {
        git fetch origin
        if ($LASTEXITCODE -ne 0) {
            Write-Host ''
            Write-Host "  (pas de réseau : on repart de la dernière version connue)" -ForegroundColor DarkGray
        }
        # -f : ils peuvent etre sur une branche a eux, avec des modifications en
        # cours. On force le retour sur main avant de reecrire, sinon « repartir du
        # projet officiel » les laisserait sur leur branche.
        git checkout -f main
        git reset --hard origin/main
        git clean -fd
    }
    finally {
        Pop-Location
    }

    Write-Host ''
    Write-Host '  Kit remis à la version officielle.' -ForegroundColor Green
    Write-Host ''
    Write-Host '  Votre travail précédent est conservé ici :' -ForegroundColor Yellow
    Write-Host "     $archive" -ForegroundColor Yellow
    Write-Host '  Rien n''a été perdu. Recopiez ce dont vous avez besoin.'
}

# Le script installe dans C:\Work est une COPIE de celui du depot. Sans ce
# rafraichissement, une correction apportee au script lui-meme n'arriverait jamais
# sur les postes : le raccourci continuerait de lancer l'ancienne version.
function RafraichirLeScript {
    $source = Join-Path $cible 'outils\maj-tp.ps1'
    if (-not (Test-Path $source)) { return }
    if (-not (Test-Path $installe)) { return }
    $a = (Get-FileHash $source -Algorithm SHA256).Hash
    $b = (Get-FileHash $installe -Algorithm SHA256).Hash
    if ($a -ne $b) {
        Get-Content $source -Encoding UTF8 | Set-Content $installe -Encoding UTF8
        Write-Host ''
        Write-Host '  (le raccourci lui-même a été mis à jour)' -ForegroundColor DarkGray
    }
}

try {
    Write-Host ''
    if ($Neuf) {
        Write-Host '  === Repartir du projet officiel ===' -ForegroundColor Cyan
    }
    else {
        Write-Host '  === Mise à jour du kit de TP ===' -ForegroundColor Cyan
    }
    Write-Host ''

    if (-not (Test-Path $cible)) {
        Write-Host "  Dossier absent. Récupération d'une version neuve..."
        git clone $url $cible
        Write-Host ''
        Write-Host '  Kit installé.' -ForegroundColor Green
        RafraichirLeScript
    }
    elseif ($Neuf) {
        Write-Host '  Votre dossier va reprendre la version officielle du dépôt.'
        Write-Host '  Votre travail actuel sera COPIÉ de côté avant, jamais supprimé,'
        Write-Host '  et son chemin s''affichera à la fin.'
        Write-Host ''
        Write-Host '  À faire en début de session, ou quand un poste est à remettre d''aplomb.'
        Write-Host '  En cours de travaux pratiques, préférez « Mettre a jour le TP ».'
        Write-Host ''
        $rep = Read-Host '  Continuer ? (o/n)'
        if ($rep -ne 'o') {
            Write-Host ''
            Write-Host "  Annulé. Rien n'a changé." -ForegroundColor Green
        }
        else {
            RemettreANeuf
            RafraichirLeScript
        }
    }
    else {
        Push-Location $cible
        git pull
        $code = $LASTEXITCODE
        Pop-Location

        if ($code -eq 0) {
            Write-Host ''
            Write-Host '  Kit à jour. Votre travail en cours est intact.' -ForegroundColor Green
            RafraichirLeScript
        }
        else {
            Write-Host ''
            Write-Host "  La mise à jour n'a pas pu se faire toute seule." -ForegroundColor Yellow
            Write-Host '  Cela arrive quand une nouveauté touche un fichier que vous avez modifié.'
            Write-Host ''
            Write-Host '  Vous avez le choix :'
            Write-Host "    n  ->  on ne touche à rien. Votre travail reste en place et vous"
            Write-Host '           continuez avec la version que vous avez. Prévenez le formateur.'
            Write-Host '    o  ->  on repart de la version officielle. Votre travail actuel sera'
            Write-Host '           COPIÉ de côté, jamais supprimé, et son chemin s''affichera.'
            Write-Host ''
            $rep = Read-Host '  Repartir de la version officielle ? (o/n)'

            if ($rep -ne 'o') {
                Write-Host ''
                Write-Host "  Rien n'a changé. Votre travail est intact." -ForegroundColor Green
            }
            else {
                RemettreANeuf
                RafraichirLeScript
            }
        }
    }
}
catch {
    Write-Host ''
    Write-Host ('  Erreur : ' + $_.Exception.Message) -ForegroundColor Red
    Write-Host "  Prévenez le formateur. Votre travail n'a pas été touché."
}

Write-Host ''
Read-Host '  Appuyez sur Entrée pour fermer'
