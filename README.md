# Commons OS

**Commons as Code — the forkable operating system for living systems.**

Commons OS provides everything you need to operate a commons — from a personal growth system to a neighbourhood initiative to a multinational enterprise. Fork it. Boot it. Run it.

## What is this?

An operating system for **commons-based organisation**, built on four Universal Dimensions:

| Dimension | What it governs |
|---|---|
| **D1 — Definition & Purpose** | Direction, architecture, governance, impact |
| **D2 — Participation & Relationship** | Community, stakeholders, workforce |
| **D3 — Proposition & Exchange** | Value creation, value exchange |
| **D4 — Production & Resilience** | Infrastructure, production, delivery |

Every instance ships with a **four-agent board** — Purpose, Participation, Proposition, Production — that operates as a team of humans and AI agents from day one.

## Quick Start

### 1. Create your instance

Click **"Use this template"** on GitHub → name it `[purpose]-os` → choose **Private**.

### 2. Set up the workspace

```bash
cd [purpose]-os
chmod +x .commons/setup.sh
.commons/setup.sh
```

This creates labels, project board, milestones, and upstream remote.

### 3. Boot it

Open your instance in an AI agent (Claude Code, Cursor, or any MCP-capable tool) and say:

> **"Boot this instance"**

The agent guides you through 10 phases — from identity to operating commons. See `BOOT.md` for details.

## What's included

| Folder | What it is |
|---|---|
| `AGENT.md` | Agent-neutral AI configuration |
| `ALIGN.md` | Alignment service check |
| `.commons/` | Identity, config, setup script |
| `blueprint/` | Living Blueprint — L1 to L9 layers |
| `inventory/` | Entities, relationships, communities |
| `valuestreams/` | Organised by the four dimensions |
| `collections/` | Three core pattern collections |
| `templates/` | Blueprint templates (me-os + commons-os) |
| `operations/` | Rhythms and economic model |
| `site/` | Intranet + extranet (GitHub Pages ready) |
| `.github/` | Issue templates, workflows, improvement loop |

## What's NOT included (by design)

The full pattern library (100,000+ patterns) and lighthouse intelligence are delivered via **MCP** (Model Context Protocol), not bundled here. This keeps the OS lean and the intelligence live.

## Human-Agent Teams

From the moment of fork, you operate with a full board:

```
Solo founder  →  1 human + 4 agents  =  operating team of 5
Growing       →  N humans + 4 agents + specialised agents
Mature        →  many humans + many agents = the commons as organism
```

The **issue board** is the primary alignment surface. Both humans and agents see the same priorities. If it's not on the board, it doesn't exist.

## Self-Improvement

Enable the improvement loop (`.github/workflows/improvement-loop.yml`) to get structured improvement proposals on your board automatically. SENSE → ASSESS → PROPOSE → REVIEW → ACT → LEARN.

## Receiving Updates

| Method | How updates arrive |
|---|---|
| **Template copy** | Upstream remote configured during boot — pull when ready |
| **Fork** | Automatic PRs via GitHub Action (weekly) — review and merge |

Your `.commons/`, `blueprint/`, `inventory/`, and `AGENT.md` are **never touched** by upstream — sovereignty by convention.

## Architecture

- [Commons OS Manifest](https://github.com/commons-engineering/workshop) — what IS a commons OS
- [Commons OS Spec](https://github.com/commons-engineering/workshop) — how to BUILD a commons OS
- [Commons MCP Architecture](https://github.com/commons-engineering/workshop) — the knowledge service

## Community

Commons OS is maintained by [Commons Engineering](https://github.com/Commons-Engineering) and stewarded by [cloudsters](https://cloudsters.de).

## License

Content: CC-BY-SA 4.0 | Code: MIT — see [LICENSE](LICENSE)
