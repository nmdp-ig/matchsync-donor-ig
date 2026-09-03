# Example HLA-A Genotype - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example HLA-A Genotype**

## Example Observation: Example HLA-A Genotype

Profile: [NMDP HLA Genotype Observation](StructureDefinition-nmdp-hla-genotype.md)

**status**: Final

**code**: HLA-A [Type] by High resolution

**subject**: [Marcus Reynolds Male, DoB: 1985-03-15 ( http://nmdp.org/identifier/grid#99D0BA02660443B585D525525EB3F2D2)](Patient-ExampleNMDPDonor.md)

**value**: hla#3.53.0#HLA-A*02:01+HLA-A*03:01



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleHLAGenotypeA",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "57290-9",
      "display" : "HLA-A [Type] by High resolution"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleNMDPDonor"
  },
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://glstring.org",
      "code" : "hla#3.53.0#HLA-A*02:01+HLA-A*03:01"
    }]
  }
}

```
