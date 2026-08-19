# journal-agent.ps1
#
# Declencheur PostToolUse : appele par VS Code apres CHAQUE appel d'outil de l'agent.
# Ecrit une ligne dans journal-agent.txt, a la racine du projet.
#
# Aucune IA n'est appelee ici : c'est un script, donc c'est gratuit.
# Volontairement sans accents : ce fichier n'a pas besoin de marque d'ordre d'octets.
#
# Ce script ne doit JAMAIS faire echouer l'agent : il sort toujours en code 0.

$ErrorActionPreference = 'SilentlyContinue'

$outil = 'inconnu'
$cible = ''

try {
    # 1. VS Code envoie l'evenement en JSON sur l'entree standard.
    $brut = [Console]::In.ReadToEnd()
    $evt = $null
    if ($brut) { $evt = $brut | ConvertFrom-Json }

    # 2. Quel outil a ete appele.
    if ($evt -and $evt.tool_name) { $outil = [string]$evt.tool_name }

    # 3. Sur quel fichier. Le nom du champ varie selon l'outil : on essaie les plus courants.
    if ($evt -and $evt.tool_input) {
        foreach ($champ in @('filePath', 'file_path', 'path', 'uri', 'filename')) {
            $v = $evt.tool_input.$champ
            if ($v) { $cible = [string]$v; break }
        }
    }
    if ($cible) { $cible = Split-Path $cible -Leaf }
}
catch {
    # JSON illisible : on ecrit quand meme une ligne. Un journal muet ne prouve rien.
    $outil = 'evenement-illisible'
}

try {
    # 4. La racine du projet : ce script vit dans <racine>/.github/hooks/
    $racine = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
    $journal = Join-Path $racine 'journal-agent.txt'

    # 5. Une ligne, alignee pour rester lisible projetee a l'ecran.
    $heure = Get-Date -Format 'HH:mm:ss'
    $ligne = ('{0}   {1,-28} {2}' -f $heure, $outil, $cible).TrimEnd()

    # AppendAllText avec un UTF8 sans marque d'ordre d'octets : le journal reste propre
    # a l'ecran, meme si un nom de fichier porte des accents.
    $utf8 = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::AppendAllText($journal, $ligne + [Environment]::NewLine, $utf8)
}
catch {
    # On avale tout. Un declencheur casse ne doit pas casser la session de l'agent.
}

exit 0
