# Alignment Rules — Commons OS

This file defines WHAT to check. Results are posted as GitHub Issues
(label: alignment-report), not written here.

## §1 Purpose Alignment Checks

| Check | Rule |
|---|---|
| D1 (Purpose) | blueprint.md L1 must be populated |
| D2 (Participation) | registry/5_entities/participation/ must contain at least one entity |
| D3 (Proposition) | registry/3_valuestreams/ must contain at least one active stream |
| D4 (Production) | operations/ must contain rhythms.md or economics.md |

## §2 Specification Conformance

| Spec | Expected version |
|---|---|
| PATTERN_SPEC | v8.2 |
| LIGHTHOUSE_BUSINESS_SPEC | v1.2 |
| COMMONS_OS_SPEC | v0.2 |

Agent compares local knowledge/specs/core/ versions against Commons MCP latest.

## §3 Collection Sync

Agent compares local knowledge/patterns/core/ counts against Commons MCP library_stats().

## §4 Structural Checks

| Check | Rule |
|---|---|
| blueprint.md | Must exist and be non-empty |
| .commons/identity.yml | Must be valid YAML with slug, purpose, domain |
| .commons/config.yml | Must have 3-MCP endpoints defined |
| AGENT.md | Must not reference a specific AI product by name |
| knowledge/manifests/core/ | Must contain all required manifests |
| knowledge/specs/core/ | Must contain all required specs |
| knowledge/patterns/core/ | Must contain 0-singularity through 2-commons |
| registry/ | Must contain 1_journeys/ through 5_entities/ |

## §5 Reporting

Results are posted as a GitHub Issue with:
- Label: `alignment-report`
- Title: "Alignment Check — [date]"
- Body: structured table of check results
- Recommendations as action items in the issue
