# Example Deceased Donor - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Deceased Donor**

## Example Patient: Example Deceased Donor

Profile: [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md)

Erik Johansson Male, DoB: 1970-04-10 ( http://terminology.nmdp.org/identifier/donor#5551234)

-------

| | |
| :--- | :--- |
| Deceased: | 2025-06-15 |
| Other Id: | `http://www.isbt128.org/uri/GRID`/BBBB2222222 |
| Donor Status: | * status: permanently-unavailable
 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleDeceasedDonor",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "status",
      "valueCode" : "permanently-unavailable"
    }],
    "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status"
  }],
  "identifier" : [{
    "system" : "http://terminology.nmdp.org/identifier/donor",
    "value" : "5551234"
  },
  {
    "system" : "http://www.isbt128.org/uri/GRID",
    "value" : "BBBB2222222"
  }],
  "name" : [{
    "family" : "Johansson",
    "given" : ["Erik"]
  }],
  "gender" : "male",
  "birthDate" : "1970-04-10",
  "deceasedDateTime" : "2025-06-15"
}

```
