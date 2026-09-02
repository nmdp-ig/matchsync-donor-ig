# Domain Context — NMDP Donor Patient IG

This document provides domain terminology and FHIR-specific context for agents working in this repository.

## Organization

**NMDP** (National Marrow Donor Program), operating as **Be The Match**, manages the world's largest registry of potential hematopoietic cell donors. The registry connects patients needing bone marrow or stem cell transplants with unrelated donors.

**CIBMTR** (Center for International Blood and Marrow Transplant Research) is a research collaboration between NMDP and the Medical College of Wisconsin that tracks transplant outcomes.

## Key domain terms

| Term | Definition |
|------|-----------|
| **Donor** | A person registered in the NMDP registry as a potential source of hematopoietic stem cells |
| **GRID** | Global Registration Identifier for Donors (ISBT 128 standard). A globally unique donor ID used across registries worldwide. Format: alphanumeric, issued by WMDA. |
| **NMDP Donor ID** | NMDP's internal numeric identifier for a donor. System URI: `http://terminology.nmdp.org/identifier/nmdp-donor-id` |
| **HLA** | Human Leukocyte Antigen — the immune system genes used to match donors and recipients. Key loci: HLA-A, HLA-B, HLA-C, HLA-DRB1, HLA-DQB1, HLA-DPB1 |
| **GL String** | Genotype List String — a compact notation for HLA genotyping results (allele ambiguity, phasing). See `gl.nmdp.org`. |
| **CT** | Confirmatory Typing — HLA testing performed after a preliminary match to confirm donor suitability |
| **IDM** | Infectious Disease Markers — blood testing for transmissible diseases before donation |
| **Collection** | The procedure to harvest stem cells from the donor (apheresis or marrow harvest) |
| **Workup** | The full process from CT through collection clearance |
| **ODS** | Operational Data Services — NMDP's legacy SOAP/REST service layer that this FHIR API replaces |
| **DonorStatus** | The availability state of a donor (e.g., available, deferred, unavailable, deceased) |
| **Transplant center (TC)** | The hospital/facility treating the patient who needs a transplant |
| **Cord Blood Unit (CBU)** | Stem cells collected from umbilical cord blood, stored in banks, used as alternative to adult donors |
| **WMDA** | World Marrow Donor Association — international body coordinating donor registries globally |

## FHIR mapping

| Domain concept | FHIR resource | Profile in this IG |
|---------------|---------------|-------------------|
| Donor | Patient | NMDPDonorPatient |
| Donor center / registry | Organization | NMDPOrganization |
| Donor availability | Extension on Patient | DonorStatus |
| HLA typing result | Observation | (planned — Tier 3) |
| Donor order (CT/IDM/collection) | ServiceRequest | (planned — Tier 4) |

## Identifier systems

| System URI | What it identifies |
|-----------|-------------------|
| `http://terminology.nmdp.org/identifier/nmdp-donor-id` | NMDP's internal donor ID |
| `http://www.isbt128.org/uri/GRID` | Global Registration Identifier for Donors |
| `http://terminology.nmdp.org/identifier/center-id` | NMDP center/facility ID |

## Terminology systems

| System URI | What it contains |
|-----------|-----------------|
| `http://terminology.nmdp.org/codesystem/donor-status` | Donor availability states |
| `http://terminology.nmdp.org/codesystem/center-type` | Types of NMDP-affiliated centers |

## Standards referenced

- **FHIR R4 (4.0.1):** Base specification
- **US Core 6.1.0:** US-specific Patient constraints (race, ethnicity, Must-Support elements)
- **ISBT 128:** International standard for blood/tissue product identification (GRID)
- **LOINC:** Observation codes for lab results (HLA typing)
- **GL String Code:** Compact HLA genotype notation (planned)
