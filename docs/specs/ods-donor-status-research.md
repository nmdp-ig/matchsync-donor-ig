# ODS Donor Status Codes — Research Findings

**Date:** 2026-07-23  
**Researcher:** AI agent (research-ods-status session)  
**Unblocks:** GitHub Issues #3 and #4  

## Summary

The enterprise "Registry Status" (also called "Source Status") is the authoritative NMDP
designation for a donor's availability for patient search, matching, and product request.
The ODS stores and serves this status via the `DonorWithSampleResponse (v05)` service.

## Canonical ODS Registry Status Codes (for Donors)

| ODS Code | Name | Description |
|----------|------|-------------|
| **AV** | Available | Donor available for search, further typing, and collection |
| **TU** | Temporarily Unavailable | Temporarily unavailable, typically post-collection; has an "available date" for return |
| **AC** | Active | Currently active on a search — reserved for a specific patient case |
| **DE** | Deleted | Permanently removed from registry (not interested, deferred, deceased, too old, unable to contact) |

### Additional Status (Not Donor-Applicable)
| ODS Code | Name | Notes |
|----------|------|-------|
| **NE** | Newly Entered | Transitional state for newly registered donors before first declaration (becomes AV) |
| **AX** | Active on Another Search | MatchSource-computed display value (not persisted in ODS; derived from AC + different patient context) |
| **NA** | Not Available | Used for cords only, not donors |

## FHIR Mapping (as implemented)

| ODS Code | FHIR Code | Display |
|----------|-----------|---------|
| AV | `available` | Available |
| TU | `temporarily-unavailable` | Temporarily Unavailable |
| AC | `active` | Active |
| DE | `permanently-unavailable` | Permanently Unavailable |

CodeSystem URL: `http://terminology.nmdp.org/codesystem/donor-status`

## Confluence Sources

1. **"Donor Status Values (Same as Enterprise)"** — MatchSource space (page 57489291)
   - Definitive list of enterprise donor status codes with display values and UI behavior
   
2. **"(Sybase Retirement) Declaration of Source Status - Solution Outline"** — EA space (page 547230360)
   - Release Reason Code → Registry Status Code mapping; state machine for status transitions
   - Confirms the 4 primary donor statuses: AV, TU, AC, DE
   
3. **"Status to Reason code mapping for Sources (Donors and Cords)"** — Global Solutions (page 211521625)
   - WMDA/EMDIS interop status codes: AV, TU, RS (Reserved), DE
   - Confirms international alignment of status vocabulary

4. **"FHIR Donor API — Data Model Reference"** — MatchSync space (page 572490225)
   - Eric Friday's design doc (updated 2026-07-22) defining the FHIR extension
   - Originally listed: available, unavailable, deferred, permanently-unavailable

5. **"Donor Status Anomaly Detection - Discovery"** — MatchSource space (page 257429270)
   - Confirms ODS is one of 3 systems (CMA, ODS, Haplogic) that store donor status

6. **"Donor Supplier Local Status Message Trigger Codes"** — Traxis/Case Mgmt (page 60365211)
   - Local status codes that trigger releases: DC, DD, MI, NA, NI, TU, UC, RO

## Design Decision

The FHIR CodeSystem uses human-readable kebab-case codes rather than the 2-letter ODS
abbreviations, because:
1. FHIR best practice favors descriptive codes over legacy abbreviations
2. The API consumers (transplant centers) should not need to know ODS internals
3. The ODS code is documented in each concept's description for internal traceability

## State Transitions (Donor)

```
NE → AV (DonorRegistered)
AV → AC (order placed / source activated)
AC → AV (released: cancel, adverse event, discrepant typing, etc.)
AC → TU (released: collection complete, with available date)
AC → DE (released: not interested, permanently deferred, too old, deceased)
AV → TU (DonorSupplierStatusChanged with TU + available date)
AV → DE (DonorSupplierStatusChanged with NI/UC/DD/OD)
TU → AV (available date passes, or DonorSupplierStatusChanged with AV)
TU → DE (DonorSupplierStatusChanged with NI/UC/DD/OD)
DE → AV (DonorSupplierStatusChanged with AV — reactivation)
DE → TU (DonorSupplierStatusChanged with TU + available date)
```

Note: Donors in AC status cannot be moved to another status directly — they must first
be released (triggering DonorReleased event from Case Management).
