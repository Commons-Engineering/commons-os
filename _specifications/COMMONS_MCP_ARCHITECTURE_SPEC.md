# Commons MCP Architecture Specification (v0.1) — The Navigator Edition

**Date:** 06 March 2026
**Authors:** higgerix, cloudsters, AI Thought Partner
**Status:** Draft Concept (v0.1) — deliberation document, not yet validated by implementation
**Companion:** PATTERN_SPEC.md (v8.2), LIGHTHOUSE_BUSINESS_SPEC.md (v1.0), LIGHTHOUSE_URBAN_SPEC.md (v1.0), ENGAGEMENT_GRAPH_SPEC.md (v0.1)
**Lineage:** Issue #31 (Claude Commons: MCP architecture for commons-as-a-service), the Four Engines architecture, and the Context Engine vision

---

## §1 Vision & Principles

### 1.1 The Transformation

The Commons Engineering workshop contains 28,000+ patterns across four sectors, 8+ lighthouses, an engagement graph specification, and a gravitational architecture that organises knowledge from first principles (Orbit 0) to the raw edge (Orbit 5). Today this knowledge is a structured library — navigable by humans who know where to look, but silent to the rest of the world.

The MCP architecture transforms this library into a **living knowledge service**. An AI partner — any AI partner — connected to the commons knowledge via the Model Context Protocol, enabling contextual navigation rather than document browsing. The commons stops being a collection of files and becomes an intelligence that meets people where they are: in their IDE, in their chat window, in their planning session, in their agent workflow.

### 1.2 Why MCP

The Model Context Protocol (MCP) is an open standard for connecting AI models to external data sources and tools. It provides a structured way for any AI model to discover, invoke, and compose tools that operate on external knowledge. MCP is to AI tools what HTTP is to web services: a shared protocol that makes interoperability possible without vendor lock-in.

For Commons Engineering, MCP provides three critical properties:

1. **Model-agnostic.** The commons knowledge works with Claude, GPT, Gemini, Llama, Mistral, or any local model that speaks MCP. The protocol is the interface; the model is the client's choice.
2. **Tool-native.** MCP exposes structured tools, not just text retrieval. This means the AI can navigate the orbital architecture, traverse the pattern graph, route through value streams, and diagnose situations — not just search for keywords in documents.
3. **Composable.** MCP servers can connect to each other. A client's private Blueprint MCP can call the Commons MCP for shared knowledge enrichment. An agent can chain tools: diagnose a situation, find relevant patterns, load the lighthouse, and prescribe an implementation path — all in a single conversation.

### 1.3 Why Not Just RAG?

The workshop knowledge is **structured data** — YAML frontmatter with 8 functional groups, orbital layers, gravitational hubs, commons assessment scores, value stream routing, pattern relationships, lighthouse brightness. This structure is the intelligence. A RAG system would flatten it into text chunks and lose precisely what makes the knowledge navigable.

The MCP architecture preserves structure. RAG becomes one tool among many:

| Capability | RAG Alone | MCP Architecture |
|:---|:---|:---|
| "Find patterns about resilience" | Keyword/semantic search over body text | `find_patterns(query="resilience")` — searches frontmatter fields, ontology, search hints, AND body text |
| "Show me Orbit 2 commons patterns" | Cannot query by orbital layer | `navigate_orbit(layer=2)` — direct structural query |
| "What patterns does Deutsche Bahn need?" | Might find relevant text | `load_lighthouse(slug="deutsche-bahn")` → reads `relationships.needs` array |
| "Walk the graph from operational-resilience" | Not possible | `traverse_graph(pattern_slug="operational-resilience", depth=2)` — returns typed, weighted edges |
| "Navigate Plan to Fulfill for Deutsche Bahn" | Cannot route through value streams | `navigate_value_stream(lighthouse_slug="deutsche-bahn", stream_name="plan-to-fulfill")` |
| "Diagnose this situation" | Generic text matching | `diagnose(context="...")` — maps situation to dimensions, tensions, orbital layers, specific patterns |

RAG handles the unstructured body text (Sections 1–8 of patterns and lighthouses). The MCP tools handle everything else. Together they form a complete navigation system.

### 1.4 Core Principles

| Principle | Description |
|:---|:---|
| **The commons IS the product** | The knowledge is freely navigable. The open tier gives full access to all patterns and lighthouses. Revenue comes from tools, not from gating knowledge. |
| **Model-agnostic** | Works with any AI that speaks MCP. No vendor lock-in. The client chooses their model. |
| **Structured navigation > document retrieval** | The orbital architecture, value stream routing, and pattern graph are first-class queryable structures, not just text to be searched. |
| **Pattern graph > flat search** | Relationships (manifests_as, enables, requires, alternatives, complementary) are navigable edges, not metadata. |
| **Client sovereignty** | Client data stays in the client's MCP server. The commons provides shared knowledge; the client owns their context. |
| **Carpenter's joint** | Every interface should be clean, honest, and load-bearing. No decorative API surfaces — every tool does real structural work. |

---

## §2 Architecture Overview

### 2.1 Two-Server Architecture

The system consists of two complementary MCP servers with distinct ownership models:

```
+------------------------------------------------------------------+
|                        AI MODEL (any)                             |
|              Claude / GPT / Gemini / Local LLM                   |
+------------------------------------------------------------------+
        |                                         |
        | MCP Protocol                            | MCP Protocol
        v                                         v
+-------------------+                   +---------------------+
| COMMONS MCP       |                   | BLUEPRINT MCP       |
| (operated by      | <--- enrichment-- | (owned by client)   |
|  cloudsters)      | ---shared know--> |                     |
|                   |     ledge         |                     |
| - Pattern Index   |                   | - Private Lighthouse|
| - Graph Index     |                   | - Private Engagement|
| - Embedding Index |                   | - Pattern Adoption  |
| - Lighthouse Index|                   | - Client Knowledge  |
| - Engagement Store|                   |                     |
+-------------------+                   +---------------------+
```

**Commons MCP** is the shared knowledge server, operated by cloudsters. It contains the full pattern library, all public lighthouses, the pattern graph, and the commons engagement tools. It is the commons — open by design, structured by specification.

**Blueprint MCP** is the client's sovereign server, built by cloudsters but owned and operated by the client (or hosted by cloudsters under a data processing agreement). It contains the client's private lighthouse data (version 2+), their private engagement graph, their pattern adoption map, and connects back to the Commons MCP for shared knowledge enrichment.

### 2.2 Data Flow

```
Public Knowledge (commons)          Private Knowledge (client)
==========================          ==========================

28,000+ Patterns ─────────────┐
8+ Lighthouses (public) ──────┤
Pattern Graph ────────────────┼──> COMMONS MCP ──> AI Model <── BLUEPRINT MCP
Value Stream Routing ─────────┤         ^                            |
Embedding Index ──────────────┘         |                            |
                                        └── enrichment ──────────────┘
                                       (shared patterns inform
                                        private diagnostics)

                                      Private Lighthouse (v2+) ──────┐
                                      Private Engagement Graph ──────┤
                                      Pattern Adoption Map ──────────┼──> BLUEPRINT MCP
                                      Client Knowledge Graph ────────┘
```

### 2.3 Interaction Modes

The architecture supports all three interaction modes from the Engagement Graph Spec:

| Mode | How it works with MCP |
|:---|:---|
| **H2H** (Human-to-Human) | A Commons Engineer uses their AI assistant (connected to Commons MCP) to prepare for a meeting, navigate patterns, or build a briefing. The AI is the navigator; the human is the pilot. |
| **H2A** (Human-to-Agent) | A practitioner connects their AI assistant to Commons MCP and asks: "Diagnose my organisation's resilience." The AI invokes `diagnose`, `find_patterns`, `prescribe` — structured tools returning structured results. |
| **A2A** (Agent-to-Agent) | A client's autonomous agent connects to Commons MCP via Blueprint MCP and requests pattern recommendations for a detected tension. No human in the loop. Raw YAML, typed responses, machine-to-machine. |

---

## §3 Commons MCP Server

### 3.1 Purpose

The Commons MCP Server is the public-facing knowledge service for the entire Commons Engineering body of knowledge. It transforms the static workshop repository into a queryable, navigable, composable knowledge system.

### 3.2 Server Metadata

```json
{
  "name": "commons-engineering",
  "version": "0.1.0",
  "description": "Commons Engineering knowledge service — 28,000+ patterns, 8+ lighthouses, pattern graph, value stream routing, orbital navigation.",
  "protocol_version": "2025-03-26"
}
```

### 3.3 Resources (MCP Resources)

MCP Resources are read-only data that the server exposes for context. The Commons MCP exposes:

| Resource URI | Description | Content |
|:---|:---|:---|
| `commons://specs/pattern` | Pattern specification | PATTERN_SPEC v8.2 schema summary |
| `commons://specs/lighthouse-business` | Business lighthouse spec | LIGHTHOUSE_BUSINESS_SPEC v1.0 schema summary |
| `commons://specs/lighthouse-urban` | Urban lighthouse spec | LIGHTHOUSE_URBAN_SPEC v1.0 schema summary |
| `commons://specs/engagement-graph` | Engagement graph spec | ENGAGEMENT_GRAPH_SPEC v0.1 schema summary |
| `commons://taxonomy/orbits` | Orbital layer definitions | The 6 orbital layers with descriptions |
| `commons://taxonomy/dimensions` | Universal Dimensions | The 4 dimensions with their value streams |
| `commons://taxonomy/sectors` | Sector definitions | Life, Business, Urban, Ecology, Universal |
| `commons://stats` | Library statistics | Pattern counts by sector/orbit, lighthouse counts, graph density |

These resources allow the AI model to understand the commons architecture before invoking tools. A model encountering the Commons MCP for the first time can read these resources to orient itself — the same agent discovery path described in ENGAGEMENT_GRAPH_SPEC §4.2.

### 3.4 Tool Catalogue

Tools are organised into five categories, gated by access tier (see §7).

---

#### 3.4.1 Navigation Tools (Tier 0 — OPEN)

**`navigate_orbit`** — List patterns at a given orbital layer.

```typescript
navigate_orbit(
  layer: int,            // 0-5, required
  sector?: string,       // "Life" | "Business" | "Urban" | "Ecology" | "Universal"
  limit?: int,           // default 50, max 500
  offset?: int           // pagination offset, default 0
) → {
  total: int,
  patterns: [{
    slug: string,
    title: string,
    sector: string,
    orbital_layer: int,
    vitality: float,
    summary: string
  }]
}
```

**`find_patterns`** — Combined semantic + structured search across the pattern library.

```typescript
find_patterns(
  query: string,              // natural language query, required
  sector?: string,            // filter by sector
  domain?: string,            // filter by ontology.domain
  orbit_min?: int,            // filter by minimum orbital layer
  orbit_max?: int,            // filter by maximum orbital layer
  vitality_min?: float,       // filter by minimum vitality score
  confidence_min?: int,       // filter by minimum confidence (1-3)
  limit?: int                 // default 20, max 100
) → {
  total: int,
  patterns: [{
    slug: string,
    title: string,
    sector: string,
    orbital_layer: int,
    vitality: float,
    summary: string,
    relevance_score: float,   // combined semantic + structural relevance
    match_source: string      // "frontmatter" | "body" | "both"
  }]
}
```

Search strategy: First, query the structured index (frontmatter fields: `title`, `aliases`, `summary`, `ontology.search_hints`, `context_labels`). Second, query the embedding index (body text semantic search). Third, merge and rank results by combined relevance. The `match_source` field tells the caller whether the match came from structured data, body text, or both.

**`traverse_graph`** — Walk the pattern relationship graph.

```typescript
traverse_graph(
  pattern_slug: string,            // starting pattern, required
  relationship_type?: string,      // "manifests_as" | "enables" | "requires" |
                                   // "alternatives" | "complementary" | "tools" |
                                   // "inferred" | "all" (default: "all")
  direction?: string,              // "outgoing" | "incoming" | "both" (default: "both")
  depth?: int,                     // traversal depth, default 1, max 3
  min_weight?: float               // minimum edge weight, default 0.0
) → {
  root: { slug: string, title: string, orbital_layer: int },
  edges: [{
    source_slug: string,
    target_slug: string,
    relationship: string,          // edge type
    weight: float,
    source_type: string,           // "curated" | "migration" | "graphrag"
    depth: int                     // how many hops from root
  }],
  nodes: [{                        // all nodes encountered in traversal
    slug: string,
    title: string,
    sector: string,
    orbital_layer: int,
    vitality: float
  }]
}
```

**`navigate_value_stream`** — Navigate value streams within a lighthouse.

```typescript
navigate_value_stream(
  lighthouse_slug: string,         // required
  stream_name: string              // one of the 13 business value streams or
                                   // urban equivalents, required
) → {
  lighthouse: { slug: string, name: string, sector: string },
  stream: {
    name: string,
    dimension: string,             // which of the 4 dimensions
    relevance: string,             // from lighthouse relationships.value_streams
    section_number: string,        // body section reference (e.g., "5.2")
    body_excerpt: string           // first 500 chars of the relevant body section
  },
  patterns_exemplified: [{         // patterns the org demonstrates in this stream
    slug: string, title: string, weight: float
  }],
  patterns_needed: [{              // patterns that would improve this stream
    slug: string, title: string, weight: float, note: string
  }]
}
```

---

#### 3.4.2 Lighthouse Tools (Tier 0 — OPEN)

**`load_lighthouse`** — Full lighthouse briefing with structured frontmatter.

```typescript
load_lighthouse(
  slug: string,                    // required
  include_body?: boolean,          // include narrative body, default false
  include_engagement?: boolean     // include engagement summary, default false (Tier 1+)
) → {
  identity: {                      // Group 1
    slug: string, name: string, aliases: string[],
    legal_form: string, ownership: string, founded: int,
    headquarters: { city: string, country: string },
    website: string, summary: string
  },
  position: {                      // Group 0
    orbital_layer: int,
    sector: string,
    urban_lighthouse?: string
  },
  market: { ... },                 // Group 2
  commons_vitality: {              // Group 3
    d1_definition_purpose: float,
    d2_participation_relationship: float,
    d3_proposition_exchange: float,
    d4_production_resilience: float,
    vitality_signal: float, data_quality: int,
    signal_reasoning: string
  },
  relationships: {                 // Group 5
    exemplifies: [{ slug: string, weight: float, orbit: int, evidence: string }],
    needs: [{ slug: string, weight: float, note: string }],
    related_lighthouses: [{ slug: string, weight: float, relationship: string }],
    value_streams: [{ stream: string, relevance: string }]
  },
  body?: string,                   // Full narrative body (if requested)
  engagement_summary?: {           // Tier 1+ only
    status: string,
    engagement_level: int,
    active_explorations: int,
    active_engagements: int
  }
}
```

**`list_lighthouses`** — Browse the lighthouse gallery.

```typescript
list_lighthouses(
  sector?: string,                 // "Business" | "Urban"
  orbit_min?: int,                 // filter by minimum brightness
  orbit_max?: int,                 // filter by maximum brightness
  urban_lighthouse?: string,       // filter by parent urban lighthouse
  limit?: int,                     // default 20, max 100
  sort_by?: string                 // "brightness" | "vitality" | "name" (default: "brightness")
) → {
  total: int,
  lighthouses: [{
    slug: string,
    name: string,
    sector: string,
    orbital_layer: int,
    overall_score: float,
    summary: string,
    industry?: string,
    headquarters?: { city: string, country: string }
  }]
}
```

**`compare_lighthouses`** — Compare multiple lighthouses across dimensions.

```typescript
compare_lighthouses(
  slugs: string[],                 // 2-5 lighthouse slugs, required
  dimension?: string               // "purpose" | "participation" | "proposition" |
                                   // "production" | "all" (default: "all")
) → {
  lighthouses: [{
    slug: string,
    name: string,
    orbital_layer: int
  }],
  comparison: {
    commons_vitality: {            // side-by-side scores
      [slug: string]: {
        d1_definition_purpose: float,
        d2_participation_relationship: float,
        d3_proposition_exchange: float,
        d4_production_resilience: float,
        vitality_signal: float
      }
    },
    shared_patterns: [{            // patterns common to multiple lighthouses
      slug: string, title: string,
      present_in: string[]         // which lighthouse slugs
    }],
    unique_needs: [{               // patterns needed by one but exemplified by another
      slug: string, title: string,
      needed_by: string,
      exemplified_by: string
    }]
  }
}
```

---

#### 3.4.3 Diagnostic Tools (Tier 1 — PEER)

**`diagnose`** — Given a situation description, identify relevant patterns and dimensions.

```typescript
diagnose(
  context: string,                 // situation description, required (500-5000 chars)
  sector?: string,                 // hint: which sector to focus on
  dimension?: string,              // hint: which dimension to focus on
  depth?: string                   // "quick" | "standard" | "deep" (default: "standard")
) → {
  analysis: {
    dimensions_affected: [{
      dimension: string,
      relevance: float,            // 0.0-1.0
      tension_identified: string   // the core tension in this dimension
    }],
    orbital_mapping: {
      principles_relevant: [{ slug: string, title: string, influence: float }],
      commons_patterns: [{ slug: string, title: string, fit: string }],
      domain_patterns: [{ slug: string, title: string, fit: string }]
    },
    value_streams_affected: [{
      stream: string,
      dimension: string,
      severity: string             // "low" | "medium" | "high" | "critical"
    }]
  },
  recommended_next: string[]       // suggested follow-up tool calls
}
```

The diagnose tool works by: (1) Semantic analysis of the context description against the pattern library's `ontology.search_hints.primary_tension` fields. (2) Dimension mapping using the four Universal Dimensions and their value streams. (3) Pattern matching across orbital layers — principles first, then commons patterns, then domain patterns. (4) Returning a structured diagnosis that can be fed into `prescribe`.

**`prescribe`** — Generate implementation guidance for specific patterns in a specific context.

```typescript
prescribe(
  pattern_slugs: string[],        // 1-10 pattern slugs, required
  context: string,                // situation context, required
  lighthouse_slug?: string,       // optional: prescribe for a specific organisation
  depth?: string                  // "overview" | "detailed" (default: "overview")
) → {
  prescription: [{
    pattern: { slug: string, title: string, orbital_layer: int },
    context_fit: float,           // 0.0-1.0 — how well this pattern fits the context
    implementation_guidance: string,  // contextualised guidance (from Section 4 of pattern)
    dependencies: [{              // patterns that must be in place first
      slug: string, title: string, relationship: string
    }],
    value_streams_affected: string[],
    estimated_effort: string,     // "low" | "medium" | "high"
    cognitive_era_notes: string   // from Section 7 of pattern — AI/agent considerations
  }],
  implementation_sequence: string[],  // recommended order of pattern adoption
  standard_offers_relevant: [{        // which cloudsters offers map to this prescription
    offer: string,
    scope: string
  }]
}
```

---

#### 3.4.4 Engagement Tools (Tier 1 — PEER)

These tools operate on the engagement graph (per ENGAGEMENT_GRAPH_SPEC v0.1). At Tier 1, they manage individual practitioner engagements. At Tier 2, they support team-shared engagement workspaces.

**`start_engagement`** — Begin a new engagement graph for a lighthouse.

```typescript
start_engagement(
  lighthouse_slug: string,         // required
  engineer_slug?: string,          // optional: assigned Commons Engineer
  dimension?: string,              // initial focus dimension
  notes?: string                   // initial engagement context
) → {
  engagement_id: string,           // TypeID with eng_ prefix
  lighthouse: { slug: string, name: string },
  status: "planned",
  created: string                  // ISO date
}
```

**`log_signal`** — Log a market signal or touchpoint to an engagement.

```typescript
log_signal(
  engagement_id: string,           // required
  signal: {
    signal_source: string,         // "public_news" | "regulatory_filing" | "job_posting" |
                                   // "inbound_request" | "agent_detection" | "internal_analysis"
    dimension_triggered: string,   // which dimension
    urgency: string,               // "low" | "medium" | "high" | "critical"
    summary: string,               // what happened
    patterns_relevant?: [{
      slug: string,
      relevance: string            // "low" | "medium" | "high" | "critical"
    }],
    expires?: string               // ISO date — when is this signal no longer relevant?
  }
) → {
  signal_id: string,               // TypeID with sig_ prefix
  engagement_id: string,
  status: "logged",
  created: string
}
```

**`engagement_status`** — Current state of an engagement.

```typescript
engagement_status(
  engagement_id: string            // required
) → {
  engagement: {
    id: string,
    lighthouse: { slug: string, name: string },
    status: string,                // "planned" | "active" | "paused" | "completed" | "cancelled"
    created: string,
    last_activity: string
  },
  signals: int,                    // count of logged signals
  explorations: int,               // count of explorations
  blueprints: int,                 // count of blueprints
  pulses: int,                     // count of pulses
  patterns_explored: [{
    slug: string, title: string, fit: string
  }],
  next_action?: string,
  timeline: [{                     // recent activity log
    date: string,
    type: string,                  // "signal" | "exploration" | "blueprint" | "pulse"
    summary: string
  }]
}
```

---

#### 3.4.5 Meta Tools (Tier 0 — OPEN)

**`get_schema`** — Return the full schema definition for any entity type.

```typescript
get_schema(
  entity_type: string              // "pattern" | "lighthouse_business" | "lighthouse_urban" |
                                   // "steward" | "signal" | "exploration" | "blueprint" |
                                   // "engagement" | "pulse"
) → {
  entity_type: string,
  spec_version: string,
  frontmatter_groups: [{
    group_number: int,
    group_name: string,
    fields: [{
      name: string,
      type: string,
      required: boolean,
      description: string
    }]
  }],
  body_sections: [{
    section_number: int,
    section_name: string,
    word_range: string
  }]
}
```

**`library_stats`** — Return current library statistics.

```typescript
library_stats() → {
  patterns: {
    total: int,
    by_sector: { [sector: string]: int },
    by_orbit: { [orbit: int]: int },
    avg_vitality: float
  },
  lighthouses: {
    total: int,
    by_sector: { [sector: string]: int },
    by_orbit: { [orbit: int]: int },
    avg_overall_score: float
  },
  graph: {
    total_edges: int,
    curated_edges: int,
    inferred_edges: int,
    avg_edges_per_pattern: float
  },
  last_updated: string             // ISO date of last index rebuild
}
```

---

## §4 Blueprint MCP Server

### 4.1 Purpose

The Blueprint MCP Server is the client's sovereign knowledge service. It contains their private organisational knowledge — the lighthouse briefing enriched with insider data (version 2+), the private engagement graph, the pattern adoption map, and any client-specific knowledge structures.

The Blueprint MCP is built by cloudsters but **owned by the client**. The client controls where it runs, who has access, and what data it contains. This is the architectural expression of the sovereignty principle.

### 4.2 Deployment Models

| Model | Description | Client Profile |
|:---|:---|:---|
| **cloudsters-hosted** | cloudsters operates the Blueprint MCP on the client's behalf under a data processing agreement. Client data is encrypted at rest, logically isolated, and accessible only through authenticated MCP connections. | Smaller organisations, initial engagements, clients who want managed infrastructure. |
| **client-hosted** | The Blueprint MCP runs on the client's own infrastructure (cloud or on-premises). cloudsters provides the software, configuration, and initial setup; the client operates it. | Enterprises with data sovereignty requirements, regulated industries, clients with existing AI infrastructure. |
| **hybrid** | The shared knowledge layer connects to Commons MCP; the private data layer runs on client infrastructure. A gateway manages the boundary. | Organisations that want commons enrichment but cannot allow private data to leave their network. |

### 4.3 Blueprint MCP Tools

The Blueprint MCP mirrors the Commons MCP tool catalogue but operates on private data. It adds client-specific tools:

**Private Navigation Tools:**
- `find_patterns` — searches both commons patterns AND client-specific pattern annotations
- `traverse_graph` — includes client's private pattern adoption edges

**Private Lighthouse Tools:**
- `load_lighthouse` — returns the full lighthouse including private sections (Groups 4, Section 8)
- `load_engagement_graph` — full engagement graph for a lighthouse (stewards, signals, explorations, blueprints, engagements, pulses)

**Adoption Tools:**
- `adoption_status(pattern_slug)` — where is this pattern in the client's adoption journey?
- `adoption_map(dimension?)` — overview of all pattern adoptions across dimensions
- `adoption_progress(engagement_id)` — track implementation progress for an active engagement

**Enrichment Tools (Commons MCP connection):**
- `enrich_diagnosis(context)` — calls Commons MCP `diagnose` and overlays client-specific context
- `enrich_prescription(pattern_slugs, context)` — calls Commons MCP `prescribe` and adds client-specific implementation notes
- `compare_with_commons(dimension?)` — how does the client's pattern adoption compare to commons benchmarks?

### 4.4 Client ↔ Commons Data Flow

The Blueprint MCP connects to the Commons MCP for shared knowledge enrichment. Data flows in one direction:

```
Commons MCP ──────────────────> Blueprint MCP
(public patterns,                (used for enrichment,
 public lighthouses,              never stored beyond
 shared diagnostics)              session context)

Blueprint MCP ─────────────X──> Commons MCP
(private data NEVER                (no private data
 flows to commons)                  crosses this boundary)
```

The only data that flows from private to commons is **anonymised structural insight** — through the Clean Room process (ENGAGEMENT_GRAPH_SPEC §6.4), not through the MCP protocol. This is a human-governed process with a 6-month cooling period, not an automated data pipeline.

### 4.5 A2A Integration (Tier 3 — ENTERPRISE)

At the Enterprise tier, the Blueprint MCP supports Agent-to-Agent integration. A client's autonomous agents (procurement bots, compliance systems, planning agents) can interact with the Blueprint MCP directly:

- **Protocol adaptation:** The Blueprint MCP detects `interaction_mode: "A2A"` and serves raw structured data without narrative context.
- **Synthetic steward registration:** The client registers their agents as synthetic stewards in the engagement graph.
- **Pattern discovery:** A client agent can query the commons for patterns relevant to a detected tension, without human mediation.
- **Engagement initiation:** A client agent can log signals and initiate explorations when it detects situations that match commons patterns.

This follows the Agent-Native Paradigm from ENGAGEMENT_GRAPH_SPEC §4.

---

## §5 Data Layer

### 5.1 Architecture

The data layer transforms the workshop's Markdown files into queryable indices. The source of truth remains the git repository; the indices are derived, rebuiltable, and disposable.

```
Git Repository (source of truth)
  |
  v
Build Pipeline (parse YAML frontmatter, extract body text)
  |
  +---> Pattern Index (SQLite/DuckDB)
  |       - All frontmatter fields as columns
  |       - One row per pattern (~28,000 rows)
  |
  +---> Graph Index (SQLite/DuckDB)
  |       - Pattern relationships as edges
  |       - Curated (Group 5) + inferred (Group 6)
  |       - Gravitational hub connections
  |       - Lighthouse ↔ pattern links
  |
  +---> Embedding Index (vector store)
  |       - Body text embeddings per pattern
  |       - Body text embeddings per lighthouse section
  |       - Used by find_patterns for semantic search
  |
  +---> Lighthouse Index (SQLite/DuckDB)
  |       - All lighthouse frontmatter fields
  |       - One row per lighthouse
  |       - Value stream routing tables
  |
  +---> Engagement Store (SQLite/DuckDB)
          - Engagement graph entities
          - Per ENGAGEMENT_GRAPH_SPEC schema
          - Tier 1+ only
```

### 5.2 Pattern Index

The Pattern Index is a relational table with columns derived from the PATTERN_SPEC v8.2 frontmatter groups:

```sql
CREATE TABLE patterns (
  -- Group 0: Architectural Position
  id              TEXT PRIMARY KEY,    -- TypeID (pat_...)
  orbital_layer   INTEGER NOT NULL,    -- 0-5
  sector          TEXT NOT NULL,       -- Life | Business | Urban | Ecology | Universal

  -- Group 1: Core Identity
  slug            TEXT UNIQUE NOT NULL,
  title           TEXT NOT NULL,
  aliases         TEXT,                -- JSON array
  summary         TEXT NOT NULL,

  -- Group 2: Contextual Translation
  context_labels  TEXT,                -- JSON object

  -- Group 3: Ontology & Vitality
  domain          TEXT,
  cross_domains   TEXT,                -- JSON array
  primary_tension TEXT,
  vector_keywords TEXT,                -- JSON array
  stakeholder_architecture INTEGER,
  value_creation  INTEGER,
  resilience      INTEGER,
  ownership       INTEGER,
  autonomy        INTEGER,
  composability   INTEGER,
  fractal_value   INTEGER,
  vitality        REAL,
  overall_score   REAL,

  -- Group 4: Lifecycle
  status          TEXT,                -- experimental | stable | mature | deprecated
  version         REAL,
  confidence      INTEGER,            -- 1-3

  -- Group 7: Provenance
  contributors    TEXT,                -- JSON array
  license         TEXT,

  -- Derived
  body_hash       TEXT,                -- for cache invalidation
  indexed_at      TEXT                 -- ISO timestamp
);
```

### 5.3 Graph Index

The Graph Index stores all relationships as typed, weighted, directed edges:

```sql
CREATE TABLE edges (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  source_id       TEXT NOT NULL,        -- TypeID of source entity
  source_slug     TEXT NOT NULL,
  target_id       TEXT NOT NULL,        -- TypeID of target entity
  target_slug     TEXT NOT NULL,
  relationship    TEXT NOT NULL,        -- manifests_as | enables | requires |
                                       -- alternatives | complementary | tools |
                                       -- exemplifies | needs | gravitational_hub |
                                       -- related_lighthouse | inferred
  weight          REAL DEFAULT 0.5,    -- 0.0-1.0
  source_type     TEXT NOT NULL,        -- curated | migration | graphrag
  entity_context  TEXT,                 -- "pattern" | "lighthouse" | "engagement"

  FOREIGN KEY (source_id) REFERENCES patterns(id),
  FOREIGN KEY (target_id) REFERENCES patterns(id)
);

CREATE INDEX idx_edges_source ON edges(source_slug);
CREATE INDEX idx_edges_target ON edges(target_slug);
CREATE INDEX idx_edges_relationship ON edges(relationship);
```

Gravitational hub connections (Group 0 `gravitational_hubs`) are stored as edges with `relationship = "gravitational_hub"`. Lighthouse pattern links (`exemplifies`, `needs`) are stored as edges with `entity_context = "lighthouse"`.

### 5.4 Embedding Index

The Embedding Index stores vector embeddings of body text for semantic search. Technology choice is deliberately flexible:

| Option | Pros | Cons |
|:---|:---|:---|
| **SQLite + sqlite-vss** | Single-file, zero-config, consistent with other indices | Newer extension, limited query features |
| **DuckDB + vss** | Analytical query strength, can join with structured data | Heavier runtime |
| **Qdrant** | Purpose-built, production-grade vector search | Separate service to operate |
| **In-memory (FAISS)** | Fast, simple, no persistence needed for read-only | Rebuild on every restart |

For the MVP, the recommendation is **SQLite + sqlite-vss** for simplicity and consistency. The embedding generation uses the same model as the AI client (or a dedicated embedding model — see Open Questions §10).

### 5.5 Lighthouse Index

The Lighthouse Index parallels the Pattern Index, with columns from LIGHTHOUSE_BUSINESS_SPEC v1.0 and LIGHTHOUSE_URBAN_SPEC v1.0:

```sql
CREATE TABLE lighthouses (
  -- Group 0: Position
  id              TEXT PRIMARY KEY,
  conforms_to     TEXT NOT NULL,
  orbital_layer   INTEGER NOT NULL,
  sector          TEXT NOT NULL,
  urban_lighthouse TEXT,

  -- Group 1: Identity
  slug            TEXT UNIQUE NOT NULL,
  name            TEXT NOT NULL,
  aliases         TEXT,                -- JSON array
  legal_form      TEXT,
  ownership       TEXT,
  founded         INTEGER,
  headquarters_city TEXT,
  headquarters_country TEXT,
  website         TEXT,
  summary         TEXT NOT NULL,

  -- Group 2: Market
  industry        TEXT,
  segment         TEXT,
  geography       TEXT,                -- JSON array
  revenue_eur     REAL,
  employees       INTEGER,

  -- Group 3: Commons Assessment
  stakeholder_architecture INTEGER,
  value_creation  INTEGER,
  resilience      INTEGER,
  ownership_score INTEGER,
  autonomy        INTEGER,
  composability   INTEGER,
  fractal_value   INTEGER,
  vitality        REAL,
  overall_score   REAL,

  -- Group 4: Account (private — Tier 1+ queries only)
  account_status  TEXT,
  publication     TEXT,
  engagement_level INTEGER,

  -- Derived
  body_hash       TEXT,
  indexed_at      TEXT
);

CREATE TABLE lighthouse_value_streams (
  lighthouse_slug TEXT NOT NULL,
  stream_name     TEXT NOT NULL,
  dimension       TEXT NOT NULL,
  relevance       TEXT,                -- "low" | "medium" | "high" | "critical"
  section_ref     TEXT,                -- body section reference

  PRIMARY KEY (lighthouse_slug, stream_name),
  FOREIGN KEY (lighthouse_slug) REFERENCES lighthouses(slug)
);
```

### 5.6 Engagement Store

The Engagement Store follows the entity architecture from ENGAGEMENT_GRAPH_SPEC v0.1. Each entity type gets its own table:

```sql
CREATE TABLE engagements (
  id                TEXT PRIMARY KEY,   -- TypeID with eng_ prefix
  target_lighthouse TEXT NOT NULL,      -- lighthouse TypeID
  status            TEXT NOT NULL,
  interaction_mode  TEXT NOT NULL,      -- H2H | H2A | A2A
  dimension_served  TEXT,
  created           TEXT NOT NULL,
  updated           TEXT NOT NULL,

  FOREIGN KEY (target_lighthouse) REFERENCES lighthouses(id)
);

-- Separate tables for stewards, signals, explorations,
-- blueprints, pulses — each following their entity schema
-- from ENGAGEMENT_GRAPH_SPEC §3.1–3.6
```

### 5.7 Index Build Pipeline

The index build pipeline runs as a standalone process (Python or TypeScript) that:

1. Scans the git repository for all `.md` files in `_patterns/`, `_lighthouses/`, and engagement folders.
2. Parses YAML frontmatter using a schema-aware parser that validates against the relevant spec.
3. Extracts body text and generates embeddings.
4. Builds/updates the SQLite/DuckDB indices.
5. Reports validation errors and coverage statistics.

The pipeline is **idempotent** — running it twice produces the same result. It uses file hashes to detect changes and only rebuilds what has changed.

```
git repository ──> parse_frontmatter.py ──> validate_schema.py ──> build_indices.py
                                                                       |
                                              +------------------------+
                                              |            |           |
                                        pattern_index  graph_index  embedding_index
                                        lighthouse_index  engagement_store
```

---

## §6 Tool Catalogue Summary

### 6.1 Complete Tool Registry

| Tool | Category | Tier | Input | Output |
|:---|:---|:---|:---|:---|
| `navigate_orbit` | Navigation | 0 (OPEN) | layer, sector?, limit? | Pattern list at orbital layer |
| `find_patterns` | Navigation | 0 (OPEN) | query, sector?, domain?, orbit?, vitality? | Ranked pattern list |
| `traverse_graph` | Navigation | 0 (OPEN) | pattern_slug, relationship?, depth? | Graph subgraph (nodes + edges) |
| `navigate_value_stream` | Navigation | 0 (OPEN) | lighthouse_slug, stream_name | Value stream detail + patterns |
| `load_lighthouse` | Lighthouse | 0 (OPEN) | slug, include_body?, include_engagement? | Full lighthouse record |
| `list_lighthouses` | Lighthouse | 0 (OPEN) | sector?, orbit?, urban_lighthouse? | Lighthouse gallery |
| `compare_lighthouses` | Lighthouse | 0 (OPEN) | slugs, dimension? | Side-by-side comparison |
| `diagnose` | Diagnostic | 1 (PEER) | context, sector?, dimension?, depth? | Structured diagnosis |
| `prescribe` | Diagnostic | 1 (PEER) | pattern_slugs, context, lighthouse? | Implementation guidance |
| `start_engagement` | Engagement | 1 (PEER) | lighthouse_slug, engineer? | New engagement record |
| `log_signal` | Engagement | 1 (PEER) | engagement_id, signal | Logged signal record |
| `engagement_status` | Engagement | 1 (PEER) | engagement_id | Engagement state + timeline |
| `get_schema` | Meta | 0 (OPEN) | entity_type | Schema definition |
| `library_stats` | Meta | 0 (OPEN) | (none) | Library statistics |

### 6.2 Tool Composition Patterns

The tools are designed to be composed in natural conversational flows. Example chains:

**Discovery flow:**
```
library_stats()
  → navigate_orbit(layer=2)              # browse commons patterns
  → traverse_graph("mutual-accountability", depth=2)  # explore neighbourhood
  → find_patterns("stakeholder governance in rail")    # targeted search
```

**Diagnostic flow:**
```
diagnose(context="Our infrastructure maintenance backlog...", sector="Business")
  → find_patterns(query, orbit_max=2)      # find commons patterns for identified tensions
  → prescribe(["operational-resilience", "subsidiarity-governance"], context)
```

**Lighthouse flow:**
```
list_lighthouses(sector="Business", orbit_max=3)
  → load_lighthouse("deutsche-bahn")
  → navigate_value_stream("deutsche-bahn", "plan-to-fulfill")
  → compare_lighthouses(["deutsche-bahn", "sncf"], dimension="production")
```

**Engagement flow:**
```
start_engagement(lighthouse_slug="deutsche-bahn")
  → log_signal(engagement_id, signal)
  → diagnose(context)
  → prescribe(pattern_slugs, context, lighthouse_slug="deutsche-bahn")
  → engagement_status(engagement_id)
```

---

## §7 Access Tiers & Revenue

### 7.1 Tier Architecture

The access tiers follow the cloudsters value ladder. Each tier includes all capabilities of the tiers below it.

| Tier | Name | Audience | Price Model | Key Capabilities |
|:---|:---|:---|:---|:---|
| **0** | **COMMONS OPEN** | Anyone | Free | Full pattern library, full lighthouse gallery, all navigation tools, graph traversal, schema access |
| **1** | **PEER** | Individual practitioner | Subscription (monthly/annual) | + Diagnostic tools (diagnose, prescribe), + Engagement tools (personal workspace), + API access |
| **2** | **TEAM** | Team of practitioners | Team subscription | + Shared engagement workspace, + Team engagement graphs, + Collaborative diagnostics, + Team analytics |
| **3** | **ENTERPRISE** | Organisations | Enterprise agreement | + Blueprint MCP integration, + A2A agent integration, + Custom enrichment, + Dedicated support |

### 7.2 The Free Tier Is Not a Teaser

The COMMONS OPEN tier gives full access to all knowledge. Every pattern. Every lighthouse. Every relationship. The full graph. This is not a marketing strategy — it is the commons principle made operational. The knowledge IS the commons; gating it would betray the architecture.

What the free tier does not include is **tools that require computation and state**: diagnostics (which combine multiple knowledge sources into a synthesis), engagement management (which requires persistent storage), and integration capabilities (which require infrastructure).

### 7.3 Metering Model

**Subscription + connection. No token counting. No per-query billing.**

| What is metered | How |
|:---|:---|
| **Tier access** | Subscription (monthly or annual) |
| **Connection** | Active MCP connection (one connection per subscription; additional connections for team/enterprise) |
| **Usage** | Not metered per query — use as much as you need |
| **Storage** | Engagement data storage included in subscription; large volumes at enterprise tier may incur storage fees |

The metering model is intentionally simple. Per-query billing creates perverse incentives (users avoid asking questions to save money). Per-token billing is opaque (users cannot predict costs). Subscription + connection is honest: you know what you pay, and you use it as much as you want.

### 7.4 Revenue Model

```
Tier 0 (OPEN)       → Free — the commons grows through use and contribution
Tier 1 (PEER)       → ~EUR 29-49/month individual subscription
Tier 2 (TEAM)       → ~EUR 99-199/month per team (up to 10 seats)
Tier 3 (ENTERPRISE) → Custom pricing — Blueprint MCP setup + ongoing enrichment
```

Revenue scales with value delivered:
- **Tier 1:** An individual practitioner gets AI-powered commons diagnostics and engagement management — worth multiples of the subscription in saved research and structuring time.
- **Tier 2:** A team gets shared situational awareness across engagements — the engagement graph becomes a team intelligence tool.
- **Tier 3:** An organisation gets a sovereign knowledge service connected to the global commons — Standard Offers #4 (Context Engine Deployment) and #5 (Graph-to-Graph Handshake) are delivered through this tier.

### 7.5 Mapping to Standard Offers

The MCP tiers map naturally to the Standard Offers from ENGAGEMENT_GRAPH_SPEC §5:

| Standard Offer | MCP Tier | Delivery |
|:---|:---|:---|
| #1 Baseline Blueprint | Tier 1-2 | Commons MCP diagnostic tools produce the blueprint diagnostic |
| #2 Pattern Injection | Tier 2-3 | Commons MCP prescribe tools guide the injection; Blueprint MCP tracks adoption |
| #3 Governance Shift | Tier 3 | Blueprint MCP as the ongoing governance intelligence layer |
| #4 Context Engine Deployment | Tier 3 | The Blueprint MCP IS the context engine — deployed for the client |
| #5 Graph-to-Graph Handshake | Tier 3 | Blueprint MCP ↔ Commons MCP connection is the handshake |
| #6 Agentic Governance Alignment | Tier 3 | A2A integration through Blueprint MCP |

---

## §8 Security & Sovereignty

### 8.1 Authentication

| Tier | Auth Method |
|:---|:---|
| **Tier 0 (OPEN)** | No authentication required. Rate-limited by IP/connection. |
| **Tier 1 (PEER)** | API key (issued on subscription). Key identifies the subscriber and gates tool access. |
| **Tier 2 (TEAM)** | API key per team member + team identifier. Shared engagement workspace scoped to team. |
| **Tier 3 (ENTERPRISE)** | OAuth 2.0 / mutual TLS for A2A. API keys for human users. Blueprint MCP authenticates to Commons MCP with service credentials. |

### 8.2 Data Classification

| Data Class | Examples | Storage | Access |
|:---|:---|:---|:---|
| **Public Commons** | Patterns, public lighthouse sections (1-7), pattern graph, value streams | Commons MCP indices (derived from public git repo) | Tier 0+ |
| **Gated Commons** | Lighthouse Section 8 (Business Potential), diagnostic syntheses | Commons MCP (access-controlled) | Tier 1+ |
| **Private Guild** | Lighthouse Group 4 (Account Lifecycle), engagement graph | Commons MCP engagement store (logically isolated per subscriber) | Tier 1+ (own data only) |
| **Sovereign Client** | Private lighthouse data, private engagement graph, pattern adoption map | Blueprint MCP (client infrastructure or cloudsters-hosted with DPA) | Tier 3 (client only) |

### 8.3 Data Sovereignty Principles

1. **Public knowledge stays public.** All patterns and public lighthouse sections are freely accessible. The MCP does not gate what the git repository already publishes.
2. **Private data stays private.** Subscriber engagement data is logically isolated. No subscriber can access another subscriber's data. No aggregate analytics are derived from private data without explicit consent.
3. **Client data is sovereign.** Blueprint MCP data never flows to Commons MCP. The only data path is commons → client (enrichment). The reverse path (client → commons) is a human-governed Clean Room process per ENGAGEMENT_GRAPH_SPEC §6.4.
4. **No model training on private data.** Private engagement data and Blueprint MCP data are not used for model training, embedding model fine-tuning, or any form of machine learning that would leak information across boundaries.

### 8.4 Rate Limiting

| Tier | Rate Limit | Rationale |
|:---|:---|:---|
| **Tier 0** | 60 requests/minute, 1000 requests/day | Prevents abuse while allowing genuine exploration |
| **Tier 1** | 300 requests/minute, no daily limit | Professional use requires sustained access |
| **Tier 2** | 300 requests/minute per seat, no daily limit | Team scale |
| **Tier 3** | Custom — negotiated per enterprise agreement | Enterprise scale |

### 8.5 Audit Trail

All tool invocations at Tier 1+ are logged with:
- Timestamp
- Subscriber/team identifier (not personal identity for OPEN tier)
- Tool name and parameters (with private data redacted in logs)
- Response status (success/error)
- Latency

Logs are retained for 90 days. Subscribers can request their own logs. No cross-subscriber log analysis is performed.

---

## §9 Implementation Roadmap

### Phase 1: MVP — Pattern Navigation + Lighthouse Browsing

**Goal:** A working Commons MCP Server that exposes the full pattern library and lighthouse gallery with structured navigation tools.

**Scope:**
- Index build pipeline (parse all patterns and lighthouses into SQLite)
- Navigation tools: `navigate_orbit`, `find_patterns` (structured search only — no embeddings yet), `traverse_graph`
- Lighthouse tools: `load_lighthouse`, `list_lighthouses`
- Meta tools: `get_schema`, `library_stats`
- Tier 0 (OPEN) only — no authentication, no engagement tools
- MCP server running locally (stdio transport) for development and testing

**Technology:**
- Python (FastMCP or official MCP Python SDK)
- SQLite for pattern and graph indices
- Git repo as data source (local clone)

**Deliverables:**
- `commons-mcp/` repository with server implementation
- `scripts/build_index.py` — index build pipeline
- `tests/` — tool integration tests using the actual workshop data
- Documentation: tool reference, setup guide

**Milestone:** A Commons Engineer can connect Claude Desktop to the Commons MCP Server and have a natural conversation that navigates patterns, browses lighthouses, and traverses the graph — all from structured data, not document retrieval.

**Timeline estimate:** 4-6 weeks from start.

---

### Phase 2: Semantic Search + Diagnostics

**Goal:** Add embedding-based semantic search and the diagnostic tools (diagnose, prescribe).

**Scope:**
- Embedding index build (body text embeddings for all patterns and lighthouses)
- Enhanced `find_patterns` with semantic search component
- Diagnostic tools: `diagnose`, `prescribe`
- `navigate_value_stream` (requires body text access for section excerpts)
- `compare_lighthouses`
- Tier 1 (PEER) authentication with API keys

**Technology:**
- Embedding model: TBD (see Open Questions §10)
- SQLite + sqlite-vss or FAISS for vector search
- API key management (simple key-based auth)

**Deliverables:**
- Embedding generation pipeline
- Diagnostic tool implementations
- Tier 1 authentication middleware
- Hosted MCP server (SSE transport) for remote access

**Milestone:** A practitioner can describe a situation, receive a structured diagnosis mapped to commons dimensions and patterns, and get contextualised implementation guidance.

**Timeline estimate:** 4-6 weeks after Phase 1.

---

### Phase 3: Engagement Tools

**Goal:** Add the engagement graph tools — signal logging, exploration management, engagement tracking.

**Scope:**
- Engagement store (persistent storage for engagement entities)
- Engagement tools: `start_engagement`, `log_signal`, `engagement_status`
- Additional engagement entity management (explorations, blueprints, pulses)
- Tier 2 (TEAM) — shared engagement workspaces

**Technology:**
- SQLite for engagement store (per-subscriber isolation)
- Team management layer

**Deliverables:**
- Engagement store implementation
- Engagement tool suite
- Team workspace management
- Engagement analytics (basic)

**Milestone:** A Commons Engineer can manage their full engagement lifecycle — from signal to exploration to blueprint to engagement — through their AI assistant connected to the Commons MCP.

**Timeline estimate:** 4-6 weeks after Phase 2.

---

### Phase 4: Blueprint MCP

**Goal:** Launch the Blueprint MCP Server for enterprise clients.

**Scope:**
- Blueprint MCP server implementation (mirrors Commons MCP tools on private data)
- Blueprint MCP ↔ Commons MCP enrichment connection
- Adoption tracking tools
- A2A integration framework
- Tier 3 (ENTERPRISE) authentication and deployment

**Technology:**
- Containerised deployment (Docker) for client-hosted scenarios
- OAuth 2.0 / mutual TLS for A2A
- Managed hosting option (cloudsters infrastructure)

**Deliverables:**
- Blueprint MCP server package
- Deployment guide (client-hosted and cloudsters-hosted)
- A2A integration documentation
- First enterprise pilot

**Milestone:** An enterprise client has their own Blueprint MCP running, connected to Commons MCP for enrichment, with their private lighthouse data, engagement graph, and pattern adoption map navigable through their AI assistant of choice.

**Timeline estimate:** 8-12 weeks after Phase 3.

---

### Phase Summary

| Phase | Focus | Tier | Timeline | Key Milestone |
|:---|:---|:---|:---|:---|
| **1** | Pattern navigation + lighthouse browsing | 0 (OPEN) | Q2 2026 | First working MCP server with structured navigation |
| **2** | Semantic search + diagnostics | 0-1 | Q2-Q3 2026 | Diagnostic tools + subscription launch |
| **3** | Engagement tools | 0-2 | Q3 2026 | Full engagement lifecycle management |
| **4** | Blueprint MCP | 0-3 | Q4 2026 | Enterprise client pilot |

---

## §10 Open Questions

The following questions require deliberation before or during implementation. Each is tagged with the phase where the decision is needed.

### 10.1 Embedding Model Choice (Phase 2)

**Question:** Which embedding model should generate the body text embeddings for semantic search?

**Options:**
- **Claude embeddings (Anthropic):** Consistent with the primary AI partner, but creates vendor dependency for the embedding layer.
- **OpenAI text-embedding-3-small/large:** Well-established, good quality, but again vendor-dependent.
- **Open-source (e.g., BGE, Nomic, E5):** Self-hosted, no vendor dependency, but requires infrastructure.
- **Model-agnostic approach:** Generate embeddings with multiple models and let the client's model choose which index to query.

**Consideration:** The MCP protocol is model-agnostic, but the embedding index is model-specific. If we generate embeddings with Claude's model, a client using GPT gets degraded semantic search. Should we offer multiple embedding indices? Or is a single, high-quality open-source embedding model the right answer?

### 10.2 MCP Transport (Phase 1-2)

**Question:** Which MCP transport should the Commons MCP server use?

**Options:**
- **stdio (local):** For development and local-only use. The MCP server runs as a subprocess of the AI client.
- **SSE (Server-Sent Events):** For hosted deployment. The MCP server runs as an HTTP service; the AI client connects over the network.
- **Streamable HTTP:** The newest MCP transport, designed for production deployments with authentication and routing.

**Recommendation:** Start with stdio for Phase 1 (local development), move to SSE or Streamable HTTP for Phase 2+ (hosted deployment).

### 10.3 Index Freshness (Phase 1)

**Question:** How fresh should the indices be?

**Options:**
- **On-demand rebuild:** Run the build pipeline manually when patterns/lighthouses change.
- **Git-hook rebuild:** Trigger index rebuild on every push to the workshop repo.
- **Periodic rebuild:** Rebuild indices on a schedule (e.g., nightly).
- **Incremental rebuild:** Only rebuild indices for files that have changed since the last build.

**Consideration:** With 28,000+ patterns, a full rebuild may take significant time. Incremental rebuild is more complex to implement but necessary at scale. For the MVP, on-demand rebuild is probably sufficient.

### 10.4 Diagnostic Tool Implementation (Phase 2)

**Question:** How should `diagnose` and `prescribe` work internally?

**Options:**
- **Pure structured matching:** The tools query the indices (frontmatter fields, graph relationships) and return structured results. The AI model does the synthesis.
- **LLM-assisted synthesis:** The tools invoke a secondary LLM call internally to synthesise the structured data into a diagnosis. This adds latency and cost but produces richer results.
- **Hybrid:** Structured matching for the data retrieval, with optional LLM synthesis for the narrative layer.

**Consideration:** MCP tools are expected to be fast and deterministic. Adding an LLM call inside a tool makes the tool non-deterministic and slower. The recommendation is pure structured matching — let the AI model that invoked the tool do the synthesis.

### 10.5 Engagement Data Persistence (Phase 3)

**Question:** Where should engagement data live?

**Options:**
- **In the git repository:** Engagement entities are Markdown files in the lighthouse folders (per ENGAGEMENT_GRAPH_SPEC). The MCP server reads/writes to the repo.
- **In a separate database:** Engagement data lives in SQLite/PostgreSQL, separate from the git repository. The MCP server manages it directly.
- **Hybrid:** Engagement data starts in the database for speed, and is periodically synced to the git repository for persistence and audit.

**Consideration:** The ENGAGEMENT_GRAPH_SPEC defines engagement entities as Markdown files in the git repository. This is the canonical design. But MCP tools need fast read/write — git operations are slow for real-time interaction. The hybrid approach may be the right answer: database for hot data, git for cold persistence.

### 10.6 Team Workspace Architecture (Phase 3)

**Question:** How should team-shared engagement workspaces work?

**Options:**
- **Shared database:** All team members read/write to the same engagement store, scoped by team identifier.
- **Per-member with sync:** Each team member has their own engagement store, with real-time sync to a shared view.
- **Git-native:** Team members collaborate through the git repository (branches, PRs) with the MCP server as a read/write interface.

### 10.7 Pricing Validation (Phase 2)

**Question:** Are the proposed price points (EUR 29-49/month PEER, EUR 99-199/month TEAM) viable?

**Consideration:** The price must be high enough to cover infrastructure costs and generate revenue, but low enough that individual practitioners can justify it. Comparable services (Notion AI, GitHub Copilot, specialised SaaS tools) provide reference points. The open tier must be genuinely useful — if the free tier feels crippled, it damages the commons principle.

### 10.8 Pattern Update Propagation (Phase 1+)

**Question:** When a pattern's frontmatter changes in the git repository, how does this propagate to active engagements and diagnostic results?

**Consideration:** If a pattern's vitality score changes, does that retroactively affect past diagnoses? If a pattern's relationships change, do active engagement graphs update? The recommendation is: indices rebuild from source of truth; past diagnoses are snapshots, not live views; active engagements reference pattern slugs (stable identifiers), not volatile scores.

### 10.9 Offline / Local-First (Phase 1)

**Question:** Should the Commons MCP Server support fully offline operation?

**Consideration:** A Commons Engineer working from a camper (or a conference without Wi-Fi) should still have access to the full pattern library. The stdio transport with local SQLite indices supports this naturally. The question is whether to optimise for this use case (e.g., a bundled distribution with pre-built indices) or treat it as a secondary scenario.

**Recommendation:** The local-first architecture (SQLite indices from git repo) is inherently offline-capable. Phase 1 should ensure this works cleanly. Hosted deployment (Phase 2+) adds online capabilities but should not remove offline ones.

### 10.10 Commons MCP as MCP Gateway (Future)

**Question:** Should the Commons MCP eventually act as a gateway to other MCP servers in the commons ecosystem?

**Consideration:** As the Commons Engineering ecosystem grows, there may be multiple MCP servers: one for patterns, one for lighthouses, one for urban data, one for ecological data. The Commons MCP could become a gateway that routes tool calls to the appropriate backend. This is a future architecture decision, but the tool naming should be designed to support it (e.g., namespace prefixes).

---

## Appendix A: Glossary

| Term | Definition |
|:---|:---|
| **MCP** | Model Context Protocol — open standard for connecting AI models to external tools and data |
| **Commons MCP** | The shared knowledge server operated by cloudsters |
| **Blueprint MCP** | The client's sovereign knowledge server |
| **Pattern** | A reusable solution to a recurring problem, structured per PATTERN_SPEC v8.2 |
| **Lighthouse** | A structured briefing about an organisation (business) or settlement (urban) |
| **Engagement Graph** | The lifecycle graph of a relationship — from signal to delivery |
| **Orbital Layer** | A pattern's distance from first principles (0=Singularity to 5=Edge) |
| **Brightness** | A lighthouse's commons alignment strength (0=Beacon to 5=Dark) |
| **Value Stream** | One of 13 business or urban value creation flows (Process-to-State grammar) |
| **Gravitational Hub** | An Orbit 0-2 principle that attracts higher-orbit patterns |
| **TypeID** | Unique identifier with entity-type prefix (pat_, lh_, sig_, etc.) |
| **Clean Room** | The process of anonymising private engagement knowledge for public commons return |

## Appendix B: Related Specifications

| Spec | Version | Role in MCP Architecture |
|:---|:---|:---|
| PATTERN_SPEC.md | v8.2 | Defines the schema for the pattern index — all frontmatter groups become queryable columns |
| LIGHTHOUSE_BUSINESS_SPEC.md | v1.0 | Defines the schema for the business lighthouse index and value stream routing |
| LIGHTHOUSE_URBAN_SPEC.md | v1.0 | Defines the schema for the urban lighthouse index |
| ENGAGEMENT_GRAPH_SPEC.md | v0.1 | Defines the entity architecture for the engagement store and the agent-native paradigm |
| COMMONS_TAXONOMY_MANIFEST.md | current | Defines the gravitational architecture and orbital model that the navigation tools expose |

## Appendix C: MCP Protocol Reference

The Model Context Protocol specification (2025) defines three core primitives:

1. **Resources** — Read-only data that the server exposes. Used for static context (schema definitions, library statistics).
2. **Tools** — Functions that the server exposes for the AI model to invoke. Used for all active navigation, diagnosis, and engagement operations.
3. **Prompts** — Pre-built prompt templates that the server suggests. Could be used for guided workflows (e.g., "Start a lighthouse diagnostic" prompt template).

The Commons MCP primarily uses **Resources** (§3.3) and **Tools** (§3.4). Prompts are a future consideration for guided workflows.

Transport options:
- **stdio:** Local subprocess communication. Best for development and offline use.
- **SSE (Server-Sent Events):** HTTP-based streaming. Good for hosted deployment.
- **Streamable HTTP:** Production transport with full authentication support. Target for Phase 2+.
