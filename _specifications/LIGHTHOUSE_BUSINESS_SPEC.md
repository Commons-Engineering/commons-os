# Lighthouse Business Specification (v1.2) — The Coastal Edition

**Date:** 08 March 2026
**Authors:** higgerix, cloudsters, AI Thought Partner
**Status:** Draft Specification (v1.2)
**Companion:** PATTERN_SPEC.md (v8.2), LIGHTHOUSE_URBAN_SPEC.md (v1.2), LIGHTHOUSE_ARCHETYPE_TAXONOMY.md (v1.2)
**Lineage:** MHP Business Engineering Briefing Template (2016–2025, ~200 briefings)
**Changelog:** v1.2 restores orbital_layer to Group 0, renames commons_signal to commons_vitality (Group 3), consolidates 8 domain-specific dimensions into 4 universal dimensions (d1_definition_purpose, d2_participation_relationship, d3_proposition_exchange, d4_production_resilience), renames signal to vitality_signal. Same field names across all lighthouse domains. v1.1 added archetype field (Group 0), replaced commons_assessment with commons_signal (Group 3), added Section 6.

---

## 1. Purpose: A Lighthouse for Every Organisation

This specification defines the format for **Business Lighthouses** in the Commons Engineering library. A lighthouse is a structured briefing about a living organisation — its purpose, its people, its propositions, and its operations — viewed through the lens of the Business Purpose Spiral and scored for commons alignment.

Where a **pattern** describes a practice (how something is done), a **lighthouse** describes an **organisation** (who does things, and how their doing maps onto the pattern library). Every lighthouse is simultaneously:

1. **A briefing** — a comprehensive, permissionlessly produced portrait of an organisation's value creation system.
2. **An account record** — a CRM-like artifact tracking engagement potential for Commons Engineers.
3. **A pattern anchor** — connecting an organisation's real-world practices to the pattern library, making the library actionable.

### 1.1 The Permissionless Principle

Lighthouses are produced **without the organisation's involvement**. They are assembled from publicly available information — annual reports, press releases, job postings, sustainability reports, regulatory filings, industry analysis, news, and web presence. This is the entry product: a Commons Engineer creates a lighthouse briefing as an act of professional generosity, demonstrating value before requesting any engagement.

The quality of a permissionless briefing — produced from the same public information anyone could access, but structured with the insight of the Business Purpose Spiral — is the proof of the model. If the briefing is good enough that the organisation recognises itself in it and sees value they hadn't articulated, that is the beginning of a relationship.

### 1.2 The Coastline Metaphor

There are more than 1.5 million kilometres of coastline in the world, and more than 20,000 lighthouses. For a reason. Every lighthouse marks a place where the land meets the sea — where the familiar meets the unknown, where navigation matters most.

In Commons Engineering, every organisation is a point on the coastline. Some are well-lit beacons that guide entire industries. Some are dark stretches where a light is desperately needed. The lighthouse library is the chart of this coastline. Its purpose is not to judge organisations but to illuminate them — to make the terrain navigable for Commons Engineers seeking meaningful work and for organisations seeking the systems thinking they need.

### 1.3 Brightness as Orbit

A lighthouse's **brightness** (orbital layer) describes how strongly its light shines. The lighthouse orbital model is a **separate model** from the pattern orbital model — they share the 0–5 scale and the gravitational metaphor, but they measure different things:

- **Pattern orbit** = distance from first principles (how universal is this practice?). Names: SINGULARITY (0), PRINCIPLES (1), COMMONS (2), TRANSVERSALS (3), DOMAINS (4), EDGE (5).
- **Lighthouse orbit** = brightness of commons alignment (how many Orbit 2 COMMONS patterns does this organisation exemplify?)

| Orbital Layer | Lighthouse Character | What it means |
|:---|:---|:---|
| 0 | **Beacon** — The exemplar. Its light is so strong it defines the coastline. | Deep, structural commons alignment across all four dimensions. |
| 1 | **Bright** — Deeply commons-aligned. Proven, structural, replicable. | Strong commons alignment with evidence across most dimensions. |
| 2 | **Steady** — Strong commons potential. The attractor state. | Clear commons alignment in key areas; genuine potential in others. |
| 3 | **Visible** — Bridging conventional and commons. Mixed signals. | Some commons practices present; significant gaps remain. |
| 4 | **Distant** — Conventional enterprise within extractive defaults. | Operates well but few connections to commons patterns. |
| 5 | **Dark** — Unexamined. First contact. The light hasn't been lit yet. | No assessed commons alignment. The briefing itself begins illumination. |

**Brightness is emergent, not assigned.** A lighthouse's orbit is determined by the quantity and strength of its relationships to **Orbit 2 commons patterns** — the crafted, curated patterns that represent the commons attractor state. The fewer Orbit 2 pattern links a lighthouse has, the darker its light. This makes brightness objective and measurable rather than subjective.

We could have a million lighthouses in our database, but only a defined number will exist in each orbit. The distribution is naturally pyramidal: many dark lighthouses, few beacons.

Most lighthouses will be produced at Orbit 4 or 5. The act of creating a briefing is itself the first step of illumination. Orbit movement happens through engagement — either the organisation moves inward (toward commons alignment) or the briefing reveals that it was already closer to the core than it appeared.

---

## 2. The Core Principle: Write Once, Render Richly

Identical to PATTERN_SPEC v8.2:

- **Author Focus:** Write the briefing narrative along the Business Purpose Spiral.
- **Machine Focus:** Structure all scoring, relationships, and account data in YAML frontmatter. **The frontmatter is the machine-readable API surface.** Agents — human or synthetic — parse Groups 0–7 as structured data. The body is narrative for human consumption (and future NLP extraction into Group 6).
- **Build Process:** A build script renders the frontmatter as rich components (commons alignment scorecard, pattern links, engagement timeline, value stream map).

---

## 3. The Definitive Frontmatter (v1.2)

The frontmatter is organised into 8 functional groups, paralleling PATTERN_SPEC v8.2 but adapted for organisations as subjects.

```yaml
---
# ═══════════════════════════════════════════════════════════════════
# GROUP 0: LIGHTHOUSE POSITION (The Coastline)
# ═══════════════════════════════════════════════════════════════════
id: lh_01h8x4e1gq7r9d1z2x3c4v5b6n   # TypeID with 'lh_' prefix
conforms_to: "LIGHTHOUSE_BUSINESS_SPEC/1.2"  # Schema version — agents use this to parse the file
orbital_layer: 3                        # Brightness: 0 (Beacon) to 5 (Dark)
                                        # COMPUTED from vitality_signal + Orbit 2 pattern linkage
                                        # See §1.3 for the lighthouse orbital model
sector: "Business"                      # Always "Business" for this spec
archetype: kritis-national              # Primary structural archetype (1 of 16)
                                        # See LIGHTHOUSE_ARCHETYPE_TAXONOMY.md
archetype_secondary: []                 # Optional secondary traits (max 2)
                                        # e.g., ["circular-industry", "knowledge-commons"]
commons_hub: baltic-hanse               # Direct hub membership — hub is its own fractal entity
                                        # Business lighthouses belong to hubs directly, not via urban lighthouses
urban_lighthouse: luebeck               # Slug of the urban lighthouse this org sits within
                                        # (geographic nesting — see §5.2)

# ═══════════════════════════════════════════════════════════════════
# GROUP 1: ORGANISATION IDENTITY
# ═══════════════════════════════════════════════════════════════════
slug: deutsche-bahn
name: "Deutsche Bahn AG"
aliases: ["DB", "DB Group", "Deutsche Bahn Group"]
legal_form: "AG (Aktiengesellschaft)"   # Legal structure
ownership: "State-owned (100% Federal Republic of Germany)"
founded: 1994                           # Year of incorporation/founding
headquarters:
  city: "Berlin"
  country: "Germany"
  coordinates: [52.5069, 13.3350]       # Optional: lat, lon
website: "https://www.deutschebahn.com"
summary: >-
  Europe's largest railway operator and infrastructure manager, operating
  passenger and freight transport across Germany and 130+ countries. A
  state-owned enterprise navigating the tension between public service
  mandate and commercial efficiency in an era of climate-driven modal shift.

# ═══════════════════════════════════════════════════════════════════
# GROUP 2: MARKET CONTEXT (The Navigator Engine)
# ═══════════════════════════════════════════════════════════════════
market:
  industry: "Transport & Logistics"
  segment: "Rail Transport, Infrastructure, Logistics"
  geography: ["Germany", "Europe", "Global"]
  size_metrics:
    revenue_eur: 45_800_000_000          # Latest available, in EUR
    employees: 340_000                    # Approximate headcount
    revenue_year: 2024                    # Reference year for financials
  competitive_position: >-
    Monopoly provider of German rail infrastructure (DB InfraGO), dominant
    in long-distance passenger rail, facing increasing competition in
    regional rail from private operators.

# ═══════════════════════════════════════════════════════════════════
# GROUP 3: COMMONS VITALITY (The Vitality Dimensions)
# ═══════════════════════════════════════════════════════════════════
# Four vitality dimensions (0-9 scale), one per Universal Dimension.
# Same field names across all lighthouse domains (Business, Urban, Ecology, Life).
# See rubrics in _pipeline/BUSINESS_LIGHTHOUSES.xlsx (Rubric sheet)
# and LIGHTHOUSE_ARCHETYPE_TAXONOMY.md §3 for archetype-typical profiles.
commons_vitality:
  d1_definition_purpose: 6        # Definition & Purpose — how clearly defined is the value system?
  d2_participation_relationship: 4 # Participation & Relationship — how inclusive is value creation?
  d3_proposition_exchange: 5       # Proposition & Exchange — how does value flow and circulate?
  d4_production_resilience: 4      # Production & Resilience — how resilient is the production system?
  vitality_signal: 4.8            # Average of 4 dimensions (rounded to 1 decimal)
  data_quality: 7                 # How much public data is available (0-9)
  signal_reasoning: >-
    Strong definition & purpose (essential rail infrastructure with clear public
    mandate), but participation constrained by hierarchical structures and
    operational fragility reduces overall vitality.

# ═══════════════════════════════════════════════════════════════════
# GROUP 4: ACCOUNT LIFECYCLE
# ═══════════════════════════════════════════════════════════════════
account:
  status: prospect                # prospect | qualified | engaged | active | alumni | dormant
  publication: internal           # internal | on-request | public | featured
                                  # internal = workshop only; public = permissionless publication
  engagement_level: 0             # 0 (no contact) to 5 (deep partnership)
  assigned_engineer: null         # slug of assigned Commons Engineer, if any
  first_briefing: 2025-06-02      # Date of first lighthouse briefing
  last_activity: 2025-06-02       # Date of last engagement activity
  next_action: null               # Free text: what's the next step?
  revenue_potential:
    annual_eur: null              # Estimated annual engagement value
    confidence: low               # low | medium | high
  tags: ["dax40", "state-owned", "rail", "infrastructure"]

# ═══════════════════════════════════════════════════════════════════
# GROUP 5: RELATIONSHIPS (Human-Curated Graph)
# ═══════════════════════════════════════════════════════════════════
relationships:
  # Orbit 2 (Commons) patterns this organisation exemplifies — these determine brightness
  exemplifies:                    # Patterns the org already demonstrates
    - slug: stakeholder-governance       # Orbit 2 commons pattern
      weight: 0.8
      orbit: 2                           # Track orbit level — Orbit 2 links drive brightness
      source: curated                    # curated | migration | graphrag
      evidence: >-                       # Why this link exists — the observable proof
        Board includes employee, community, and environmental representatives
        with binding governance authority.
    - slug: transparent-ledger           # Orbit 2 commons pattern
      weight: 0.6
      orbit: 2
      source: curated
      evidence: "Annual open-book financial reports published since 2018."
  needs:                          # Patterns that would improve the org
    - slug: operational-resilience
      weight: 0.9
      source: curated
      note: >-                           # Why this pattern is needed — the diagnostic reasoning
        Infrastructure backlog and punctuality crisis indicate systemic
        fragility that operational resilience patterns could address.
  # Related lighthouses
  related_lighthouses:
    - slug: sncf                  # Related organisations (competitors, partners, peers)
      weight: 0.7
      relationship: peer
    - slug: db-schenker
      weight: 0.9
      relationship: subsidiary
  # Value stream connections
  value_streams:                  # Which of the 13 value streams are most relevant
    - stream: "purpose-to-portfolio"
      relevance: high
    - stream: "plan-to-fulfill"
      relevance: critical

# ═══════════════════════════════════════════════════════════════════
# GROUP 6: GRAPH GARDEN (Machine-Written Graph)
# ═══════════════════════════════════════════════════════════════════
graph_garden:
  last_pruned: null
  entities: []                    # Named entities extracted from briefing
  communities: []                 # Entity clusters
  inferred_links: []              # Pattern links inferred by GraphRAG

# ═══════════════════════════════════════════════════════════════════
# GROUP 7: PROVENANCE
# ═══════════════════════════════════════════════════════════════════
contributors: ["higgerix", "cloudsters"]
sources:
  - type: annual_report
    title: "DB Integrated Report 2024"
    url: "https://www.deutschebahn.com/ir"
    accessed: 2025-06-01
  - type: website
    title: "Deutsche Bahn Corporate"
    url: "https://www.deutschebahn.com"
    accessed: 2025-06-01
license: CC-BY-SA-4.0
attribution: "commons.engineering by cloudsters, https://cloudsters.net"
briefing_version: 1               # Incremented on each major update
---
```

---

## 4. The Definitive Body Structure (v1.0)

The body follows the **Business Purpose Spiral** — four dimensions, each containing their value streams in Process-to-State grammar. This structure has been proven across ~200 briefings at MHP/Porsche over 9 years.

The body has **9 sections**. Section 1 is a rich executive overview (absorbing business areas, financials, markets). Sections 2–5 follow the four Universal Dimensions. Section 6 is the Commons Vitality Assessment — a structured scoring table synthesising the dimensional analysis. Sections 7–8 are public. Section 9 (Business Potential) is **gated** — visible only to registered Commons Engineers. Each value stream subsection uses a **Context → Tension → Alignment** flow — mirroring the pattern body's Context → Problem → Solution structure.

```markdown
> A one-sentence summary of the organisation and its commons significance.

> [!NOTE] Lighthouse Brightness: ★★★★☆ (Orbit 4 — Distant)
> This rating reflects how closely the organisation's current value creation
> system aligns with commons principles.

---

### 1. Organisation Overview

*(500–800 words)*

The executive portrait. A reader should understand the organisation after this
section alone. Include:

- **Identity:** Legal form, ownership, founding story, headquarters, mission
- **Business Areas & Products/Services:** What does the organisation do? What
  are its main product/service lines? How is it structured organisationally?
- **Financial Summary:** Revenue, employees, key financial metrics, investment
  posture. For listed companies: market cap, share development. For private:
  what is known about financial health.
- **Customers, Markets & Partners:** Who does it serve? Where? Who are its
  key partners and alliances? What is the competitive landscape?
- **Key Tension:** What is the central tension the organisation navigates?
  (e.g., public mandate vs. commercial efficiency for Deutsche Bahn)

This section should make the reader feel the life of the organisation — is it
growing, transforming, stagnating, or fighting for survival?

---

### 2. Definition & Purpose

*(400–600 words)*

How does this organisation define itself, what portfolio of value does it
create, and how does its purpose translate into systematic value creation?

Each value stream subsection follows a **Context → Tension → Alignment** flow:
- **Context:** What does the org do in this area? (observed facts)
- **Tension:** Where is the gap, conflict, or unrealised potential?
- **Alignment:** How could commons patterns strengthen this?

#### 2.1 Purpose to Portfolio

The stated purpose and how it translates into the actual portfolio. Is there
responsible stewardship of the portfolio around a clear purpose, with
alignment between impact, margin, and sustainability — or is there drift?

#### 2.2 Value to Profit

Financial stewardship — steering revenue, profit, costs, liquidity, and
regulatory compliance. How the organisation creates business value,
stakeholder value, and transparency across the ecosystem. Revenue,
margins, subsidies, investment posture, and what the financial structure
reveals about value creation health.

#### 2.3 Portfolio to System

How the enterprise is shaped as a business system using information
technology. Platform, pipeline, network, or hybrid? How modular or
monolithic? How does the system architecture sustainably increase value
and margin?

> **Commons Engineering Alignment — Purpose:**
> [2–3 sentences on how commons principles could strengthen the organisation's
> purpose dimension. Which Orbit 2 patterns are most relevant?]

---

### 3. Participation & Relationship

*(400–600 words)*

Who participates in this organisation's value creation, and what are the
relationships between them?

#### 3.1 Participants to Community

All participants in the business ecosystem — customers, suppliers, partners,
employees, stakeholders — and their integration into a harmonious community
of human, digital, and robotic actors. Is there genuine community for
purposeful and sustainable value creation, or merely a collection of
transacting parties?

#### 3.2 Collaborate to Automate

Where the organisation collaborates with humans and where it automates. The
trajectory — toward more automation, more collaboration, or a thoughtful
balance?

#### 3.3 Hire to Retire

The human lifecycle — recruitment, development, retention, transition. What
the talent market signals about the organisation's health.

#### 3.4 Welcome to Transition

How the organisation empowers and equips people to plan, build, operate,
and continuously optimise the business system. Change management,
capability building, organisational learning, and adaptability. This is
the enablement stream — not just onboarding, but the full lifecycle of
organisational capability.

> **Commons Engineering Alignment — Participation:**
> [2–3 sentences on participation dimension alignment + relevant Orbit 2 patterns]

---

### 4. Proposition & Exchange

*(400–600 words)*

What does this organisation offer the world, and how does value flow between
the organisation and its stakeholders?

#### 4.1 Discover to Usage

Steering the product lifecycle from product idea through market launch to
continuous usage — including development, design, production, supply chain,
service, and optimisation. This is the broadest value stream — it absorbs
the MHP "Idea to Market" product creation journey into the customer adoption
journey. If the two journeys need separate treatment, see the Decision Note
in §6.

#### 4.2 Lead to User

Organising the customer experience from first awareness through order
processing, delivery, usage, service, and post-use of products. How the
organisation converts interest into engagement through both commercial and
non-commercial channels.

#### 4.3 Distribute to Market

How the organisation reaches its markets. Distribution infrastructure —
owned, partnered, or platform-mediated?

> **Commons Engineering Alignment — Proposition:**
> [2–3 sentences on proposition dimension alignment + relevant Orbit 2 patterns]

---

### 5. Production & Resilience

*(400–600 words)*

How does this organisation actually produce value, and how resilient is its
production system?

#### 5.1 Acquire to Retire

Asset management — physical, digital, intellectual, natural. The lifecycle
from acquisition to retirement or renewal.

#### 5.2 Plan to Fulfill

How the organisation plans operations and fulfills commitments. Planning
horizons, variability handling, disruption response.

#### 5.3 Source to Pay

The supply chain — sourcing to payment. Visibility depth, dependencies,
vulnerabilities.

> **Commons Engineering Alignment — Operations:**
> [2–3 sentences on operations dimension alignment + relevant Orbit 2 patterns]

---

### 6. Commons Vitality Assessment

*(150–250 words + table)*

The synthesis of the dimensional analysis into a structured scoring table.
Each vitality dimension (0-9) is scored with evidence from the preceding
sections. The table IS the vitality assessment — the narrative above provides
the proof.

| Dimension | Vitality Dimension | Score | Key Evidence |
|:---|:---|:---|:---|
| D1 | Definition & Purpose | _/9 | [1-sentence evidence from §2] |
| D2 | Participation & Relationship | _/9 | [1-sentence evidence from §3] |
| D3 | Proposition & Exchange | _/9 | [1-sentence evidence from §4] |
| D4 | Production & Resilience | _/9 | [1-sentence evidence from §5] |
| **Vitality Signal** | | **_/9** | Average of 4 dimensions |
| **Data Quality** | | **_/9** | [Sources available] |

> **Archetype:** [archetype name] — [1-sentence explanation of why this
> archetype applies]

> **Vitality Profile vs. Archetype Typical:** [2-3 sentences on how this
> organisation's profile compares to the archetype-typical profile from
> LIGHTHOUSE_ARCHETYPE_TAXONOMY.md §3. Where does it exceed expectations?
> Where does it lag?]

The scores in this table MUST match the values in Group 3 (commons_vitality)
of the frontmatter. This dual representation ensures machine-readability
(frontmatter) and human-readability (body table with evidence).

---

### 7. Strategic Initiatives

*(300–400 words)*

What is the organisation actively working on? The current transformation
agenda — digitisation, sustainability, restructuring, expansion, new ventures.
Each initiative connected to one or more of the four dimensions.

This is the most dynamic section and the most likely entry point for
engagement. Strategic initiatives reveal where the organisation invests energy,
feels pain, and where systems thinking is most valuable.

---

### 8. Cognitive Era

*(200–300 words)*

How does this organisation change in the Cognitive Age? How is it interacting
with AI, autonomous systems, and distributed intelligence? Is it leading,
following, or resisting the transformation? What does its Cognitive Era
trajectory mean for commons alignment — does automation concentrate or
distribute value?

---

### 9. Business Potential *(gated — Commons Engineers only)*

*(300–500 words)*

The matchmaking section. This is where the lighthouse briefing becomes an
account management tool. **Not published on the public site.**

- **Engagement Potential:** How likely is this organisation to benefit from
  Commons Engineering? What are the entry points?
- **Classification:** A (active pursuit), B (qualified opportunity),
  C (monitor and nurture)
- **Value Stream Priorities:** Which of the 13 value streams represent the
  highest-impact engagement opportunities?
- **Pattern Prescription:** A curated list of 5–10 patterns from the library
  that would most benefit this organisation, with brief rationale for each.
- **Workplace Potential:** Could a Commons Engineer work here — as employee,
  contractor, or independent advisor? What roles exist or could be created?
```

---

## 5. File Organisation

### 5.1 Folder Structure

Lighthouse files live in `_lighthouses/` with sector subdirectories. **Industry is ontology, not taxonomy** — it belongs in the frontmatter (`market.industry`), not in the folder structure. The folder structure is flat within each sector:

```
_lighthouses/
  business/
    deutsche-bahn.md                          # The lighthouse briefing (anchor)
    deutsche-bahn/                            # Engagement graph nest (see §14)
      stwd_01h...._mueller-richard.md         # Steward (human)
      sig_01h...._generalsanierung.md         # Signal (market trigger)
      exp_01h...._resilience-diagnostic.md    # Exploration (opportunity)
      bp_01h...._resilience-workshop.md       # Blueprint (proposal)
      eng_01h...._resilience-delivery.md      # Engagement (project)
      pls_01h...._2025-09-01-kickoff.md       # Pulse (interaction log)
    sap.md
    porsche.md
  urban/           # → See LIGHTHOUSE_URBAN_SPEC (v1.0)
    luebeck.md
    luebeck/
      ...
  ecology/         # → Future
  life/            # → Future
```

Each lighthouse gets a `.md` file (the briefing) and optionally a same-named folder (the engagement nest). The folder only exists when there are engagement objects to store.

### 5.2 Urban ↔ Business Nesting

Business lighthouses nest within urban lighthouses through the `urban_lighthouse` field in Group 0. This reflects a geographic reality: business lighthouse density is highest in urban areas.

```
Urban Lighthouse: luebeck
  ├── Business Lighthouse: draegerwerk (urban_lighthouse: luebeck)
  ├── Business Lighthouse: euroimmun (urban_lighthouse: luebeck)
  └── Business Lighthouse: baader-bank (urban_lighthouse: luebeck)
```

This nesting enables geographic queries ("show me all business lighthouses in Lübeck") and reveals the commons density of a place — an urban lighthouse whose business lighthouses are mostly dark tells a different story from one where several are bright.

The nesting is a **frontmatter relationship, not a folder relationship**. Business lighthouses stay in `_lighthouses/business/`, urban lighthouses stay in `_lighthouses/urban/`. The link is the `urban_lighthouse` slug reference. This keeps the folder structure clean and allows a business lighthouse to relate to multiple urban contexts (e.g., a company with operations in multiple cities).

### 5.3 Commons Hubs (Future)

Above urban lighthouses sit **Commons Hubs** — cultural regions with urban hotspots that serve as natural centers of gravity for account management. These ignore nation-state boundaries and think in terms of cultural similarity, local knowledge, relationships, and circular economics. See Issue #25 for the deliberation on this concept.

---

## 6. The 13 Business Value Streams

The Business Purpose Spiral contains 13 value streams, organised under the four Universal Dimensions. Each value stream follows the Process-to-State grammar — the name describes the transformation from an active process to a desired state.

**Lineage:** These 13 value streams are the canonical form of the MHP/BEN Business Purpose Spiral (2016–2025, ~200 briefings). Three changes were made from the original 12-stream model: "Mission" became "Purpose" (broader than organisational mission), "Plan to Profit" became "Value to Profit" (includes stakeholder value and transparency), and "Participants to Community" was added — recognising human, digital, and robotic actors as ecosystem participants. "Idea to Market" (product development lifecycle) was absorbed into "Discover to Usage" but may be reinstated as a 14th stream if test-samples show the product creation journey needs its own space — see Decision Note below. The English missions below are faithful translations of the German originals from the BEN Business Briefing Prompt.

| # | Dimension | Value Stream | Mission | Section |
|:---|:---|:---|:---|:---|
| 1 | **Definition & Purpose** | Purpose to Portfolio | Responsibly build and steer the value-creating portfolio of the business ecosystem around a clear purpose, to improve impact, margin, and sustainability. | 2.1 |
| 2 | | Value to Profit | Steer revenue, profit, costs, liquidity, and regulatory compliance to increase business value, stakeholder value, and transparency across the business ecosystem. | 2.2 |
| 3 | | Portfolio to System | Shape the enterprise as a business system using information technology to sustainably increase value and margin. | 2.3 |
| 4 | **Participation & Relationship** | Participants to Community | Integrate all participants in the business ecosystem — customers, suppliers, partners, employees, stakeholders — into a harmonious community of human, digital, and robotic actors for purposeful and sustainable value creation. | 3.1 |
| 5 | | Collaborate to Automate | Improve human-machine collaboration through integrated tools and workflows to increase agility, efficiency, and time-to-market. | 3.2 |
| 6 | | Hire to Retire | Recruit, develop, manage, and retain employees and external workers for seamless integration and optimal performance in the business system. | 3.3 |
| 7 | | Welcome to Transition | Empower and equip people to plan, build, operate, and continuously optimise the business system — ensuring sustainable improvement and adaptability. | 3.4 |
| 8 | **Proposition & Exchange** | Discover to Usage | Steer the product lifecycle from product idea through market launch to continuous usage — including development, design, production, supply chain, service, and optimisation. | 4.1 |
| 9 | | Lead to User | Organise the customer experience from first awareness through order processing, delivery, usage, service, and post-use of products. | 4.2 |
| 10 | | Distribute to Market | Build and optimise a distribution system to ensure efficient availability, reach, and delivery of products and services to customers. | 4.3 |
| 11 | **Production & Resilience** | Acquire to Retire | Manage the lifecycle of assets — from identification and procurement through implementation and maintenance to decommissioning. | 5.1 |
| 12 | | Plan to Fulfill | Organise the digital supply chain from demand planning and procurement through production to delivery of a product system — ensuring efficiency and seamless operations. | 5.2 |
| 13 | | Source to Pay | Optimise and steer all expenditure processes from needs identification through supplier selection and contract negotiation to ordering and payment. | 5.3 |

These 13 value streams are the standard lens through which every business lighthouse is analysed. Not every value stream will be equally relevant for every organisation — the briefing author should invest depth where the organisation's situation demands it and keep other sections concise.

> **Decision Note: Idea to Market**
> The MHP original had "Idea to Market" as a dedicated value stream: *"Steer all activities from product idea to market readiness, including development, design, and integration of downstream processes like production, supply chain, and service."* In v1.0, this was absorbed into "Discover to Usage" (§4.1), which now spans from product idea through to habitual usage. If test-samples show that the product creation journey (R&D, design, engineering) consistently needs separate treatment from the customer adoption journey (discovery, trial, usage), "Idea to Market" should be reinstated as value stream 8 under Proposition & Exchange, with "Discover to Usage" narrowing to the customer-facing journey. Track in Issue #23.

---

## 7. TypeID Convention

All entities in the lighthouse ecosystem use TypeID with a unique prefix. The lighthouse itself uses `lh_`; extension entities (defined in the Engagement Graph Spec) use their own prefixes. This registry is the canonical list — no two entity types may share a prefix.

| Prefix | Entity | Spec |
|:---|:---|:---|
| `pat_` | Pattern | PATTERN_SPEC |
| `lh_` | Business Lighthouse | LIGHTHOUSE_BUSINESS_SPEC |
| `ulh_` | Urban Lighthouse | LIGHTHOUSE_URBAN_SPEC |
| `stwd_` | Steward (Contact) | ENGAGEMENT_GRAPH_SPEC (planned) |
| `sig_` | Signal (Market Trigger) | ENGAGEMENT_GRAPH_SPEC (planned) |
| `exp_` | Exploration (Opportunity) | ENGAGEMENT_GRAPH_SPEC (planned) |
| `bp_` | Blueprint (Proposal) | ENGAGEMENT_GRAPH_SPEC (planned) |
| `eng_` | Engagement (Delivery) | ENGAGEMENT_GRAPH_SPEC (planned) |
| `pls_` | Pulse (Interaction Log) | ENGAGEMENT_GRAPH_SPEC (planned) |

```
lh_01h8x4e1gq7r9d1z2x3c4v5b6n
^^  ^^^^^^^^^^^^^^^^^^^^^^^^^^
|   Crockford Base32 timestamp + random (same algorithm as patterns)
|
Entity prefix (see registry above)
```

Generated by the same `generate_typeid.py` script with a prefix parameter.

---

## 8. Validation Rules

1. **Identity Completeness:** Every lighthouse must have `name`, `slug`, `summary`, and at least one `sources` entry.
2. **Dimension Coverage:** Sections 2–5 must each contain substantive content (not just placeholders) for a lighthouse to be considered "briefing complete."
3. **Commons Vitality:** All 4 vitality dimension scores (0-9) must be present in Group 3 (`commons_vitality`). `vitality_signal` must equal the average of the 4 component scores (rounded to 1 decimal). Body Section 6 table scores must match frontmatter values exactly.
4. **Source Freshness:** At least one source must have an `accessed` date within the last 12 months for the lighthouse to be considered "current."
5. **Brightness Emergence:** `orbital_layer` (Group 0) is **computed** from the density and strength of links to Orbit 2 (Commons) patterns in the `relationships.exemplifies` array. The fewer Orbit 2 pattern links, the darker the light. A validation script should verify that `orbital_layer` is consistent with this computation. The exact thresholds are to be calibrated once a critical mass of lighthouses exists.
6. **Publication Consistency:** Lighthouses with `publication: public` must not contain any content in Group 4 (Account Lifecycle) that would be inappropriate for public consumption. The build pipeline must strip Group 4 from publicly rendered lighthouses.

---

## 9. Pipeline

The lighthouse production pipeline mirrors the pattern pipeline:

```
PHASE A: Infrastructure
  └── Tools: generate_typeid.py (with lh_ prefix), lighthouse_stub_generator.py

PHASE B: Stub Generation
  └── Input:  Organisation name + public URLs
  └── Output: _lighthouses/{sector}/{slug}.md (frontmatter + skeleton)

PHASE C: Briefing Enrichment
  └── Input:  Stub with skeleton body
  └── Output: Full briefing with all 9 sections populated
  └── Method: Claude API with structured prompts per section
  └── Sources: Annual reports, websites, news, job postings, ESG reports
  └── Vitality: 4 dimensions scored per rubric; archetype assigned per taxonomy

PHASE D: Pattern Linking
  └── Input:  Enriched briefing
  └── Output: Groups 5 & 6 populated (exemplifies, needs, graph_garden)
  └── Runs:   Cross-reference against full pattern library
```

---

## 10. Relationship to Pattern Library

Every lighthouse is **nested with the pattern library**, and the relationship to **Orbit 2 (Commons) patterns** is the critical structural link:

- **Exemplifies:** Patterns the organisation already demonstrates (evidence-based, linked to specific sections of the briefing). **Links to Orbit 2 commons patterns determine brightness.** An organisation that exemplifies many Orbit 2 patterns has a bright light; one that exemplifies few has a dark light. We deliberately link to commons patterns, not to extractive Orbit 4 domain patterns — otherwise we would not be treating them as a lighthouse.
- **Needs:** Patterns that would improve the organisation's commons alignment (diagnostic, linked to gaps identified in the briefing). These are the prescriptive links — the patterns a Commons Engineer would bring to an engagement.
- **Graph Garden:** Machine-extracted entities and relationships from the briefing text, cross-linked with pattern entities.

This nesting creates a **bidirectional graph**: patterns link to the lighthouses that exemplify or need them, and lighthouses link to the patterns that describe their practices or prescribe their improvements. A Commons Engineer can navigate from a pattern to "which organisations use this?" or from an organisation to "which patterns would help them?"

The Orbit 2 linkage creates a natural incentive structure: the way to make a lighthouse brighter is to help the organisation adopt more commons patterns. The briefing becomes a diagnostic, the pattern library becomes the prescription, and the engagement becomes the treatment. This is the Lighthouse Engine's value cycle.

---

## 11. Account Management Integration

The `account` group in the frontmatter transforms the briefing into a lightweight CRM record:

| Field | Purpose |
|:---|:---|
| `status` | Pipeline stage: prospect → qualified → engaged → active → alumni → dormant |
| `engagement_level` | 0–5 depth: no contact → awareness → conversation → project → partnership → deep integration |
| `assigned_engineer` | Which Commons Engineer is responsible for this lighthouse |
| `first_briefing` | When the lighthouse was first lit |
| `last_activity` | Most recent engagement activity |
| `next_action` | Free text: the next concrete step |
| `revenue_potential` | Estimated annual value + confidence level |
| `tags` | Free-form tags for filtering (industry, size, geography, special characteristics) |

This is deliberately lightweight. The briefing itself is the detailed record. The account fields exist to enable pipeline views, dashboards, and assignment workflows — the kind of operational tooling that the Build Engine (GitHub Actions) can automate.

---

## 12. Versioning and Updates

Lighthouses are living documents. Unlike patterns (which tend toward stability), lighthouses change as organisations change. The `briefing_version` field tracks major updates:

- **Version 1:** Initial permissionless briefing from public sources.
- **Version 2:** Updated with engagement insights (post-first-contact).
- **Version 3+:** Deepened with insider knowledge (active engagement phase).

Each version increment should be accompanied by a git commit referencing the lighthouse slug and the nature of the update.

---

## 13. Privacy Zones and Publication

A lighthouse has **three privacy zones**:

| Zone | Content | Visibility | Rendering |
|:---|:---|:---|:---|
| **Public** | Sections 1–8 (briefing narrative + vitality assessment + cognitive era), Groups 0–3, 6–7 | Anyone (public site) | PROD (Cloudflare from public repo) |
| **Gated** | Section 9 (Business Potential, pattern prescription) | Registered Commons Engineers | STAGING or authenticated PROD |
| **Private** | Group 4 (Account Lifecycle), revenue potential, next action, assigned engineer | Workshop repo only | DEV / STAGING (private repo) |

**Publication is a separate decision from production.** The permissionless principle applies to production — we can and should produce lighthouse briefings freely. But publication follows the `account.publication` field:

| Value | Meaning |
|:---|:---|
| `internal` | Workshop only. Default for all new lighthouses. |
| `on-request` | Available to anyone who asks but not publicly listed. |
| `public` | Published on commons.engineering. Permissionless — we publish analysis from public sources. |
| `featured` | Highlighted on the public site as an exemplar or case study. |

The build pipeline strips Group 4 (Account Lifecycle) from any lighthouse with `publication: public` or `featured`. Section 9 (Business Potential) is stripped for non-authenticated visitors.

**What can be published permissionlessly:** Analysis derived from public sources — annual reports, press releases, websites, regulatory filings. The briefing narrative (Sections 1–8) and the commons vitality scores (Group 3) are our analytical work product, not the organisation's confidential information.

**What stays internal:** Account management data (Group 4), engagement strategy (Section 9), and any insights gained from direct engagement (briefing versions 2+).

---

## 14. The Engagement Graph (Preview)

> **Status:** Draft specification in progress. See Issue #23 and ENGAGEMENT_GRAPH_SPEC.md (planned).

The lighthouse briefing is the **anchor** — the public, stable description of an organisation's state. Around it, engagement entities grow as child markdown files, each linking bottom-up to the lighthouse via a `target_lighthouse` YAML field. This keeps the public lighthouse pristine while the private graph grows.

The architecture replaces the traditional CRM silo (Lead → Opportunity → Deal) with an ecological engagement model designed for **Human-to-Human (H2H)**, **Human-to-Agent (H2A)**, and **Agent-to-Agent (A2A)** interactions as first-class citizens.

```
_lighthouses/
  business/
    deutsche-bahn.md                          # Anchor (the lighthouse briefing)
    deutsche-bahn/                            # Engagement graph nest
      stwd_01h...._mueller-richard.md         # Steward (human contact)
      stwd_01h...._procurement-agent.md       # Steward (synthetic agent)
      sig_01h...._generalsanierung.md         # Signal (market trigger)
      exp_01h...._resilience-diagnostic.md    # Exploration (opportunity)
      bp_01h...._resilience-workshop.md       # Blueprint (proposal)
      eng_01h...._resilience-delivery.md      # Engagement (project)
      pls_01h...._2025-09-01-kickoff.md       # Pulse (interaction log)
```

All engagement entities share a common frontmatter grammar: `type`, `target_lighthouse`, `status`, `date`, `participants`, `interaction_mode` (H2H | H2A | A2A), `entity_class` (human | synthetic | composite), `patterns_referenced`, `dimension_served`. The body is free-form markdown. Git provides the audit trail. See §7 for the full TypeID prefix registry.

---

## 15. Ethics

Lighthouses are produced from **public information only**. The specification explicitly prohibits:

1. Including non-public financial data, trade secrets, or confidential strategic plans.
2. Including personal data about individuals beyond what is publicly associated with their professional role (e.g., CEO names from annual reports are fine; personal contact details are not).
3. Presenting analysis as fact — the briefing must distinguish between observed facts (from sources) and analytical interpretation (from the author).
4. Creating briefings with intent to harm, embarrass, or pressure an organisation.

The permissionless principle means the organisation has not consented to being analysed. This creates an ethical obligation to be generous, accurate, and fair. The lighthouse should illuminate, not expose.
