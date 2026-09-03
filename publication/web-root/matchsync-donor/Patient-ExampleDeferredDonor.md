# Example Deferred Donor - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Deferred Donor**

## Example Patient: Example Deferred Donor

Profile: [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md)

Lisa Chen Female, DoB: 1992-08-22 ( http://nmdp.org/identifier/grid#A1B2C3D4E5F60718293A4B5C6D7E8F90)

-------

| | |
| :--- | :--- |
| Other Id: | `http://nmdp.org/identifier/source-id`/SRC-76543 |
| US Core Ethnicity Extension: | * ombCategory: [CDC Race and Ethnicity: 2135-2](http://terminology.hl7.org/5.0.0/CodeSystem-CDCREC.html#CDCREC-2135-2) (Hispanic or Latino)
* text: Hispanic or Latino
 |
| US Core Race Extension: | * ombCategory: [CDC Race and Ethnicity: 2028-9](http://terminology.hl7.org/5.0.0/CodeSystem-CDCREC.html#CDCREC-2028-9) (Asian)
* text: Asian
 |
| [Donor Status](StructureDefinition-donor-status.md) | Temporarily Unavailable |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleDeferredDonor",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"]
  },
  "extension" : [{
    "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status",
    "valueString" : "Temporarily Unavailable"
  },
  {
    "extension" : [{
      "url" : "ombCategory",
      "valueCoding" : {
        "system" : "urn:oid:2.16.840.1.113883.6.238",
        "code" : "2028-9",
        "display" : "Asian"
      }
    },
    {
      "url" : "text",
      "valueString" : "Asian"
    }],
    "url" : "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
  },
  {
    "extension" : [{
      "url" : "ombCategory",
      "valueCoding" : {
        "system" : "urn:oid:2.16.840.1.113883.6.238",
        "code" : "2135-2",
        "display" : "Hispanic or Latino"
      }
    },
    {
      "url" : "text",
      "valueString" : "Hispanic or Latino"
    }],
    "url" : "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
  }],
  "identifier" : [{
    "system" : "http://nmdp.org/identifier/grid",
    "value" : "A1B2C3D4E5F60718293A4B5C6D7E8F90"
  },
  {
    "system" : "http://nmdp.org/identifier/source-id",
    "value" : "SRC-76543"
  }],
  "name" : [{
    "family" : "Chen",
    "given" : ["Lisa"]
  }],
  "gender" : "female",
  "birthDate" : "1992-08-22"
}

```
