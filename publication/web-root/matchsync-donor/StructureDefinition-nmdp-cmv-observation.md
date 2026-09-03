# NMDP CMV Observation - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP CMV Observation**

## Resource Profile: NMDP CMV Observation 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-cmv-observation | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:NMDPCMVObservation |

 
An observation representing a donor or CBU's CMV IgG antibody presence status. Uses LOINC 22244-8 and valueCodeableConcept with text-only values (Positive, Negative, Inconclusive, Untested). 

**Usages:**

* Examples for this Profile: [Observation/ExampleDonorCMV](Observation-ExampleDonorCMV.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-nmdp-cmv-observation.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nmdp-cmv-observation.csv), [Excel](StructureDefinition-nmdp-cmv-observation.xlsx), [Schematron](StructureDefinition-nmdp-cmv-observation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nmdp-cmv-observation",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-cmv-observation",
  "version" : "0.1.0",
  "name" : "NMDPCMVObservation",
  "title" : "NMDP CMV Observation",
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
  "description" : "An observation representing a donor or CBU's CMV IgG antibody presence status. Uses LOINC 22244-8 and valueCodeableConcept with text-only values (Positive, Negative, Inconclusive, Untested).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
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
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "patternCode" : "final",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "CMV IgG Ab [Presence] in Serum (LOINC 22244-8)",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "22244-8",
          "display" : "CMV IgG Ab [Presence] in Serum"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "short" : "The donor or CBU this CMV result belongs to",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "short" : "CMV status (text-based: Positive, Negative, Inconclusive, Untested)",
      "definition" : "The CMV IgG antibody presence result. In FHIR Donor API payloads, this is conveyed as a text-only value in valueCodeableConcept.text.",
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true
    }]
  }
}

```
