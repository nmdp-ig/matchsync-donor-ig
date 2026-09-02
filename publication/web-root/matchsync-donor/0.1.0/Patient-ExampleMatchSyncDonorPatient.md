# Example MatchSync Donor Patient - MatchSync Donor Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example MatchSync Donor Patient**

## Example Patient: Example MatchSync Donor Patient

Profile: [MatchSync Donor Patient](StructureDefinition-matchsync-donor-patient.md)

John Smith (no stated gender), DoB Unknown

-------

| | |
| :--- | :--- |
| Active: | true |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleMatchSyncDonorPatient",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/matchsync-donor/StructureDefinition/matchsync-donor-patient"]
  },
  "active" : true,
  "name" : [{
    "family" : "Smith",
    "given" : ["John"]
  }]
}

```
