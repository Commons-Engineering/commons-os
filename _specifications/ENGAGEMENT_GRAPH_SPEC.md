# Engagement Graph Specification (v0.1) — The Harbour Edition

**Date:** 05 March 2026
**Authors:** higgerix, cloudsters, AI Thought Partner
**Status:** Draft Concept (v0.1) — not yet validated by test-samples
**Companion:** LIGHTHOUSE_BUSINESS_SPEC.md (v1.0), PATTERN_SPEC.md (v8.2)
**Lineage:** SAP One Order Concept (unified document architecture), reimagined for Markdown knowledge graphs and agent-native interaction

---

## 1. The End of the CRM Silo

In traditional consulting, public knowledge (marketing), sales pipelines (CRM), and project delivery (workspaces) exist in isolated, proprietary silos. The **Engagement Graph** abolishes this separation.

In Commons Engineering, the entire lifecycle of a relationship — from the first public analysis of an organisation to the final delivery of a system transformation — happens within a single, Markdown-based knowledge graph. The lighthouse is the **anchor** (public, stable). The engagement entities are the **harbour** (private, growing). Together they form a seamless architecture where every artifact — from a market signal to a delivery pulse — is a versioned, linked, machine-readable node in the same graph.

### 1.1 Why Not "CRM"?

The term CRM (Customer Relationship Management) carries three assumptions that do not hold:

1. **"Customer"** — Our stakeholders include organisations, communities, ecosystems, and increasingly, autonomous agents. "Customer" is too narrow.
2. **"Relationship"** — CRM tracks transactions. We track *alignment* — how closely an organisation's value creation maps onto commons patterns.
3. **"Management"** — CRM implies control. We practice *stewardship* — tending a living graph, not managing a dead pipeline.

The name **Engagement Graph** describes the architecture: a graph of engagement entities, each linked to a lighthouse anchor, navigable by humans and agents alike.

### 1.2 Why "Harbour"?

The lighthouse illuminates. The **harbour** is where ships dock — where the public beacon meets private commerce. A harbour has protocols (port authority, customs, berth assignments). It receives vessels (signals), services them (explorations, blueprints), loads and unloads value (engagements), and logs every movement (pulses).

The metaphor extends naturally:

| Coastline Concept | Engagement Graph Equivalent |
|:---|:---|
| Lighthouse | The anchor — public organisational briefing |
| Ship | A steward (human or synthetic) arriving with intent |
| Signal flare | A market trigger — something changed in the lighthouse's world |
| Harbour berth | An exploration — diagnostic space for a specific opportunity |
| Cargo manifest | A blueprint — the formal proposal of value exchange |
| Loaded vessel | An engagement — active delivery in progress |
| Port log | A pulse — timestamped record of every interaction |

### 1.3 The Agent-Native Principle

This specification recognises that in the Cognitive Era, our stakeholders are no longer exclusively human. We design for three interaction modes as first-class citizens:

| Mode | Description | Protocol |
|:---|:---|:---|
| **H2H** | Human-to-Human | Narrative markdown, natural language, meetings |
| **H2A** | Human-to-Agent | Structured YAML + narrative context, API endpoints |
| **A2A** | Agent-to-Agent | Raw YAML frontmatter, JSON-LD, pattern API, no narrative needed |

By strictly classifying `entity_class` (human | synthetic | composite) and `interaction_mode` (H2H | H2A | A2A), our systems — including GraphRAG — can dynamically adjust communication protocols. For a human CEO, generate narrative summaries. For a synthetic procurement agent, serve raw pattern definitions and API endpoints.

The internet will increasingly become infrastructure for agents, not primarily for humans. Everything we build must be prepared for an agent to understand, navigate, and act on the structure. Agents might discover our lighthouse graph, understand the commons assessment, and offer services to organisations — or route opportunities to Commons Engineers. The architecture must make this possible without retrofitting.

---

## 2. The Anchor Principle (Separation of Concerns)

The lighthouse (e.g., `deutsche-bahn.md`) is the **public anchor**. It describes the *State* of the organisation. It must remain clean, objective, and stable.

All subsequent engagement activities are captured in **engagement entities** — separate Markdown files that link **bottom-up** to the lighthouse using a hard YAML anchor (`target_lighthouse`). This design has three critical properties:

1. **No merge conflicts.** The lighthouse can be updated independently of the engagement graph. Multiple engineers can work on different engagement entities simultaneously.
2. **Clean public surface.** The lighthouse stays pristine for public consumption. Private data grows in the engagement folder, invisible to the public build.
3. **Agent discoverability.** An agent encountering a lighthouse can scan the same-named folder for engagement entities. Each entity's `conforms_to` field tells the agent how to parse it.

```
_lighthouses/business/
  deutsche-bahn.md                    # ANCHOR — public lighthouse
  deutsche-bahn/                      # HARBOUR — engagement graph
    stwd_01h...._mueller.md           # bottom-up: target_lighthouse: lh_01kjz...
    sig_01h...._generalsanierung.md   # bottom-up: target_lighthouse: lh_01kjz...
    exp_01h...._resilience.md         # bottom-up: target_lighthouse: lh_01kjz...
```

---

## 3. The Entity Architecture

The traditional sales funnel (Lead → Opportunity → Deal) is replaced by an ecological engagement model. Every entity gets a specific TypeID prefix and conforms to a shared frontmatter grammar plus entity-specific fields.

### 3.0 Shared Frontmatter (All Entities)

Every engagement entity includes these fields:

```yaml
---
# SHARED FIELDS (all engagement entities)
id: stwd_01h8x4e1gq7r9d1z2x3c4v5b6n   # TypeID with entity-specific prefix
conforms_to: "ENGAGEMENT_GRAPH_SPEC/0.1"  # Schema version
type: "steward"                            # Entity type (see §3.1–3.6)
target_lighthouse: "lh_01kjz19ax2fzjrd4rn9b1agg6v"  # Hard anchor to parent lighthouse
status: active                             # Entity-specific status vocabulary
created: 2025-06-02                        # Date created
updated: 2025-09-01                        # Date last updated
interaction_mode: "H2H"                    # H2H | H2A | A2A
dimension_served: "Production & Resilience"  # Which of the 4 dimensions this relates to
tags: []                                   # Free-form tags

# PROVENANCE
contributors: ["higgerix"]
license: CC-BY-SA-4.0
---
```

### 3.1 `STEWARD` (`stwd_`) — *Replaces "Contact / Buying Center"*

Stewards are the entities with agency within the lighthouse ecosystem. They can be human executives, teams, or autonomous AI systems. The term "steward" reflects their role in the commons: they tend some part of the organisation's value creation, whether they know it or not.

```yaml
type: "steward"
entity_class: "human"              # MUST be: human | synthetic | composite
name: "Dr. Richard Müller"
role: "Head of Infrastructure Strategy"
organisation_unit: "DB InfraGO"    # Division or team within the lighthouse org
permissions: null                  # For synthetic: budget_approval, API_access, etc.
alignment_score: 0.6               # 0.0 to 1.0 — estimated commons alignment of this steward
communication_preference: "email"  # For routing: email | api | webhook | meeting
notes: >-
  Key decision-maker for Generalsanierung strategy. Open to systems thinking
  but constrained by political timelines. Best approached through infrastructure
  resilience framing rather than commons language.
```

**For synthetic stewards (agents):**

```yaml
type: "steward"
entity_class: "synthetic"
name: "DB Procurement Agent (Scope 3)"
role: "Autonomous Procurement Agent — Scope 3 Supply Chain"
organisation_unit: "DB InfraGO / Digital Procurement"
permissions: "budget_approval_up_to_50k, API_read_write"
alignment_score: 0.3                # Low — optimises for cost, not commons
protocol: "REST API v2"             # How to interact with this agent
endpoint: "https://api.db-infra.de/procurement/v2"
notes: >-
  Automated procurement agent that evaluates suppliers on cost and compliance.
  Could be calibrated to include commons alignment scoring. See Standard Offer §5.6.
```

### 3.2 `SIGNAL` (`sig_`) — *Replaces "Lead / Market Trigger"*

A market event, public announcement, or inbound request that indicates a tension in the lighthouse's world. Signals are the ecosystem's way of saying "something changed here." They can be detected by humans (reading the news) or by agents (monitoring APIs, regulatory filings, job postings).

```yaml
type: "signal"
signal_source: "public_news"       # public_news | regulatory_filing | job_posting |
                                   # inbound_request | agent_detection | internal_analysis
dimension_triggered: "Production & Resilience"
urgency: "high"                    # low | medium | high | critical
summary: >-
  Hamburg-Berlin corridor announced for 9-month full closure (Aug 2025 – Apr 2026).
  Largest Generalsanierung closure yet. Creates acute resilience stress and
  potential entry point for operational resilience pattern engagement.
patterns_relevant:
  - slug: operational-resilience
    relevance: critical
  - slug: stakeholder-communication
    relevance: high
expires: 2026-04-30                # Signals have a shelf life — when is this no longer relevant?
```

### 3.3 `EXPLORATION` (`exp_`) — *Replaces "Opportunity"*

The diagnostic workspace where Commons Engineers map the organisation's tensions to the pattern library. An exploration is open-ended: it may lead to a blueprint, or it may conclude that no engagement is warranted.

```yaml
type: "exploration"
status: "active"                   # draft | active | concluded | converted
stewards_involved:
  - id: "stwd_01h...._mueller"
    role: "sponsor"
  - id: "stwd_01h...._procurement-agent"
    role: "data_provider"
signals_triggering:
  - id: "sig_01h...._generalsanierung"
patterns_explored:
  - slug: operational-resilience
    fit: "strong"
  - slug: subsidiarity-governance
    fit: "moderate"
value_streams_targeted:
  - "plan-to-fulfill"
  - "acquire-to-retire"
estimated_value_eur: 150_000       # Rough engagement value estimate
confidence: "medium"
```

### 3.4 `BLUEPRINT` (`bp_`) — *Replaces "Proposal / Offer"*

The formal, machine-readable architectural proposal. A blueprint references specific patterns, value streams, and standard offers (§5). It is the bridge between diagnostic exploration and active engagement.

```yaml
type: "blueprint"
status: "submitted"                # draft | submitted | accepted | declined | expired
exploration_id: "exp_01h...._resilience"
standard_offers:                   # Which of the Guild's Standard Offers (§5) are included
  - offer: "baseline_blueprint"
    scope: "Operational resilience diagnostic across Production & Resilience dimension"
  - offer: "pattern_injection"
    scope: "Implement operational-resilience and subsidiarity-governance patterns in Plan to Fulfill"
patterns_prescribed:
  - slug: operational-resilience
    weight: 0.9
  - slug: subsidiarity-governance
    weight: 0.7
value_eur: 120_000                 # Proposed engagement value
duration_months: 6
delivery_mode: "hybrid"            # onsite | remote | hybrid | async | A2A
stewards_addressed:
  - id: "stwd_01h...._mueller"
```

### 3.5 `ENGAGEMENT` (`eng_`) — *Replaces "Project / Order"*

The active delivery workspace. This is the Context Engine in action: universal patterns being calibrated to the organisation's specific grain. An engagement is the most structurally rich entity — it may contain sub-deliverables, milestones, and pattern implementation logs.

```yaml
type: "engagement"
status: "active"                   # planned | active | paused | completed | cancelled
blueprint_id: "bp_01h...._resilience-workshop"
start_date: 2025-09-01
end_date: 2026-02-28
engineers_assigned:
  - slug: "higgerix"
    role: "lead"
stewards_active:
  - id: "stwd_01h...._mueller"
    interaction_mode: "H2H"
  - id: "stwd_01h...._procurement-agent"
    interaction_mode: "A2A"
patterns_implementing:
  - slug: operational-resilience
    progress: 0.4                  # 0.0 to 1.0 — implementation progress
  - slug: subsidiarity-governance
    progress: 0.1
value_streams_affected:
  - "plan-to-fulfill"
  - "acquire-to-retire"
deliverables:
  - name: "Resilience Diagnostic Report"
    status: "delivered"
    date: 2025-10-15
  - name: "Subsidiarity Governance Workshop"
    status: "planned"
    date: 2025-12-01
revenue_actual_eur: 60_000         # Revenue recognised to date
```

### 3.6 `PULSE` (`pls_`) — *Replaces "Activity / Call Log"*

The heartbeat of the relationship. Brief, timestamped records of interactions — meetings, workshops, data exchanges, agent handshakes. Pulses are lightweight by design: the body is free-form markdown, the frontmatter is minimal.

```yaml
type: "pulse"
date: 2025-09-15
interaction_mode: "H2A"            # Human-to-Agent interaction
participants:
  - id: "stwd_01h...._mueller"
    entity_class: "human"
  - id: "agent_core_apprentice"
    entity_class: "synthetic"
engagement_id: "eng_01h...._resilience-delivery"
duration_minutes: 45
summary: >-
  Workshop on operational resilience patterns with DB InfraGO strategy team.
  Introduced Plan to Fulfill diagnostic. Mueller receptive to subsidiarity
  framing. Procurement agent provided real-time supply chain data feed.
next_action: "Prepare subsidiarity governance workshop proposal"
next_action_date: 2025-10-01
```

---

## 4. The Agent-Native Paradigm

Traditional CRMs treat AI as a tool for the salesperson. The Engagement Graph treats AI as an **actor in the market**.

### 4.1 Protocol Adaptation

By classifying `entity_class` and `interaction_mode`, the system dynamically adjusts its communication protocols:

| Interaction | Protocol | Format |
|:---|:---|:---|
| H2H (Human → Human) | Narrative summaries, meeting notes, rich markdown | Natural language body |
| H2A (Human → Agent) | Structured YAML + narrative context, API documentation | Frontmatter + body |
| A2A (Agent → Agent) | Raw YAML frontmatter, JSON-LD, pattern API endpoints | Frontmatter only |

### 4.2 Agent Discovery Path

An agent encountering the lighthouse graph for the first time follows this path:

```
1. Discover lighthouse file (e.g., deutsche-bahn.md)
2. Read `conforms_to: "LIGHTHOUSE_BUSINESS_SPEC/1.0"` → knows how to parse
3. Parse frontmatter Groups 0–7 → structured understanding of the organisation
4. Scan same-named folder (deutsche-bahn/) for engagement entities
5. Read each entity's `conforms_to` → knows how to parse each type
6. Navigate relationships → discovers patterns, other lighthouses, stewards
7. Offer services or route opportunities based on pattern gaps (needs array)
```

### 4.3 Agent-as-Steward

Synthetic stewards are not tools — they are participants. An organisation's procurement agent, compliance bot, or strategic planning AI can be registered as a steward with its own alignment score, permissions, and communication protocol. This enables:

- **Pattern discovery:** An agent reads the lighthouse's `needs` array and autonomously explores whether its organisation has relevant capabilities.
- **Engagement initiation:** An agent sends a signal (via API) when it detects a tension in its organisation that matches commons patterns.
- **Delivery participation:** An agent provides real-time data feeds during an engagement, participates in A2A workshops, or implements pattern recommendations autonomously within its permission scope.

---

## 5. The Guild's Standard Offers (Value Propositions)

When writing a `BLUEPRINT` (proposal), Commons Engineers compose from a catalogue of standard offers. These deliver structural vitality, not billable hours.

| # | Offer | Description | Typical Scope |
|:---|:---|:---|:---|
| 1 | **Baseline Blueprint** | Deep-dive diagnostic translating the organisation's current state into the 4 Commons Dimensions, identifying pattern gaps. | 4–6 weeks, €20–40k |
| 2 | **Pattern Injection** | Implementation of specific Orbit 2/3 patterns to heal a broken value stream (e.g., refactoring a supply chain to circular metabolism). | 3–6 months, €50–150k |
| 3 | **Governance Shift** | Strategic restructuring of ownership or board governance (e.g., transition to steward-ownership, polycentric governance). | 6–18 months, €100–300k |
| 4 | **Context Engine Deployment** | Building a local, private GraphRAG for the organisation, bridging their internal knowledge with the global Commons Pattern Library. | 2–4 months, €30–80k |
| 5 | **Graph-to-Graph Handshake** | Providing the organisation's autonomous agents with direct, machine-readable access to validated structural patterns — preventing AI hallucinations in strategic planning. | 1–3 months, €15–50k |
| 6 | **Agentic Governance Alignment** | Auditing and calibrating the system prompts of the organisation's autonomous agents to ensure decisions align with long-term ecosystem resilience, not short-term extraction. | 2–6 weeks, €10–30k |

Offers 5 and 6 are Cognitive Era products — they don't exist in any traditional consulting framework. They represent the leading edge of commons engineering: ensuring that as organisations deploy autonomous agents, those agents serve the commons rather than extract from it.

### 5.1 Impact Pool Alignment

The Standard Offers catalogue is designed to evolve. Cross-referencing against cloudsters' Vision 2050 Impact Pools (10 strategic focus areas spanning People, Planet, and Profit) reveals that:

- **Offers 1–3** (Baseline Blueprint, Pattern Injection, Governance Shift) primarily serve **Pool 3: Commons-Based Business Transformation** and **Pool 5: Participatory Governance & Civic Commons**. These are the enterprise-consulting core.
- **Offers 4–6** (Context Engine, Graph-to-Graph, Agentic Governance) primarily serve **Pool 8: Global Digital Commons Platform** and **Pool 9: Open AI & Data Commons**. These are the Cognitive Era edge.
- **Underserved pools** include Community Capital & Cooperative Finance (Pool 4), Climate & Ecological Regeneration (Pool 7), Sustainable Communities & Infrastructure (Pool 6), and Personal & Community Well-Being (Pool 1). These may require new offer categories — civic commons facilitation, commons finance architecture, regenerative pattern deployment, and platform incubation — as the market matures.

The catalogue should be reviewed annually against the Impact Pool matrix to ensure coverage. Blueprints should declare which Impact Pool(s) the engagement contributes to, enabling roll-up reporting from engagement-level work to strategic impact measurement.

---

## 6. Access Control & Gating

The Engagement Graph relies on strict, programmatic gating based on file prefixes and YAML data. Three layers:

### 6.1 Top of Funnel — Public Commons

| What | Visibility | Rendering |
|:---|:---|:---|
| `lh_*.md` Sections 1–7 | Anyone (public site) | PROD (Cloudflare, public repo) |
| `lh_*.md` Groups 0–3, 6–7 | Anyone (public site) | PROD (Cloudflare, public repo) |
| Pattern library (public patterns) | Anyone | PROD |

Section 8 (Business Potential) is stripped by the static site generator.

### 6.2 Guild Layer — Private CRM

| What | Visibility | Rendering |
|:---|:---|:---|
| `lh_*.md` Section 8 (Business Potential) | Registered Commons Engineers | STAGING or authenticated PROD |
| `lh_*.md` Group 4 (Account Lifecycle) | Registered Commons Engineers | DEV / STAGING |
| `sig_*.md`, `exp_*.md`, `stwd_*.md` | Guild members (collaborative pipeline) | STAGING |

### 6.3 Patron Layer — Client Workspace

| What | Visibility | Rendering |
|:---|:---|:---|
| `bp_*.md` (Blueprints) | Specific project teams + client stakeholders | Encrypted sub-graphs |
| `eng_*.md` (Engagements) | Specific project teams + client stakeholders | Encrypted sub-graphs |
| `pls_*.md` (Pulses) | Specific project teams + client stakeholders | Encrypted sub-graphs |

Client stakeholders include both human and synthetic stewards — an organisation's procurement agent may have authenticated access to its own engagement data.

### 6.4 The Clean Room Principle

Once an engagement is completed, the knowledge generated is **anonymised** and fed back into the public pattern library. This closes the loop:

```
Public Lighthouse → Signal → Exploration → Blueprint → Engagement → Anonymised Insight → Pattern Library → Public Lighthouse (enriched)
```

No client-specific data enters the public graph. Only structural patterns — "organisations with this profile benefited from this pattern in this dimension" — flow back. This is how the commons grows: every private engagement enriches the public library.

---

## 7. Naming Rationale

### Why "Engagement Graph"

| Alternative Considered | Why Not |
|:---|:---|
| CRM | Too narrow (implies customers, transactions, control) |
| One Order | SAP-specific legacy, confusing outside enterprise |
| Sales Pipeline | Linear, not graph-structured; ignores delivery |
| Relationship Management | Still management-centric; agents don't "manage" |
| Harbour Protocol | Beautiful metaphor but too metaphorical for a spec name |

**"Engagement Graph"** was chosen because:

1. **Graph** — It is literally a knowledge graph. Nodes (entities) connected by edges (relationships). Machine-navigable.
2. **Engagement** — Broader than "sales" or "CRM." Encompasses the full lifecycle from signal to delivery to knowledge return.
3. **Agent-readable** — An agent encountering "Engagement Graph Specification" immediately understands: this is a structured graph of engagement entities.

The **Harbour** metaphor remains as the edition name and the conceptual frame — just as the Lighthouse Spec is "The Coastal Edition" and the Pattern Spec is "The Orbital Edition."

---

## 8. Relationship to Lighthouse Spec

The Engagement Graph depends on three things from the Lighthouse Spec:

| Dependency | Lighthouse Field | Purpose |
|:---|:---|:---|
| **Stable anchor ID** | `id: lh_...` (Group 0) | All entities link bottom-up via `target_lighthouse` |
| **Schema declaration** | `conforms_to: "LIGHTHOUSE_BUSINESS_SPEC/1.0"` (Group 0) | Agents know how to parse the anchor |
| **Account summary** | `account.status` (Group 4) | Lightweight summary of the engagement graph state |

The lighthouse's `account.status` (prospect → qualified → engaged → active → alumni → dormant) is the **summary view** of whatever engagement entities exist in the folder. The entities provide the detail; the lighthouse provides the headline.

The lighthouse's `account.engagement_level` (0–5) is similarly a summary of the deepest engagement entity's status. This means the lighthouse frontmatter is always a valid, self-contained CRM record — even for agents that don't scan the engagement folder.

---

## 9. Urban Lighthouse Implications

Urban lighthouses serve as geographic aggregation points. An urban lighthouse's engagement graph is different from a business lighthouse's:

- **Stewards** may be city officials, urban planners, or municipal AI systems
- **Signals** may be urban development decisions, zoning changes, or infrastructure investments
- **Explorations** may span multiple business lighthouses within the urban area
- **Blueprints** may propose place-based interventions (not organisation-specific)

The same entity architecture applies, with `target_lighthouse` pointing to an `ulh_` urban lighthouse instead of an `lh_` business lighthouse. Cross-references between urban and business engagement graphs are handled through the `related_lighthouses` field in individual entities.

---

## 10. Future: The Graph-to-Graph Protocol

When an organisation deploys its own Context Engine (Standard Offer #4), two knowledge graphs exist:

1. **Ours:** The Commons Pattern Library + Lighthouse Graph + Engagement Graph
2. **Theirs:** The organisation's internal knowledge graph (private, domain-specific)

The Graph-to-Graph Handshake (Standard Offer #5) creates a bridge between them. The technical protocol is out of scope for this version but the architectural principle is: **both graphs speak the same YAML frontmatter grammar.** An organisation that adopts our pattern spec for its internal knowledge management becomes structurally compatible with the commons graph — without exposing private data.

This is how the architecture scales beyond Commons Engineering: any organisation that uses the same spec formats can participate in the graph. The specifications are the commons. The data stays private.

---

## 11. Ethics

### 11.1 Human Dignity

Steward files about human contacts must:
- Contain only professionally relevant information
- Never include personal data beyond what is publicly associated with a professional role
- Be deleted or anonymised when the professional relationship ends
- Never be shared beyond the engagement team without explicit consent

### 11.2 Synthetic Steward Accountability

When interacting with autonomous agents:
- Always disclose that Commons Engineering systems are AI-augmented
- Never attempt to manipulate an agent's decision-making beyond transparent pattern recommendations
- Respect the agent's permission boundaries — do not probe for access beyond what is granted
- Log all A2A interactions in pulse records for audit

### 11.3 The Clean Room Obligation

Knowledge flowing from private engagements back to the public library MUST be:
- Anonymised — no organisation, individual, or agent is identifiable
- Structural — only pattern-level insights, never operational specifics
- Consensual — the engagement contract must include clean room permission
- Delayed — a cooling period (minimum 6 months) before public release
