# Superpowers for Droid CLI

Framework disiplin pengembangan untuk AI coding assistant, dioptimasi untuk [Droid CLI](https://docs.factory.ai).

## Tentang Versi Ini

Repo ini adalah **versi modifikasi** dari [obra/superpowers](https://github.com/obra/superpowers) dengan pendekatan berbeda:

**Perbedaan utama dengan superpowers original:**

| Aspek | Original (obra/superpowers) | Versi Ini |
|-------|----------------------------|-----------|
| **Eksekutor** | `general-purpose` agent untuk semua task | **Specialist droids** sesuai domain task |
| **Routing** | Satu agent mengerjakan semua | Task di-route ke droid yang tepat (frontend-developer, python-pro, dll) |
| **Jumlah Droids** | 100+ droids (banyak redundan) | Droids yang ter-kurasi dan fokus |
| **Aktivasi** | Otomatis via AGENTS.md | **Manual via slash command** (lebih fleksibel) |

**Keunggulan pendekatan specialist droids:**
- Setiap task dikerjakan oleh droid dengan expertise yang sesuai
- Hasil lebih berkualitas karena droid fokus pada domain spesifiknya
- Routing table memastikan task selalu ke droid yang tepat

## Struktur

```
├── skills/      # Workflow protocols
├── droids/      # Specialist agents
└── commands/    # Slash commands
```

### Skills (Workflows)

| Skill | Fungsi |
|-------|--------|
| `using-superpowers` | Core protocol - wajib di awal sesi |
| `brainstorming` | Merancang fitur sebelum coding |
| `writing-plans` | Membuat implementation plan detail |
| `subagent-driven-development` | Eksekusi dengan dispatch specialist droids |
| `executing-plans` | Eksekusi plan di sesi terpisah |
| `test-driven-development` | TDD: RED → GREEN → REFACTOR |
| `systematic-debugging` | 4-fase debugging sistematis |
| `verification-before-completion` | Verifikasi sebelum klaim selesai |
| `requesting-code-review` | Meminta code review |
| `receiving-code-review` | Merespons feedback review |
| `dispatching-parallel-agents` | Dispatch multiple agents paralel |
| `ui-ux-pro-max` | UI/UX design dengan 50 styles |

### Droids (Specialists)

**Language Specialists:** python-pro, javascript-pro, typescript-pro, golang-pro, rust-pro, java-pro, php-pro, ruby-pro, elixir-pro, scala-pro, csharp-pro, cpp-specialist, sql-pro

**Domain Specialists:** frontend-developer, backend-specialist, database-specialist, security-specialist, devops-specialist, kubernetes-architect, observability-engineer, network-engineer, flutter-expert, wordpress-developer

**Quality & Review:** code-reviewer, test-automator, debugger, architect-review, ui-visual-validator

**AI & Data:** ai-engineer, prompt-engineer, mlops-engineer, data-specialist, context-manager

**Business & Docs:** business-analyst, documentation-specialist, seo-specialist, search-specialist

**Others:** orchestrator, general-purpose, legacy-modernizer, payment-integration, blockchain-developer, mermaid-expert, ui-ux-designer, dx-optimizer, incident-responder, hybrid-cloud-architect

## Workflow Utama

```
brainstorming → writing-plans → [choice] → specialist droids implement → verification → code-review
```

1. **brainstorming**: Tanya jawab untuk memahami requirement
2. **writing-plans**: Pecah design menjadi task-task detail
3. **[choice]**: Pilih eksekusi (subagent-driven atau executing-plans)
4. **specialist droids**: Task di-route ke droid yang sesuai
5. **verification**: Verifikasi semua berjalan
6. **code-review**: Review oleh code-reviewer droid

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

# Copy ke ~/.factory/
cp -r superpowers-for-my-own-workflow/skills/* ~/.factory/skills/
cp -r superpowers-for-my-own-workflow/droids/* ~/.factory/droids/
cp -r superpowers-for-my-own-workflow/commands/* ~/.factory/commands/
```

## Penggunaan

Versi ini menggunakan **custom slash commands** dengan support argument. Aktivasi manual untuk fleksibilitas.

### Slash Commands

| Command | Fungsi |
|---------|--------|
| `/superpowers` | Aktivasi full workflow (brainstorming → planning → execution) |
| `/brainstorm <deskripsi>` | Langsung brainstorming fitur tanpa full workflow |
| `/debug` | Aktivasi systematic debugging |
| `/review` | Request code review |
| `/writing-plans` | Buat implementation plan |

### Contoh Penggunaan

**Full workflow dengan superpowers:**
```
/superpowers
```

**Langsung brainstorming tanpa full workflow:**
```
/brainstorm aku ingin menambah fitur dark mode pada aplikasi
```

**Debugging:**
```
/debug ada error pada fungsi login
```

## Credits

Based on [obra/superpowers](https://github.com/obra/superpowers), modified with specialist droid approach for better task execution quality.
