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

### Fork it

```bash
# Fork this repo into your organisation
# Then clone your fork
git clone https://github.com/your-org/your-instance-os.git
cd your-instance-os

# Copy the template and fill in your identity
cp CLAUDE.md.template CLAUDE.md
# Edit CLAUDE.md with your instance's purpose, domain, and conventions
```

### Name it

Follow the convention: `[purpose]-os`

- `luebeck-os` — a city commons
- `draeger-os` — an enterprise commons
- `me-os` — a personal commons

### Run it

Open your fork in Claude Code (or any AI coding tool). The `CLAUDE.md` makes the Purpose Agent immediately operational. Start with Definition & Purpose (D1) — the agent will guide you through setting up your commons.

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

When Commons Engineering publishes improvements to specs, manifests, or core patterns, your fork can receive them:

1. **Automatic PRs** — a GitHub Action creates pull requests from upstream
2. **You decide** — review, merge what fits, reject what doesn't
3. **Your `_local/` folder is never touched** — sovereignty by convention

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
