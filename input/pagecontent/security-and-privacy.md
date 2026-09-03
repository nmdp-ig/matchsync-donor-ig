# Security and Privacy

This page documents the sensitivity classification of identifiers and data elements in the NMDP Donor Patient IG, along with data governance policies and access control recommendations for implementers.

## Identifier Sensitivity Classification

NMDP identifiers have nuanced sensitivity classifications. The NMDP Security Architecture team made a formal determination in 2016 that NMDP Donor IDs (DID), Recipient IDs (RID), and CRIDs are "re-identification numbers" — they are not PHI in isolation, but **become PHI when combined with health information** in a FHIR Bundle or API response.

| Identifier System URI | Classification | Notes |
|---|---|---|
| `http://terminology.nmdp.org/identifier/donor-id` | PHI when combined with health info | Re-identification number per 2016 Security Architecture ruling. De-identified in isolation; constitutes PHI when bundled with demographics or HLA data. |
| `http://nmdp.org/identifier/grid` | PII/PHI in operational practice | NMDP GRID — globally unique donor identifier. Treated as PII/PHI in all NMDP systems due to global uniqueness and linkability to an individual. |
| HLA typing data (GL String values) | GDPR Article 9 genetic data | Not HIPAA PHI by itself, but classified as genetic data under GDPR Article 9 for international donors. NMDP recognizes HLA can be re-identifying. |
| `http://terminology.nmdp.org/identifier/center-id` | Internal Use | Does not identify an individual. Lower sensitivity; used to identify transplant centers and donor centers. |

### Bundle-Level PHI

A Donor API response Bundle constitutes PHI in aggregate, even though individual identifiers (such as a Donor ID alone) may be considered de-identified in isolation. When a Donor ID appears alongside demographics, HLA typing, or blood type within a FHIR Bundle, the entire Bundle must be protected as PHI.

### HLA as Genetic Data

For donors from jurisdictions covered by GDPR (e.g., European registries), HLA typing data is classified as "genetic data" under Article 9 and requires additional protections including explicit consent for processing. NMDP exempts HLA strings from de-identification requirements in non-production environments due to testing needs, but production data must be handled as sensitive genetic information.

## Data Governance

### NMDP Information Classification Framework

NMDP policy P00096 (Information Security Policy) defines four data classification levels:

| Level | Description | Entitlement Review |
|---|---|---|
| **Public** | No access restrictions. Published research, public website content. | None required |
| **Internal Use** | NMDP employees only. Internal documentation, org charts. | None required |
| **Confidential** | Restricted access, role-based. Competitive data, non-PHI business records. | Annually |
| **Confidential: Personal Medical** | PHI/PII — highest restriction. Donor/patient identifying info combined with health data. | Semi-annually |

### Donor-Identifying Information

NMDP defines "Donor-Identifying Information" broadly — it includes registry, managing donor center, location, gender, age, ABO/Rh type, HLA type, infectious disease marker results, health history, and photographs. Per NMDP policy, **Donor-Identifying Information is always classified as Personal Medical Information** (the highest sensitivity level).

### Regulatory Jurisdiction

The Donor API falls under multiple regulatory frameworks:

- **HIPAA** — Health information of US donors
- **HRSA** — Federal grant requirements for the C.W. Bill Young Cell Transplantation Program
- **FDA** — Regulatory compliance for donor eligibility and selection
- **GDPR** — International donors; HLA is genetic data under Article 9

## Access Control Recommendations

### Minimum Necessary Principle

Implementers SHOULD apply the HIPAA minimum necessary standard: request and return only the data elements required for the specific use case. The Donor API supports this through:

- Scoped search parameters that limit returned results
- Profile-level constraints that define which elements are required vs. optional
- Role-based access that restricts endpoint availability

### Transplant Center-Scoped Authorization

Access to the Donor API is protected by OAuth 2.0 (Okta). Each transplant center (TC) receives individual credentials with access tokens that scope data access:

- Tokens carry TC-specific claims that limit which donor records are accessible
- Authorization is scoped to the transplant center's own searches and orders
- All access is logged with: timestamp, operation result, username, accessed method, user role, and patient/donor ID

### Transport Security

The Donor API transmits data over the Internet to transplant centers. Per NMDP's Data Protection Matrix, **TLS 1.2+ is mandatory** for any transmission of Confidential Health/Personal Information across the Internet.

### Audit Requirements

NMDP security requires structured audit logging for all PHI access in the following format:

```
Timestamp | Result | Username | ID | Accessed Method | User Role | Patient/Donor ID
```

Implementers SHOULD maintain audit logs consistent with this format for all Donor API interactions.
