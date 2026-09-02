# Research: effectivePeriod for DonorStatus Extension

**Date**: 2026-07-24
**Question**: Does the ODS 'available date' for TU donors need to be surfaced in the FHIR API? Should DonorStatus be a complex extension with code + date?

## Summary of Findings

**Yes — the available date is a critical operational field that should be surfaced in the FHIR API.** The ODS `DonorWithSampleResponse` returns `baseInfo.availableDate` for every donor, and the enterprise architecture explicitly tracks this date as part of TU status transitions. Transplant centers use it for planning.

## Evidence: The Available Date Field

### 1. ODS DonorWithSampleResponse Contains `availableDate`

The "MS dates" page (Confluence page 71671365, MatchSource space) provides explicit field mapping:

| MS field name | Integration | Integration Mapping | Example |
|---|---|---|---|
| `Donor.availableDate` | ESB | `DonorWithSample.baseInfo.availableDate` | `2019-10-14T00:00:00.000-05:00` |

This confirms `availableDate` is part of the standard `DonorWithSampleResponse` payload, in `baseInfo`, alongside `registrationDate` and `lastDonorContactDate`.

Additionally, `DonorIDSearch.availableDate` (the lookup service) also returns the date, mapped as `DonorLookup.availabilityDate` in MatchSource.

### 2. Available Date Is Semantically Tied to TU Status

From the "(Sybase Retirement) Declaration of Source Status - Solution Outline" (page 547230360, EA space, modified 2026-07-23):

> When Release Reason Code = **CC** (Collection Complete):
> - ESB Action: `MakeDonorTemporarilyUnavailable`
> - New Registry Status: `TEMPORARY_UNAVAILABLE (TU)`
> - **"Updates the Available Date within Salesforce as well and includes the Available Date in MakeDonorTemporarilyUnavailable message. The Available Date should be set to the Collection Date plus twelve months."**

> When Release Reason Code = **TU** (Temporarily Unavailable):
> - ESB Action: `MakeDonorTemporarilyUnavailable`
> - **"Updates the Available Date within Salesforce as well and includes the Available Date in MakeDonorTemporarilyUnavailable message."**

The available date is **required** when the TU transition contains reason codes `CC` or `TU`. It is the date on which the donor becomes available again.

### 3. Available Date Drives Automated Status Transitions

From "SR: Making a TU Donor AV After Available Date Passes" (page 213158523, Global Solutions space):

> "The Making a TU Donor AV After Available Date Passes capability identifies donors with a registry status of Temporarily Unavailable (TU) and an Available Date on or before the current processing date, and updates their registry status from Temporarily Unavailable to Available."

This is a **batch process** that:
- Checks if `availableDate <= currentDate` for all TU donors
- Automatically transitions them to Available (AV) status
- Sends `MakeDonorAvailable` ESB message
- Creates action items to donor centers and transplant centers

### 4. Active Work on Available Date Field (July 2026)

From "Scope: Available Donors - Donor available date update" (page 555619901, Enterprise Integrations space, modified 2026-07-16):

> **Current Process:** "When Donors (Members and Non Members) become available (previously temporarily unavailable status) - **the old available date is still maintained in ODS (In-correct date)**"
>
> **Proposed Process:** "When Donors status becomes available - the available date will be cleared [set to NULL]"
>
> **Phase 1 - July 22, 2026 go live:** ESB will add an optional "available date" field to `MakeDonorAvailable` message (NULL value for non-member donors)

This confirms the field is actively being worked on for correctness — further evidence it's important to the ecosystem.

### 5. MatchSource Displays Available Date to Users

From "Notifications - TUDNRAV - TU Donor Now Available" (page 281624489, MatchSource space):

The notification workflow involves:
- Oracle database field: `CASEMGMT.individual_source.AVAILABLE_DTE`
- Registry status code: `REGISTRY_STATUS_CDE`
- MatchSource displays "TU donor now available" notification when date passes

### 6. WMDA Registry Depends on Available Date

From page 555619901:
> "This change is also need for WMDA Registry as they don't allow donor updates when there is an 'available date' for donor status 'Available'"

This confirms international registries (WMDA) also depend on this field.

## Whether It's Returned in Current API Responses

**Yes.** The `availableDate` field is returned in:
- `DonorWithSampleResponse.baseInfo.availableDate` (the primary ODS call for donor demographics, v05)
- `DonorIDSearch.availableDate` (the ID lookup service)
- Haplogic search/match results: `MatchResultDto.availableDate`

The FHIR Donor API Data Model Reference (page 572490225) already identifies ODS `DonorWithSampleResponse (v05)` as the data source for donor demographics, and that response **does include** `availableDate` in `baseInfo`.

## Recommendation: Complex Extension (code + date)

### Preferred Approach: Complex Extension with Optional `availableDate`

The DonorStatus extension should carry:
1. **`code`** (required) — the status value from the ValueSet (available, temporarily-unavailable, etc.)
2. **`availableDate`** (optional, type: `date`) — the date when a TU donor becomes available again

### Rationale

1. **The date is semantically inseparable from TU status.** It only has meaning when `status = temporarily-unavailable`. It's not a standalone field on the Patient — it qualifies the status itself.

2. **Transplant centers need it for planning.** Knowing a donor is TU without knowing *when* they'll be back is incomplete information. TCs currently see this in MatchSource and make scheduling decisions based on it.

3. **The data is already in the ODS response.** No additional API call is needed — `DonorWithSampleResponse.baseInfo.availableDate` comes back with the same call that provides demographics and status.

4. **It follows FHIR patterns.** Complex extensions with code + date are standard. The `effectivePeriod` pattern (Period with only `end` populated) is also valid, but a simple `date` is cleaner since:
   - There's no "start" — the TU period starts when the status changes
   - The date represents "when they become available again", not an end-of-unavailability

5. **Active enterprise investment.** The July 2026 ESB changes (page 555619901) confirm the organization is actively investing in making this field correct and consistent. The FHIR API should surface it from day one.

### FSH Sketch

```fsh
Extension: DonorStatus
Id: donor-status
Title: "Donor Status"
Description: "Registry status of a donor or CBU source"
* extension contains
    code 1..1 and
    availableDate 0..1
* extension[code].value[x] only CodeableConcept
* extension[code].valueCodeableConcept from DonorStatusValueSet (required)
* extension[availableDate].value[x] only date
* extension[availableDate] ^short = "Date when TU donor becomes available again"
```

### Alternative Considered: Simple Extension + Separate Element

A simpler approach would keep DonorStatus as a code-only extension and put `availableDate` as a separate extension on Patient. However, this is **not recommended** because:
- The date only makes sense in context of TU status
- It would require consumers to correlate two separate extensions
- If status changes, the orphaned date element would need separate cleanup logic

## Sources

| Page ID | Title | Space | Last Modified | Relevance |
|---|---|---|---|---|
| 71671365 | MS dates | MatchSource | 2019-06-25 | Field mapping: `DonorWithSample.baseInfo.availableDate` |
| 547230360 | (Sybase Retirement) Declaration of Source Status - Solution Outline | Enterprise Architecture | 2026-07-23 | TU status transitions require available date |
| 213158523 | SR: Making a TU Donor AV After Available Date Passes - Solution Outline | Global Solutions | 2022-04-14 | Batch process uses available date for auto-transition |
| 555619901 | Scope: Available Donors - Donor available date update | Enterprise Integrations | 2026-07-16 | Active July 2026 work on available date in ESB messages |
| 281624489 | Notifications - TUDNRAV - TU Donor Now Available | MatchSource | 2024-04-05 | MatchSource notification workflow for TU→AV |
| 572490225 | FHIR Donor API — Data Model Reference | MatchSync | 2026-07-22 | Current FHIR model (code-only, doesn't yet include date) |
| 545984197 | Solution Outline - External Donor API | Systems Architecture CoP | 2026-06-16 | Architecture decision: direct ODS calls |
| 50074980 | ESB Enrichment Web Services | Enterprise Architecture | 2026-07-20 | ODS service catalog (getDonorWithSample v04/v06/v07) |
