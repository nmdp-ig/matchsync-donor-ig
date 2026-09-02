# Example Donor Without GRID - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Donor Without GRID**

## Example Patient: Example Donor Without GRID

Profile: [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md)

Adaeze Okafor Female, DoB: 1998-11-02 ( http://terminology.nmdp.org/identifier/donor#9876543)

-------

| | |
| :--- | :--- |
| Language: | English |
| Donor Status: | * status: active
 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleDonorNoGrid",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "status",
      "valueCode" : "active"
    }],
    "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status"
  }],
  "identifier" : [{
    "system" : "http://terminology.nmdp.org/identifier/donor",
    "value" : "9876543"
  }],
  "name" : [{
    "family" : "Okafor",
    "given" : ["Adaeze"]
  }],
  "gender" : "female",
  "birthDate" : "1998-11-02",
  "communication" : [{
    "language" : {
      "coding" : [{
        "system" : "urn:ietf:bcp:47",
        "code" : "en",
        "display" : "English"
      }]
    }
  }]
}

```
