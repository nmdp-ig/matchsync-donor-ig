# Donor Status - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Donor Status**

## Extension: Donor Status 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status | *Version*:0.1.0 |
| Draft as of 2026-09-02 | *Computable Name*:DonorStatus |

The registration status of a donor in the NMDP registry, with an optional available date for temporarily unavailable donors.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md)
* Examples for this Extension: [Patient/ExampleDeceasedDonor](Patient-ExampleDeceasedDonor.md), [Patient/ExampleDeferredDonor](Patient-ExampleDeferredDonor.md), [Patient/ExampleDonorNoGrid](Patient-ExampleDonorNoGrid.md) and [Patient/ExampleNMDPDonor](Patient-ExampleNMDPDonor.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-donor-status.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-donor-status.csv), [Excel](StructureDefinition-donor-status.xlsx), [Schematron](StructureDefinition-donor-status.sch) 

#### Terminology Bindings

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
  "date" : "2026-09-02T19:29:11+00:00",
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
  "description" : "The registration status of a donor in the NMDP registry, with an optional available date for temporarily unavailable donors.",
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
      "definition" : "The registration status of a donor in the NMDP registry, with an optional available date for temporarily unavailable donors."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 1
    },
    {
      "id" : "Extension.extension:status",
      "path" : "Extension.extension",
      "sliceName" : "status",
      "short" : "Donor registration status code",
      "definition" : "The current registration status of the donor in the NMDP registry.",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:status.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:status.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "status"
    },
    {
      "id" : "Extension.extension:status.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-donor-status-vs"
      }
    },
    {
      "id" : "Extension.extension:availableDate",
      "path" : "Extension.extension",
      "sliceName" : "availableDate",
      "short" : "Date donor becomes available again",
      "definition" : "The date when a temporarily unavailable donor is expected to become available again. Only meaningful when status is temporarily-unavailable.",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:availableDate.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:availableDate.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "availableDate"
    },
    {
      "id" : "Extension.extension:availableDate.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
