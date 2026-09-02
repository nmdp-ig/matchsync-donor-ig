# ADR-0002: NMDP FHIR namespace conventions

**Status:** Accepted  
**Date:** 2026-07-22

## Context

NMDP needs consistent URI namespaces for identifiers, code systems, and extensions used across FHIR IGs and APIs. Multiple legacy OID-based identifiers exist in the ecosystem (e.g., OIDs from HL7 v2 messaging, WMDA registrations), but we want to standardize on HTTP URIs for:

1. **Discoverability** — HTTP URIs can resolve to human-readable documentation
2. **Consistency** — a single pattern for all NMDP FHIR artifacts
3. **Tooling** — FHIR validators, IG Publisher, and terminology servers expect HTTP canonical URLs
4. **Avoiding collision** — namespaced URIs prevent identifier conflicts across registries

NMDP controls two domains relevant to FHIR:

- `fhir.nmdp.org` — FHIR-specific artifacts (IGs, StructureDefinitions)
- `terminology.nmdp.org` — terminology and identifier systems

## Decision

Use these namespace conventions for all NMDP FHIR artifacts:

| Category | Namespace prefix | Examples |
|----------|-----------------|----------|
| Identifier systems | `http://terminology.nmdp.org/identifier/` | `.../donor`, `.../cbu`, `.../order`, `.../nmdp-recipient` |
| Code systems | `http://terminology.nmdp.org/codesystem/` | `.../center-type`, `.../donor-status` |
| Extensions | `http://fhir.nmdp.org/StructureDefinition/` | `.../donor-status` |
| Profiles | `http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/` | `.../NMDPDonorPatient` |
| Value sets | `http://fhir.nmdp.org/ig/donor-patient/ValueSet/` | `.../DonorStatusVS` |
| External: ISBT GRID | `http://www.isbt128.org/uri/GRID` | (external standard, not NMDP-controlled) |

All URI aliases are centralized in `input/fsh/aliases.fsh` — the single source of truth for URI strings used in FSH files.

```fsh
// input/fsh/aliases.fsh (pattern)
Alias: $NMDP_DONOR_ID = http://terminology.nmdp.org/identifier/donor
Alias: $NMDP_CBU_ID = http://terminology.nmdp.org/identifier/cbu
Alias: $DONOR_STATUS_CS = http://terminology.nmdp.org/codesystem/donor-status
Alias: $GRID = http://www.isbt128.org/uri/GRID
```

## Consequences

### Positive

- All new profiles and terminology use predictable, consistent namespaces.
- `aliases.fsh` prevents typos and duplication — change a URI in one place.
- HTTP URIs can eventually resolve to IG documentation or terminology server lookups.
- Clear separation: `terminology.nmdp.org` for vocabulary/identifiers, `fhir.nmdp.org` for FHIR conformance artifacts.

### Negative

- Legacy OID-based references in existing systems must be migrated or mapped.
- Systems that only understand OIDs (older HL7 v2 interfaces) need a translation layer.
- The `terminology.nmdp.org` domain must be maintained and eventually serve content at these URIs (or return appropriate redirects).

### Migration from Legacy OIDs

Existing OID-based identifiers (e.g., from HL7 v2 MSH segments or WMDA registrations) should be:

1. Mapped to the new HTTP URI equivalents in documentation
2. Accepted as alternative identifier systems during a transition period
3. Deprecated in new implementations — all new code uses HTTP URIs via aliases

## Alternatives Considered

| Option | Rejected because |
|--------|-----------------|
| Continue using OIDs | Not discoverable; inconsistent tooling support in FHIR R4+; no resolution to documentation |
| Single domain for everything (`fhir.nmdp.org`) | Conflates terminology governance with IG publishing; terminology may be shared across non-FHIR systems |
| Per-IG namespace (embed IG name in identifier URIs) | Identifiers are cross-IG concepts; a donor ID is the same regardless of which IG references it |

## References

- FHIR R4 NamingSystem guidance: https://hl7.org/fhir/R4/namingsystem.html
- HL7 URI assignment: https://terminology.hl7.org
- ISBT 128 GRID standard: https://www.isbt128.org

## Review Triggers

Re-open this ADR if:

- NMDP acquires or consolidates domains (e.g., `bethematch.org` FHIR artifacts)
- HL7 assigns official URIs for NMDP identifier systems
- WMDA standardizes HTTP URIs that conflict with these conventions
