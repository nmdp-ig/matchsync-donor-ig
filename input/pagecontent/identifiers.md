# Identifiers

This page describes the identifier systems used in the NMDP Donor Patient IG, their cardinality, and PHI sensitivity classification.

NMDP uses two distinct source identifiers to identify a subject: the **Donor ID** (`source-id`) identifies a donor, and the **CBU ID** (`cbu-source-id`) identifies a cord blood unit.

## Identifier Systems on NMDPDonorPatient

The [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.html) profile requires at least one identifier and defines two named slices:

| Identifier | System URI | Cardinality | Example Value | PHI Sensitivity |
|------------|-----------|-------------|---------------|-----------------|
| GRID | `http://nmdp.org/identifier/grid` | 1..1 (MS) | `6939DKM001392612726` | Direct identifier |
| Donor ID (source-id) | `http://nmdp.org/identifier/source-id` | 0..1 (MS) | `SRC-77412` | Indirect identifier |

The identifier slice is `open`, allowing additional identifier systems beyond the two named slices.

## Identifier Systems on NMDPCBUPatient

The [NMDPCBUPatient](StructureDefinition-nmdp-cbu-patient.html) profile requires at least one identifier and defines three named slices:

| Identifier | System URI | Cardinality | Example Value | PHI Sensitivity |
|------------|-----------|-------------|---------------|-----------------|
| CBU ID (cbu-source-id) | `http://nmdp.org/identifier/cbu-source-id` | 1..1 (MS) | `CBU-SRC-20180415-001` | Indirect identifier |
| CBU Registry ID | `http://nmdp.org/identifier/cbu-registry-id` | 0..1 (MS) | `REG-CBU-887744` | Indirect identifier |
| Cord Blood Bank ID | `http://nmdp.org/identifier/cbb-id` | 0..1 (MS) | `CBB-1042` | Internal use |

## Identifier Descriptions

### Donor ID (source-id)

The source identifier assigned to a donor in the originating NMDP registry. This is the NMDP identifier used to identify a **donor** (distinct from the CBU source ID used for cord blood units).

- **System:** `http://nmdp.org/identifier/source-id`
- **Assigned by:** NMDP
- **Cardinality:** 0..1 (optional but must-support)

### CBU ID (cbu-source-id)

The source identifier assigned to a **cord blood unit** in the originating NMDP registry. This is the NMDP identifier used to identify a CBU (distinct from the donor source ID). It is required on the [NMDPCBUPatient](StructureDefinition-nmdp-cbu-patient.html) profile.

- **System:** `http://nmdp.org/identifier/cbu-source-id`
- **Assigned by:** NMDP
- **Cardinality:** 1..1 (required on NMDPCBUPatient)

### GRID (Global Registration Identifier for Donors)

The NMDP GRID — a globally unique identifier that follows the donor across NMDP systems and orders.

- **System:** `http://nmdp.org/identifier/grid`
- **Format:** 19-character ISBT 128 identifier composed of a 4-digit Issuing Organization Number (ION), a donor registration number, and check characters, e.g. `6939DKM001392612726`
- **Assigned by:** NMDP
- **Cardinality:** 0..1 (optional but must-support)

## Additional Identifier Systems (aliases.fsh)

The following identifier systems are defined in `aliases.fsh` for use in related profiles and future IG expansion:

| Identifier | System URI | Description |
|------------|-----------|-------------|
| CBU ID | `http://terminology.nmdp.org/identifier/cbu` | Cord Blood Unit identifier |
| Recipient ID | `http://terminology.nmdp.org/identifier/recipient` | Transplant recipient identifier |
| Local ID | `http://terminology.nmdp.org/identifier/local-id` | Center-specific local identifier |
| Order ID | `http://terminology.nmdp.org/identifier/order` | Search/workup order identifier |
| HML ID | `http://terminology.nmdp.org/identifier/hmlid` | HML message identifier |
| Specimen ID | `http://terminology.nmdp.org/identifier/specimen` | Specimen identifier |
| CIBMTR CRID | `http://terminology.cibmtr.org/identifier/CRID` | CIBMTR Center Research ID |

## PHI Sensitivity

Implementers **MUST** handle donor identifiers according to their PHI classification:

### Indirect Identifier — Donor ID / CBU ID (source IDs)

The Donor ID (`source-id`) and CBU ID (`cbu-source-id`) are classified as **indirect identifiers**. On their own, they do not identify an individual. However, when combined with demographic information (name, date of birth, address), they become Protected Health Information (PHI) under HIPAA.

- On its own: Not PHI
- Combined with demographics: PHI
- Access control: Standard system-level access controls

### Direct Identifier — GRID

The GRID is classified as a **direct patient identifier**. Because it is globally unique to a single individual and can be used to re-identify a person across registries, it is always considered PHI regardless of context.

- Always PHI regardless of accompanying data
- Access control: Requires appropriate authorization and audit logging
- Transmission: Must be encrypted in transit and at rest

### Implementation Guidance

1. **Logging:** Never log GRID values in plain text. Donor IDs and CBU IDs may be logged for operational purposes but should be excluded from broadly accessible log aggregation.
2. **API responses:** Include identifiers only when the consumer has appropriate authorization. Consider identifier-specific scoping in SMART on FHIR access tokens.
3. **Storage:** All identifier types should be encrypted at rest in production systems.
4. **De-identification:** When de-identifying data for research, the Donor ID, CBU ID, and GRID must be removed or replaced with opaque tokens.
