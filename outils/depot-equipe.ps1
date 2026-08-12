# Prepare le depot d'arrivee du cas pratique « equipe augmentee » (module 7).
#
# POURQUOI CE SCRIPT EXISTE
# L'exercice a besoin d'un depot commun ou les quatre briques atterrissent. La
# solution nominale est un depot GitHub. Elle depend des comptes des participants,
# et si ce sont des comptes geres par leur entreprise, ils ne peuvent ni forker un
# depot externe ni etre invites sur un depot personnel. Ce script fournit le repli,
# et il est ecrit pour que le repli et la solution nominale soient LE MEME GESTE.
#
# Git ne fait aucune difference entre un depot chez GitHub, sur un partage reseau ou
# sur le disque : une adresse est une adresse. Seul le parametre -Adresse change.
#
#   .\outils\depot-equipe.ps1
#       -> depot local sur la machine. Marche toujours, sans compte ni reseau.
#          Chacun publie chez soi : les gestes sont reels, la convergence non.
#
#   .\outils\depot-equipe.ps1 -Adresse '\\<serveur>\<partage>\daia-equipe.git'
#       -> depot partage. Les neuf postes convergent pour de vrai : la relecture
#          croisee et la recuperation finale redeviennent un exercice.
#
#   .\outils\depot-equipe.ps1 -Adresse 'https://github.com/<org>/<depot>.git'
#       -> solution nominale, si les comptes le permettent.

param(
    [string]$Adresse = 'C:\Work\depot-equipe.git',
    [string]$Projet = 'C:\Work\daia-tp-pharmacie'
)

$ErrorActionPreference = 'Stop'
$NOM_DISTANT = 'equipe'

try {
    Write-Host ''
    Write-Host "  === Dépôt d'équipe — module 7 ===" -ForegroundColor Cyan
    Write-Host ''

    if (-not (Test-Path $Projet)) {
        throw "Le projet est introuvable : $Projet"
    }

    # --- Le depot d'arrivee ---------------------------------------------------
    # On ne le cree que s'il est local et absent. Une adresse reseau ou GitHub est
    # supposee exister deja : ce n'est pas a un poste de participant de la fabriquer.
    $estLocal = $Adresse -notmatch '^(https?|git|ssh)://' -and $Adresse -notmatch '^\\\\'

    if ($estLocal) {
        if (Test-Path $Adresse) {
            Write-Host "  Dépôt d'arrivée déjà en place : $Adresse"
        }
        else {
            git init --bare $Adresse | Out-Null
            Write-Host "  Dépôt d'arrivée créé : $Adresse" -ForegroundColor Green
        }
    }
    else {
        Write-Host "  Dépôt d'arrivée (distant) : $Adresse"
        Write-Host '  Il doit exister avant que la salle publie.' -ForegroundColor Yellow
    }

    # --- Le raccordement du projet -------------------------------------------
    Push-Location $Projet
    $existant = git remote 2>$null
    if ($existant -contains $NOM_DISTANT) {
        git remote set-url $NOM_DISTANT $Adresse
        Write-Host "  Raccordement mis à jour : « $NOM_DISTANT »"
    }
    else {
        git remote add $NOM_DISTANT $Adresse
        Write-Host "  Raccordement ajouté : « $NOM_DISTANT »" -ForegroundColor Green
    }
    $branche = (git rev-parse --abbrev-ref HEAD).Trim()
    Pop-Location

    Write-Host ''
    Write-Host '  Prêt.' -ForegroundColor Green
    Write-Host ''
    Write-Host "  Le dépôt d'arrivée s'appelle « $NOM_DISTANT ». C'est le nom à donner"
    Write-Host '  à la salle : « publiez sur equipe », et rien d''autre.'
    Write-Host ''
    Write-Host "  Branche courante : $branche"

    if ($estLocal) {
        Write-Host ''
        Write-Host '  ATTENTION — mode local.' -ForegroundColor Yellow
        Write-Host '  Chacun publie sur SA machine. Les gestes sont réels, la convergence'
        Write-Host "  ne l'est pas : personne ne verra la brique d'un autre."
        Write-Host '  Les étapes de relecture croisée et de récupération se démontrent'
        Write-Host "  depuis le poste du formateur."
    }
}
catch {
    Write-Host ''
    Write-Host ('  Erreur : ' + $_.Exception.Message) -ForegroundColor Red
}

Write-Host ''
Read-Host '  Appuyez sur Entrée pour fermer'
