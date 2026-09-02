# Research: OAuth/SMART-on-FHIR Scopes for Donor API

**Date:** 2026-07-24  
**Status:** Research Complete  
**Context:** SPEC-001 lists "SMART-on-FHIR scope documentation" as future work. This document captures what exists.

---

## Executive Summary

The Donor API **does not yet have SMART-on-FHIR scope definitions**. The authorization model is designed around **Okta Client Credentials flow with TC-scoped custom claims** — not the SMART-on-FHIR launch framework. However, NMDP has extensive precedent for SMART scopes in other projects (Genomic Services HealthLake, CIBMTR Reporting App, Patient Import) that can inform future Donor API scope design.

---

## Existing Auth Design for the Donor API

### Source: Solution Outline — Donor API (page 555619332, EA space)

**NFR-1: Security & Authentication** (approved by EA review board):
- API access shall be protected by **Okta OAuth 2.0**
- Authentication and authorization shall align with existing NMDP API patterns
- Access tokens shall scope access to donor data endpoints
- TCs will have their own individual set of credentials

### Source: Solution Outline — External Donor API (page 545984197, PE space)

**Security section** (authored by Dan Valiga, June 2026):
1. Must use **Client Credentials** flow for Okta (do not use password grant anymore)
2. Limit what patients and donors can be returned based on TC affiliation

### Source: FHIR Donor API — Data Model Reference (page 572490225, MAT space)

**Security Model** (Decision #11 — TC-scoped access control):
- **Authentication**: Okta Client Credentials flow (no password grant)
- **Authorization**: TC-scoped — token carries TC affiliation claim; API filters responses to only donors/patients associated with the requesting TC
- **Multi-TC**: TCs with multiple TC IDs handled via Okta custom claims/scopes
- **Error on unauthorized access**: HTTP 403 with FHIR `OperationOutcome`

### Key Insight: Not SMART Launch, But Could Adopt SMART Scopes

The Donor API uses a **backend service (system-level)** pattern, not an EHR-launched app. This maps to the SMART Backend Services specification (`system/` scopes), not the interactive `patient/` or `user/` launch contexts. The auth flow is:

1. TC registers as Okta client (gets client_id + client_secret)
2. TC requests token via Client Credentials grant
3. Token carries custom claim identifying TC affiliation (e.g., `tc_id: "TC-123"`)
4. API uses claim to filter data — TC can only see donors ordered for their patients

---

## SMART-on-FHIR Scope Patterns at NMDP (Precedent)

### 1. Genomic Services / HLA Antibody Service (page 446078133, GSD space)

Uses SMART FHIR scopes with Okta:
- Lab partners authenticate with client_id + client_secret
- **Scopes defined by SMART FHIR standard** (reference: `https://hl7.org/fhir/smart-app-launch/1.0.0/scopes-and-launch-context/`)
- Example scope: `system/*.*`
- WSO2 API gateway enforces scopes and subscriptions
- AD groups map to lab identity (e.g., `l1_labsync_lab_999`)
- LabSync validates that payload institution matches token claim

### 2. Amazon HealthLake FHIR Datastore (page 411895058, GSD space)

Full SMART-on-FHIR implementation with Okta as authorization server:

| Environment | AuthorizationStrategy | Scopes | Okta Endpoint |
|---|---|---|---|
| GENOMICAPPS-ENG | SMART_ON_FHIR_V1 | `system/*.*` | `nmdp.oktapreview.com/oauth2/ausaexcazhLhxKnJs0h7` |
| GENOMICAPPS-DEV | SMART_ON_FHIR | `system/*.crus` | Same |
| GENOMICAPPS-QA | SMART_ON_FHIR | `system/*.crus` | Same |
| GENOMICAPPS-PREPROD | SMART_ON_FHIR | `system/*.crus` | `nmdp.okta.com/oauth2/<tbd>` |
| GENOMICAPPS-PROD | SMART_ON_FHIR | `system/*.crus` | `nmdp.okta.com/oauth2/<tbd>` |

Scope examples from this implementation:

| Scope | Interpretation |
|---|---|
| `system/*.*` | Client authentication with access to all resources, all operations |
| `system/*.cruds` | All resources, all operations |
| `system/*.crus` | All resources, all operations except DELETE |
| `system/*.s` | All resources, SELECT only (Read Only) |

### 3. CIBMTR Reporting App / Patient Import (page 369330987, MAT space)

Okta scope → claim → groups pattern:
- **CIBMTR scope**: `api_cibmtr_fhir_ehr_client` → claim `authz_cibmtr_fhir_ehr_client` → groups `l1_role_rc_*, l1_api_cibmtr_fhir_ehr_client_user`
- **MsyncPI scope**: `api_msync_fhir_ehr_client` → claim `authz_msync_fhir_ehr_client` → groups `l1_role_mpi_tc_*, l1_api_msync_fhir_ehr_client_user`

This demonstrates that NMDP already uses **custom Okta scopes that carry group-based claims** for FHIR applications.

### 4. SMART on FHIR Notes — Okta Custom Scopes (page 69998663, CIT space)

Historical research (2018, Joel Schneider) confirming:
- Okta's default scopes do NOT include SMART-on-FHIR scopes
- SMART scopes CAN be added to Okta as custom scopes
- Reference: `https://developer.okta.com/authentication-guide/implementing-authentication/set-up-authz-server#create-scopes-optional`
- ServiceNow request for Okta OAuth2 setup: `https://nmdp.service-now.com/servicecenter/?id=sc_cat_item&sys_id=e7c3b044133a5b0023015d322244b04b`

### 5. SMART on FHIR 2.1 — Epic Integration (page 516362480, CIT space)

CRA App uses SMART v1/v2 scopes for Epic EHR launch:
- SMART v1: `{user-type}/Resource.read` or `{user-type}/Resource.write`
- SMART v2: `{user-type}/Resource.c`, `.r`, `.u`, `.d`, `.s`
- Example from CRA token: `user/Medication.r`, `user/Patient.r`, etc.

---

## Resource-Level vs Patient-Level Scopes

### SMART Scope Taxonomy (from NMDP implementations)

| Prefix | Context | Use Case at NMDP |
|---|---|---|
| `system/` | Backend service, no user context | HealthLake, LabSync, **Donor API (planned)** |
| `user/` | Logged-in user context | CRA App (clinician-facing EHR launch) |
| `patient/` | Patient-specific context | Patient portal apps, MyChart integrations |

### Donor API Scope Recommendation

Given that the Donor API uses Client Credentials (no user login), the appropriate SMART scope prefix is **`system/`**. Proposed scopes for the IG's CapabilityStatement:

| Scope | Description | Rationale |
|---|---|---|
| `system/Patient.rs` | Read + Search Patient (donor demographics) | Core use case: retrieve donor info |
| `system/Observation.rs` | Read + Search Observation (HLA, blood type, CMV) | Core use case: retrieve typing data |
| `system/ServiceRequest.rs` | Read + Search ServiceRequest (orders) | Core use case: retrieve order info |
| `system/Organization.rs` | Read + Search Organization (registry/TC) | Supporting context |
| `system/Bundle.r` | Read Bundle (collection response) | Bundle retrieval |

**Note:** These are read-only scopes. TCs never write data back to the Donor API (it's a read API).

---

## Auth Architecture Summary

```
┌─────────────────────┐
│  Transplant Center  │
│  (TC Client App)    │
└──────────┬──────────┘
           │ 1. Client Credentials Grant
           │    (client_id + client_secret)
           │    scope: system/Patient.rs system/Observation.rs
           ▼
┌─────────────────────┐
│      Okta           │
│  (Authorization     │
│   Server)           │
│                     │
│  Custom claims:     │
│  - tc_id: "TC-123"  │
│  - scopes granted   │
└──────────┬──────────┘
           │ 2. Access Token (JWT)
           │    with TC affiliation claim
           ▼
┌─────────────────────┐
│   WSO2 API Gateway  │
│   (api.nmdp.org)    │
│                     │
│  - Validates token  │
│  - Enforces scopes  │
│  - Rate limiting    │
└──────────┬──────────┘
           │ 3. Validated request
           ▼
┌─────────────────────┐
│   Donor API         │
│   (FHIR R4 Server)  │
│                     │
│  - Extracts tc_id   │
│  - Filters response │
│    to TC's patients/ │
│    donors only      │
└─────────────────────┘
```

---

## What Does NOT Exist Yet

1. **No formal SMART scope definitions** for the Donor API
2. **No `.well-known/smart-configuration`** endpoint defined
3. **No CapabilityStatement security section** specifying supported scopes
4. **No SMART Backend Services profile** (asymmetric key auth / JWT assertion)
5. **No granular resource-level scopes** — current design is "all or nothing" per TC
6. **No SMART-on-FHIR launch context** — this is a backend API, not an EHR-launched app

---

## Recommendations for SPEC-001

1. **Document `system/` scopes in the IG CapabilityStatement** — even if the actual Okta config uses custom scope names (`api_donor_fhir_client`), the IG should declare the SMART scope equivalents for interoperability.

2. **Adopt SMART Backend Services** (asymmetric key auth) as a future goal — this eliminates shared client_secrets and aligns with industry best practice (Epic Toolbox 2027 requires it).

3. **Define a custom Okta scope** following NMDP's existing pattern:
   - Scope: `api_donor_fhir_client`
   - Claim: `authz_donor_fhir_client`
   - Groups: `l1_role_donor_tc_*`, `l1_api_donor_fhir_client_user`

4. **TC affiliation claim is the authorization boundary** — scopes control what _resources_ are accessible; the TC claim controls what _data_ is visible. This is a data-level security concern, not a scope concern.

5. **No patient-level or user-level scopes needed** — the Donor API is strictly a backend service API.

---

## Sources

| Page ID | Title | Space | Relevance |
|---|---|---|---|
| 555619332 | Donor API - Solution Outline | EA | Primary auth requirements (NFR-1) |
| 545984197 | Solution Outline - External Donor API | PE | Security decisions (Dan Valiga) |
| 572490225 | FHIR Donor API — Data Model Reference | MAT | Security model, Decision #11 |
| 446078133 | Authentication and Authorization | GSD | SMART scope precedent (Antibody Service) |
| 411895058 | Implementing Amazon HealthLake for FHIR | GSD | Full SMART-on-FHIR + Okta architecture |
| 69998663 | SMART on FHIR Notes | CIT | Okta custom scope feasibility (2018) |
| 516362480 | Smart on FHIR 2.1 | CIT | SMART v1/v2 scope differences |
| 369330987 | CRA - MSync Smart on FHIR | MAT | Okta scope→claim→group pattern |
| 547237037 | FHIR Donor API (parent page) | MAT | Parent page for API specs |
| 306579742 | FHIR Backend Application Architecture | CIT | HAPI FHIR auth interceptor pattern |

### GitLab References

- `matchsync-smart-pi (66840030)` — publishes `@matchsync/smart-pi-ng` for SMART-on-FHIR Patient Import (shared patterns)
- `donor-api-sandbox` Issue #11 — TC-scoped access control decision
