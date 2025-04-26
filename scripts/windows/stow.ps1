param (
    [string]$Module = "."
)

$dotfilesRoot = Resolve-Path "$PSScriptRoot/../.."
$userHome = Resolve-Path "$PSScriptRoot/../../.."
# $userHome = [System.Environment]::GetFolderPath("UserProfile")

function Link-File {
    param (
        [string]$source,
        [string]$target
    )

    if (Test-Path $target) {
        Write-Host "⚠️ Skipping: $target already exists"
    } else {
        $parent = Split-Path $target
        if (!(Test-Path $parent)) {
            New-Item -ItemType Directory -Path $parent | Out-Null
        }

        New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
        Write-Host "✅ Linked: $source → $target"
    }
}

$modules = if ($Module -eq ".") {
    Get-ChildItem -Directory $dotfilesRoot | Where-Object { $_.Name -notmatch "^(\.git|scripts|platform)$" }
} else {
    Get-Item -Path "$dotfilesRoot\$Module"
}

foreach ($mod in $modules) {
    $modPath = $mod.FullName
    $files = Get-ChildItem -Path $modPath -File -Recurse

    foreach ($file in $files) {
        $relativePath = $file.FullName.Substring($modPath.Length).TrimStart('\')
        $target = Join-Path $userHome $relativePath
        Link-File -source $file.FullName -target $target
    }
}