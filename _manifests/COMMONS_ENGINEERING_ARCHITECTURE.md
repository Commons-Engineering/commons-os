# Commons Engineering — Platform Architecture

**Version:** 1.1
**Date:** March 2026
**Status:** Living Document — Subject to Eternal Iteration
**Authors:** Holger Eggerichs, Claude (AI Thought Partner)
**Supersedes:** Commons-OS `AGENT_BOOT.md`, `docs/adr/0003`, `docs/adr/0004`

---

## 0. Agent Session Boot Protocol

*This section exists to solve the context-continuity problem for AI-driven development. If you are Claude beginning a Cowork session, read this section first — then read the rest of the document before taking any action.*

**You are working on Commons Engineering** — a platform and knowledge infrastructure for designing resilient, vital, collaborative living systems. The platform serves practitioners (Cognitive Systems Builders) across four domains: Life, Business, Urban, and Ecology.

**Before doing anything:**
1. Read this entire document
2. Read the session summary provided by Holger (or check the previous session summary file if available)
3. For the full BoK map: read `COMMONS_ENGINEERING_BOK.md` (the canonical index — start here if orientation is needed)
4. For pattern pipeline work: read `PATTERN_PIPELINE_SPEC.md`
5. For pattern spec questions: read `PATTERN_SPEC.md` (v8.2, the Orbital Edition)
6. For taxonomic architecture: read `COMMONS_TAXONOMY_MANIFEST.md` (the gravitational model)
7. Check `_secrets/github_token.txt` if GitHub read-access is needed

**Hard constraints to remember:**
- The Cowork VM proxy blocks `api.github.com` and `github.com:443` — Claude cannot push to GitHub directly. All git commits and pushes are done by Holger from his local terminal. Claude prepares files and commit messages; Holger executes the push.
- All Claude-generated files go to the mounted workspace folder. Holger's machine sees them immediately.
- The Anthropic API key for pattern enrichment is in `Urban Engineering Key.txt` — this is the `ANTHROPIC_API_KEY` used by enrichment scripts, not a GitHub token.
- Every significant architectural decision becomes an ADR (see §8). Do not make major structural changes without proposing them first.

**The working model in one sentence:** Claude builds and drafts; Holger decides, approves, and commits.

---

## 1. What Commons Engineering Is

*(Full detail in the manifests — read `COMMONS_ENGINEERING_MANIFEST.md`, `COMMONS_BLUEPRINT_MANIFEST.md`, and domain manifests for depth)*

Commons Engineering is a discipline for designing living systems — individuals, organisations, cities, ecosystems — toward vitality rather than extraction. It provides:

- **A design language**: the Commons Blueprint, a 9-layer temporal architecture (Anatomy L1–L6 + Physiology L7–L9)
- **A knowledge commons**: the pattern library, organised by domain scale and orbital layer (the gravitational Orbital Model — see `COMMONS_TAXONOMY_MANIFEST.md`)
- **A qualification process**: patterns enter at the outer edge (specific, contextual) and move inward as evidence of universality accumulates
- **Four operational engines**: Context, Pattern, Lighthouse, Community
- **A delivery model**: three deployment modes — Open Web, Ambience Stack, Sovereign Stack
- **A practitioner system**: the 7Cs arc (Clarity → Credibility → Capital → Character → Collaboration → Community → Commons)
- **A deployment network**: Commons Incubator Network — independent actors who deploy patterns and return learning

**The four Commons domain scales:** Life Engineering (organism scale), Business Engineering (enterprise scale), Urban Engineering (settlement scale), Ecology Engineering (biosphere scale). Plus: Emerging Commons (temporary edge frontier for patterns without existing governance frameworks).

---

## 2. The Four Engines

### 2.1 Pattern Engine
*Primary repo: `pattern-engine` (public)*

Maps, qualifies, and connects every pattern of human practice across commons domain scales. Operates the gravitational qualification process: centripetal force (Orbit 0) pulls patterns inward toward universality; centrifugal force (Orbits 4–5) pulls toward specialisation and extraction. Raw patterns enter at the Edge (Orbit 5), qualify into Domain patterns (Orbit 4), and move inward as evidence of universality accumulates. GraphRAG (Microsoft, Azure OpenAI) infers relationships across domains, revealing cross-domain geometry invisible to manual curation — essential for discovering Bridge patterns (Orbit 3) and polycentric structure.

Three growth mechanisms: **curation** (importing and translating external patterns), **creation** (generating new IP-free patterns), **mutation** (updating patterns as contexts shift).

**Current state — February 2026:**

| Domain | Status | Patterns | .md files |
|---|---|---|---|
| Urban Engineering | Wave 1 complete | 11,564 | 13,019 |
| Life Engineering | Partial | TBD | TBD |
| Business Engineering | Decision pending (migrate vs. rebuild) | — | — |
| Ecology Engineering | Not started — taxonomy needed first | — | — |
| Emerging Commons | Not started | — | — |

### 2.2 Context Engine
*Primary repo: `context-engine` (public / mixed visibility)*

Reads living systems before design begins. Produces:
- **Briefings**: baseline specifications capturing purpose, stakeholder architecture, value flows, capabilities, and forcing functions
- **Living Blueprints**: continuously updated system models connected to sensing layers

Carries the technical implementation of two delivery modes:
- **Sovereign Stack**: pattern infrastructure integrated into an organisation's own systems — the tools, templates, and processes for running Commons Engineering on private infrastructure
- **Ambience Stack**: patterns injected into existing workflows and tools (Notion, SharePoint, Teams, project management systems) without requiring the organisation to change platforms

The Context Engine is the most technically complex of the four engines because it must bridge the open commons with the specific, private contexts of client organisations.

### 2.3 Lighthouse Engine
*Primary repo: `lighthouse-engine` (public)*

Discovers, documents, and builds vital systems that embody Commons Engineering principles. Three operational modes:
- **Discovery**: unilateral documentation of vital systems from the outside
- **Engagement**: co-created documentation with system stakeholders
- **Partnership**: the lighthouse becomes a co-generating node in the pattern library — contributing new patterns from its lived experience

Scale note: a fully documented lighthouse uses the Commons Blueprint across 9 layers and 4 timeslices. This produces a large document corpus per organisation. The Lighthouse Engine may ultimately contain more content than the Pattern Engine. Plan storage and build architecture accordingly.

Network topology mirrors the pattern library: new lighthouses have many outgoing links (implementing existing patterns), few incoming; mature lighthouses acquire high in-degree as others reference them.

### 2.4 Community Engine
*Primary repo: `community-engine` (visibility TBD — placeholder)*

Builds and sustains the practitioner community of Cognitive Systems Builders. Five engagement levels (nested, not hierarchical): Explore → Join → Learn → Build → Teach.

Practitioner development follows the 7Cs arc. The curriculum (Journey & Mission Curricula) consists of structured learning pathways built on curated pattern collections, delivered via M365/SharePoint for organisational clients and via the Open Web for individual practitioners.

**Status:** scope and technical implementation to be defined as the community grows. Create the repo as a placeholder; do not over-engineer before the community shape is known.

---

## 3. Repository Architecture

**GitHub Organisation:** `commons.engineering` (new — blank as of February 2026)

Separate repos per engine, by design. This enables independent access control, different audience permissions, independent Cloudflare Pages deployments, and independent development cadence per engine.

| Repo | Visibility | Purpose |
|---|---|---|
| `commons.engineering` | Public | Main Hugo site — hub, navigation, cross-engine landing pages |
| `pattern-engine` | Public | Pattern library — all domains, scripts, taxonomy xlsx, specs |
| `lighthouse-engine` | Public | Lighthouse documentation — organisations and cities |
| `context-engine` | Public / Mixed | Context Engine tools, Sovereign Stack, Ambience Stack delivery |
| `community-engine` | TBD | Practitioner community, curricula, journey maps |
| `sovereign-stack` | Private | Self-hosted deployment package for organisational clients |

### 3.1 pattern-engine folder structure

```
pattern-engine/
├── _patterns/
│   ├── _core/          Orbits 0–2: Singularity, Principle, Commons
│   ├── urban/          Urban Engineering — Orbit 3–5 patterns (~14,500+)
│   ├── life/           Life Engineering (~2,050)
│   ├── ecology/        Ecology Engineering
│   ├── business/       Business Engineering (~9,400+)
│   └── _emerge/        Orbit 5 — Emerging Commons, unvalidated edge
├── _scripts/           Generation, enrichment, migration, validation scripts
├── taxonomies/         Domain taxonomy xlsx files
└── specs/              PATTERN_SPEC_V8.md, PATTERN_PIPELINE_SPEC.md
```

### 3.2 commons.engineering (site) folder structure

```
commons.engineering/
├── content/            Hugo content — one section per engine
├── themes/             Hugo theme
├── static/             Static assets
├── config.toml         Hugo configuration
└── docs/
    └── adr/            Architecture Decision Records (see §8)
```

### 3.3 _secrets/ (workspace only — never committed)

```
_secrets/
├── github_token.txt    Fine-grained GitHub PAT (read access) — for Claude browser operations
```

---

## 4. Tech Stack

### Static Site Generator: Hugo
Replaces Jekyll (see ADR-0006). Hugo is compiled Go — builds 100K+ pages in under 60 seconds. Jekyll at this scale produces 30–60 minute builds. Hugo reads YAML frontmatter natively, exposing all Pattern Spec v8.2 Group 0–7 fields directly in templates. Built-in taxonomies handle `orbital_layer`, `sector`, and `domain` as first-class dimensions.

Migration effort: existing Jekyll Markdown + frontmatter converts almost directly. Liquid templates → Go templates is the main rewrite.

### Hosting: Cloudflare Pages
Replaces GitHub Pages (see ADR-0006). One Cloudflare Pages project per engine repo, deployed to subdomains:
- `commons.engineering` → main hub site
- `patterns.commons.engineering` → Pattern Engine
- `lighthouses.commons.engineering` → Lighthouse Engine
- (additional engines as they develop)

**Cloudflare tier guidance:** Free zone plan is sufficient for a static read-only site. Workers & Pages paid tier ($5/month) removes the 100,000-file-per-deployment cap — required once any single engine's build output exceeds 100K files.

### Search: Pagefind
Replaces Fuse.js (see ADR-0007). Pagefind indexes the rendered static HTML at build time — not just titles and summaries but full body text. Runs entirely client-side. Scales to 100K+ pages without bundle size problems. Supports multi-index federation across engine subdomains.

**Critical build requirement:** Hugo templates must inject frontmatter fields as indexable HTML so Pagefind and search engines see them. Fields that must be surfaced:

| Frontmatter field | How to surface |
|---|---|
| `summary` | Visible lead paragraph + `<meta name="description">` |
| `aliases` | `<div data-pagefind-meta="aliases">` (hidden, indexed) |
| `context_labels` | `<div data-pagefind-meta="context">` (hidden, indexed) — powers the Navigator Engine |
| `vector_keywords` | `<meta name="keywords">` + Pagefind meta |
| `primary_tension` | Visible as Problem section subheading |
| `title` | `<title>` and `<h1>` |

The `context_labels` field is the Navigator Engine: a corporate user searches "Open Book Management" and finds "Transparent Ledger." If these labels are not indexed, the Navigator Engine does not work.

### Intelligence Layer: Azure OpenAI + GraphRAG
Microsoft's GraphRAG library for entity/relationship/community inference across the pattern corpus. Uses Azure OpenAI for LLM and embedding calls. Output (entity graph, relationship graph, community reports, inferred links) stored in `sovereign-stack` (private). Results flow back into pattern frontmatter `graph_garden` section.

GraphRAG strategy for the polycentric model:
- **Domain-level passes**: run GraphRAG per domain folder → domain-specific graph intelligence
- **Cross-domain synthesis pass**: run over all domains → surfaces universal patterns and cross-domain geometry, revealing candidates for Orbit 1 (Principle) and Orbit 2 (Commons) promotion, and discovering new Orbit 3 (Bridge) patterns
- Treat Phase D as a periodic synthesis step (after each wave), not a once-and-done operation

### Pattern Generation & Enrichment: Anthropic API (Claude Haiku)
All pattern generation and body enrichment uses `claude-haiku-4-5-20251001`. Key parameters: `MAX_TOKENS=8192`, `CONCURRENCY=25`. Full pipeline documentation in `PATTERN_PIPELINE_SPEC.md`.

### Organisational Integrations
- **M365 / SharePoint**: Journey & Mission Curricula for enterprise and community delivery — curated pattern collections as structured learning pathways
- **Notion**: Role in architecture TBD — candidate for editorial workflow, Ambience Stack target, or internal knowledge management
- **GitHub Actions**: CI/CD for all repos — validation, build triggers, Cloudflare Pages deploys

---

## 5. AI-Driven Development Model

Commons Engineering is built by a very small core team, with Claude (via Anthropic Cowork) as the primary builder. This is a deliberate architectural choice, not a temporary workaround. The platform is designed to be AI-generatable, AI-maintainable, and AI-navigable — while human judgment remains the quality gate and decision authority.

### 5.1 Why Previous Agent Context Approaches Failed

The `AGENT_BOOT.md` file in Commons-OS and the ADRs in `docs/adr/` were the right instinct and the wrong implementation. Two failure modes:

1. **Agents don't read files they aren't told to read.** A file in a repo an agent *might* discover is not the same as context the agent *has*. There is no ambient awareness between sessions.
2. **Session context resets completely.** Every Cowork session starts from zero. Previous work survives only in files (if Claude wrote them to the workspace) and in the session summary (if one was generated). An agent that isn't given explicit context at session start has no continuity with what came before.

This document is the solution: a structured, explicit context file that Holger references at session start and that Claude reads in full before doing anything.

### 5.2 Session Boot Protocol (detailed)

**At the start of every Cowork session, in order:**

1. Holger provides the session summary from the previous session (or paste the summary from the session summary file)
2. Claude reads `COMMONS_ENGINEERING_ARCHITECTURE.md` (this document) in full
3. Claude reads the domain-specific spec for the work at hand (`PATTERN_PIPELINE_SPEC.md`, engine spec, etc.)
4. Claude confirms understanding of current state and pending tasks before proceeding

**At the end of every significant Cowork session:**

Claude generates a session summary capturing:
- Work completed (files changed, scripts run, decisions made)
- Current state (pipeline status, file counts, pending issues)
- Next steps (the exact next action to take)
- Any new lessons learned to add to specs

This summary is the primary continuity bridge between sessions. It replaces the AGENT_BOOT approach with a dynamic, always-current handoff document.

### 5.3 The Cowork Plugin Solution (recommended next step)

Create a custom Cowork plugin that automatically injects this architecture document into Claude's context at session start, without Holger having to manually reference it. This solves the boot problem at the infrastructure level. Use the `cowork-plugin-management:create-cowork-plugin` skill to implement this once the architecture spec has stabilised.

### 5.4 Division of Responsibility

**Claude's role:**
- Writes and modifies files in the mounted workspace folder
- Runs Python scripts (pattern generation, enrichment, migration, validation)
- Reads and analyses existing files and specifications
- Drafts architecture documents, specs, and ADRs for Holger's approval
- Browses GitHub via the browser tool (read operations)
- Prepares commit messages
- Proposes architectural decisions — does not implement without approval

**Holger's role:**
- Approves architectural decisions
- Commits and pushes to GitHub from local terminal
- Sets direction and priorities
- Quality gates on generated content

**What Claude cannot do from Cowork (network constraint):**
- Push to GitHub directly — the Cowork VM proxy blocks `api.github.com` and `github.com:443`
- This is a hard constraint, not a configuration problem. The correct workflow is: Claude writes → Holger pushes.

### 5.5 Living Specification Principle

Every specification is a living document subject to eternal iteration. The workflow for keeping specs current:

- **New lesson from pipeline run** → add to `PATTERN_PIPELINE_SPEC.md` §11 (Lessons Learned)
- **New architectural decision** → new ADR in `docs/adr/`
- **Breaking change to a script** → update script header comment + note in relevant spec
- **Change to this document** → update version date and add a brief changelog entry at the bottom

The spec is the memory of the platform. If it's not in a spec, it will be lost at the next session reset.

### 5.6 Agent-Readable Codebase Conventions

To make the codebase navigable by Claude at session start:

- Every script begins with a docstring describing its purpose, inputs, outputs, and key parameters
- Every spec has a clear table of contents with section numbers
- `PATTERN_PIPELINE_SPEC.md` §13 maintains a file inventory — update it when adding or renaming scripts
- ADRs are numbered sequentially and never deleted — superseded ones are marked, not removed
- The `_patterns/` subdirectory naming matches the `sector` field in frontmatter exactly: `urban/` → `sector: "Urban"`

---

## 6. Pattern Spec v8.2 — Key Points

*(Full specification in `PATTERN_SPEC.md` — the Orbital Edition. Taxonomic architecture in `COMMONS_TAXONOMY_MANIFEST.md`.)*

### The Orbital Model

Every pattern has an `orbital_layer` (0–5) and `gravitational_hubs`. Two opposing gravitational forces define the field: centripetal (Orbit 0 pulls inward toward unity) and centrifugal (Orbits 4–5 pull outward toward extraction and specialisation).

| Layer | Name | Character |
|---|---|---|
| 0 | Singularity | Infinite density. Centre of gravity. Creates the force. |
| 1 | Principle | First Principles & Practices. The bones. Forces the structure. <100 patterns. |
| 2 | Commons | The attractor state. Resilient, collaborative, systematic value creation. |
| 3 | Bridge | NEW universal cross-domain patterns. Knowledge, communication, governance. |
| 4 | Domain | Mechanical substrate. Dry, process-oriented operating patterns. Clean room generated. |
| 5 | Edge | Raw frontier. Unvalidated signals, historic substrate, emerging anomalies. |

**Anchor validation timing:** `gravitational_hubs` starts empty (`[]`) for all generated patterns. Hub references are validated only after GraphRAG has run and identified natural attractors. The validator runs in `--lenient` mode (warn only) during generation; `--strict` mode enforces hub references post-GraphRAG.

**Frontmatter groups:** Group 0 (Architectural Position) added in v8.0, orbit names updated in v8.2. All Urban Engineering Wave 1 patterns need Group 0 backfilled: `orbital_layer: 4`, `sector: "Urban"`, `gravitational_hubs: []`. This is a batch migration script task — ~10 minutes of execution.

---

## 7. Deployment Pipeline

Each engine repo has its own GitHub Actions workflow → Cloudflare Pages deployment:

```
git push (by Holger, local terminal)
    ↓
GitHub Actions: validate patterns + build Hugo
    ↓
Cloudflare Pages: deploy to subdomain
    ↓
Pagefind: index built HTML at deploy time
```

Cross-engine search works via Pagefind's multi-index federation: the main `commons.engineering` hub loads search indexes from each subdomain and federates results.

GraphRAG runs separately (Azure OpenAI, triggered manually or on schedule) and outputs JSON files committed to `sovereign-stack`. The pattern-engine build pulls these at build time to populate `graph_garden` fields in rendered pages.

---

## 8. Architecture Decision Records

ADRs live in `docs/adr/` in the `commons.engineering` site repo. Numbered sequentially, never deleted. Superseded ADRs are marked **Superseded by ADR-XXXX** — the record of why a decision was made is as valuable as the decision itself.

### ADRs carried forward from Commons-OS

| # | Decision | Status |
|---|---|---|
| 0001 | Use TypeID for entity identifiers | **Active** |
| 0002 | File-based architecture — markdown source of truth, derived JSON indexes | **Active** |
| 0003 | Multi-engine architecture (Pattern / Context / Lighthouse) | **Active — extended to 4 engines by ADR-0009** |
| 0004 | Jekyll + GitHub Pages | **Superseded by ADR-0006** |
| 0005 | Unified search with Fuse.js | **Superseded by ADR-0007** |

### New ADRs for Commons Engineering

| # | Decision | Rationale |
|---|---|---|
| 0006 | Hugo replaces Jekyll; Cloudflare Pages replaces GitHub Pages | Build time: Jekyll is 30–60 min at 100K pages; Hugo is under 60 sec. Cloudflare Pages gives independent deployment per engine with global CDN. |
| 0007 | Pagefind replaces Fuse.js | Fuse.js indexes only title + summary (client bundle grows with content). Pagefind indexes full rendered HTML at build time, scales to 100K+ pages, zero bundle size on load. |
| 0008 | Separate repos per engine (not monorepo) | Independent access control per engine, different audience visibility, independent deployment cadence, no cross-engine build coupling. |
| 0009 | Four-engine architecture adds Community Engine | Community Engine scope is still forming — created as placeholder repo; not over-engineered before community shape is known. |
| 0010 | Pattern Spec v8.0→v8.2 — Orbital Model | Adds Group 0 (orbital_layer, sector, gravitational_hubs) to encode the gravitational hierarchy as queryable frontmatter. v8.2 (March 2026) renames orbits: Principle, Commons, Bridge, Domain, Edge. Companion: COMMONS_TAXONOMY_MANIFEST.md. |
| 0011 | MAX_TOKENS = 8192 for all enrichment scripts | 4096 caused ~31% silent truncation in Urban Engineering Wave 1 (bodies of 2,000 words with rich markdown consume 3,000–4,500 output tokens). 8192 is Haiku's ceiling. |
| 0012 | Concurrency = 25 for Anthropic API enrichment | At 40 concurrent calls, 120K output tokens/min burst hits the 200K output-TPM org limit → HTTP 429 errors. At 25: ~75K burst, stable 30 patterns/min throughput. |
| 0013 | Cowork + local terminal push workflow | Cowork VM proxy blocks api.github.com and github.com:443. Claude writes to mounted workspace folder; Holger pushes from local terminal. This is the permanent workflow, not a workaround. |
| 0014 | AI-driven development model — Claude as primary builder | Small core team. Claude (Cowork) generates patterns, writes scripts, drafts specs. Human judgment is the quality gate and decision authority. All decisions are ADR-documented. |

---

## 9. Pending Decisions

These decisions are open. They should become ADRs once resolved.

| Topic | Question | Notes |
|---|---|---|
| Community Engine scope | What does it become? Curriculum platform, community portal, or both? | Defer until community shape is clearer |
| Notion integration | Role in the platform? Editorial workflow? Ambience Stack target? M365 complement? | TBD |
| Azure OpenAI + GraphRAG | When to run first pass? Which domain? What Azure infrastructure? | After Urban Wave 2 or after first domain reaches 100% coverage |
| M365 / SharePoint curricula | Integration architecture for Journey & Mission delivery? | Needs Community Engine scope decision first |
| Business Engineering | Migrate existing patterns vs. clean-slate rebuild from proper domain taxonomy? | Migrate if taxonomy compatible; rebuild if not |
| Subdomain vs path routing | `patterns.commons.engineering` vs `commons.engineering/patterns/`? | Subdomains give independent deployments; paths give unified Pagefind index more simply |
| Cowork plugin | Build a session-boot plugin that auto-injects this document? | High value — implement once spec stabilises |
| Orbit 0–2 hub patterns | How many? Which principles? Derived from corpus or defined a priori? | Defer until post-GraphRAG — hubs should emerge from the graph, not be pre-declared |
| Wave 2 Urban Engineering | Start after v8.2 migration and folder reorganisation? | Yes — confirmed sequence |

---

## 10. Immediate Next Steps (February 2026)

In agreed sequence — do not start Wave 2 before steps 1–3 are complete:

1. **Finalise this architecture spec** — review and approve (you are here)
2. **Supersede pattern spec** — adopt v8.2 as the definitive spec; update `PATTERN_PIPELINE_SPEC.md` to reference it
3. **Update enrichment scripts** — `enrich_async.py` and `enrich_urban_async.py` must generate Group 0 fields (`orbital_layer`, `sector`, `gravitational_hubs: []`) in new pattern stubs
4. **Migrate existing patterns** — batch script to backfill Group 0 fields in all 11,564+ Urban and Life patterns
5. **Reorganise `_patterns/` folder** — create domain subfolders (`urban/`, `life/`, etc.); move existing patterns
6. **Wave 2 Urban Engineering** — generate P2/P3 domains with v8.2 frontmatter from the start

---

*End of document. Version 1.1 — March 2026.*
*Next review: after Cloudflare Pages first deployment and Wave 2 Urban Engineering completion.*

---

### Changelog
| Version | Date | Change |
|---|---|---|
| 1.0 | February 2026 | Initial version — supersedes Commons-OS AGENT_BOOT.md |
| 1.1 | March 2026 | v8.2 alignment: renamed orbits (Principle, Commons, Bridge, Domain, Edge), added gravitational model (centripetal + centrifugal), added COMMONS_TAXONOMY_MANIFEST.md reference, updated pattern counts, updated version refs throughout |
