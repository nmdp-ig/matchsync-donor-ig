# Donor Status - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Donor Status**

## Extension: Donor Status 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:DonorStatus |

The registration status of a donor in the NMDP registry. Conveyed as a simple string value (e.g., 'Available', 'Temporarily Unavailable', 'Active', 'Permanently Unavailable').

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md)
* Examples for this Extension: [Patient/ExampleDeceasedDonor](Patient-ExampleDeceasedDonor.md), [Patient/ExampleDeferredDonor](Patient-ExampleDeferredDonor.md), [Patient/ExampleDonorNoGrid](Patient-ExampleDonorNoGrid.md) and [Patient/ExampleNMDPDonor](Patient-ExampleNMDPDonor.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-donor-status.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-donor-status.csv), [Excel](StructureDefinition-donor-status.xlsx), [Schematron](StructureDefinition-donor-status.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "donor-status",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status",
  "version" : "0.1.0",
  "name" : "DonorStatus",
  "title" : "Donor Status",
  "status" : "draft",
  "date" : "2026-09-03T14:51:12+00:00",
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
  "description" : "The registration status of a donor in the NMDP registry. Conveyed as a simple string value (e.g., 'Available', 'Temporarily Unavailable', 'Active', 'Permanently Unavailable').",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Patient"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Donor Status",
      "definition" : "The registration status of a donor in the NMDP registry. Conveyed as a simple string value (e.g., 'Available', 'Temporarily Unavailable', 'Active', 'Permanently Unavailable')."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Donor registration status",
      "definition" : "The current registration status of the donor in the NMDP registry as a human-readable string.",
      "min" : 1,
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
