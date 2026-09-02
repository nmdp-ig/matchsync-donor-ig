# Example HLA-DRB1 Genotype - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example HLA-DRB1 Genotype**

## Example Observation: Example HLA-DRB1 Genotype

Profile: [NMDP HLA Genotype Observation](StructureDefinition-nmdp-hla-genotype.md)

**status**: Final

**category**: Laboratory

**code**: Genotype display name

**subject**: [Marcus James Reynolds Male, DoB: 1985-03-15 ( http://terminology.nmdp.org/identifier/donor#1234567)](Patient-ExampleNMDPDonor.md)

**effective**: 2026-06-15

**value**: hla#3.59.0#HLA-DRB1*15:01:01+HLA-DRB1*03:01:01

### Components

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Value[x]** |
| * | Gene studied [ID] | HLA-DRB1 |



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleHLAGenotypeDRB1",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype"]
  },
  "status" : "final",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "laboratory"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "84413-4",
      "display" : "Genotype display name"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleNMDPDonor"
  },
  "effectiveDateTime" : "2026-06-15",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://glstring.org",
      "code" : "hla#3.59.0#HLA-DRB1*15:01:01+HLA-DRB1*03:01:01"
    }]
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "48018-6",
        "display" : "Gene studied [ID]"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.nmdp.org/codesystem/hla-gene-name",
        "code" : "HGNC:4948",
        "display" : "HLA-DRB1"
      }]
    }
  }]
}

```
