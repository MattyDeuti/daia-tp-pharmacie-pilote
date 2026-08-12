# Inventaire du poste : ce qui est installe, comment il est regle, ou en est le kit.
#
# DEUX USAGES
#   1. Avant le clonage : capturer l'etat de reference de l'image dorée. Sans cette
#      reference, un clone qui se comporte mal le jour J n'est comparable a rien.
#   2. Le jour J : comparer un poste qui coince a la reference, en quinze secondes.
#
# Ne modifie rien, n'ecrit rien, ne demande aucun droit particulier.
#
#   .\outils\inventaire-poste.ps1

$ErrorActionPreference = 'Continue'
$kit = 'C:\Work\daia-tp-pharmacie'

function Ligne($cle, $valeur) {
    Write-Host ('  {0,-22}' -f $cle) -NoNewline
    Write-Host $valeur -ForegroundColor Gray
}

function Version($commande, $motif) {
    try {
        $s = (& $commande --version 2>$null | Select-Object -First 1)
        if ($s -match $motif) { return $Matches[1] }
        return ($s -replace '\s+', ' ').Trim()
    }
    catch { return 'ABSENT' }
}

Write-Host ''
Write-Host '  ================ INVENTAIRE DU POSTE ================' -ForegroundColor Cyan
Ligne 'date' (Get-Date -Format 'dd/MM/yyyy HH:mm')
Ligne 'machine' ($env:COMPUTERNAME + '  utilisateur ' + $env:USERNAME)

Write-Host ''
Write-Host '  --- Logiciels' -ForegroundColor Cyan
Ligne 'git' (Version 'git' '(\d+\.\d+\.\d+)')
Ligne 'node' (Version 'node' '(v[\d.]+)')
Ligne 'npm' (Version 'npm' '([\d.]+)')
# On lit la version dans les proprietes de l'executable plutot que par `java -version` :
# cette commande ecrit sur la sortie d'erreur, et la rediriger en PowerShell 5.1 fabrique
# des enregistrements d'erreur au lieu de texte.
$j = Get-Command java -ErrorAction SilentlyContinue
Ligne 'java' $(if ($j) { $j.Version.ToString() } else { 'ABSENT' })
Ligne 'maven' (Version 'mvn' 'Apache Maven ([\d.]+)')
Ligne 'gh' (Version 'gh' 'gh version ([\d.]+)')
Ligne 'VS Code' (Version 'code' '([\d.]+)')

Write-Host ''
Write-Host '  --- Extensions VS Code' -ForegroundColor Cyan
try { (& code --list-extensions) | ForEach-Object { Ligne '' $_ } } catch { Ligne '' 'illisible' }

Write-Host ''
Write-Host '  --- Reglages qui doivent tenir apres le gel' -ForegroundColor Cyan
foreach ($n in @('Code', 'Kiro')) {
    $f = "$env:APPDATA\$n\User\settings.json"
    if (Test-Path $f) {
        $t = Get-Content $f -Raw
        $ok = ($t -match '"update.mode"\s*:\s*"none"') -and ($t -match '"extensions.autoUpdate"\s*:\s*false')
        Ligne "$n updates" $(if ($ok) { 'COUPES' } else { '!! ACTIFS !!' })
    }
    else { Ligne "$n updates" 'fichier absent' }
}
$prof = $PROFILE.CurrentUserAllHosts
Ligne 'profil PowerShell' $(if ((Test-Path $prof) -and ((Get-Content $prof -Raw) -match 'Get-Content:Encoding')) { 'UTF-8 pose' } else { '!! absent !!' })
Ligne 'ExecutionPolicy' (Get-ExecutionPolicy -Scope CurrentUser)
Ligne 'Windows Update' ((Get-Service wuauserv).Status.ToString() + ' / ' + (Get-Service wuauserv).StartType)

Write-Host ''
Write-Host '  --- Comptes : tout doit etre vide avant le clonage' -ForegroundColor Cyan
$gh = (& gh auth status 2>&1 | Out-String)
Ligne 'GitHub CLI' $(if ($gh -match 'not logged') { 'deconnecte' } else { '!! CONNECTE !!' })
$id = (& git config --global --list 2>$null | Out-String).Trim()
Ligne 'identite Git' $(if ([string]::IsNullOrWhiteSpace($id)) { 'aucune' } else { '!! ' + ($id -replace '\s+', ' ') + ' !!' })
$cm = (& cmdkey /list 2>$null | Out-String)
Ligne 'jeton GitHub' $(if ($cm -match 'github') { '!! PRESENT !!' } else { 'aucun' })

Write-Host ''
Write-Host '  --- Le kit' -ForegroundColor Cyan
if (Test-Path $kit) {
    Push-Location $kit
    Ligne 'commit' ((git log --oneline -1) -replace '\s+$', '')
    Ligne 'branche' (git rev-parse --abbrev-ref HEAD)
    $st = (git status --porcelain | Measure-Object -Line).Lines
    Ligne 'modifications' $(if ($st -eq 0) { 'aucune' } else { "$st fichier(s)" })
    (git remote -v) | Where-Object { $_ -match 'fetch' } | ForEach-Object { Ligne 'distant' ($_ -replace '\s+\(fetch\)', '') }
    foreach ($m in @('.vscode\mcp.json', '.kiro\settings\mcp.json')) {
        if (Test-Path $m) {
            $t = Get-Content $m -Raw
            $l = @(); if ($t -match 'filesystem') { $l += 'filesystem' }; if ($t -match 'playwright') { $l += 'playwright' }
            Ligne $m ($l -join ' + ')
        }
    }
    Ligne 'consignes' ((Get-ChildItem 'consignes\tp*.md' -ErrorAction SilentlyContinue).Count.ToString() + ' fichier(s)')
    Pop-Location
}
else { Ligne 'kit' '!! ABSENT !!' }

Write-Host ''
Write-Host '  --- C:\Work et Bureaux' -ForegroundColor Cyan
Get-ChildItem C:\Work -Force -ErrorAction SilentlyContinue | ForEach-Object { Ligne 'C:\Work' $_.Name }
foreach ($b in @([Environment]::GetFolderPath('Desktop'), 'C:\Users\Public\Desktop')) {
    Get-ChildItem $b -Force -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -ne 'desktop.ini' } |
        ForEach-Object { Ligne (Split-Path $b -Leaf) $_.Name }
}

Write-Host ''
Write-Host '  --- Gabarit' -ForegroundColor Cyan
$os = Get-CimInstance Win32_OperatingSystem
Ligne 'Windows' ($os.Caption + ' ' + $os.Version)
Ligne 'RAM' ([math]::Round($os.TotalVisibleMemorySize / 1MB, 1).ToString() + ' Go')
Ligne 'vCPU' (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors
$d = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$total = [math]::Round($d.Size / 1GB)
$pris = [math]::Round(($d.Size - $d.FreeSpace) / 1GB)
Ligne 'disque C:' "$total Go dont $pris utilises"

Write-Host ''
Read-Host '  Appuyez sur Entree pour fermer'
