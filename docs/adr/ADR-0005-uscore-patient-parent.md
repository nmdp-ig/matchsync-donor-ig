# ADR-0005: NMDPDonorPatient extends USCorePatientProfile

**Status:** Accepted  
**Date:** 2026-07-23

## Context

NMDPDonorPatient is the central profile in the Donor Patient IG. It represents hematopoietic cell donors registered in the NMDP registry. The IG already declares `hl7.fhir.us.core: 6.1.0` as a dependency and uses US Core Race and Ethnicity extensions.

The question: should NMDPDonorPatient extend base `Patient` or `USCorePatientProfile`?

Key factors:

- NMDP operates in the US healthcare ecosystem. Transplant centers consuming the Donor API expect US Core conformance.
- CIBMTR's Reporting IG extends US Core — alignment avoids mapping friction.
- ONC/USCDI certification requires US Core Patient for EHR interoperability.
- SMART-on-FHIR scopes and EHR whitelist behavior assume US Core profiles.
- AWS HealthLake (our target data store) validates against declared profiles — US Core parent means stricter but more useful validation.

Counter-factors:

- International donors (WMDA registries outside the US) don't conform to US Core assumptions.
- US Core marks `address` and `telecom` as Must-Support, but donor records often lack these (privacy concerns, registry-level data doesn't always include contact info).
- Coupling to US Core version complicates future FHIR R5/R6 migration.

## Decision

NMDPDonorPatient extends `USCorePatientProfile` (US Core 6.1.0).

```fsh
Profile: NMDPDonorPatient
Parent: USCorePatientProfile
```

This inherits all US Core Patient constraints including:
- `name.family` MS, `name.given` MS
- `address` MS (line, city, state, postalCode)
- `telecom` MS (system, value)
- US Core Race and Ethnicity extensions (built-in)
- `gender` 1..1 MS, `birthDate` MS

## Consequences

### Positive

- Automatic US Core conformance — transplant centers can validate donor resources against US Core without additional profiles.
- Race/Ethnicity extensions inherited; no need to re-declare.
- CIBMTR alignment is free.
- Standard SMART-on-FHIR scopes work as expected.
- HealthLake validation catches real data quality issues.

### Negative

- `address` and `telecom` are MS but often absent in donor data. Systems must support these elements structurally but are not required to populate them (MS ≠ required). Conformance tools may emit warnings.
- International donor data from WMDA registries will not fully conform to US Core assumptions. If non-US consumers adopt this IG, a separate "international" profile without US Core parent may be needed.
- The IG is version-coupled to US Core. When migrating to FHIR R5/R6, a new US Core version targeting that FHIR release is required before the parent can be updated.

### R5/R6 Migration Path

When FHIR R6 migration begins:

1. **Wait for US Core R6** — HL7 must ballot a US Core version targeting R6. Until then, this IG cannot declare a US Core R6 parent.
2. **Re-evaluate the parent** — R6 changes the Patient resource (communication backbone, potential first-class race/ethnicity). The US Core parent decision must be revisited at that point.
3. **If multiple Patient profiles emerge** (NMDPDonorPatient, NMDPRecipientPatient, CBUPatient), consider an intermediate `NMDPBasePatient` that isolates the US Core coupling to one place.

### Review Triggers

Re-open this ADR when any of the following occur:

- US Core R6 is balloted
- WMDA requests conformance for non-US registries
- A second Patient-derived profile (Recipient, CBU) is added to this IG
- NMDP begins R5/R6 migration planning

## Alternatives Considered

| Option | Rejected because |
|--------|-----------------|
| `Parent: Patient` + manual alignment | Drift risk; loses automatic conformance claim; must manually track US Core changes across versions |
| `Parent: USCorePatientProfile` + suppress address/telecom | Cannot suppress MS from parent in FHIR profiling; would require an intermediate profile that weakens constraints (not valid in FHIR's profiling rules) |
| Abstract NMDPBasePatient layer | Premature with only one Patient profile; adds indirection without current benefit |
