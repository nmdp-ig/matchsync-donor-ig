# Research: Cord Blood Unit (CBU) Profile Design

**Date:** 2026-07-24  
**Researcher:** AI agent (research-cbu session)  
**Unblocks:** GitHub Issue #2 (FHIR resource type for CBU)

---

## Summary

A Cord Blood Unit (CBU) is a banked, frozen stem cell product extracted from a newborn's umbilical cord blood. It serves as an alternative transplant source to adult donors. While CBUs share many data patterns with adult donors (HLA typing, ABO/Rh, demographics, status), they differ fundamentally in:

1. **Identity** — A CBU is a stored product, not a living person who can be re-contacted
2. **Identifiers** — Different identifier systems and qualifiers
3. **Status codes** — Different state machine with CBU-specific statuses
4. **Additional data** — Maternal data, cell counts, processing/storage info, volume
5. **Missing data** — No contact info, no address, no ability to perform additional workup

---

## How CBU Data Differs from Adult Donor Data

### Shared Fields (same FHIR pattern)

| Field | Adult Donor | CBU | Notes |
|-------|------------|-----|-------|
| HLA typing | ✅ | ✅ | Same LOINC codes, same GL String representation |
| ABO/Rh | ✅ | ✅ | Same Observation pattern |
| Sex | ✅ | ✅ | Sex of the cord blood donor (infant) |
| Race | ✅ | ✅ | Same US Core extension |
| Ethnicity | ✅ | ✅ | Same US Core extension |
| CMV | ✅ | ✅ | Same Observation pattern |
| Status | ✅ | ✅ | Same extension structure, **different code set** |
| IDM (Infectious Disease Markers) | ✅ | ✅ | Same pattern |

### CBU-Only Fields (not on adult donors)

| Field | Description | Source |
|-------|-------------|--------|
| **Collection Date** | Date the CBU was collected (maps to `birthDate` if using Patient) | COLL_DATE in B2B |
| **Freeze Date** | Date the CBU was frozen | NMSM labInfo |
| **Processing Date** | Date processing started | NMSM baseInfo |
| **Processing Method** | Method used (e.g., manual, automated) | PROC_METH |
| **Volume (pre-processing)** | Collected volume in ml | VOL |
| **Volume (frozen)** | Post-processing volume in ml | VOL_FRZN |
| **TNC (Total Nucleated Cells)** | Cell count before processing | TNC |
| **TNC (frozen)** | Cell count post-processing | TNC_FRZN |
| **CD34+ cells** | Stem cell count (before/after processing) | CD34PC, CD34PC_FRZN |
| **CFU (Colony Forming Units)** | Post-processing CFU count | CFU_FRZN |
| **MNC (Mononucleated Cells)** | Post-processing MNC count | MNC_FRZN |
| **Viability** | Percentage viability + test date + method | VIABILITY, VIABILITY_DATE |
| **Hemoglobin (Hbg)** | Hemoglobinopathy screening | HEMO_STATUS |
| **Bacterial Culture** | Contamination test result (Y/N/U) | BACT_CULT |
| **Fungal Culture** | Contamination test result (Y/N/U) | FUNG_CULT |
| **Bag Type** | Type of cryopreservation bag | BAG_TYPE |
| **Number of Bags** | Number of sub-units | BAGS |
| **Attached Segments** | Number of attached testing segments | ATT_SEG |
| **DNA Samples Available** | Whether DNA samples exist | DNA_SMPL |
| **Red Blood Cell Reduced** | Whether RBC reduction was performed (Y/N/U) | baseInfo |
| **Plasma Reduced** | Whether plasma reduction was performed (Y/N/U) | baseInfo |
| **Confirmatory Typing Sample Type** | Type of CT sample | baseInfo |
| **CT Complete Date** | When confirmatory typing was completed | CT_COMPLETE_DATE |
| **Maternal Data** | Mother's identifiers, HLA, IDM, serum/plasma | MAT section |
| **Bank Manufacturer ID** | CBB that manufactured the unit | BANK_MANUF_ID |
| **Bank Distributor ID** | CBB distributing the unit | BANK_DISTRIB_ID |

### Adult Donor-Only Fields (not on CBUs)

| Field | Notes |
|-------|-------|
| **Contact information** | CBUs cannot be re-contacted |
| **Address** | Not applicable to a stored product |
| **Weight/Height** | Adult donor physical measurements |
| **Willingness indicators** | Donor preferences for donation type |
| **Donor center affiliation** | CBUs belong to Cord Blood Banks instead |

---

## CBU-Specific Identifiers

From the AGNIS on FHIR System URIs (page 137761765) and NMSM APIs:

| Identifier Type | System URI | Description |
|-----------------|-----------|-------------|
| **NMDP CBU ID** | `http://terminology.nmdp.org/identifier/cbu` | Primary NMDP identifier for a cord blood unit |
| **GRID** | `http://www.isbt128.org/uri/GRID` | Global Registration Identifier (shared with donors) |
| **EMDIS ID** | Qualifier `EMDIS` | Hub code + donor ID (e.g., `AUCBB1-12345`) |
| **Local ID** | Qualifier `1` or `FULL` | Local registry identifier |
| **Bank ID** | Qualifier `BANK` | Cord blood bank's own identifier |
| **Bag ID** | Qualifier `BAG` | Identifier on the physical bag |
| **CIBMTR Non-NMDP CBU ID** | `http://terminology.cibmtr.org/identifier/non-nmdp-cbu` | For CBUs not in NMDP registry |

### Key difference from adult donors

- Adult donors use `http://terminology.nmdp.org/identifier/donor` (aka `$nmdp-donor-id`)
- CBUs use `http://terminology.nmdp.org/identifier/cbu` (aka `$nmdp-cbu`)
- CBUs have **additional qualifiers** (EMDIS, FULL, 1, BANK, BAG) that don't apply to adult donors
- CBUs have a **Maternal Subject** linked via separate identifiers (maternal EMDIS ID, maternal BANK ID)

---

## CBU-Specific Status Codes

CBU statuses differ significantly from donor statuses. Based on NMSM (page 487294470, page 400557851):

### CBU Registry Status Codes

| Code | Name | Description |
|------|------|-------------|
| **AV** | Available | CBU available for search and reservation |
| **AC** | Active | CBU currently reserved/activated for a patient case |
| **NA** | Not Available | Permanently unavailable (destroyed, expired, distributed, etc.) |
| **TU** | Temporarily Unavailable | (Transitional — rarely used directly for CBUs at registry level) |

### CBU Local Status Codes (from NMSM)

| Code | Name | Description |
|------|------|-------------|
| **AV** | Available | Available from the bank |
| **NS** | No Sample | Available but no testing sample |
| **RSO** | Reserved Other | Reserved by the partner |
| **QR** | Quarantined | Under quarantine |
| **OT** | Other | Unavailable for other reasons |
| **CD** | CBU Destroyed | Unit destroyed or damaged |
| **SO** | Shipped Out | Distributed for infusion |
| **XP** | Expired | Unit has expired |
| **NA** | Not Available | Generic not available |

### CBU Input Status Codes (from EMDIS/API)

| Input Status | Stat Reason | Meaning |
|-------------|-------------|---------|
| **AV** | NS or null | Available (with or without sample) |
| **RS** | — | Reserved (maps to RSO/AC internally) |
| **TU** | QR, AD, OT, UK | Temporarily Unavailable (quarantine, admin, other, unknown) |
| **DE** | CD, MR, DS, XP, OT, UK | Deleted (destroyed, medical, distributed, expired, other) |

### Comparison: Donor vs CBU Status

| Donor Status | CBU Equivalent | Key Difference |
|-------------|---------------|----------------|
| AV (Available) | AV (Available) | Same concept |
| AC (Active on search) | AC (Active) | Same concept |
| TU (Temporarily Unavailable) | NA (Not Available) | CBUs don't "come back" easily — TU is rare for cords |
| DE (Deleted/Permanently Unavailable) | NA (Not Available) | CBUs use NA with reason codes instead |
| — | NS (No Sample) | CBU-specific: available but no testing material |
| — | RSO (Reserved Other) | CBU-specific: reserved by external partner |
| — | QR (Quarantined) | CBU-specific: contamination concern |
| — | CD (Destroyed) | CBU-specific: physical destruction |
| — | XP (Expired) | CBU-specific: shelf life exceeded |
| — | SO (Shipped Out) | CBU-specific: already distributed |

**Key insight:** CBU statuses are product-lifecycle statuses (destroyed, expired, shipped), while donor statuses are person-availability statuses (deferred, too old, deceased). The state machines are fundamentally different.

---

## Recommendation: Separate Profile or Variant?

### Option A: Separate Profile (`NMDPCordBloodUnit`)

A standalone profile extending `USCorePatientProfile` (same parent as `NMDPDonorPatient`).

**Pros:**
- Clean separation of concerns — different required fields, different status codes
- Can enforce CBU-specific constraints without affecting donor validation
- Clearer for API consumers — no ambiguity about what they're looking at
- `meta.profile` immediately distinguishes CBU from donor
- Follows the pattern already anticipated in ADR-0005: "If multiple Patient profiles emerge... consider an intermediate NMDPBasePatient"

**Cons:**
- Some duplication of shared patterns (HLA observations, ABO/Rh, race/ethnicity)
- Two profiles to maintain instead of one

### Option B: Variant of `NMDPDonorPatient` (discriminated by identifier or extension)

A single profile that uses a `source-type` extension or slice to distinguish CBU from adult donor.

**Pros:**
- Single profile to maintain
- Shared constraints aren't duplicated

**Cons:**
- Makes constraints mushy — can't require donor-only fields (contact) while making them 0..0 for CBUs
- Status code binding becomes complex (union of two different code sets)
- Harder to validate — examples must conditionally conform based on source type
- Violates FHIR profiling best practice: profiles should add constraints, not conditional ones

### Option C: BiologicallyDerivedProduct (alternative resource type)

The FHIR Roadmap (page 319260617) lists "Biologically Derived Product" as an FY2025 initiative for "Cryogenic Cord Blood." The Genomic Services team documented BiologicallyDerivedProduct as the natural fit for stored stem cell products (page 416418394).

**Pros:**
- Semantically correct — a CBU IS a biologically derived product
- Captures processing, storage, and manipulation natively
- Collection.source references the donor Patient
- Better for product lifecycle tracking

**Cons:**
- BiologicallyDerivedProduct is Maturity Level 1 (trial-use) in R4 — unstable
- No US Core profile exists for it — we lose the US Core compliance story
- CBU demographic data (race, ethnicity, sex) doesn't map naturally to BiologicallyDerivedProduct
- The Donor API's primary consumer (transplant centers doing search) needs CBU data alongside donor data in the same Patient-shaped format for comparison
- Would require extensions for nearly all the search-relevant fields
- R4 version lacks property element — can't represent blood type, HLA without extensions

### Recommendation: **Option A — Separate Profile**

**Rationale:**

1. **The status systems are different enough** to warrant separate CodeSystem bindings. A shared extension with conditional binding is harder to validate and explain.

2. **CBU has many additional required fields** (cell counts, processing info) that make no sense on an adult donor. These should be typed extensions on the CBU profile.

3. **The identifier systems are distinct** (`$nmdp-cbu` vs `$nmdp-donor-id`). Slicing them into a shared profile creates unnecessary complexity.

4. **ADR-0005 already anticipated this** and suggested introducing `NMDPBasePatient` as an intermediate profile if multiple Patient profiles emerge.

5. **BiologicallyDerivedProduct is not yet stable** and doesn't serve the Donor API's primary use case (search comparison). The Enterprise FHIR team's roadmap item may produce a separate IG for product tracking — that's a different concern than the Donor API's search/discovery use case.

6. **The "current leaning" in the Data Model Reference** (page 572490225) is already toward `Patient` with a distinguishing `meta.profile`, which aligns with Option A.

### Proposed Architecture

```
USCorePatientProfile
├── NMDPDonorPatient          (adult donors)
│   ├── identifier: $nmdp-donor-id (1..1)
│   ├── identifier: $grid (0..1)
│   ├── extension: DonorStatus (codes: available, temporarily-unavailable, active, permanently-unavailable)
│   └── ... donor-specific constraints
│
└── NMDPCordBloodUnit         (cord blood units)
    ├── identifier: $nmdp-cbu (1..1)
    ├── identifier: $grid (0..1)
    ├── extension: CBUStatus (codes: available, reserved, quarantined, destroyed, expired, shipped, not-available)
    ├── extension: CollectionDate
    ├── extension: ProcessingInfo
    ├── extension: MaternalReference (Reference to RelatedPerson)
    └── ... CBU-specific constraints
```

**Future consideration:** If a third Patient profile is added (Recipient), extract shared constraints into `NMDPBasePatient` as ADR-0005 suggests.

---

## Sources

| Page ID | Title | Space | Freshness | Key Content |
|---------|-------|-------|-----------|-------------|
| 572490225 | FHIR Donor API — Data Model Reference | MatchSync | Fresh (2026-07-22) | Proposed CBU fields mapped to FHIR Patient; open decision on resource type |
| 547237037 | FHIR Donor API | MatchSync | Fresh (2026-07-17) | CBU field list (DOB, Sex, ABO, CMV, Race, Ethnicity, Hbg, Status, HLA, Source ID) |
| 137761765 | AGNIS on FHIR - System URIs for Locally Maintained Namespaces | CIT | Stale (2024-05) | Canonical identifier URIs: `http://terminology.nmdp.org/identifier/cbu` and subject type code `CBU` |
| 487294470 | POST /listed-cord - Create or update a listed CBU | NSM | Fresh (2026-05) | Full CBU data model in NMSM: identifiers, demographics, lab info, status mapping, maternal data |
| 53053940 | CBU Identifier's and Basic validations | NSM | Ancient (2017) | CBU subject type = 'CBU', identifier validation rules, GUID assignment |
| 35586454 | CBU (B2B Gateway Interface Design) | Global Solutions | Ancient (2017) | Complete EMDIS/BMDW attribute list for CBUs: 50+ fields including volumes, cell counts, processing |
| 400557851 | NMSM Source Status Changes | NSM | Aging (2025-04) | CBU Local Status Codes (RSO, AV, QR, OT, NA, CD) and transition rules |
| 319260617 | FHIR Roadmap | Enterprise FHIR | Stale (2024-07) | BiologicallyDerivedProduct listed for "Cryogenic Cord Blood" in FY2025 roadmap |
| 416418394 | Standard FHIR Resource Definitions (R4 and US Core) | Genomic Services | Aging (2025-11) | BiologicallyDerivedProduct analysis: scope, limitations in R4, stem cell use case |
| 55313945 | PF_AD010 Cord Status Worksheet_v10.xls | NSM | Ancient (2017) | Historical cord status state machine |
| 52199850 | CBU - Mother Subject, Maternal Identifiers, CBU Identifiers | NSM | Ancient (2017) | Maternal information handling for CBUs |

---

## Open Questions (for team discussion)

1. **Should CBU status use the same extension URL as DonorStatus** (`http://fhir.nmdp.org/StructureDefinition/donor-status`) with a different binding, or a completely separate extension (`cbu-status`)?

2. **How should maternal data be represented?** Options: RelatedPerson resource, nested extension, or linked Patient (mother as a separate Patient resource with relationship link).

3. **Should cell count observations (TNC, CD34+, CFU)** be part of the CBU profile's must-support, or are they out of scope for the Donor API (which focuses on search/matching)?

4. **Does the BiologicallyDerivedProduct IG** (from Enterprise FHIR roadmap) overlap or complement this profile? Should CBU exist in both forms for different use cases?

5. **Timing:** Should CBU profile be in this IG (`donor-patient`) or a separate IG? ADR-0006 anticipated "future CBU profiles can live in dedicated IGs without namespace collision."
