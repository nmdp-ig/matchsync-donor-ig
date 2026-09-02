# ADR-0006: Canonical URL uses `donor-patient` not `donor-api`

**Status:** Accepted  
**Date:** 2026-07-23

## Context

SPEC-001 originally proposed publishing the IG at `http://fhir.nmdp.org/ig/donor-api/` with an IG id of `nmdp.fhir.donor-api`. This reflected the intent to cover the full FHIR Donor API surface: donor demographics, HLA typing observations, order coordination (ServiceRequest), and potentially cord blood units.

During implementation, the IG was initialized with:

```yaml
id: nmdp.fhir.donor-patient
canonical: http://fhir.nmdp.org/ig/donor-patient
```

The question: should this be corrected to match the spec, or kept as-is?

## Decision

Keep `donor-patient` as the canonical URL and IG id.

```yaml
id: nmdp.fhir.donor-patient
canonical: http://fhir.nmdp.org/ig/donor-patient
```

## Rationale

1. **Scope matches content.** This IG currently defines the NMDPDonorPatient profile, NMDPOrganization, donor status terminology, and related examples. It is specifically about the *Patient resource* representation of donors — not the full API surface.

2. **IGs are not APIs.** A FHIR Implementation Guide defines conformance resources (profiles, extensions, terminology). The "Donor API" is a deployment concern — it may serve resources from multiple IGs (e.g., a future HLA Observation IG, a ServiceRequest IG). Naming the IG after the API conflates two concepts.

3. **Narrower scope enables independent versioning.** If HLA observations and order coordination live in separate IGs (`donor-hla`, `donor-orders`), each can version independently. A monolithic `donor-api` IG would force coordinated releases for unrelated changes.

4. **Canonical URLs are permanent.** Once published and referenced by consumers, the canonical URL cannot change without breaking downstream validation. Better to start narrow and compose than to start broad and need to split.

5. **Precedent.** HL7 IGs follow resource-oriented naming: `us-core` (not `us-api`), `genomics-reporting` (not `lab-api`), `mcode` (not `oncology-api`).

## Consequences

### Positive

- Clear scope: consumers know this IG covers donor Patient resources specifically.
- Future HLA typing, order coordination, and CBU profiles can live in dedicated IGs without namespace collision.
- No breaking change if the API surface grows beyond what one IG should cover.

### Negative

- Deviates from SPEC-001's original naming. The spec should be updated to reflect this decision.
- If the IG eventually absorbs HLA and order profiles (keeping everything in one IG), the `donor-patient` name becomes misleading. At that point, consider a broader name only if all content is genuinely coupled.

### Migration

No migration needed — the IG has not been published externally. All current references use `donor-patient`.

## Alternatives Considered

| Option | Rejected because |
|--------|-----------------|
| `donor-api` (per SPEC-001) | Conflates IG with API deployment; too broad for current content; creates splitting pain later |
| `nmdp-patient` | Ambiguous — could be confused with recipient Patient profiles |
| `donor-demographics` | Too narrow — the IG includes status, organization, identifiers beyond demographics |

## Review Triggers

Re-open this ADR if:

- HLA Observation profiles are added to this IG (rather than a separate one)
- ServiceRequest/order profiles are added to this IG
- The decision is made to consolidate all donor-related FHIR content into a single IG
