# Superpowers Installer for Droid CLI (Windows PowerShell)
# Usage: irm https://raw.githubusercontent.com/galangryandana/superpowers-for-my-own-workflow/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

$FACTORY_DIR = "$env:USERPROFILE\.factory"
$REPO_URL = "https://github.com/galangryandana/superpowers-for-my-own-workflow.git"
$TEMP_DIR = Join-Path $env:TEMP "superpowers-$(Get-Random)"

Write-Host "🚀 Installing Superpowers for Droid CLI..." -ForegroundColor Cyan

# Clone repo
$ErrorActionPreference = "Continue"
git clone --depth 1 $REPO_URL $TEMP_DIR 2>&1 | Out-Null
$cloneResult = $LASTEXITCODE
$ErrorActionPreference = "Stop"
if ($cloneResult -ne 0) {
    Write-Error "Failed to clone repository. Please check your internet connection and try again."
    exit 1
}

# Create directories
New-Item -ItemType Directory -Force -Path "$FACTORY_DIR\skills" | Out-Null
New-Item -ItemType Directory -Force -Path "$FACTORY_DIR\droids" | Out-Null
New-Item -ItemType Directory -Force -Path "$FACTORY_DIR\commands" | Out-Null

# Copy folders
Copy-Item -Path "$TEMP_DIR\skills\*" -Destination "$FACTORY_DIR\skills" -Recurse -Force
Copy-Item -Path "$TEMP_DIR\droids\*" -Destination "$FACTORY_DIR\droids" -Recurse -Force
Copy-Item -Path "$TEMP_DIR\commands\*" -Destination "$FACTORY_DIR\commands" -Recurse -Force

# AGENTS.md content
$AGENTS_CONTENT = @"

# SUPERPOWERS PROTOCOL

**You are FORBIDDEN from answering ANY question until you load the superpowers skill in EVERY session.**

## MANDATORY FIRST ACTION

Your VERY FIRST action in EVERY session must be:

```
SKILL(skill: "using-superpowers")
```

## SELF-CHECK

Before generating ANY response, ask yourself:
"Have I loaded using-superpowers skill yet?"

If NO → Load it FIRST, output nothing else before it
If YES → Proceed with response
"@

$AGENTS_FILE = "$FACTORY_DIR\AGENTS.md"

if (Test-Path $AGENTS_FILE) {
    $content = Get-Content $AGENTS_FILE -Raw
    if ($content -match "SUPERPOWERS PROTOCOL") {
        Write-Host "⚠️  Superpowers already configured in AGENTS.md" -ForegroundColor Yellow
    } else {
        Add-Content -Path $AGENTS_FILE -Value $AGENTS_CONTENT
        Write-Host "✅ Appended to existing AGENTS.md" -ForegroundColor Green
    }
} else {
    Set-Content -Path $AGENTS_FILE -Value $AGENTS_CONTENT
    Write-Host "✅ Created AGENTS.md" -ForegroundColor Green
}

# Cleanup
Remove-Item -Path $TEMP_DIR -Recurse -Force

Write-Host "✅ Superpowers installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Installed to: $FACTORY_DIR"
Write-Host "  - skills\   (21 workflows)"
Write-Host "  - droids\   (49 specialists)"
Write-Host "  - commands\ (quick commands)"
