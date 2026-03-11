# Boot Sequence — Commons OS Instance Setup

**Run this once after creating your instance.** The Purpose Agent will guide you through setup. Nothing is executed until you approve the plan.

### How did you get here?

| Method | Visibility | Upstream sync |
|---|---|---|
| **Fork** (click "Fork" on GitHub) | Always public | Automatic PRs via GitHub Action |
| **Template** (click "Use this template") | Public or private | Manual — agent sets up upstream remote during boot |

> **Private instances** (companies, personal commons): use "Use this template" — GitHub doesn't allow private forks of public repos.

To start: open this repo in Claude Code and say **"Boot this instance"**.

---

## Phase 1: Identity (conversation)

The Purpose Agent will ask you:

1. **What is this commons called?** → Instance name (e.g. "Lübeck OS")
2. **What is its purpose?** → One sentence that defines why this commons exists
3. **What domain scale?** → Life (organism) | Business (enterprise) | Urban (settlement) | Ecology (biosphere)
4. **What language does this instance operate in?** → The agent will use this language for all local content (issues, lighthouses, conversations). Framework specs and manifests stay in English.
5. **Who is the steward?** → Organisation or person responsible
6. **Who is the founder?** → The human with ultimate authority on the board
7. **Where is it located?** → City, region, country (if relevant)
8. **Who are the first stakeholders?** → People, organisations, or communities this commons serves
9. **What are the first lighthouse accounts?** → Organisations or entities to study and engage with
10. **What existing tools and systems does this instance connect to?** → Notion, Slack, CRM, databases, etc.
11. **What is the first milestone?** → What does "running" look like in 4 weeks?

## Phase 2: Plan (agent builds, founder approves)

Based on your answers, the Purpose Agent will generate a **boot plan** covering:

### Instance Configuration
- [ ] Generate `CLAUDE.md` from template with your identity
- [ ] Configure `_local/` structure for your domain

### GitHub Repo Settings
- [ ] Enable Issues (required for board and tracking)
- [ ] Enable Projects (required for board)
- [ ] Disable Wikis (not needed — docs live in the repo)
- [ ] Configure upstream remote for sync (especially for template copies — forks have this automatically)

### GitHub Project Setup
- [ ] Create project board with columns: Backlog | In Progress | Review | Done
- [ ] Create dimension labels: `definition`, `participation`, `proposition`, `production`
- [ ] Create type labels: `decision`, `build`, `spec`, `deliberation`
- [ ] Create priority labels: `critical`, `high`, `normal`
- [ ] Create issue templates for your domain

### Founding Issues
- [ ] D1: Define instance purpose, boundaries, and governance model
- [ ] D1: Create first milestone with success criteria
- [ ] D2: Map initial stakeholders and participants
- [ ] D2: Define community engagement approach
- [ ] D3: Identify first lighthouse accounts
- [ ] D3: Create lighthouse briefings for top 3 accounts
- [ ] D4: Set up MCP connections (Commons MCP, local tools)
- [ ] D4: Configure CI/CD and deployment (if applicable)

### MCP Wiring
- [ ] Connect Commons MCP (shared pattern intelligence)
- [ ] Connect platform MCP (cloudsters services, if applicable)
- [ ] Configure local MCPs based on tools identified in Phase 1

### First Content
- [ ] Create instance lighthouse (the commons itself as a lighthouse)
- [ ] Pull relevant patterns from Commons MCP for the instance's domain
- [ ] Create first local patterns based on stakeholder needs

## Phase 3: Execute (with approval)

The Purpose Agent presents the complete boot plan. The founder reviews and approves. Only then does the agent execute:

1. Write `CLAUDE.md`
2. Create board, labels, and issues
3. Configure MCP settings
4. Create initial content
5. Commit everything with message: "Boot: [Instance Name] — first breath"

## Phase 4: Verify

After execution, the Purpose Agent confirms:

- [ ] `CLAUDE.md` exists and reflects the instance identity
- [ ] Project board is live with correct columns and labels
- [ ] Founding issues are created across all four dimensions
- [ ] MCP connections are configured (even if servers aren't live yet)
- [ ] First lighthouse exists
- [ ] The instance is ready for its first working session

---

## After Boot

The instance is alive. The Purpose Agent knows who it serves and what it's building toward. Future sessions start from `CLAUDE.md` — the boot sequence doesn't need to run again.

To update the instance later, just edit `CLAUDE.md` directly or ask the Purpose Agent to evolve it as the commons grows.
