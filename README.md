# Commons OS

**The forkable operating system for living systems.**

Commons OS is a framework, pattern library, and agent architecture for organisations, cities, and ecosystems. It provides the structural foundation for running any commons — from a neighbourhood initiative to a multinational enterprise — as a living system.

## What is this?

Commons OS is built on the **Orbital Architecture** (v8.2) with six layers from Singularity (Orbit 0) to Edge (Orbit 5), and four **Universal Dimensions** that govern every living system:

| Dimension | Paired Name | What it governs |
|---|---|---|
| D1 | Definition & Purpose | Direction, architecture, governance, impact |
| D2 | Participation & Relationship | Community, stakeholders, workforce |
| D3 | Proposition & Exchange | What we offer, value exchange, go-to-market |
| D4 | Production & Resilience | Infrastructure, production lines, delivery |

Every Commons OS instance ships with a **four-agent board** — Purpose, Participation, Proposition, Production — that can be operated by humans, AI agents, or both.

## How to use

### 1. Create your instance

Choose the path that fits your needs:

| Path | Visibility | How | Best for |
|---|---|---|---|
| **Fork** | Public | Click "Fork" on GitHub | Open communities, cities, public initiatives |
| **Template** | Public or Private | Click "Use this template" on GitHub | Companies, personal commons, private instances |

> **Rule of thumb:** If your instance should be private, use "Use this template" — GitHub doesn't allow private forks of public repos.

### 2. Name it

Follow the convention: `[purpose]-os`

- `luebeck-os` — a city commons
- `draeger-os` — an enterprise commons
- `me-os` — a personal commons

### 3. Boot it

Open your instance in Claude Code and say **"Boot this instance"**. The Purpose Agent will walk you through setup — see `BOOT.md` for details.

Or manually: copy `CLAUDE.md.template` to `CLAUDE.md` and fill in your identity.

### 4. Run it

The `CLAUDE.md` makes the Purpose Agent immediately operational. Start with Definition & Purpose (D1) — the agent will guide you through building your commons.

## What's included

| Folder | Contents |
|---|---|
| `_manifests/` | Governance documents — agent architecture, body of knowledge, taxonomy |
| `_specifications/` | Technical specs — pattern format, lighthouse format, MCP architecture |
| `_patterns/_core/` | 26 core patterns that define the four dimensions |
| `_templates/` | Templates for creating patterns and lighthouses |
| `_local/` | Your sovereign space — upstream never touches this folder |

## What's NOT included (by design)

The full pattern library (54,000+ patterns across Life, Business, Urban, and Ecology) and lighthouse intelligence are delivered via **MCP (Model Context Protocol)**, not bundled in this repo. This keeps the OS lean and the intelligence live.

## Receiving updates

When Commons Engineering publishes improvements to specs, manifests, or core patterns, your instance can receive them:

| Instance type | How updates arrive |
|---|---|
| **Fork** | Automatic PRs via GitHub Action (weekly) — review and merge |
| **Template copy** | Add upstream remote manually, then pull when ready |

For template copies, the Purpose Agent will set up upstream tracking during boot:

```bash
git remote add upstream https://github.com/Commons-Engineering/commons-os.git
git fetch upstream
```

In both cases: **your `_local/` folder and `CLAUDE.md` are never touched** — sovereignty by convention.

## Architecture

For the full architecture, see:

- `_manifests/COMMONS_OS_MANIFEST` — the operating system design
- `_manifests/COMMONS_AGENT_MANIFEST.md` — the four-agent board
- `_manifests/COMMONS_ENGINEERING_ARCHITECTURE.md` — the system architecture
- `_specifications/COMMONS_MCP_ARCHITECTURE_SPEC.md` — how intelligence flows

## Community

Commons OS is maintained by [Commons Engineering](https://github.com/Commons-Engineering) and stewarded by [cloudsters](https://cloudsters.de).

## License

Content: CC-BY-SA 4.0 | Code: MIT (see LICENSE)
