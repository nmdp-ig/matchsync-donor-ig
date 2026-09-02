# Example Deferred Donor - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Deferred Donor**

## Example Patient: Example Deferred Donor

Profile: [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md)

Lisa Chen Female, DoB: 1992-08-22 ( http://terminology.nmdp.org/identifier/donor#7654321)

-------

| | |
| :--- | :--- |
| US Core Ethnicity Extension: | * ombCategory: [CDC Race and Ethnicity: 2135-2](http://terminology.hl7.org/5.0.0/CodeSystem-CDCREC.html#CDCREC-2135-2) (Hispanic or Latino)
* text: Hispanic or Latino
 |
| US Core Race Extension: | * ombCategory: [CDC Race and Ethnicity: 2028-9](http://terminology.hl7.org/5.0.0/CodeSystem-CDCREC.html#CDCREC-2028-9) (Asian)
* text: Asian
 |
| Donor Status: | * status: temporarily-unavailable
* availableDate: 2027-03-15
 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleDeferredDonor",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "status",
      "valueCode" : "temporarily-unavailable"
    },
    {
      "url" : "availableDate",
      "valueDate" : "2027-03-15"
    }],
    "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status"
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
    "system" : "http://terminology.nmdp.org/identifier/donor",
    "value" : "7654321"
  }],
  "name" : [{
    "family" : "Chen",
    "given" : ["Lisa"]
  }],
  "gender" : "female",
  "birthDate" : "1992-08-22"
}

```
