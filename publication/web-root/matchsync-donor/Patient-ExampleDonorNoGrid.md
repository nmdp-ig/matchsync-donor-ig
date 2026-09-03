# Example Donor With GRID Only - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Donor With GRID Only**

## Example Patient: Example Donor With GRID Only

Profile: [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md)

Adaeze Okafor Female, DoB: 1998-11-02 ( http://nmdp.org/identifier/grid#7C4E9A21D0B53F86E1A2C3D4B5F60798)

-------

| | |
| :--- | :--- |
| [Donor Status](StructureDefinition-donor-status.md) | Active |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleDonorNoGrid",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"]
  },
  "extension" : [{
    "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status",
    "valueString" : "Active"
  }],
  "identifier" : [{
    "system" : "http://nmdp.org/identifier/grid",
    "value" : "7C4E9A21D0B53F86E1A2C3D4B5F60798"
  }],
  "name" : [{
    "family" : "Okafor",
    "given" : ["Adaeze"]
  }],
  "gender" : "female",
  "birthDate" : "1998-11-02"
}

```
