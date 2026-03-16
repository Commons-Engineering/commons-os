# Lighthouse Urban Specification (v1.2)

**Version:** 1.2
**Status:** Specification
**Companion:** LIGHTHOUSE_BUSINESS_SPEC.md (v1.2), PATTERN_SPEC.md (v8.2), URBAN_ENGINEERING_MANIFEST.md (v1.0), LIGHTHOUSE_ARCHETYPE_TAXONOMY.md (v1.2)

---

## 1. Purpose: A Lighthouse for Every Settlement

This specification defines the format for **Urban Lighthouses** in the Commons Engineering library. An urban lighthouse is a structured briefing about a living settlement — its purpose, its agents, its offers, and its operations — viewed through the lens of the Urban Purpose Spiral and scored for commons alignment.

Where a **pattern** describes a practice (how something is done), and a **business lighthouse** describes an organisation (who does things), an **urban lighthouse** describes a **settlement** (the place where things are done together). Every urban lighthouse is simultaneously:

1. **A briefing** — a comprehensive, permissionlessly produced portrait of a settlement's living system.
2. **An account record** — a CRM-like artifact tracking engagement potential for Urban Engineers and Commons Incubators.
3. **A pattern anchor** — connecting a settlement's real-world conditions to the urban pattern library, making the library actionable.
4. **A nesting frame** — the geographic container within which business lighthouses are situated, revealing the commons density of a place.

### 1.1 The Permissionless Principle

Urban lighthouses are produced **without the settlement's involvement**. They are assembled from publicly available information — municipal reports, statistical databases, press releases, governance documents, academic publications, news, and web presence. This is the entry product: an Urban Engineer creates an urban briefing as an act of professional generosity, demonstrating the systems intelligence of the Urban Purpose Spiral before requesting any engagement.

The quality of a permissionless briefing — produced from the same public information anyone could access, but structured with the insight of the Urban Purpose Spiral — is the proof of the model. If the briefing is good enough that the settlement's governance actors recognise themselves in it and see systemic connections they hadn't articulated, that is the beginning of a relationship.

### 1.2 The Coastline Metaphor

The coastline metaphor extends naturally from business to urban lighthouses. If business lighthouses mark where individual organisations meet the commons sea, urban lighthouses mark where **entire communities** meet it. An urban lighthouse illuminates the settlement as a living system — not a collection of services or a governance hierarchy, but a complex, adaptive, multi-generational commons.

### 1.3 Brightness as Orbit

An urban lighthouse's **brightness** (orbital layer) describes how strongly its light shines, following the same 0–5 scale as business lighthouses:

| Orbital Layer | Lighthouse Character | What it means |
|:---|:---|:---|
| 0 | **Beacon** — The exemplar. Its light defines what a living urban commons can be. | Deep, structural commons alignment across all four dimensions. |
| 1 | **Bright** — Deeply commons-aligned. Proven, structural, replicable. | Strong commons alignment with evidence across most dimensions. |
| 2 | **Steady** — Strong commons potential. The attractor state. | Clear commons alignment in key areas; genuine potential in others. |
| 3 | **Visible** — Bridging conventional governance and commons. Mixed signals. | Some commons practices present; significant gaps remain. |
| 4 | **Distant** — Conventional municipality within administrative defaults. | Functions well but few connections to commons patterns. |
| 5 | **Dark** — Unexamined. First contact. The light hasn't been lit yet. | No assessed commons alignment. The briefing itself begins illumination. |

**Brightness is emergent, not assigned.** An urban lighthouse's orbit is determined by the quantity and strength of its relationships to **Orbit 2 urban commons patterns** — the same mechanism as business lighthouses. The fewer Orbit 2 pattern links, the darker its light.

### 1.4 The Urban ↔ Business Nesting

Urban lighthouses serve as **geographic containers** for business lighthouses. A business lighthouse's `urban_lighthouse` frontmatter field points to the urban lighthouse of the settlement where the organisation is headquartered. This creates a bidirectional graph:

- **Top-down:** An urban lighthouse reveals the commons density of a place — how many business lighthouses are nested within it, and how bright they are.
- **Bottom-up:** A business lighthouse reveals its geographic context — the settlement's living system within which the organisation operates.

```
Urban Lighthouse: luebeck
  +-- Business Lighthouse: draegerwerk (urban_lighthouse: luebeck)
  +-- Business Lighthouse: possehl (urban_lighthouse: luebeck)
  +-- Business Lighthouse: niederegger (urban_lighthouse: luebeck)
```

This nesting enables geographic queries ("show me all business lighthouses in Lubeck") and systemic analysis ("how does the settlement's commons health correlate with its enterprise ecosystem's commons alignment?").

---

## 2. The Core Principle: Write Once, Render Richly

Identical to LIGHTHOUSE_BUSINESS_SPEC v1.0 and PATTERN_SPEC v8.2:

- **Author Focus:** Write the briefing narrative along the Urban Purpose Spiral.
- **Machine Focus:** Structure all scoring, relationships, and account data in YAML frontmatter. **The frontmatter is the machine-readable API surface.** Agents — human or synthetic — parse Groups 0–7 as structured data. The body is narrative for human consumption (and future NLP extraction into Group 6).
- **Build Process:** A build script renders the frontmatter as rich components (commons alignment scorecard, pattern links, engagement timeline, value stream map, business lighthouse nesting view).

---

## 3. The Definitive Frontmatter (v1.2)

The frontmatter is organised into 8 functional groups, paralleling LIGHTHOUSE_BUSINESS_SPEC v1.2 but adapted for settlements as subjects.

```yaml
---
# ===================================================================
# GROUP 0: LIGHTHOUSE POSITION (The Coastline)
# ===================================================================
id: ulh_01kk0a7b2m4n5p6q8r9s1t3u5w   # TypeID with 'ulh_' prefix
conforms_to: "LIGHTHOUSE_URBAN_SPEC/1.2"  # Schema version -- agents use this to parse the file
orbital_layer: 3                        # Brightness: 0 (Beacon) to 5 (Dark)
                                        # COMPUTED from vitality_signal + Orbit 2 pattern linkage
                                        # See §1.3 for the lighthouse orbital model
archetype: port-metabolism              # Primary structural archetype (1 of 16)
                                        # See LIGHTHOUSE_ARCHETYPE_TAXONOMY.md §8
archetype_secondary: []                 # Optional secondary traits (max 2)
                                        # e.g., ["creative-commons", "civic-governance"]
sector: "Urban"                         # Always "Urban" for this spec
commons_hub: null                       # Slug of the commons hub this settlement belongs to
                                        # (cultural-regional nesting -- see Issue #25)

# ===================================================================
# GROUP 1: SETTLEMENT IDENTITY
# ===================================================================
slug: luebeck
name: "Hansestadt Lubeck"
aliases: ["Lubeck", "Queen of the Hanse", "Konigon der Hanse"]
settlement_type: "City"                 # City | Town | District | Quarter | Village |
                                        # Metropolitan Region | Borough
governance_type: "Kreisfreie Stadt"     # Municipal governance classification
                                        # (varies by country -- use local terminology)
founded: 1143                           # Year of founding/incorporation
location:
  state: "Schleswig-Holstein"           # State / province / canton
  country: "Germany"
  coordinates: [53.8689, 10.6864]       # lat, lon
website: "https://www.luebeck.de"
population: 216_000                     # Current population
population_year: 2022                   # Reference year for population figure
area_km2: 214.13                        # Settlement area in square kilometres
density_per_km2: 1009                   # Population density (computed)
summary: >-
  The Queen of the Hanse -- a UNESCO World Heritage city of 216,000 on
  Germany's Baltic coast, bridging 900 years of trading history with a modern
  economy built on port logistics, medical technology, and biotechnology.
  Lubeck carries the full weight of the urban commons challenge: a
  magnificent built inheritance that costs a fortune to maintain, a port
  economy in structural transition, a governance tradition rooted in
  Hanseatic self-governance, and a research ecosystem (University of Lubeck,
  BioMedTec Campus) generating innovation that could transform the city --
  if the transfer mechanisms work. The settlement is simultaneously a
  heritage commons, a logistics commons, and an emerging knowledge commons,
  navigating all three transitions at once.

# ===================================================================
# GROUP 2: REGIONAL CONTEXT (The Navigator Engine)
# ===================================================================
regional_context:
  region: "Metropolregion Hamburg"       # Metropolitan region or regional association
  geography: ["Germany", "Schleswig-Holstein", "Baltic Coast"]
  size_metrics:
    population: 216_000
    area_km2: 214.13
    municipal_budget_eur: 700_000_000    # Annual municipal budget
    budget_year: 2022                    # Reference year for budget
    municipal_debt_eur: null             # Outstanding debt (if known)
  key_industries:
    - "Port logistics & shipping"
    - "Medical technology & safety technology"
    - "Biotechnology & life sciences"
    - "Tourism & hospitality"
    - "Food manufacturing (Marzipan, Niederegger)"
  key_employers:
    - name: "Dragerwerk AG & Co. KGaA"
      sector: "Medical & safety technology"
      employees_local: 6000
    - name: "L. Possehl & Co. mbH"
      sector: "Diversified industrial"
      employees_global: 13000
    - name: "Stadtwerke Lubeck GmbH"
      sector: "Municipal utilities"
      employees_local: 1300
    - name: "Lubecker Hafen-Gesellschaft (LHG)"
      sector: "Port operations & logistics"
  universities:
    - name: "Universitat zu Lubeck"
      focus: ["Medicine", "Computer Science", "Digital Health", "AI"]
      students: 5000
    - name: "Technische Hochschule Lubeck"
      focus: ["Engineering", "Construction", "Applied CS", "Economics"]
      students: 4000
    - name: "Musikhochschule Lubeck"
      focus: ["Classical Music", "Music Education"]
  competitive_position: >-
    Germany's largest Baltic port -- central hub for Scandinavian and Baltic
    trade via RoRo, container, and general cargo. Competing with Rostock
    (similar port profile), Kiel (maritime economy, Kieler Woche), and
    Wismar (UNESCO peer, less economic diversity). Unique advantages:
    proximity to Hamburg metropolitan region (65 km), BioMedTec science
    campus creating a medical technology cluster, and UNESCO World Heritage
    status driving cultural tourism.

# ===================================================================
# GROUP 3: COMMONS VITALITY (The Vitality Dimensions)
# ===================================================================
# Four vitality dimensions (0-9 scale), one per Universal Dimension.
# Same field names across all lighthouse domains (Business, Urban, Ecology, Life).
# See rubrics in _pipeline/URBAN_LIGHTHOUSES.xlsx (Rubric sheet)
# and LIGHTHOUSE_ARCHETYPE_TAXONOMY.md §9 for archetype-typical profiles.
commons_vitality:
  d1_definition_purpose: 5         # Definition & Purpose — how clearly defined is the settlement?
  d2_participation_relationship: 4 # Participation & Relationship — how alive is civic participation?
  d3_proposition_exchange: 3       # Proposition & Exchange — how well does the settlement serve its people?
  d4_production_resilience: 4      # Production & Resilience — how resilient is the settlement's metabolism?
  vitality_signal: 4.0            # Average of 4 dimensions (rounded to 1 decimal)
  data_quality: 5                 # How much public data is available (0-9)
  signal_reasoning: >-
    Strong definition & purpose (D1: 5) from 900 years of Hanseatic heritage
    and UNESCO World Heritage status, though governance effectiveness tempers
    the identity coherence. Participation & relationship (D2: 4) shows
    moderate civic engagement without structural innovation. Proposition &
    exchange (D3: 3) reflects conventional provision — market-driven housing,
    standard municipal services. Production & resilience (D4: 4) benefits
    from port infrastructure but faces sea-level exposure and nascent
    circular metabolism. The light is visible but not yet bright.

# ===================================================================
# GROUP 4: ACCOUNT LIFECYCLE
# ===================================================================
account:
  status: prospect                # prospect | qualified | engaged | active | alumni | dormant
  publication: internal           # internal | on-request | public | featured
  engagement_level: 0             # 0 (no contact) to 5 (deep partnership)
  assigned_engineer: null         # slug of assigned Urban Engineer, if any
  first_briefing: 2025-03-05      # Date of first lighthouse briefing
  last_activity: 2025-03-05       # Date of last engagement activity
  next_action: null               # Free text: what's the next step?
  engagement_potential:
    annual_eur: null              # Estimated annual engagement value
    confidence: low               # low | medium | high
  tags: ["unesco", "hanseatic", "port-city", "baltic", "medtech-cluster", "smart-city"]

# ===================================================================
# GROUP 5: RELATIONSHIPS (Human-Curated Graph)
# ===================================================================
relationships:
  # Orbit 2 (Commons) patterns this settlement exemplifies -- these determine brightness
  exemplifies:
    - slug: heritage-as-living-resource
      weight: 0.7
      orbit: 2
      source: curated
      evidence: >-
        UNESCO World Heritage old town actively used as living, commercial,
        and cultural space -- not a museum district but an inhabited commons.
    - slug: civic-endowment
      weight: 0.6
      orbit: 2
      source: curated
      evidence: >-
        Possehl-Stiftung operates as a civic endowment funding culture,
        education, and social projects -- a structural commons mechanism.
  needs:
    - slug: housing-commons
      weight: 0.9
      source: curated
      note: >-
        Tight housing market, rising rents, limited social housing innovation.
        Community land trust or cooperative housing patterns would address
        the affordability crisis, especially in St. Lorenz Sud and Moisling.
    - slug: citizen-data-sovereignty
      weight: 0.7
      source: curated
      note: >-
        Smart city pilots lack citizen data governance frameworks. Data commons
        patterns would transform surveillance-risk infrastructure into
        genuine participatory governance tools.
  # Business lighthouses nested within this settlement
  business_lighthouses:
    - slug: draegerwerk
      relationship: headquartered
    - slug: possehl
      relationship: headquartered
    - slug: niederegger
      relationship: headquartered
  # Related urban lighthouses
  related_lighthouses:
    - slug: rostock
      weight: 0.6
      relationship: peer                # peer | partner | competitor | mentor
    - slug: kiel
      weight: 0.5
      relationship: peer
    - slug: hamburg
      weight: 0.8
      relationship: metropolitan-anchor  # The metro region's primary city
  # Value stream connections
  value_streams:
    - stream: "vision-to-identity"
      relevance: critical               # UNESCO identity + Hanseatic heritage
    - stream: "housing-to-life-quality"
      relevance: critical               # Tight housing market, social challenges
    - stream: "resource-to-supply"
      relevance: high                   # Port logistics, energy transition

# ===================================================================
# GROUP 6: GRAPH GARDEN (Machine-Written Graph)
# ===================================================================
graph_garden:
  last_pruned: null
  entities: []                    # Named entities extracted from briefing
  communities: []                 # Entity clusters
  inferred_links: []              # Pattern links inferred by GraphRAG

# ===================================================================
# GROUP 7: PROVENANCE
# ===================================================================
contributors: ["higgerix", "cloudsters"]
sources:
  - type: municipal_website
    title: "Hansestadt Lubeck"
    url: "https://www.luebeck.de"
    accessed: 2025-03-01
  - type: statistics
    title: "Statistikamt Nord -- Lubeck"
    url: "https://www.statistik-nord.de"
    accessed: 2025-03-01
  - type: governance
    title: "Haushaltsplan Hansestadt Lubeck 2022"
    url: "https://www.luebeck.de/haushalt"
    accessed: 2025-03-01
license: CC-BY-SA-4.0
attribution: "commons.engineering by cloudsters, https://cloudsters.net"
briefing_version: 1               # Incremented on each major update
---
```

---

## 4. The Definitive Body Structure (v1.2)

The body follows the **Urban Purpose Spiral** — four dimensions, each containing their value streams in Process-to-State grammar. This structure mirrors LIGHTHOUSE_BUSINESS_SPEC v1.2 with the urban domain's 21 value streams (see §6) in place of the business domain's 13.

The body has **9 sections**. Section 1 is a rich settlement overview (absorbing geography, economy, demographics, governance, and history). Sections 2–5 follow the four Universal Dimensions. Section 6 is the Commons Vitality Assessment — a structured scoring table synthesising the dimensional analysis. Each value stream subsection uses a **Context --> Tension --> Alignment** flow — mirroring the business lighthouse body and the pattern body's Context --> Problem --> Solution structure. Sections 7–8 are public. Section 9 (Urban Potential) is **gated** — visible only to registered Commons Engineers.

```markdown
> A one-sentence summary of the settlement and its commons significance.

> [!NOTE] Lighthouse Brightness: ★★★☆☆ (Orbit 3 — Visible)
> This rating reflects how closely the settlement's current living system
> aligns with commons principles.

---

### 1. Settlement Overview

*(500–800 words)*

The executive portrait. A reader should understand the settlement after this
section alone. Include:

- **Identity:** Name, settlement type, founding, governance form, population,
  area, geographic position, and the story the settlement tells about itself.
- **History & Heritage:** Key milestones, cultural inheritance, built fabric,
  what makes this place distinctive across time.
- **Economy & Industries:** Key industries, major employers, economic structure,
  fiscal health. Municipal budget, debt, investment posture.
- **Demographics & Society:** Population structure, education levels, social
  challenges, migration patterns, income levels.
- **Governance & Institutions:** Political structure, key governance actors,
  universities, research institutions, civic organisations.
- **Key Tension:** What is the central tension the settlement navigates?
  (e.g., heritage preservation vs. modernisation for Lubeck)

This section should make the reader feel the life of the settlement — is it
growing, transforming, stagnating, or fighting for survival?

---

### 2. Definition & Purpose

*(400–600 words)*

How does this settlement define itself, and how does its sense of purpose
translate into governance, identity, and cultural continuity?

Each value stream subsection follows a **Context --> Tension --> Alignment** flow:
- **Context:** What does the settlement do in this area? (observed facts)
- **Tension:** Where is the gap, conflict, or unrealised potential?
- **Alignment:** How could commons patterns strengthen this?

#### 2.1 Vision to Identity

The settlement's shared aspiration and how it translates into a distinctive
identity. Does the settlement tell its own story, or is it described by others?

#### 2.2 Idea to Governance

The values and principles shaping how the settlement makes decisions about
its shared life. Is governance expressive of the community's character, or
merely administrative?

#### 2.3 Heritage to Culture

How the settlement transmits what it knows about itself across time. Is
heritage held as a living resource or preserved as a museum piece?

#### 2.4 Local to Global Exchange

The relationship between local identity and global flows. Does the settlement
participate in international networks without losing itself?

> **Commons Engineering Alignment -- Purpose:**
> [2-3 sentences on how commons principles could strengthen the settlement's
> purpose dimension. Which Orbit 2 patterns are most relevant?]

---

### 3. Participation & Relationship

*(500–700 words)*

Who participates in this settlement's living system, and what are the
relationships between them?

#### 3.1 Residents to Community

Inhabitants and households -- are they a population that lives here, or a
community that belongs here? What generates (or erodes) the social fabric?

#### 3.2 Enterprise to Value Creation

The economic actors -- do enterprises extract value or generate value that
circulates within and beyond the settlement? What is the enterprise ecosystem's
diversity and health?

#### 3.3 Visitor to Contributor

Non-residents -- tourists, students, day-workers, seasonal populations. Are
they consumers of the settlement's identity, or contributors who add to it?

#### 3.4 Civic to Common Good

Institutional actors -- government, civil society, foundations, universities.
Are they genuinely oriented toward the flourishing of the whole community?

#### 3.5 Research to Innovation

Knowledge-generating actors -- universities, research institutions, independent
practitioners. Is research connected to the settlement's living challenges,
or does it happen in isolation?

> **Commons Engineering Alignment -- Participation:**
> [2-3 sentences on participation dimension alignment + relevant Orbit 2 patterns]

---

### 4. Proposition & Exchange

*(600–800 words)*

What does this settlement offer its inhabitants and visitors, and how does the
infrastructure of daily life enable flourishing or constrain it?

#### 4.1 Housing to Life Quality

The housing commons -- beyond shelter: belonging, safety, beauty, roots.
Affordability, social mix, spatial quality, and the relationship between
housing policy and community vitality.

#### 4.2 Mobility to Participation

Transport infrastructure -- not just movement but access. Can all inhabitants
reach every part of the urban commons, engage in economic and social life?

#### 4.3 Health to Wellbeing

Health systems and the broader question: is the settlement a health-generating
environment, or merely a health-service provider?

#### 4.4 Education to Flourishing

Schools, universities, lifelong learning -- does the settlement enable people
to become the fullest version of themselves?

#### 4.5 Work to Prosperity

Employment and distributed wealth -- does the economic commons create enough,
for enough people, sustainably?

#### 4.6 Leisure to Belonging

Recreation, culture, third places -- do shared rituals and collective
experiences generate a sense of belonging?

#### 4.7 Digital to Services

Digital infrastructure -- does it make the settlement more responsive,
participatory, and equitable, or merely more administrable?

> **Commons Engineering Alignment -- Proposition:**
> [2-3 sentences on proposition dimension alignment + relevant Orbit 2 patterns]

---

### 5. Production & Resilience

*(500–700 words)*

How does this settlement sustain itself, and how resilient is its metabolism?

#### 5.1 Resource to Supply

Energy, water, food, materials -- how does the settlement manage its intake,
and with what ecological awareness?

#### 5.2 Waste to Cycle

Outputs -- wastewater, solid waste, heat, carbon. Are they problems to dispose
of, or materials to cycle?

#### 5.3 Risk to Safety

Hazards -- climate events, infrastructure failure, social conflict, economic
shock. What is the settlement's adaptive capacity?

#### 5.4 Data to Smart Governance

Operational data -- used for better decisions and community involvement, or
for surveillance and control?

#### 5.5 Land to Living Quarter

The physical terrain -- is land allocated to its highest living uses? Is what
is irreplaceable protected? Is what is degraded being transformed?

> **Commons Engineering Alignment -- Operations:**
> [2-3 sentences on operations dimension alignment + relevant Orbit 2 patterns]

---

### 6. Commons Vitality Assessment

*(200–300 words)*

The structured vitality assessment — dual representation of the 4-dimensional
commons vitality. Scores appear in frontmatter (Group 3, machine-readable);
this section provides the human-readable evidence table.

| Dimension | Vitality Dimension | Score | Key Evidence |
|---|---|---|---|
| D1 | Definition & Purpose | X/9 | [Evidence summary] |
| D2 | Participation & Relationship | X/9 | [Evidence summary] |
| D3 | Proposition & Exchange | X/9 | [Evidence summary] |
| D4 | Production & Resilience | X/9 | [Evidence summary] |
| **Vitality Signal** | | **X.X** | Average of 4 dimensions |
| **Data Quality** | | **X** | |

**Archetype Comparison:** [2-3 sentences comparing this settlement's vitality
profile against the expected profile for its primary archetype. Where does
it exceed or fall below the archetype's typical pattern?]

---

### 7. Strategic Initiatives

*(300–400 words)*

What is the settlement actively working on? The current transformation
agenda -- climate targets, digitisation, infrastructure renewal, governance
reform, participation experiments. Each initiative connected to one or more
of the four dimensions.

This is the most dynamic section and the most likely entry point for
engagement. Strategic initiatives reveal where the settlement invests energy,
feels pain, and where systems thinking is most valuable.

---

### 8. Cognitive Era

*(200–300 words)*

How does this settlement change in the Cognitive Age? How is it interacting
with AI, autonomous systems, and distributed intelligence? Are smart city
initiatives concentrating control or distributing capability? What does the
Cognitive Era trajectory mean for commons alignment?

---

### 9. Urban Potential *(gated -- Commons Engineers only)*

*(300–500 words)*

The matchmaking section. This is where the urban lighthouse becomes an
account management tool. **Not published on the public site.**

- **Engagement Potential:** How likely is this settlement to benefit from
  Urban Engineering? What are the entry points?
- **Classification:** A (active pursuit), B (qualified opportunity),
  C (monitor and nurture)
- **Value Stream Priorities:** Which of the 21 value streams represent the
  highest-impact engagement opportunities?
- **Pattern Prescription:** A curated list of 5-10 patterns from the urban
  library that would most benefit this settlement, with brief rationale.
- **Incubator Potential:** Could a Commons Incubator operate here? What
  institutional partners exist? What governance openings are present?
```

---

## 5. File Organisation

### 5.1 Folder Structure

Urban lighthouse files live in `_lighthouses/urban/`. The folder structure mirrors the business lighthouse structure:

```
_lighthouses/
  urban/
    luebeck.md                            # The lighthouse briefing (anchor)
    luebeck/                              # Engagement graph nest (see §14)
      stwd_01h...._lindenau-jan.md        # Steward (human contact)
      sig_01h...._smart-city-pilot.md     # Signal (market trigger)
      exp_01h...._governance-diagnostic.md # Exploration (opportunity)
      bp_01h...._commons-workshop.md      # Blueprint (proposal)
      eng_01h...._commons-delivery.md     # Engagement (project)
      pls_01h...._2025-09-01-meeting.md   # Pulse (interaction log)
    rostock.md
    kiel.md
  business/                               # Business lighthouses (separate)
    draegerwerk.md                        # urban_lighthouse: luebeck
    possehl.md                            # urban_lighthouse: luebeck
```

Each urban lighthouse gets a `.md` file (the briefing) and optionally a same-named folder (the engagement nest). The folder only exists when there are engagement objects to store.

### 5.2 Business ↔ Urban Nesting

Business lighthouses nest within urban lighthouses through the `urban_lighthouse` field in the business lighthouse's Group 0 (defined in LIGHTHOUSE_BUSINESS_SPEC §5.2). Urban lighthouses list their known business lighthouses in Group 5 (`relationships.business_lighthouses`).

**The nesting is a frontmatter relationship, not a folder relationship.** Business lighthouses stay in `_lighthouses/business/`, urban lighthouses stay in `_lighthouses/urban/`. The link is a slug reference in both directions:

```
                    commons_hub: baltic-coast (future)
                           |
                    Urban Lighthouse: luebeck
                    /          |           \
         draegerwerk      possehl      niederegger
    (urban_lighthouse:  (urban_lighthouse:  (urban_lighthouse:
         luebeck)          luebeck)          luebeck)
```

### 5.3 Commons Hubs (Future)

Above urban lighthouses sit **Commons Hubs** — cultural regions with urban hotspots that serve as natural centres of gravity for account management. These ignore nation-state boundaries and think in terms of cultural similarity, local knowledge, relationships, and circular economics.

An urban lighthouse's `commons_hub` field in Group 0 points to the hub it belongs to. See Issue #25 for the deliberation on this concept.

### 5.4 The Fractal Chain

The Urban Engineering Manifest (§2.1) defines the fractal chain: hamlet → village → town → city → metropolitan region. The `settlement_type` field in Group 1 declares a settlement's position on this chain. Lighthouses can exist at any level — a neighbourhood commons is as valid a lighthouse as a metropolitan region. The same 21 value streams apply at every scale; the content changes but the structure does not.

---

## 6. The 21 Urban Value Streams

The Urban Purpose Spiral contains 21 value streams, organised under the four Universal Dimensions. Each value stream follows the Process-to-State grammar — the name describes the transformation from an active process to a desired state.

**Lineage:** These 21 value streams are the canonical form of the Urban Purpose Spiral as defined in the Urban Engineering Manifest (v0.1) and validated through the cloudsters Urban Briefing Template (2024–2025, ~12 briefings). The English missions below are faithful translations of the German originals from the cloudsters Urban Briefing Prompt. The German stream names appear in the Lineage Note column for traceability.

| # | Dimension | Value Stream | Mission | Section | German Original |
|:---|:---|:---|:---|:---|:---|
| 1 | **Definition & Purpose** | Vision to Identity | Articulate and sustain the settlement's shared aspiration, translating strategic vision into a distinctive identity that inhabitants recognise, defend, and continuously renew. | 2.1 | Vision zu Identitat |
| 2 | | Idea to Governance | Shape the values and principles that govern the settlement's shared life — ensuring decisions reflect the community's character, fairness, and commitment to the common good. | 2.2 | Idee zu Governance |
| 3 | | Heritage to Culture | Transmit the settlement's accumulated knowledge, memory, and built inheritance across generations — holding heritage as a living resource, not a museum piece. | 2.3 | Erbe zu Kultur |
| 4 | | Local to Global Exchange | Manage the settlement's relationship between local identity and global flows — participating in regional, national, and international networks without losing distinctive character. | 2.4 | Lokal zu globaler Austausch |
| 5 | **Participation & Relationship** | Residents to Community | Transform inhabitants from a population that lives somewhere into a community that belongs somewhere — through webs of relationship, mutual obligation, and shared meaning. | 3.1 | Einwohner zu Gemeinschaft |
| 6 | | Enterprise to Value Creation | Cultivate diverse enterprise ecosystems where economic actors generate value that circulates within and beyond the settlement, rather than extracting it. | 3.2 | Unternehmung zu Wertschopfung |
| 7 | | Visitor to Contributor | Manage the relationship with non-residents — tourists, students, day-workers — transforming them from consumers of the settlement's identity into contributors who add to it. | 3.3 | Gast zu Beitrag |
| 8 | | Civic to Common Good | Strengthen institutional actors — governments, civil society, foundations, universities — in their genuine orientation towards the flourishing of the whole community. | 3.4 | Burgersinn zu Gemeinwohl |
| 9 | | Research to Innovation | Integrate knowledge-generating actors so that research expands the settlement's adaptive capacity through applied innovation, not isolated academic production. | 3.5 | Forschung zu Innovation |
| 10 | **Proposition & Exchange** | Housing to Life Quality | Provide not merely shelter but belonging, safety, beauty, and the possibility of putting down roots — the housing commons as a foundation of the good life. | 4.1 | Wohnen zu Lebensqualitat |
| 11 | | Mobility to Participation | Build infrastructure that enables inhabitants to reach every part of the urban commons, to engage in its economic and social life, to be present rather than excluded. | 4.2 | Mobilitat zu Teilhabe |
| 12 | | Health to Wellbeing | Create a health-generating environment where the settlement promotes the positive capacity for a full life, not merely the treatment of illness. | 4.3 | Gesundheit zu Wohlbefinden |
| 13 | | Education to Flourishing | Build an environment in which people can become the fullest version of themselves — the settlement as a place of lifelong learning, not merely schooling. | 4.4 | Bildung zu Entfaltung |
| 14 | | Work to Prosperity | Generate distributed wealth that allows the whole community to participate in the good life — an economic commons that creates enough, for enough people, sustainably. | 4.5 | Arbeit zu Wohlstand |
| 15 | | Leisure to Belonging | Create shared rituals, collective experiences, and third places where a community recognises itself — transforming recreation into belonging. | 4.6 | Freizeit zu Zugehorigkeit |
| 16 | | Digital to Services | Use digital infrastructure to make the settlement more responsive, more participatory, and more equitable — not merely more legible to its administrators. | 4.7 | Digital zu E-Services |
| 17 | **Production & Resilience** | Resource to Supply | Manage the settlement's intake of energy, water, food, and materials with awareness of ecological cost and the ambition to close loops. | 5.1 | Ressource zu Versorgung |
| 18 | | Waste to Cycle | Treat the settlement's outputs — wastewater, solid waste, heat, carbon — not as problems to dispose of but as materials to be cycled. | 5.2 | Abfall zu Kreislauf |
| 19 | | Risk to Safety | Build resilience not by eliminating risk but by developing the adaptive capacity to absorb disruption without losing integrity. | 5.3 | Risiko zu Sicherheit |
| 20 | | Data to Smart Governance | Use the settlement's operational data to improve governance — better decisions, early problem detection, community involvement — not to surveil, extract, or control. | 5.4 | Daten zu Smart Governance |
| 21 | | Land to Living Quarter | Manage the settlement's physical terrain as a shared resource — allocating land to its highest living uses, protecting what is irreplaceable, and transforming what is degraded into places of vitality. | 5.5 | Flache zu lebendigem Quartier |

These 21 value streams are the standard lens through which every urban lighthouse is analysed. Not every value stream will be equally relevant for every settlement — the briefing author should invest depth where the settlement's situation demands it and keep other sections concise. A small village may have little to say about "Digital to Services" but much about "Residents to Community." A metropolitan region may need extensive treatment of "Mobility to Participation" but less on "Heritage to Culture."

> **Note on stream count:** The business lighthouse uses 13 value streams; the urban lighthouse uses 21. This reflects the broader terrain of the urban commons — a settlement must simultaneously manage housing, mobility, health, education, work, leisure, and digital services as distinct offer domains, whereas a business typically bundles these into fewer proposition and production streams. The four Universal Dimensions remain identical; only the stream granularity differs.

---

## 7. TypeID Convention

All entities in the lighthouse ecosystem use TypeID with a unique prefix. The urban lighthouse uses `ulh_`. This is registered in the canonical TypeID prefix registry in LIGHTHOUSE_BUSINESS_SPEC §7.

| Prefix | Entity | Spec |
|:---|:---|:---|
| `pat_` | Pattern | PATTERN_SPEC |
| `lh_` | Business Lighthouse | LIGHTHOUSE_BUSINESS_SPEC |
| `ulh_` | Urban Lighthouse | **LIGHTHOUSE_URBAN_SPEC** |
| `stwd_` | Steward (Contact) | ENGAGEMENT_GRAPH_SPEC |
| `sig_` | Signal (Market Trigger) | ENGAGEMENT_GRAPH_SPEC |
| `exp_` | Exploration (Opportunity) | ENGAGEMENT_GRAPH_SPEC |
| `bp_` | Blueprint (Proposal) | ENGAGEMENT_GRAPH_SPEC |
| `eng_` | Engagement (Delivery) | ENGAGEMENT_GRAPH_SPEC |
| `pls_` | Pulse (Interaction Log) | ENGAGEMENT_GRAPH_SPEC |

```
ulh_01kk0a7b2m4n5p6q8r9s1t3u5w
^^^  ^^^^^^^^^^^^^^^^^^^^^^^^^^
|    Crockford Base32 timestamp + random (same algorithm as patterns)
|
Entity prefix (see registry above)
```

Generated by the same `generate_typeid.py` script with a prefix parameter: `python _scripts/generate_typeid.py --prefix ulh`.

---

## 8. Validation Rules

1. **Identity Completeness:** Every urban lighthouse must have `name`, `slug`, `summary`, `population`, `settlement_type`, and at least one `sources` entry.
2. **Dimension Coverage:** Sections 2–5 must each contain substantive content (not just placeholders) for an urban lighthouse to be considered "briefing complete."
3. **Commons Vitality:** All 4 vitality dimension scores (0-9) must be present in Group 3 (`commons_vitality`). `vitality_signal` must equal the average of the 4 component scores (rounded to 1 decimal). Body Section 6 table scores must match frontmatter values exactly.
4. **Source Freshness:** At least one source must have an `accessed` date within the last 12 months for the urban lighthouse to be considered "current."
5. **Brightness Emergence:** `orbital_layer` (Group 0) is **computed** from the density and strength of links to Orbit 2 (Commons) patterns in the `relationships.exemplifies` array. A validation script should verify consistency.
6. **Publication Consistency:** Urban lighthouses with `publication: public` must not contain any content in Group 4 (Account Lifecycle) that would be inappropriate for public consumption. The build pipeline must strip Group 4 from publicly rendered lighthouses.
7. **Word Count Balance:** The total briefing body should target **3,500–5,000 words** (approximately 8–12 rendered pages). Dimension sections should be proportional to their stream count: Section 2 (~400–600 words, 4 streams), Section 3 (~500–700 words, 5 streams), Section 4 (~600–800 words, 7 streams), Section 5 (~500–700 words, 5 streams). The pipeline should flag briefings outside the ±20% tolerance band.
8. **Settlement Type Consistency:** The `settlement_type` field must be one of the defined types: City, Town, District, Quarter, Village, Metropolitan Region, Borough. Compound types are not permitted.

---

## 9. Pipeline

The urban lighthouse production pipeline mirrors the business lighthouse pipeline:

```
PHASE A: Infrastructure
  +-- Tools: generate_typeid.py (with ulh_ prefix), urban_lighthouse_stub_generator.py

PHASE B: Stub Generation
  +-- Input:  Settlement name + public URLs + settlement type
  +-- Output: _lighthouses/urban/{slug}.md (frontmatter + skeleton)

PHASE C: Briefing Enrichment
  +-- Input:  Stub with skeleton body
  +-- Output: Full briefing with all 8 sections populated
  +-- Method: Claude API with structured prompts per section
  +-- Sources: Municipal websites, statistical databases, governance documents,
              academic publications, news, UNESCO/heritage databases,
              transport data, demographic registers

PHASE D: Pattern Linking
  +-- Input:  Enriched briefing
  +-- Output: Groups 5 & 6 populated (exemplifies, needs, graph_garden)
  +-- Runs:   Cross-reference against urban pattern library (14,596 patterns)

PHASE E: Business Lighthouse Cross-Reference
  +-- Input:  Enriched urban lighthouse
  +-- Output: business_lighthouses list populated in Group 5
  +-- Runs:   Scan _lighthouses/business/ for urban_lighthouse: {slug} references
```

**Phase E** is unique to urban lighthouses — it creates the bidirectional link between the urban lighthouse and its nested business lighthouses.

---

## 10. Relationship to Pattern Library

Every urban lighthouse is **nested with the pattern library**, and the relationship to **Orbit 2 (Commons) urban patterns** is the critical structural link:

- **Exemplifies:** Patterns the settlement already demonstrates (evidence-based, linked to specific sections of the briefing). **Links to Orbit 2 commons patterns determine brightness.** A settlement that exemplifies many Orbit 2 patterns has a bright light; one that exemplifies few has a dark light.
- **Needs:** Patterns that would improve the settlement's commons alignment (diagnostic, linked to gaps identified in the briefing). These are the prescriptive links — the patterns an Urban Engineer would bring to an engagement.
- **Graph Garden:** Machine-extracted entities and relationships from the briefing text, cross-linked with pattern entities.

The urban pattern library contains **14,596 patterns** (as of March 2026) across the full terrain of the Urban Purpose Spiral. These patterns are the shared knowledge base from which urban lighthouse briefings draw their diagnostic and prescriptive links.

The Orbit 2 linkage creates the same incentive structure as for business lighthouses: the way to make an urban lighthouse brighter is to help the settlement adopt more commons patterns. The briefing becomes a diagnostic, the pattern library becomes the prescription, and the engagement becomes the treatment.

---

## 11. Account Management Integration

The `account` group in the frontmatter transforms the briefing into a lightweight CRM record, identical in structure to LIGHTHOUSE_BUSINESS_SPEC §11:

| Field | Purpose |
|:---|:---|
| `status` | Pipeline stage: prospect --> qualified --> engaged --> active --> alumni --> dormant |
| `engagement_level` | 0–5 depth: no contact --> awareness --> conversation --> project --> partnership --> deep integration |
| `assigned_engineer` | Which Urban Engineer is responsible for this lighthouse |
| `first_briefing` | When the lighthouse was first lit |
| `last_activity` | Most recent engagement activity |
| `next_action` | Free text: the next concrete step |
| `engagement_potential` | Estimated annual value + confidence level |
| `tags` | Free-form tags for filtering (settlement type, region, special characteristics) |

For urban lighthouses, the engagement pathway typically involves institutional partners (municipal governments, civic foundations, universities) rather than corporate procurement. The `next_action` field should reflect this: "contact Possehl-Stiftung re: urban commons workshop" rather than "schedule sales call."

---

## 12. Versioning and Updates

Urban lighthouses are living documents. Unlike business lighthouses, which change when organisations change, urban lighthouses change at the pace of municipal governance cycles, demographic shifts, and infrastructure transformation. The `briefing_version` field tracks major updates:

- **Version 1:** Initial permissionless briefing from public sources.
- **Version 2:** Updated with engagement insights (post-first-contact with governance actors).
- **Version 3+:** Deepened with insider knowledge (active engagement phase).

Electoral cycles (typically 4–6 years in European municipalities) create natural update triggers. A version update should be considered after any change in the settlement's chief executive, major budget restructuring, or completion of a strategic initiative listed in Section 6.

---

## 13. Privacy Zones and Publication

An urban lighthouse has **three privacy zones**, identical in structure to LIGHTHOUSE_BUSINESS_SPEC §13:

| Zone | Content | Visibility | Rendering |
|:---|:---|:---|:---|
| **Public** | Sections 1–7 (briefing + cognitive era), Groups 0–3, 6–7 | Anyone (public site) | PROD (Cloudflare from public repo) |
| **Gated** | Section 8 (Urban Potential, pattern prescription) | Registered Commons Engineers | STAGING or authenticated PROD |
| **Private** | Group 4 (Account Lifecycle), engagement potential, next action | Workshop repo only | DEV / STAGING (private repo) |

**Publication follows the same principle as business lighthouses.** The permissionless principle applies to production; publication follows the `account.publication` field. The same four publication levels apply: `internal`, `on-request`, `public`, `featured`.

**What can be published permissionlessly:** Analysis derived from public sources — municipal reports, statistical databases, governance documents, academic publications. The briefing narrative and commons vitality scores are our analytical work product.

**What stays internal:** Account management data (Group 4), engagement strategy (Section 8), and any insights gained from direct engagement.

---

## 14. The Engagement Graph (Preview)

> **Status:** Draft specification in progress. See ENGAGEMENT_GRAPH_SPEC.md.

The urban lighthouse briefing is the **anchor** — the public, stable description of a settlement's state. Around it, engagement entities grow as child markdown files in the same-named folder, each linking bottom-up to the lighthouse via a `target_lighthouse` YAML field.

The engagement graph for urban lighthouses uses the **same six entity types** as business lighthouses (defined in ENGAGEMENT_GRAPH_SPEC.md):

| Entity | Urban Context |
|:---|:---|
| **Steward** | Municipal officials, civic leaders, university rectors, foundation directors, community organisers |
| **Signal** | Municipal elections, budget decisions, EU funding rounds, infrastructure crises, climate events |
| **Exploration** | Diagnostic assessments, commons readiness surveys, governance mapping |
| **Blueprint** | Commons Incubator proposals, urban pattern workshops, governance redesign plans |
| **Engagement** | Active projects: commons workshops, pattern deployment, governance pilots |
| **Pulse** | Meeting notes, correspondence, field observations, event participation |

The interaction modes (H2H, H2A, A2A) apply identically. Urban engagements are more likely to involve **composite interactions** (H2H governance meetings supplemented by A2A data analysis) than pure H2H or pure A2A.

ENGAGEMENT_GRAPH_SPEC §9 defines the specific implications of urban lighthouses for the engagement entity schema.

---

## 15. Ethics

Urban lighthouses are produced from **public information only**. The specification explicitly prohibits:

1. Including non-public governance data, internal municipal communications, or confidential strategic plans.
2. Including personal data about individuals beyond what is publicly associated with their professional role (e.g., a mayor's name and party affiliation from public records are fine; personal contact details are not).
3. Presenting analysis as fact — the briefing must distinguish between observed facts (from sources) and analytical interpretation (from the author).
4. Creating briefings with intent to harm, embarrass, or pressure a settlement or its governance actors.
5. Using the briefing as a tool for political campaigning, lobbying, or advocacy for specific political positions.

**The additional ethical dimension of urban lighthouses** is that they describe places where people live — not just organisations where people work. A careless or unfair briefing about a settlement can affect the sense of identity and belonging of its inhabitants. The urban lighthouse should illuminate the settlement's living system with the same generosity, accuracy, and fairness that the business lighthouse brings to organisations — and with the additional awareness that the subject is a community of people, not a legal entity.

The briefing should honour the settlement's own narrative about itself before introducing external analytical frameworks. Section 1 should surface the story the settlement already tells; Sections 2–5 should make visible the systemic patterns that the Urban Purpose Spiral reveals. The relationship between the two — between self-narrative and systems analysis — is where the value of the briefing lies.

---

*LIGHTHOUSE URBAN SPECIFICATION v1.2*
*Commons Engineering is licensed under CC-BY-SA-4.0*
*Distributed by cloudsters*
