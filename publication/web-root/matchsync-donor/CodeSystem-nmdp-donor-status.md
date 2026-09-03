# NMDP Donor Status - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Donor Status**

## CodeSystem: NMDP Donor Status 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/CodeSystem/donor-status | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:NMDPDonorStatusCS |

 
Status codes for NMDP registered donors. These codes represent the enterprise Registry Status maintained by NMDP, indicating a donor's availability for patient search, matching, and product request activities. Source: ODS DonorWithSampleResponse (v05). In FHIR Donor API payloads, donor status is conveyed as a valueString on the donor-status extension. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [NMDP Donor Status ValueSet](ValueSet-nmdp-donor-status-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "nmdp-donor-status",
  "url" : "http://fhir.nmdp.org/CodeSystem/donor-status",
  "version" : "0.1.0",
  "name" : "NMDPDonorStatusCS",
  "title" : "NMDP Donor Status",
  "status" : "draft",
  "date" : "2026-09-03T16:43:13+00:00",
  "publisher" : "National Marrow Donor Program (NMDP)",
  "contact" : [{
    "name" : "National Marrow Donor Program (NMDP)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.nmdp.org"
    },
    {
      "system" : "email",
      "value" : "fhir@nmdp.org"
    }]
  }],
  "description" : "Status codes for NMDP registered donors. These codes represent the\nenterprise Registry Status maintained by NMDP, indicating a donor's availability\nfor patient search, matching, and product request activities. Source: ODS\nDonorWithSampleResponse (v05). In FHIR Donor API payloads, donor status is\nconveyed as a valueString on the donor-status extension.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [{
    "code" : "Available",
    "display" : "Available",
    "definition" : "Donor is available for search, further typing, and collection/transplant (ODS code: AV)."
  },
  {
    "code" : "Temporarily-Unavailable",
    "display" : "Temporarily Unavailable",
    "definition" : "Donor is temporarily unavailable, typically post-collection with a future available date (ODS code: TU)."
  },
  {
    "code" : "Active",
    "display" : "Active",
    "definition" : "Donor is currently active on a search — reserved for a specific patient case (ODS code: AC)."
  },
  {
    "code" : "Permanently-Unavailable",
    "display" : "Permanently Unavailable",
    "definition" : "Donor has been permanently removed from the registry. Reasons include: not interested, permanently medically deferred, unable to contact, donor too old, or deceased (ODS code: DE)."
  }]
}

```
