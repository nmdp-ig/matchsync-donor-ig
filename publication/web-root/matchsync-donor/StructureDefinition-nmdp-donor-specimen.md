# NMDP Donor Specimen - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Donor Specimen**

## Resource Profile: NMDP Donor Specimen 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-specimen | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:NMDPDonorSpecimen |

 
A profile representing a testing specimen (blood tube, buccal swab, etc.) collected from a donor for HLA typing or infectious disease marker testing. Specimens are identified by Order Number + Donor GRID rather than individual specimen IDs. 

**Usages:**

* Examples for this Profile: [Specimen/ExampleDonorSpecimen](Specimen-ExampleDonorSpecimen.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-nmdp-donor-specimen.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nmdp-donor-specimen.csv), [Excel](StructureDefinition-nmdp-donor-specimen.xlsx), [Schematron](StructureDefinition-nmdp-donor-specimen.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nmdp-donor-specimen",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-specimen",
  "version" : "0.1.0",
  "name" : "NMDPDonorSpecimen",
  "title" : "NMDP Donor Specimen",
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
  "description" : "A profile representing a testing specimen (blood tube, buccal swab, etc.) collected from a donor for HLA typing or infectious disease marker testing. Specimens are identified by Order Number + Donor GRID rather than individual specimen IDs.",
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
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Specimen",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Specimen",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Specimen",
      "path" : "Specimen"
    },
    {
      "id" : "Specimen.type",
      "path" : "Specimen.type",
      "short" : "Type of specimen (blood tube type, buccal swab, etc.)",
      "definition" : "The type of specimen collected, indicating the sample material and any anticoagulant used.",
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-specimen-type-vs"
      }
    },
    {
      "id" : "Specimen.subject",
      "path" : "Specimen.subject",
      "short" : "The donor this specimen was collected from",
      "definition" : "Reference to the donor (NMDPDonorPatient) from whom this specimen was collected.",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Specimen.request",
      "path" : "Specimen.request",
      "short" : "The order that requested this specimen",
      "definition" : "Reference to the ServiceRequest (NMDPDonorOrder) that initiated collection of this specimen.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-order"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Specimen.collection.collector",
      "path" : "Specimen.collection.collector",
      "short" : "Practitioner who collected the specimen",
      "definition" : "The practitioner at the donor center who collected this specimen.",
      "mustSupport" : true
    },
    {
      "id" : "Specimen.collection.collected[x]",
      "path" : "Specimen.collection.collected[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Specimen.collection.collected[x]:collectedDateTime",
      "path" : "Specimen.collection.collected[x]",
      "sliceName" : "collectedDateTime",
      "short" : "When the specimen was collected",
      "definition" : "The date and time the specimen was collected from the donor.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    }]
  }
}

```
