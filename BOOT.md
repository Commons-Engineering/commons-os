# Boot Guide — Commons OS

This guide walks you through activating your commons after forking. Your agent (Purpose Agent at D1) guides the process — read this together.

## Prerequisites

- You have forked this repository and renamed it to `[your-commons]-os`
- You have an AI agent connected (any model that speaks MCP)
- You have copied `AGENT.md.template` to your agent's configuration file (e.g., `CLAUDE.md` for Claude Code, or `AGENT.md`)

## Boot Sequence

### Phase 1: Identity

1. **Edit `.commons/identity.yml`**
   - Set `locale` — your primary language (determines everything downstream)
   - Set `slug` — your commons identifier (e.g., `luebeck-os`, `my-life`)
   - Set `name` — human-readable name
   - Set `purpose` — one sentence: what this commons exists for
   - Set `domain` — Life, Business, Urban, or Ecology
   - Set `founder` — your GitHub handle
   - Set `stage` to `Boot`

2. **The agent reads your identity and begins speaking in your locale.**

### Phase 2: Blueprint

3. **Open `blueprint.md`** and fill in Layer 1 (Identity & Purpose):
   - Who are you?
   - What is this commons for?
   - What is the boundary?
   - The agent helps you articulate this.

4. **The agent proposes initial value stream families** based on your domain.

### Phase 3: First Entity

5. **Create your first entity** in `registry/5_entities/purpose/`:
   - This is the commons itself as an entity
   - The `self_entity_slug` in identity.yml points here

### Phase 4: Connect Intelligence

6. **Configure MCP connections** in `.commons/config.yml`:
   - Commons MCP: shared intelligence (default endpoint works for OPEN tier)
   - Blueprint MCP: local knowledge graph (configure if available)
   - Fabric MCPs: your systems of record (add as needed)

### Phase 5: Seed

7. **Change stage to `Seed`** in identity.yml
8. **The agent begins:** suggesting patterns, proposing value streams, helping you build your blueprint layer by layer

## What Happens Next

The boot sequence gets you from Fork to Seed. From Seed onwards, you grow your commons:

| Stage | What happens |
|---|---|
| **Seed** | Blueprint takes shape, first patterns applied, value streams identified |
| **Active** | Regular operations, rhythms established, first touchpoints live |
| **Gathering** | First community event, commons touches the physical world |
| **Established** | Self-sustaining operations, multiple active participants |
| **Mature** | Full governance runtime, contribution back to upstream |

## Need Help?

- Read `ALIGN.md` to check your commons' health
- Explore `knowledge/patterns/core/` for available patterns
- Open an issue on this repository
