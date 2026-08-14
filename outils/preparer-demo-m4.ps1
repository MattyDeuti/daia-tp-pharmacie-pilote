# Prepare le dossier de demonstration du module 4, celui de 09h15 le jour 2.
#
# Appele par le raccourci du Bureau « Preparer la demo M4 ».
#
# CE SCRIPT NE TOUCHE JAMAIS C:\Work\daia-tp-pharmacie.
#
# Il fabrique un dossier SEPARE, C:\Work\demo-m4, qui contient le kit PLUS la
# specification de demonstration (les trois documents : exigences, conception,
# taches). Cette specification vit sur une branche a part, jamais sur main,
# pour une raison ecrite au runbook du module 4, § A.2.2 :
#
#   le legacy du kit (GestionStock.java, schema_extensions.sql) A ETE PRODUIT
#   par cette specification-la. Ses 31 taches le reconstruisent. Si la demo
#   tournait dans le depot de la salle, l'agent reecrirait devant tout le monde
#   les fichiers qui servent de support a tous les autres modules.
#
# D'ou la regle : la demo du module 4 se joue dans demo-m4. Jamais ailleurs.
#
# Le dossier est JETABLE. On le remet a neuf avant chaque session : c'est ce qui
# rend les boutons de validation a nouveau cliquables, et la demo rejouable.
#
# Installation sur la machine (une seule fois) :
#   Get-Content outils\preparer-demo-m4.ps1 -Encoding UTF8 | Set-Content C:\Work\_preparer-demo-m4.ps1 -Encoding UTF8

$ErrorActionPreference = 'Stop'
$cible   = 'C:\Work\demo-m4'
$url     = 'https://github.com/MattyDeuti/daia-tp-pharmacie.git'
$branche = 'spec-demo-m4'

try {
    Write-Host ''
    Write-Host '  === Preparation de la demo du module 4 ===' -ForegroundColor Cyan
    Write-Host ''

    if (-not (Test-Path $cible)) {
        Write-Host '  Dossier absent. Recuperation...'
        Write-Host ''
        git clone --branch $branche $url $cible
        if ($LASTEXITCODE -ne 0) { throw "le telechargement a echoue (reseau ?)" }
    }
    else {
        Write-Host '  Ce dossier est jetable : il va reprendre son etat de depart.'
        Write-Host '  Tout ce que la demo precedente y a produit sera efface.'
        Write-Host ''
        $rep = Read-Host '  Continuer ? (o/n)'
        if ($rep -ne 'o') {
            Write-Host ''
            Write-Host "  Annule. Rien n'a change." -ForegroundColor Green
            Write-Host ''
            Read-Host '  Appuyez sur Entree pour fermer'
            exit
        }

        Push-Location $cible
        try {
            git fetch origin
            if ($LASTEXITCODE -ne 0) {
                Write-Host ''
                Write-Host '  (pas de reseau : on repart de la derniere version connue)' -ForegroundColor DarkGray
            }
            git checkout -f $branche
            git reset --hard "origin/$branche"
            git clean -fd
        }
        finally {
            Pop-Location
        }
    }

    Write-Host ''
    Write-Host '  Dossier de demo pret :' -ForegroundColor Green
    Write-Host "     $cible" -ForegroundColor Green
    Write-Host ''
    Write-Host '  Ouvrez CE dossier dans Kiro, pas celui du TP.'
    Write-Host '  La specification apparait dans le panneau des specifications.'
    Write-Host ''
    Write-Host '  Avant de jouer, deux verifications :' -ForegroundColor Yellow
    Write-Host '    - Autopilot COUPE (interrupteur en bas a droite du panneau).'
    Write-Host '      On ne le bascule qu au bloc 5, expres.'
    Write-Host '    - Les boutons de validation sont-ils encore la sur la premiere'
    Write-Host '      phase ? C est eux que la salle doit vous voir cliquer.'
}
catch {
    Write-Host ''
    Write-Host ('  Erreur : ' + $_.Exception.Message) -ForegroundColor Red
    Write-Host '  Le dossier du TP n a pas ete touche, quoi qu il arrive.'
}

Write-Host ''
Read-Host '  Appuyez sur Entree pour fermer'
