# NMDP HLA Genotype Observation - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP HLA Genotype Observation**

## Resource Profile: NMDP HLA Genotype Observation 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype | *Version*:0.1.0 |
| Draft as of 2026-09-02 | *Computable Name*:NMDPHLAGenotype |

 
A profile for HLA genotype observations. Each instance represents a genotype for a single HLA locus, expressed as a GL String Code. 

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
  "description" : "A profile for HLA genotype observations. Each instance represents a genotype for a single HLA locus, expressed as a GL String Code.",
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
      "mustSupport" : true
    },
    {
      "id" : "Observation.category",
      "path" : "Observation.category",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Observation.category:laboratory",
      "path" : "Observation.category",
      "sliceName" : "laboratory",
      "min" : 1,
      "max" : "1",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
          "code" : "laboratory"
        }]
      }
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "Genotype display name (LOINC 84413-4)",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "84413-4",
          "display" : "Genotype display name"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "short" : "The donor whose HLA was typed",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "short" : "When the typing was performed",
      "mustSupport" : true
    },
    {
      "id" : "Observation.performer",
      "path" : "Observation.performer",
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
    },
    {
      "id" : "Observation.specimen",
      "path" : "Observation.specimen",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component",
      "path" : "Observation.component",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "code"
        }],
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Observation.component:geneStudied",
      "path" : "Observation.component",
      "sliceName" : "geneStudied",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:geneStudied.code",
      "path" : "Observation.component.code",
      "short" : "Gene studied (LOINC 48018-6)",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "48018-6",
          "display" : "Gene studied [ID]"
        }]
      }
    },
    {
      "id" : "Observation.component:geneStudied.value[x]",
      "path" : "Observation.component.value[x]",
      "short" : "HLA gene name (HGNC ID)",
      "min" : 1,
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-hla-gene-name-vs"
      }
    }]
  }
}

```
