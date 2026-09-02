# Identifiers - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Identifiers**

## Identifiers

# Identifiers

This page describes the identifier systems used in the NMDP Donor Patient IG, their cardinality, and PHI sensitivity classification.

## Identifier Systems on NMDPDonorPatient

The [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.md) profile requires at least one identifier and defines two named slices:

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| NMDP Donor ID | `http://terminology.nmdp.org/identifier/donor` | 1..1 (MS) | `1234567` | Indirect identifier |
| GRID | `http://www.isbt128.org/uri/GRID` | 0..1 (MS) | `AAAA1111111` | Direct identifier |

The identifier slice is `open`, allowing additional identifier systems beyond the two named slices.

## Identifier Descriptions

### NMDP Donor ID

The unique numeric identifier assigned to a donor by the National Marrow Donor Program upon registration. Every donor in the NMDP registry has exactly one Donor ID.

* **System:** `http://terminology.nmdp.org/identifier/donor`
* **Format:** Numeric string (typically 7 digits)
* **Assigned by:** NMDP at time of registration
* **Cardinality:** 1..1 (required)

### GRID (Global Registration Identifier for Donors)

The ISBT 128 Global Registration Identifier for Donors — a globally unique identifier that follows the donor across registries and international borders.

* **System:** `http://www.isbt128.org/uri/GRID`
* **Format:** 4 alpha characters + 7 numeric characters (e.g., `AAAA1111111`)
* **Assigned by:** WMDA via the national registry
* **Cardinality:** 0..1 (optional but must-support)

## Additional Identifier Systems (aliases.fsh)

The following identifier systems are defined in `aliases.fsh` for use in related profiles and future IG expansion:

| | | |
| :--- | :--- | :--- |
| CBU ID | `http://terminology.nmdp.org/identifier/cbu` | Cord Blood Unit identifier |
| Recipient ID | `http://terminology.nmdp.org/identifier/recipient` | Transplant recipient identifier |
| Local ID | `http://terminology.nmdp.org/identifier/local-id` | Center-specific local identifier |
| Order ID | `http://terminology.nmdp.org/identifier/order` | Search/workup order identifier |
| HML ID | `http://terminology.nmdp.org/identifier/hmlid` | HML message identifier |
| Specimen ID | `http://terminology.nmdp.org/identifier/specimen` | Specimen identifier |
| CIBMTR CRID | `http://terminology.cibmtr.org/identifier/CRID` | CIBMTR Center Research ID |

## PHI Sensitivity

Implementers **MUST** handle donor identifiers according to their PHI classification:

### Indirect Identifier — NMDP Donor ID

The NMDP Donor ID is classified as an **indirect identifier**. On its own, it does not identify an individual. However, when combined with demographic information (name, date of birth, address), it becomes Protected Health Information (PHI) under HIPAA.

* On its own: Not PHI
* Combined with demographics: PHI
* Access control: Standard system-level access controls

### Direct Identifier — GRID

The GRID is classified as a **direct patient identifier**. Because it is globally unique to a single individual and can be used to re-identify a person across registries, it is always considered PHI regardless of context.

* Always PHI regardless of accompanying data
* Access control: Requires appropriate authorization and audit logging
* Transmission: Must be encrypted in transit and at rest

### Implementation Guidance

1. **Logging:**Never log GRID values in plain text. NMDP Donor IDs may be logged for operational purposes but should be excluded from broadly accessible log aggregation.
1. **API responses:**Include identifiers only when the consumer has appropriate authorization. Consider identifier-specific scoping in SMART on FHIR access tokens.
1. **Storage:**Both identifier types should be encrypted at rest in production systems.
1. **De-identification:**When de-identifying data for research, both the NMDP Donor ID and GRID must be removed or replaced with opaque tokens.

