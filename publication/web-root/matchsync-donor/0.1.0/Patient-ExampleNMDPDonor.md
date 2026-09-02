# Example NMDP Donor - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example NMDP Donor**

## Example Patient: Example NMDP Donor

Profile: [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md)

Marcus James Reynolds Male, DoB: 1985-03-15 ( http://terminology.nmdp.org/identifier/donor#1234567)

-------

| | |
| :--- | :--- |
| Deceased: | false |
| Other Id: | `http://www.isbt128.org/uri/GRID`/AAAA1111111 |
| Language: | English |
| Links: | * Managing Organization: [Organization Minneapolis Blood Center](Organization-ExampleNMDPDonorCenter.md)
 |
| US Core Ethnicity Extension: | * ombCategory: [CDC Race and Ethnicity: 2186-5](http://terminology.hl7.org/5.0.0/CodeSystem-CDCREC.html#CDCREC-2186-5) (Not Hispanic or Latino)
* text: Not Hispanic or Latino
 |
| US Core Race Extension: | * ombCategory: [CDC Race and Ethnicity: 2106-3](http://terminology.hl7.org/5.0.0/CodeSystem-CDCREC.html#CDCREC-2106-3) (White)
* text: White
 |
| Donor Status: | * status: active
 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleNMDPDonor",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "status",
      "valueCode" : "active"
    }],
    "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status"
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
    "system" : "http://terminology.nmdp.org/identifier/donor",
    "value" : "1234567"
  },
  {
    "system" : "http://www.isbt128.org/uri/GRID",
    "value" : "AAAA1111111"
  }],
  "name" : [{
    "family" : "Reynolds",
    "given" : ["Marcus", "James"]
  }],
  "gender" : "male",
  "birthDate" : "1985-03-15",
  "deceasedBoolean" : false,
  "communication" : [{
    "language" : {
      "coding" : [{
        "system" : "urn:ietf:bcp:47",
        "code" : "en",
        "display" : "English"
      }]
    }
  }],
  "managingOrganization" : {
    "reference" : "Organization/ExampleNMDPDonorCenter"
  }
}

```
