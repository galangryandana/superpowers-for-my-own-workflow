# Superpowers for Droid CLI

Framework disiplin pengembangan untuk AI coding assistant, dioptimasi untuk [Droid CLI](https://github.com/galangryandana/droid).

## Mengapa Repo Ini?

Repo ini adalah **clone termodifikasi** dari [obra/superpowers](https://github.com/obra/superpowers) yang awalnya didesain 100% untuk Claude Code.

**Perbedaan dengan superpowers original:**
- Skills telah diupdate agar **full kompatibel dengan Droid CLI**
- Droids disesuaikan dengan arsitektur Droid
- Commands dioptimasi untuk workflow Droid
- Beberapa syntax dan path telah disesuaikan supaya kompatibel dengan Droid CLI

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
~/.factory/
├── AGENTS.md    # Konfigurasi (append, tidak menimpa file existing)
├── skills/      # 21 workflow protocols (Droid-compatible)
├── droids/      # 49 specialist agents
└── commands/    # Quick commands
```

**Catatan:** 
- File AGENTS.md akan di-append, bukan di-replace

## Credits

Based on [obra/superpowers](https://github.com/obra/superpowers), modified for Droid CLI compatibility.
