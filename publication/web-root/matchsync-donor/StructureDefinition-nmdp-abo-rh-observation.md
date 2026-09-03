# NMDP ABO/Rh Observation - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP ABO/Rh Observation**

## Resource Profile: NMDP ABO/Rh Observation 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-abo-rh-observation | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:NMDPABORhObservation |

 
An observation representing a donor or CBU's ABO and Rh blood group type. Uses LOINC 882-1 and valueCodeableConcept with codes from LOINC Answer List LL2972-9. 

**Usages:**

* Examples for this Profile: [Observation/ExampleDonorABORh](Observation-ExampleDonorABORh.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-nmdp-abo-rh-observation.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nmdp-abo-rh-observation.csv), [Excel](StructureDefinition-nmdp-abo-rh-observation.xlsx), [Schematron](StructureDefinition-nmdp-abo-rh-observation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nmdp-abo-rh-observation",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-abo-rh-observation",
  "version" : "0.1.0",
  "name" : "NMDPABORhObservation",
  "title" : "NMDP ABO/Rh Observation",
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
  "description" : "An observation representing a donor or CBU's ABO and Rh blood group type. Uses LOINC 882-1 and valueCodeableConcept with codes from LOINC Answer List LL2972-9.",
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
      "short" : "ABO and Rh group [Type] in Blood (LOINC 882-1)",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "882-1",
          "display" : "ABO and Rh group [Type] in Blood"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "short" : "The donor or CBU this blood type belongs to",
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
      "short" : "ABO/Rh blood type code from LOINC Answer List LL2972-9",
      "definition" : "The ABO and Rh blood group type using codes from LOINC Answer List LL2972-9 (e.g., LA21325-8 = A Pos).",
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-abo-rh-type-vs"
      }
    }]
  }
}

```
