# Example NMDP Donor - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example NMDP Donor**

## Example Patient: Example NMDP Donor

Profile: [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md)

Marcus Reynolds Male, DoB: 1985-03-15 ( http://nmdp.org/identifier/grid#99D0BA02660443B585D525525EB3F2D2)

-------

| | |
| :--- | :--- |
| Other Id: | `http://nmdp.org/identifier/source-id`/SRC-77412 |
| Links: | * Managing Organization: [Organization Minneapolis Blood Center](Organization-ExampleNMDPDonorCenter.md)
 |
| US Core Ethnicity Extension: | * ombCategory: [CDC Race and Ethnicity: 2186-5](http://terminology.hl7.org/5.0.0/CodeSystem-CDCREC.html#CDCREC-2186-5) (Not Hispanic or Latino)
* text: Not Hispanic or Latino
 |
| US Core Race Extension: | * ombCategory: [CDC Race and Ethnicity: 2106-3](http://terminology.hl7.org/5.0.0/CodeSystem-CDCREC.html#CDCREC-2106-3) (White)
* text: White
 |
| [Donor Status](StructureDefinition-donor-status.md) | Available |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleNMDPDonor",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"]
  },
  "extension" : [{
    "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status",
    "valueString" : "Available"
  },
  {
    "extension" : [{
      "url" : "ombCategory",
      "valueCoding" : {
        "system" : "urn:oid:2.16.840.1.113883.6.238",
        "code" : "2106-3",
        "display" : "White"
      }
    },
    {
      "url" : "text",
      "valueString" : "White"
    }],
    "url" : "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
  },
  {
    "extension" : [{
      "url" : "ombCategory",
      "valueCoding" : {
        "system" : "urn:oid:2.16.840.1.113883.6.238",
        "code" : "2186-5",
        "display" : "Not Hispanic or Latino"
      }
    },
    {
      "url" : "text",
      "valueString" : "Not Hispanic or Latino"
    }],
    "url" : "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
  }],
  "identifier" : [{
    "system" : "http://nmdp.org/identifier/grid",
    "value" : "99D0BA02660443B585D525525EB3F2D2"
  },
  {
    "system" : "http://nmdp.org/identifier/source-id",
    "value" : "SRC-77412"
  }],
  "name" : [{
    "family" : "Reynolds",
    "given" : ["Marcus"]
  }],
  "gender" : "male",
  "birthDate" : "1985-03-15",
  "managingOrganization" : {
    "reference" : "Organization/ExampleNMDPDonorCenter"
  }
}

```
