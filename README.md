# Commons OS

**The forkable operating system for living systems.**

Commons OS is a complete operating environment for any commons — an organisation, a city district, a personal system, an ecological watershed, or any community that chooses to govern itself as a living system.

## What You Get When You Fork

| Component | What it does |
|---|---|
| **Registry** | Your workspace — journeys, touchpoints, value streams, capabilities, entities |
| **Knowledge** | Commons patterns (152+), manifests, specifications, templates — with upstream sync. Extensions from any provider. Instance patterns of your own |
| **Portals** | Intranet and extranet configuration for static site generation |
| **Workshop** | Your forge — experiments, drafts, work in progress |
| **Agent Configuration** | AI-ready governance with 4-agent board architecture |
| **Living Blueprint** | Single-document, 9-layer architecture for your commons |
| **MCP Connections** | Shared intelligence (Commons MCP) + local knowledge (Blueprint MCP) + your systems (Fabric MCPs) |

## Quick Start

1. **Fork** this repository
2. **Rename** to `[your-commons]-os` (e.g., `luebeck-os`, `my-life`, `acme-commons`)
3. **Edit** `.commons/identity.yml` — set your slug, purpose, domain, and locale
4. **Copy** `AGENT.md.template` to `AGENT.md` (this is the OS-standard AI configuration)
5. **Read** `BOOT.md` — the agent guides you through the rest

## Architecture

Commons OS implements four Universal Dimensions:

| Dimension | Overlay Name | What it governs |
|---|---|---|
| D1 | Definition & Purpose | Direction, governance, impact, architectural integrity |
| D2 | Participation & Relationship | Community, stakeholders, workforce, non-human participants |
| D3 | Proposition & Exchange | Value creation, products, services, knowledge exchange |
| D4 | Production & Resilience | Infrastructure, production lines, delivery, economics |

Each dimension has an **agent** (conversational governance) and may have **engines** (production at volume, supervised by D4).

## Directory Structure

```
[commons]-os/
├── AGENT.md.template          Agent configuration (copy to AGENT.md)
├── BOOT.md                    Boot guide
├── ALIGN.md                   Alignment check rules
├── blueprint.md               Living Blueprint (L1-L9)
├── .commons/                  Identity and configuration
├── registry/                  THE WORKSPACE — local instances & state
├── knowledge/                 THE LIBRARY — commons (upstream) + extensions (packs) + instance (yours)
├── portals/                   Portal configuration & themes
└── workshop/                  THE FORGE — experiments, drafts, WIP
```

## Commons / Extensions / Instance

Every `knowledge/` subdirectory (patterns, specs, manifests, templates, scripts) uses three layers:

| Layer | Path | Who owns it | Sync behaviour |
|---|---|---|---|
| **Commons** | `knowledge/*/commons/` | Upstream (commons-os template) | Read-only in forks, updated via upstream sync |
| **Extensions** | `knowledge/*/extensions/{provider}/{pack}/` | Pack providers (any Commons Incubator) | Loaded via Commons MCP, cached locally |
| **Instance** | `knowledge/*/instance/` | Your commons | Yours entirely — upstream never touches it |

`registry/` and `workshop/` are always instance-level — they contain your operational data and work in progress.

## Documentation

| Document | What it covers |
|---|---|
| `knowledge/manifests/commons/COMMONS_OS_MANIFEST.md` | What Commons OS is — vision, principles, architecture |
| `knowledge/specs/commons/COMMONS_OS_SPEC.md` | How to build, fork, boot, and operate a Commons OS instance |
| `knowledge/manifests/commons/COMMONS_AGENT_MANIFEST.md` | The 4-agent governance model |
| `knowledge/specs/commons/COMMONS_MCP_ARCHITECTURE_SPEC.md` | The 3-MCP channel architecture |

## License

Content (manifests, specifications, patterns): [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
Code (scripts, workflows, templates): [MIT](https://opensource.org/licenses/MIT)

See [LICENSE](LICENSE) for details.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to contribute patterns, improvements, and fixes back upstream.

---

*Commons OS is developed by [Commons Engineering](https://commons.engineering) and operated by [cloudsters](https://cloudsters.net).*

*Commons Engineering is licensed under CC-BY-SA-4.0 — Distributed by cloudsters*
