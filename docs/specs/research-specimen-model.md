# Research: NMDP Donor Specimen/Sample Data Model

**Date:** 2026-07-24
**Author:** Research Agent (automated)
**Status:** DRAFT — research findings for FHIR Specimen profile design
**Related:** SPEC-001 (future work: Specimen profile for donor samples)

---

## Executive Summary

NMDP tracks two fundamentally different categories of biological material from donors:

1. **Testing Samples** — Blood draws, buccal swabs, etc. collected for HLA typing, IDM testing, and confirmatory typing
2. **Stem Cell Products** — The actual therapeutic products (HPC, Apheresis; HPC, Marrow; HPC, Cord Blood) collected for transplant

These are distinct in purpose, lifecycle, identifiers, and FHIR resource fit. A single `Specimen` profile may not cover both — the stem cell products may better align with `BiologicallyDerivedProduct` (R4) or a custom profile.

---

## 1. Sample/Specimen Types

### 1.1 Testing Samples (for typing/IDM)

Collected during Search and Workup phases. **Specimen collection methods** documented in EO2F BRD:

| Specimen Type | Tube/Container | Context | Notes |
|---|---|---|---|
| Blood sample (ACD) | ACD tube | CT, IDM, HLA typing | Acid Citrate Dextrose anticoagulant |
| Blood sample (EDTA) | EDTA tube | CT, IDM, HLA typing | Standard hematology tube |
| Blood sample (No Anticoagulant) | Plain/SST tube | Serology | For serum-based tests |
| Blood sample (Sodium Heparin) | Heparin tube | HLA typing, crossmatch | Green top |
| Buccal swab | Swab kit | HLA typing (exception) | Pandemic/remote fallback for CT |
| Hair root | Collection kit | Rare fallback | DNA source |
| Saliva tube | Saliva tube | DNA typing | Alternative DNA source |
| Urine | Container | Rare | Drug screening |
| Cord sample | Segment from CBU | CBU CT typing | Attached segment for testing |
| Cryopreserved product sample | Vial/segment | QC testing | Aliquot from cryopreserved product |

**Source:** EO2F "Business Requirement Document - information to collect prior to setting up a Product or Service" (page 266929254); "Test - Confirmatory Typing - Donor" (page 271320049)

### 1.2 Stem Cell Products (for transplant)

These are the therapeutic products collected and delivered:

| Product Type | NMDP Code | ISBT-128 Name | Collection Method | Storage |
|---|---|---|---|---|
| HPC, Apheresis | PBSC | HPC, Apheresis [HPC(A)] | Leukapheresis (after G-CSF mobilization) | Cooled (fresh) or Cryopreserved |
| HPC, Marrow | MARROW | HPC, Marrow [HPC(M)] | Surgical harvest from iliac crest | Cooled (fresh) or Cryopreserved |
| HPC, Cord Blood | CBU | HPC, Cord Blood [HPC(CB)] | Collected at birth from umbilical cord | Frozen (always cryopreserved) |
| MNC, Apheresis | MNC(A) | MNC, Apheresis | Unstimulated leukapheresis | Cooled (fresh) |
| NC, Whole Blood | — | NC, Whole Blood (in tubes) | Blood draw | Room temperature |

**Source:** "Donor Fulfillment Request/Order Overview - CURRENT STATE" (page 235443430); "Product - HPC, Apheresis" (page 271320103); "Customer Ready Product" (page 271320105)

### 1.3 Pre-Collection and Day-of-Collection Samples

Associated with workup/collection orders, these accompany the product:

- **Pre-collection samples** — Blood drawn before donation starts (for crossmatch, IDM)
- **Day of collection blood samples** — Drawn on collection day
- **Day of collection product samples** — Aliquots taken from the product bag itself

**Source:** WMDA F10 "Formal Request for Stem Cell or Lymphocyte Collection" (page 539920766); "Product - HPC, Apheresis" (page 271320103)

---

## 2. Identifiers

### 2.1 Identifiers for Testing Samples

Testing samples are NOT individually identified with their own unique ID in the current system. They are tracked by:

| Identifier | System | Purpose |
|---|---|---|
| Order Number | `http://terminology.nmdp.org/identifier/order` | Links sample to the ServiceRequest that triggered collection |
| Donor GRID | `http://www.isbt128.org/uri/GRID` | Identifies whose sample it is |
| Donor NMDP ID | `http://terminology.nmdp.org/identifier/donor` | Alternative donor identifier |
| Kit ID | Internal (KitMaker) | Tracks the physical collection kit shipped to draw site |

### 2.2 Identifiers for Cord Blood Units

CBUs have rich identification per WMDA/EMDIS data dictionary:

| Identifier | EMDIS Field | System URI | Notes |
|---|---|---|---|
| CBU ID | `CB_ID` | `http://terminology.nmdp.org/identifier/cbu` | Hub-assigned unit ID |
| CBU Local ID | `CB_LOCAL_ID` | Cord Blood Bank local system | Bank's internal ID |
| GRID | `D_GRID` | `http://www.isbt128.org/uri/GRID` | Global Registration ID |
| Donor/Source ID | `D_ID` | Registry-specific | 17-char donor identification |
| ISBT-128 DIN | — | ISBT-128 | Donation Identification Number (on product label) |

**Source:** EMDIS "DONOR_CB" message type (page 555619838); "FHIR Donor API — Data Model Reference" (page 572490225)

### 2.3 Identifiers for Stem Cell Products

| Identifier | Context | Notes |
|---|---|---|
| ISBT-128 DIN (Donation Identification Number) | Product labeling | Required by FDA for HPC products |
| Source GUID | ODS SourceActivationInfo | Internal NMDP activation identifier |
| Order Number | ServiceRequest | Links to the fulfillment order |
| GRID | Donor linkage | Connects product to donor |

---

## 3. Key Attributes

### 3.1 CBU-Specific Attributes (from EMDIS/WMDA)

These are the quantitative attributes exchanged internationally:

| Attribute | EMDIS Field | WMDA Dict # | Unit | Phase |
|---|---|---|---|---|
| Volume at collection | `CB_VOL` | 283 | mL | Pre-processing |
| Volume frozen (cryopreserved) | `CB_VOL_FRZN` | 284 | mL | Post-processing |
| TNC collected | `CB_TNC` | 218 | ×10^8 total | At collection |
| TNC frozen | `CB_TNC_FRZN` | 219 | ×10^8 total | Post-processing |
| CD34+ collected | `CB_CD34PC` | 1 | ×10^6 total | At collection |
| CD34+ frozen | `CB_CD34PC_FRZN` | 2 | ×10^6 total | Post-processing |
| MNC frozen | `CB_MNC_FRZN` | 212 | ×10^6 total | Post-processing |
| CFU (colony forming units) | `CB_CFU_FRZN` | 48 | Total | Post-processing (GM method) |
| Volume reduction method | `CB_REDUCTION` | 248 | Code | Processing method |
| CT completion date | `CB_CT_COMPLETE_DATE` | 66 | Date | Verification typing |
| DNA sample available | `DNA_AVA` | 73 | Boolean | — |
| Maternal serum available | `MAT_SER_AVA` | 197 | Boolean | — |
| Maternal serum quantity | `MAT_SER_QUANT` | 198 | Count (vials) | — |

**Source:** EMDIS "ALM_RES" (page 555619833); EMDIS "DONOR_CB" (page 555619838)

### 3.2 Adult Donor Product Attributes (from Ops Metrics)

For PBSC and Marrow products, key quality metrics:

| Attribute | Product | Minimum Threshold | Unit |
|---|---|---|---|
| CD34+ per kg | PBSC | ≥ 4.5 | ×10^6/kg (recipient weight) |
| CD34+ per kg | Marrow (pt ≥70kg) | ≥ 2 | ×10^6/kg |
| TNC per kg | Marrow (pt ≥70kg) | ≥ 2 | ×10^8/kg |
| CD34+ per kg | Marrow (pt <70kg) | ≥ 3 | ×10^6/kg |
| TNC per kg | Marrow (pt <70kg) | ≥ 3 | ×10^8/kg |

**Source:** "Ops Metrics Source Logic" (page 235451273)

### 3.3 Common Specimen Attributes (IDM Specimen from IDM IG)

The Genomic Services IDM FHIR IG defines a specimen profile with:

| Element | Requirement | Notes |
|---|---|---|
| `type` | Required | e.g., blood, buccal swab (SNOMED coded) |
| `collection.collected[x]` | Required | Collection date |
| `collection.bodySite` | Optional | Body site |
| `condition` | Optional | Sample condition |
| Custom: `idm-specimen-validity` | Extension | valid / compromised / unknown |

**Source:** "IDM FHIR Implementation Guide (IG) – Draft" (page 555617199, GSD space)

---

## 4. Relationship to ServiceRequest (Orders)

The NMDP order structure creates a clear hierarchy linking samples to orders:

```
Customer Order (CO) — placed by TC in MatchSource
  └── Fulfillment Order (FO) — communicated to Donor Center/CBB
        ├── Supplier Order (SO) — for typing lab work
        └── Order Tracking — milestones and dates
```

### Order Types That Generate Specimen Collection

| Order Type | FO Code | Product Type | Samples Generated |
|---|---|---|---|
| DR Request | DR | N/A | Blood sample for DR typing |
| HR Request | HR | N/A | Blood sample for high-res typing |
| CT Request | CT | N/A | Blood sample for confirmatory typing + IDM |
| Marrow Workup | WU, WU2 | HPC, Marrow | Pre-collection samples + product |
| PBSC Workup | G1, G2 | HPC, Apheresis | Pre-collection samples + product |
| T-Cell/Leuka | UW | MNC, Apheresis | Product (unstimulated) |
| Additional Tubes | AT | N/A | Extra blood tubes for TC labs |
| CBU Request | — | HPC, Cord Blood | Product (from storage) |

### FHIR Relationship Pattern

```
ServiceRequest (order)
  ├── Specimen (testing sample) — via ServiceRequest.specimen or Specimen.request
  └── BiologicallyDerivedProduct / Specimen (stem cell product)
        └── linked via ServiceRequest.identifier (Order Number)
```

**Source:** "Donor Fulfillment Request/Order Overview - CURRENT STATE" (page 235443430)

---

## 5. Recommendations for FHIR Profile Design

### 5.1 Two Distinct Profiles Needed

Based on the research, NMDP's specimen domain splits into:

| Category | Recommended FHIR Resource | Rationale |
|---|---|---|
| Testing specimens (blood tubes, swabs) | `Specimen` | Standard lab specimen — type, collection date, subject, request linkage |
| Stem cell products (HPC(A), HPC(M)) | `BiologicallyDerivedProduct` (R5) or `Specimen` with extensions | Products have processing, storage, cell counts, volume reduction — more than Specimen natively supports |
| Cord Blood Units | **OPEN** (see Issue #2) | CBUs have demographic properties AND product properties; current leaning is `Patient` with profile |

### 5.2 NMDPDonorSpecimen Profile (Testing Samples)

```
Profile: NMDPDonorSpecimen
Parent: Specimen

Elements:
  type           1..1  CodeableConcept  (SNOMED specimen type — blood, buccal swab, etc.)
  subject        1..1  Reference(NMDPDonorPatient)
  request        0..*  Reference(ServiceRequest)  — links to CT/IDM/HR order
  collection
    collected[x] 1..1  dateTime
    bodySite     0..1  CodeableConcept
  container
    type         0..1  CodeableConcept  (ACD, EDTA, Heparin, No Anticoagulant)
  condition      0..*  CodeableConcept  (hemolyzed, lipemic, etc.)
  
Extensions:
  specimen-validity    0..1  code  (valid | compromised | unknown)  — from IDM IG pattern
```

### 5.3 NMDPStemCellProduct Profile (Future — Transplant Products)

If the IG eventually covers stem cell products:

```
Profile: NMDPStemCellProduct
Parent: Specimen (or BiologicallyDerivedProduct in R5)

Elements:
  type                 1..1  (HPC, Apheresis | HPC, Marrow | HPC, Cord Blood | MNC, Apheresis)
  subject              1..1  Reference(NMDPDonorPatient)
  collection
    collected[x]       1..1  dateTime
  processing           0..*  (volume reduction method, cryopreservation)
  
Extensions/Observations:
  volume-collected     0..1  Quantity (mL)
  volume-frozen        0..1  Quantity (mL)
  tnc-collected        0..1  Quantity (×10^8)
  tnc-frozen           0..1  Quantity (×10^8)
  cd34-collected       0..1  Quantity (×10^6)
  cd34-frozen          0..1  Quantity (×10^6)
  mnc-frozen           0..1  Quantity (×10^6)
  cfu-frozen           0..1  Quantity (total)
  cell-count-per-kg    0..1  Quantity (per recipient kg)
```

### 5.4 Identifier Systems

| Identifier | System URI | Used On |
|---|---|---|
| GRID | `http://www.isbt128.org/uri/GRID` | Donor link (via subject) |
| CBU ID | `http://terminology.nmdp.org/identifier/cbu` | CBU specimens |
| Order Number | `http://terminology.nmdp.org/identifier/order` | ServiceRequest link |
| ISBT-128 DIN | `http://www.isbt128.org/uri/DIN` | Product label ID |
| Kit ID | TBD (internal) | KitMaker tracking |

### 5.5 ValueSets Needed

| ValueSet | Purpose | Source Codes |
|---|---|---|
| NMDPSpecimenType | Testing specimen types | SNOMED CT (blood, buccal swab, hair, saliva, urine) |
| NMDPContainerType | Collection tube types | ACD, EDTA, Sodium Heparin, No Anticoagulant, Plain |
| NMDPProductType | Stem cell product types | HPC Apheresis, HPC Marrow, HPC Cord Blood, MNC Apheresis, NC Whole Blood |
| NMDPVolumeReductionMethod | CBU processing method | WMDA dict #248 values |
| NMDPSpecimenValidity | Specimen quality | valid, compromised, unknown (from IDM IG) |

---

## 6. Open Questions

1. **CBU resource type** — Still OPEN (Issue #2). If CBU stays as `Patient`, does its physical product still need a `Specimen` or `BiologicallyDerivedProduct` resource?
2. **Scope boundary** — Does the Donor API need to expose product-level data (TNC, CD34, volume) or is that out of scope for v1?
3. **ISBT-128 integration** — Should the IG require ISBT-128 DIN for products, and if so, define the identifier system?
4. **ODS data source** — The `SourceReleaseInfo (v03)` and `InfusionInfo (v02)` ODS services contain release/infusion data. These are marked as v2 backlog.
5. **QC Sample Manager** — A separate system (QC Prime) manages derived QC samples. Unclear if this needs FHIR representation.

---

## 7. Sources

| Page ID | Title | Space | Freshness | Key Data |
|---|---|---|---|---|
| 572490225 | FHIR Donor API — Data Model Reference | MAT (MatchSync) | Fresh (2026-07-22) | CBU fields, identifiers, ODS services, open decisions |
| 555617199 | IDM FHIR Implementation Guide (IG) – Draft | GSD (Genomic Services) | Fresh (2026-06-25) | IDM Specimen profile, specimen validity extension |
| 235443430 | Donor Fulfillment Request/Order Overview - CURRENT STATE | EO2F | Fresh (2026-01-20) | Order types, product types, fulfillment structure |
| 271320049 | Test - Confirmatory Typing - Donor | EO2F | Stale (2024-08) | CT blood sample collection, tube types, fulfillment |
| 271320103 | Product - HPC, Apheresis | EO2F | Stale (2024-01) | PBSC product definition, pre/day-of collection samples |
| 271320105 | Customer Ready Product | EO2F | Stale (2024-01) | CBU product, cryopreserved products |
| 555619833 | ALM_RES (EMDIS message type) | SMAS | Fresh (2026-07-15) | CBU cell counts, volumes, WMDA fields |
| 555619838 | DONOR_CB (EMDIS message type) | SMAS | Fresh (2026-07-15) | CBU attributes, D_COLL_TYPE, identifiers |
| 539920766 | WMDA F10 Formal Request for Stem Cell Collection | MAT | Fresh (2026-04-29) | Pre-collection sample types, tube volumes |
| 266929254 | BRD - Products and Services Catalog | EO2F | Stale (2024-01) | Specimen collection methods enumeration |
| 235451273 | Ops Metrics Source Logic | EBDS (DnA) | Fresh (2026-06-08) | TNC/CD34 thresholds for product quality |
| 260277557 | Specimen Packaging Instructions (IATA) | D360 | Stale (2023-08) | Shipping categories, packaging requirements |

---

## 8. Next Steps

1. **Immediate (v1):** Add `NMDPDonorSpecimen` profile to the IG for CT/IDM blood samples — minimal profile aligned with IDM IG patterns
2. **v2 consideration:** Decide on CBU resource type (resolves Issue #2) before designing product-level specimen
3. **Coordination:** Align with Genomic Services team (Brittany Schueler) on the IDM Specimen profile to share extensions
4. **External standards:** Review ISBT-128 FHIR IG (if it exists) and HL7 Transfusion Medicine for `BiologicallyDerivedProduct` patterns
