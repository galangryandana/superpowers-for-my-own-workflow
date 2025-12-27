# Superpowers Installer for Droid CLI (Windows PowerShell)
# Usage: irm https://raw.githubusercontent.com/galangryandana/superpowers-for-my-own-workflow/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

$FactoryDir = "$env:USERPROFILE\.factory"
$RepoUrl = "https://github.com/galangryandana/superpowers-for-my-own-workflow.git"
$TempDir = Join-Path $env:TEMP "superpowers-$(Get-Random)"

Write-Host "Installing Superpowers for Droid CLI..."

# Clone repo
git clone --depth 1 $RepoUrl $TempDir 2>$null

# Create directories if not exist
$null = New-Item -ItemType Directory -Force -Path "$FactoryDir\skills"
$null = New-Item -ItemType Directory -Force -Path "$FactoryDir\droids"
$null = New-Item -ItemType Directory -Force -Path "$FactoryDir\commands"

# Copy folders
Copy-Item -Path "$TempDir\skills\*" -Destination "$FactoryDir\skills" -Recurse -Force
Copy-Item -Path "$TempDir\droids\*" -Destination "$FactoryDir\droids" -Recurse -Force
Copy-Item -Path "$TempDir\commands\*" -Destination "$FactoryDir\commands" -Recurse -Force

# Cleanup
Remove-Item -Path $TempDir -Recurse -Force

Write-Host "Superpowers installed successfully!"
Write-Host ""
Write-Host "Installed to: $FactoryDir"
Write-Host "  - skills/   (13 workflows)"
Write-Host "  - droids/   (49 specialists)"
Write-Host "  - commands/ (quick commands)"
