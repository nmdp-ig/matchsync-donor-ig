# Example HLA-DRB1 Genotype - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example HLA-DRB1 Genotype**

## Example Observation: Example HLA-DRB1 Genotype

Profile: [NMDP HLA Genotype Observation](StructureDefinition-nmdp-hla-genotype.md)

**status**: Final

**code**: HLA-DRB1 [Type] by High resolution

**subject**: [Marcus Reynolds Male, DoB: 1985-03-15 ( http://nmdp.org/identifier/grid#99D0BA02660443B585D525525EB3F2D2)](Patient-ExampleNMDPDonor.md)

**value**: hla#3.53.0#HLA-DRB1*15:01+HLA-DRB1*03:01



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleHLAGenotypeDRB1",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "57293-3",
      "display" : "HLA-DRB1 [Type] by High resolution"
    }]
  },
  "subject" : {
    "reference" : "Patient/ExampleNMDPDonor"
  },
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://glstring.org",
      "code" : "hla#3.53.0#HLA-DRB1*15:01+HLA-DRB1*03:01"
    }]
  }
}

```
