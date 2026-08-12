# Met le kit de TP a jour, ou le repare s'il a ete abime.
# Appele par le raccourci « Mettre a jour le TP » pose sur le Bureau.
#
# Ne supprime JAMAIS le travail en cours : un dossier modifie est mis de cote,
# horodate, et le chemin est affiche a l'ecran.
#
# Installation sur la machine (une seule fois, avant le clonage de l'image) :
#   Get-Content outils\maj-tp.ps1 -Encoding UTF8 | Set-Content C:\Work\_maj-tp.ps1 -Encoding UTF8

$ErrorActionPreference = 'Stop'
$cible = 'C:\Work\daia-tp-pharmacie'
$url = 'https://github.com/MattyDeuti/daia-tp-pharmacie.git'

try {
    Write-Host ''
    Write-Host '  === Mise à jour du kit de TP ===' -ForegroundColor Cyan
    Write-Host ''

    if (-not (Test-Path $cible)) {
        Write-Host "  Dossier absent. Récupération d'une version neuve..."
        git clone $url $cible
        Write-Host '  Kit installé.' -ForegroundColor Green
    }
    else {
        Push-Location $cible
        $modifs = git status --porcelain
        Pop-Location

        if ([string]::IsNullOrWhiteSpace(($modifs -join ''))) {
            Push-Location $cible
            git pull
            Pop-Location
            Write-Host '  Kit à jour.' -ForegroundColor Green
        }
        else {
            Write-Host '  ATTENTION : votre dossier contient du travail en cours.' -ForegroundColor Yellow
            Write-Host '  La remise à neuf va le mettre DE CÔTÉ. Rien ne sera supprimé.'
            Write-Host ''
            $rep = Read-Host '  Continuer ? (o/n)'
            if ($rep -ne 'o') {
                Write-Host "  Annulé. Rien n'a changé."
            }
            else {
                $archive = 'C:\Work\_ancien-tp-' + (Get-Date -Format 'yyyyMMdd-HHmm')
                Move-Item $cible $archive
                git clone $url $cible
                Write-Host ''
                Write-Host "  Votre ancien dossier est conservé ici : $archive" -ForegroundColor Yellow
                Write-Host '  Kit remis à neuf.' -ForegroundColor Green
            }
        }
    }
}
catch {
    Write-Host ''
    Write-Host ('  Erreur : ' + $_.Exception.Message) -ForegroundColor Red
    Write-Host "  Prévenez le formateur."
}

Write-Host ''
Read-Host '  Appuyez sur Entrée pour fermer'
