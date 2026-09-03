# Example Deceased Donor - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Deceased Donor**

## Example Patient: Example Deceased Donor

Profile: [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md)

Erik Johansson Male, DoB: 1970-04-10 ( http://nmdp.org/identifier/grid#3F7A1C9E5B2D8046AF13CE79B0D4E2A1)

-------

| | |
| :--- | :--- |
| Other Id: | `http://nmdp.org/identifier/source-id`/SRC-55123 |
| [Donor Status](StructureDefinition-donor-status.md) | Permanently Unavailable |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleDeceasedDonor",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"]
  },
  "extension" : [{
    "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status",
    "valueString" : "Permanently Unavailable"
  }],
  "identifier" : [{
    "system" : "http://nmdp.org/identifier/grid",
    "value" : "3F7A1C9E5B2D8046AF13CE79B0D4E2A1"
  },
  {
    "system" : "http://nmdp.org/identifier/source-id",
    "value" : "SRC-55123"
  }],
  "name" : [{
    "family" : "Johansson",
    "given" : ["Erik"]
  }],
  "gender" : "male",
  "birthDate" : "1970-04-10"
}

```
