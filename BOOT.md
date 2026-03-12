# Boot Sequence — Commons OS

**Run this once after creating your instance.** The agent will guide you through setup.

## How did you get here?

| Method | Visibility | Upstream sync |
|---|---|---|
| **Template** (recommended) | Private or public — your choice | Agent sets up upstream remote during boot |
| **Fork** | Always public | Automatic PRs via GitHub Action (weekly) |

> **Private-first:** A commons workspace is intimate. Use "Use this template" for private repos. The extranet publishes what you choose; the workspace stays private.

## Before You Start

1. Run the setup script: `.commons/setup.sh` (creates labels, board, milestones)
2. Open the repo in your AI agent (Claude Code, Cursor, or any MCP-capable tool)
3. Say: **"Boot this instance"**

## The 10 Boot Phases

| Phase | What happens | Agent's role | Your role |
|---|---|---|---|
| **1. Fork** | Create from template → `[purpose]-os` | Detects fresh fork, offers guided onboarding | Name the commons |
| **2. Identity** | Fill `.commons/identity.yml` — **locale first** | First question: "In welcher Sprache arbeitest du?" / "What language do you work in?" | Set the language, then define what this commons IS |
| **3. Purpose** | Write `blueprint/L1-identity-purpose.md` | Suggests patterns, probes for clarity | Write the purpose statement |
| **4. Design** | Write `blueprint/L2-design-specification.md` | Maps stakeholders, suggests value stream families | Identify who participates, what the commons produces |
| **5. Governance** | Write `blueprint/L3-governance.md` | Offers governance patterns, suggests rhythms | Decide how decisions are made |
| **6. Publish** | Enable intranet + extranet, link domain | Runs CI workflow, verifies deployment | Link custom domain (optional) |
| **7. Self-Lighthouse** | Create the self-lighthouse in `inventory/entities/` | Guides through lighthouse spec for the commons itself | Describe the commons as its first entity |
| **8. Living Blueprint** | Create the first Living Blueprint using L1-L9 | Walks through layers, applies patterns | Write the Near Future timeslice |
| **9. Seed** | First external entities in `inventory/entities/` | Guides through lighthouse spec for external entities | Describe stakeholders, partners, neighbours |
| **10. Operate** | Regular rhythms, issue tracker active | Monitors, suggests, alerts | Run the commons |

## After Boot

The commons is alive. The agent knows who it serves and what it's building toward. Future sessions start from `AGENT.md` — the boot sequence doesn't need to run again.

The improvement loop (`.github/workflows/improvement-loop.yml`) can be enabled to propose structured improvements on the issue board automatically.
