# NMDP HLA Genotype Observation - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP HLA Genotype Observation**

## Resource Profile: NMDP HLA Genotype Observation 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:NMDPHLAGenotype |

 
A profile for HLA genotype observations. Each instance represents a genotype for a single HLA locus, expressed as a GL String Code. The Observation.code uses a locus-specific LOINC code identifying which HLA gene was typed. 

**Usages:**

* Examples for this Profile: [Observation/ExampleHLAGenotypeA](Observation-ExampleHLAGenotypeA.md), [Observation/ExampleHLAGenotypeB](Observation-ExampleHLAGenotypeB.md), [Observation/ExampleHLAGenotypeC](Observation-ExampleHLAGenotypeC.md) and [Observation/ExampleHLAGenotypeDRB1](Observation-ExampleHLAGenotypeDRB1.md)
* CapabilityStatements using this Profile: [NMDP Donor API Capability Statement](CapabilityStatement-NMDPDonorAPICapabilityStatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-nmdp-hla-genotype.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nmdp-hla-genotype.csv), [Excel](StructureDefinition-nmdp-hla-genotype.xlsx), [Schematron](StructureDefinition-nmdp-hla-genotype.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nmdp-hla-genotype",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype",
  "version" : "0.1.0",
  "name" : "NMDPHLAGenotype",
  "title" : "NMDP HLA Genotype Observation",
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
  "description" : "A profile for HLA genotype observations. Each instance represents a genotype for a single HLA locus, expressed as a GL String Code. The Observation.code uses a locus-specific LOINC code identifying which HLA gene was typed.",
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
      "short" : "HLA locus-specific LOINC code (e.g., 57290-9 for HLA-A)",
      "definition" : "A LOINC code identifying the specific HLA locus typed. Each locus has its own code (HLA-A: 57290-9, HLA-B: 57291-7, HLA-C: 57297-4, HLA-DRB1: 57293-3, HLA-DQB1: 57299-0, HLA-DPB1: 59017-4, HLA-DQA1: 59019-0, HLA-DPA1: 59018-2, HLA-DRB3: 57294-1, HLA-DRB4: 57295-8, HLA-DRB5: 57296-6).",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-hla-locus-loinc-vs"
      }
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "short" : "The donor or CBU whose HLA was typed",
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
      "short" : "GL String Code representing the genotype",
      "definition" : "The genotype expressed as a GL String Code from http://glstring.org. Format: hla#<IMGT/HLA-version>#<GL-String>",
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-glstring-vs"
      }
    }]
  }
}

```
