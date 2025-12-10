# Superpowers for Droid CLI

Framework disiplin pengembangan untuk AI coding assistant, dioptimasi untuk [Droid CLI](https://github.com/galangryandana/droid).

## Mengapa Repo Ini?

Repo ini adalah **fork termodifikasi** dari [obra/superpowers](https://github.com/obra/superpowers) yang awalnya didesain 100% untuk Claude Code.

**Perbedaan dengan superpowers original:**
- Skills telah diupdate agar **full kompatibel dengan Droid CLI**
- Droids disesuaikan dengan arsitektur Droid
- Commands dioptimasi untuk workflow Droid
- Beberapa syntax dan path telah disesuaikan

**Jangan gunakan superpowers original untuk Droid** - akan ada inkompabilitas karena perbedaan arsitektur antara Claude Code dan Droid CLI.

## Instalasi

### macOS / Linux

```bash
curl -fsSL https://raw.githubusercontent.com/galangryandana/superpowers-for-my-own-workflow/main/install.sh | bash
```

### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/galangryandana/superpowers-for-my-own-workflow/main/install.ps1 | iex
```

### Manual

```bash
git clone https://github.com/galangryandana/superpowers-for-my-own-workflow.git
cd superpowers-for-my-own-workflow

# macOS/Linux
chmod +x install.sh && ./install.sh

# Windows PowerShell
.\install.ps1
```

## Apa yang di-install?

```
~/.droid/
├── AGENTS.md    # Konfigurasi (append, tidak menimpa file existing)
├── skills/      # 21 workflow protocols (Droid-compatible)
├── droids/      # 49 specialist agents
└── commands/    # Quick commands
```

**Catatan:** 
- File AGENTS.md akan di-append, bukan di-replace
- File custom Anda di folder skills/droids/commands tetap aman
- Hanya file dengan nama sama yang akan di-update

## Credits

Based on [obra/superpowers](https://github.com/obra/superpowers), modified for Droid CLI compatibility.
