# Research: PHI Classification of NMDP Identifiers

**Date:** 2026-07-24
**Status:** Complete
**Purpose:** Determine which NMDP identifier systems are classified as PHI/PII and what governance policies apply to the Donor FHIR API.
**Triggered by:** SPEC-001, User Story #20

---

## Executive Summary

NMDP has a well-defined data classification framework based on HIPAA and internal policy (P00096: Information Security Policy). Key finding: **NMDP Donor IDs (DID), Recipient IDs (RID), and CRIDs are classified as "re-identification numbers" — NOT as HIPAA PHI identifiers per se** — but they become PHI when combined with health information. GRID is explicitly treated as PII/PHI in practice by NMDP systems. The IG must document this nuanced classification to guide downstream consumers.

---

## 1. NMDP Data Classification Levels

NMDP uses four classification levels (from Information Security Policy P00096):

| Level | Description | Examples |
|-------|-------------|----------|
| **Public** | No restrictions | Published research, public website content |
| **Internal Use** | NMDP employees only | Internal documentation, org charts |
| **Confidential** | Restricted access, role-based | Competitive data, non-PHI business records |
| **Confidential: Personal Medical Information** | PHI/PII — highest restriction | Donor/Patient identifying info + health data |
| **Confidential: Personal Information** | PII without health context | Employee records, names without medical context |

**Entitlement review frequencies:**
- Public/Internal Use: None required
- Confidential: Annually
- Confidential: Personal Medical/Personal Information: Semi-annually

**Source:** Page 20447311 — "Best Practice Library" (Platform Services space)

---

## 2. Identifier PHI Classification

### 2.1 HIPAA Identifier Categories (18 Safe Harbor identifiers)

The HapLogic Privacy and Security Impact Assessment explicitly documents which HIPAA identifiers apply to NMDP systems:

| HIPAA Category | Applies to NMDP? | Notes |
|----------------|-------------------|-------|
| (A) Names | Yes | Donor names are PHI |
| (B) Geographic subdivisions < state | Yes | Address, zip |
| (C) Dates (except year) | Yes | DoB, CT date, infusion/collection/appointment dates |
| (D) Telephone numbers | Yes | |
| (E) Fax numbers | Yes | |
| (F) Email addresses | Yes | |
| (G) Social security numbers | Yes | |
| **(H) Medical record numbers** | **Disputed** | **"MRNs are numbers used to reference full medical charts across a medical network. This typically doesn't apply to NMDP. A DID, RID, CRID is not a MRN."** |
| (I) Health plan beneficiary numbers | Minimal | |
| **(J) Account numbers** | **Disputed** | **"A DID, RID, CRID is not an Account Number in this context."** |
| (K–Q) Other identifiers | Varies | See full HIPAA list |
| **(R) Any other unique identifying number** | **Key debate** | DID/RID/CRID classified as "re-identification numbers" not (R) |

**Source:** Page 180323729 — "HapLogic Privacy and Security Impact Assessment" (HapLogic space)

### 2.2 NMDP-Specific Identifier Classifications

Based on NMDP Security's formal determination (2016, Robert Hanson, Security Architect):

| Identifier | Classification | Rationale |
|------------|---------------|-----------|
| **NMDP Donor ID (DID)** | Re-identification number | Not a HIPAA (H) MRN or (R) unique code per NMDP Security ruling. Alone it is de-identified. Becomes PHI when combined with health data. |
| **Recipient ID (RID)** | Re-identification number | Same ruling as DID |
| **CRID** | Re-identification number | Same ruling as DID/RID |
| **GRID** | PII/PHI in practice | Explicitly listed alongside "donor name" and "medical info" as PII/PHI in NMDP SDLC documentation. Is an internationally unique identifier that can be linked to individual. |
| **Donor Name** | PHI (HIPAA Category A) | Always PHI when associated with health info |
| **Date of Birth** | PHI (HIPAA Category C) | Always PHI when associated with health info |
| **HLA Typing** | Special category (GDPR Art. 9: Genetic Information) | Not HIPAA PHI by itself, but NMDP recognizes it can be re-identifying. Non-production use exempted from de-identification due to testing needs. |
| **Center ID / TC Number** | Internal Use | Not directly identifying an individual |
| **ABO/Rh Blood Type** | Donor-Identifying Information | Part of NMDP's Donor-Identifying Information definition when associated with an individual |

**Sources:**
- Page 24936936 — "2016-12-12 Bioinformatics Research Data Provisioning with Security followup related to NMDP IDs" (Bioinformatics space)
- Page 547229556 — "IDP PreCert Release 6.10.2026 Build and Validation Plan" (AI Engineering CoE)
- Page 180323729 — "HapLogic Privacy and Security Impact Assessment"

### 2.3 The "Re-Identification" Nuance

NMDP Security made a critical determination in 2016:

> "The ID is considered a re-identification number (see 'Re-identification' clause), and NOT a (H) Medical Record Number, or (R) any other unique identifying number, characteristic or code."

**Implication for the FHIR IG:** DID/RID/CRID in a URL or standalone context are considered de-identified. However, when these identifiers appear **in a FHIR Bundle alongside health information** (HLA typing, demographics, blood type), the entire Bundle constitutes PHI and must be protected accordingly.

**Source:** Page 24936936 — Robert Hanson (NMDP Security Architect) formal determination

---

## 3. Donor-Identifying Information (NMDP Policy Definition)

NMDP's own policy defines "Donor-Identifying Information" more broadly than HIPAA PHI:

> **Donor-Identifying Information** means Personal Information of any registrant or person seeking registration on the Be The Match Registry or other hematopoietic stem cell registries or any Donor of Hematopoietic Stem Cell Product(s), as well as information relating particularly to that transplant, without limitation including the identification of any such person's:
> - Registry
> - Managing Donor Center
> - Cord Blood Bank
> - Day and month of cord blood unit collection
> - Location
> - Gender
> - Age
> - Blood group and Rh antigens (ABO/Rh type)
> - HLA type and locations of matches or mismatches
> - Infectious disease marker (IDM) results
> - Health history information
> - Medical conditions, test results, medications, treatments
> - Photographs
>
> **Donor-Identifying Information does not include the country of origin** for a donated Hematopoietic Stem Cell Product.
>
> **For the purposes of this policy, Donor-Identifying Information will always be considered Personal Medical Information.**

**Source:** Page 20447311 — "Best Practice Library" (Platform Services); also referenced in "Confidential Information SOP: Donor Patient" (S00339, rev 6)

---

## 4. Data Protection Requirements for FHIR API

### 4.1 Encryption Requirements (from NMDP Data Protection Matrix)

| Scenario | Requirement |
|----------|-------------|
| Confidential Health/Personal Info across Internet | **Encrypt** |
| Confidential Health/Personal Info across internal network | No (encryption optional) |
| Confidential Health/Personal Info at rest (data center) | Optional |
| Confidential Health/Personal Info on mobile/removable media | **Encrypt** |

The Donor API transmits data over the Internet to transplant centers, so **TLS encryption is mandatory**.

### 4.2 Access Control Requirements

From the Donor API Solution Outline (NFR-1):
- API access protected by **Okta OAuth 2.0**
- Each transplant center has individual credentials
- Access tokens scope access to donor data endpoints
- **All access logged for audit and compliance** (NFR-4)

### 4.3 PHI Handling Rule (from IDM Service Architecture)

> "PHI is persisted only in HealthLake; workflows pass identifiers and references."
> "Workflow payloads and DLQ entries contain identifiers and references only; clinical content is retrieved from HealthLake on demand."

**Implication:** The Donor FHIR API should document that the response Bundle constitutes PHI in aggregate, even though individual identifiers (DID) may be de-identified in isolation.

**Source:** Page 516370262 — "Step Functions State → Jira Story Mapping" (Genomic Services / IDM Service)

---

## 5. HIPAA Considerations Specific to Donor Data

### 5.1 Covered Entity Status

NMDP operates as both:
- **Covered Entity** (healthcare operations)
- **Data Processor** (for HapLogic/search services per their impact assessment)

### 5.2 Regulatory Jurisdiction

The Donor API falls under:
- **HIPAA** (health information)
- **HRSA** (federal grant requirements)
- **FDA** (regulatory compliance for donor selection)
- **GDPR** (international donors — HLA is genetic data under Art. 9)

### 5.3 Data Retention

Donor data retention: **Lifetime (50+ years)** — per HapLogic Impact Assessment.

### 5.4 De-Identification Standard

For non-production environments, NMDP requires removal/randomization of:
- Names
- **Medical record numbers (including Donor ID, or Recipient ID)**
- Account numbers (including medical and financial account numbers)
- Geographic subdivisions smaller than state
- Dates (except year)
- Phone, fax, email, SSN, certificate/license numbers
- Device/vehicle identifiers, URLs, IPs, biometrics, photos
- Any other unique identifying number

**Special exception:** "While HLA can be unique and would be, using residual information in many NMDP systems, attributable to an individual, it is often necessary to keep actual HLA strings intact in non-production regions for adequate system testing. For this reason, the randomization of HLA strings is not required under these circumstances."

**Source:** Page 20447311 — "Best Practice Library"

### 5.5 Audit Logging Requirements

NMDP security requires this log format for PHI access:

```
Timestamp | Result of the operation | Username | Id | The accessed method | User role | GUID or Patient/Donor ID
```

---

## 6. Bioinformatics Data Access Roles (Operational Model)

NMDP uses role-based security with sensitivity-coded role names:

| Role Pattern | Access Level | Sensitivity |
|-------------|--------------|-------------|
| `RES_DNR_RO_INT` | Research, Donor data, Read-only | Internal (non-identifying) |
| `RES_DNR_GEO_RO_CONF` | Research, Donor Address, Read-only | Confidential (PII) |
| `RES_DNR_PI_RO_CONF` | Research, Donor Names, Read-only | Confidential (PII) |
| `RES_RCP_RO_CONF` | Research, Recipient, Read-only | Confidential (indirectly identifying) |
| `RES_MATCH_RO_INT` | Research, Match results, Read-only | Internal |

**Source:** Page 30539910 — "Bioinformatics Data Provisioning Security Policies"

---

## 7. CIBMTR PHI Blacklist (for Public Datasets)

NMDP's automated PHI scanning for public datasets uses these blacklisted field identifiers:

```python
blacklist_terms = ["DOB", "typ", "CRID", "DID", "RID", "ID", "GRID", "CCN"]
```

This confirms these identifiers are treated as sensitive and must be excluded from public-facing data.

**Source:** Page 350390366 — "CIBMTR Publically available datasets QC (2024)"

---

## 8. Recommendations for the FHIR IG

Based on this research, the IG should document:

### 8.1 Identifier Sensitivity Table (for IG narrative)

| Identifier System | URI | PHI Classification | Access Control Guidance |
|-------------------|-----|-------------------|------------------------|
| NMDP Donor ID | `http://terminology.nmdp.org/identifier/donor-id` | Re-identifier (PHI in context) | Treat as PHI when bundled with health data |
| GRID | `http://terminology.nmdp.org/identifier/grid` | PII/PHI | Always protect; internationally unique |
| Center/TC Number | `http://terminology.nmdp.org/identifier/center-id` | Internal Use | Lower sensitivity; does not identify individual |
| Patient MRN (TC-assigned) | Varies by TC | PHI (HIPAA Category H) | TC responsibility; highest sensitivity |

### 8.2 IG Security Narrative Recommendations

1. **Bundle-level PHI:** Document that a Donor API response Bundle constitutes PHI in aggregate
2. **Transport security:** Mandate TLS 1.2+ (aligns with NMDP Data Protection Matrix)
3. **Access logging:** Reference NMDP audit format requirements
4. **Re-identification risk:** Note that DID alone is de-identified, but when combined with demographics/HLA in the Bundle, it becomes PHI
5. **GRID sensitivity:** GRID should be treated as PHI in all contexts due to its global uniqueness and linkability
6. **HLA as genetic data:** Note GDPR Article 9 classification for international contexts

---

## 9. Gaps Identified

| Gap | Impact | Recommended Action |
|-----|--------|-------------------|
| No formal NMDP "data classification register" in Collibra (tool adopted but strategy WIP) | No single source of truth for data classification | Reference P00096 policy + this research in IG |
| Confidential Information SOP (S00339) content not accessible via Confluence API | Cannot confirm full donor confidentiality SOP text | Request document from compliance team |
| GRID classification not formally documented in security policy | Relies on operational practice, not policy | Recommend InfoSec confirm GRID as PHI |
| 2016 DID/RID ruling may need refresh | 10-year-old determination | Recommend validation with current Security Architect |

---

## 10. Sources

| Page ID | Title | Space | Freshness | Relevance |
|---------|-------|-------|-----------|-----------|
| 20447311 | Best Practice Library | Platform Services (DTS) | Ancient (2017) | **Critical** — Defines PII/PHI, Donor-Identifying Info, data classification levels, de-identification requirements |
| 180323729 | HapLogic Privacy and Security Impact Assessment | HapLogic (SMP) | Ancient (2021) | **Critical** — Explicit ruling: DID/RID/CRID are NOT HIPAA (H) MRN or (J) Account numbers |
| 24936936 | 2016-12-12 Bioinformatics Research Data Provisioning with Security followup related to NMDP IDs | Bioinformatics (BIO) | Ancient (2016) | **Critical** — Robert Hanson (Security Architect) formal determination on DID in URLs |
| 30539910 | Bioinformatics Data Provisioning Security Policies | Bioinformatics (BIO) | Ancient (2018) | Important — Role-based access model with sensitivity levels |
| 547229556 | IDP PreCert Release 6.10.2026 Build and Validation Plan | AI Engineering CoE (AECE) | Fresh (2026) | Important — Confirms "same PII/PHI classification as existing fields (donor name, GRID, medical info)" |
| 296428845 | PII, PRI, PHI & PI | Bioinformatics (BIO) | Stale (2024) | Important — General PHI/PII definitions in NMDP context |
| 516370262 | Step Functions State → Jira Story Mapping | Genomic Services (GSD) | Fresh (2026) | Moderate — PHI handling rules for workflows |
| 555619332 | Donor API - Solution Outline | Enterprise Architecture (EA) | Fresh (2026) | Moderate — NFRs for security, auth, audit |
| 350390366 | CIBMTR Publically available datasets QC (2024) | Bioinformatics (BIO) | Fresh (2026) | Moderate — PHI blacklist terms including GRID, DID, RID |
| 296425749 | Setting Strategy for Data Governance and Collibra at NMDP - WIP | Data & Business Analytics (EBDS) | Stale (2024) | Context — Data governance is still maturing at NMDP |
| 60367893 | P00096 - Information Security Policy | MatchSource (MS) | Ancient (2018) | Reference — Master policy document (in MasterControl, not Confluence) |
| 260277555 | Confidential Information SOP: Donor Patient (S00339, rev 6) | D360 Project | Stale (2023) | Reference — SOP for donor/patient confidentiality (content not extractable) |
