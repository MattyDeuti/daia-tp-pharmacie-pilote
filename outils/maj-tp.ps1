# Met le kit de TP a jour, ou le repare s'il a ete abime.
# Appele par le raccourci « Mettre a jour le TP » pose sur le Bureau.
#
# ORDRE VOULU : on essaie TOUJOURS la mise a jour d'abord. Git sait fusionner des
# nouveautes avec du travail en cours tant que les deux ne touchent pas les memes
# fichiers - et c'est le cas ici : le formateur pousse des consignes, la salle ecrit
# des specifications, des agents et des procedures. La remise a neuf n'arrive donc
# qu'en dernier recours, apres un echec reel et apres confirmation.
#
# Ne supprime JAMAIS le travail en cours : un dossier remis a neuf est deplace,
# horodate, et son chemin est affiche a l'ecran.
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
        Write-Host ''
        Write-Host '  Kit installé.' -ForegroundColor Green
    }
    else {
        Push-Location $cible
        git pull
        $code = $LASTEXITCODE
        Pop-Location

        if ($code -eq 0) {
            Write-Host ''
            Write-Host '  Kit à jour. Votre travail en cours est intact.' -ForegroundColor Green
        }
        else {
            Write-Host ''
            Write-Host "  La mise à jour n'a pas pu se faire toute seule." -ForegroundColor Yellow
            Write-Host '  Cela arrive quand une nouveauté touche un fichier que vous avez modifié.'
            Write-Host ''
            Write-Host '  Vous avez le choix :'
            Write-Host "    n  ->  on ne touche à rien. Votre travail reste en place et vous"
            Write-Host '           continuez avec la version que vous avez. Prévenez le formateur.'
            Write-Host '    o  ->  on repart d''un kit neuf. Votre dossier actuel sera DÉPLACÉ,'
            Write-Host '           jamais supprimé, et son chemin s''affichera.'
            Write-Host ''
            $rep = Read-Host "  Repartir d'un kit neuf ? (o/n)"

            if ($rep -ne 'o') {
                Write-Host ''
                Write-Host "  Rien n'a changé. Votre travail est intact." -ForegroundColor Green
            }
            else {
                $archive = 'C:\Work\_ancien-tp-' + (Get-Date -Format 'yyyyMMdd-HHmm')
                Move-Item $cible $archive
                git clone $url $cible
                Write-Host ''
                Write-Host '  Kit remis à neuf.' -ForegroundColor Green
                Write-Host ''
                Write-Host '  TOUT votre travail précédent est conservé ici :' -ForegroundColor Yellow
                Write-Host "     $archive" -ForegroundColor Yellow
                Write-Host '  Rien n''a été perdu. Recopiez ce dont vous avez besoin.'
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
