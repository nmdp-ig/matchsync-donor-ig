# Example CBU Patient - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example CBU Patient**

## Example Patient: Example CBU Patient

Profile: [NMDP Cord Blood Unit (CBU) Patient](StructureDefinition-nmdp-cbu-patient.md)

Unit20180415 CordUnit Female, DoB: 2018-04-15 ( http://nmdp.org/identifier/cbu-source-id#CBU-SRC-20180415-001)

-------

| | |
| :--- | :--- |
| Other Ids: | * `http://nmdp.org/identifier/cbu-registry-id`/REG-CBU-887744
* `http://nmdp.org/identifier/cbb-id`/CBB-5521
 |
| US Core Ethnicity Extension: | * ombCategory: [CDC Race and Ethnicity: 2186-5](http://terminology.hl7.org/5.0.0/CodeSystem-CDCREC.html#CDCREC-2186-5) (Not Hispanic or Latino)
* text: Not Hispanic or Latino
 |
| [CBU Status](StructureDefinition-cbu-status.md) | Available |
| US Core Race Extension: | * ombCategory: [CDC Race and Ethnicity: 2054-5](http://terminology.hl7.org/5.0.0/CodeSystem-CDCREC.html#CDCREC-2054-5) (Black or African American)
* text: Black or African American
 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleCBUPatient",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-cbu-patient"]
  },
  "extension" : [{
    "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/cbu-status",
    "valueString" : "Available"
  },
  {
    "extension" : [{
      "url" : "ombCategory",
      "valueCoding" : {
        "system" : "urn:oid:2.16.840.1.113883.6.238",
        "code" : "2054-5",
        "display" : "Black or African American"
      }
    },
    {
      "url" : "text",
      "valueString" : "Black or African American"
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
    "system" : "http://nmdp.org/identifier/cbu-source-id",
    "value" : "CBU-SRC-20180415-001"
  },
  {
    "system" : "http://nmdp.org/identifier/cbu-registry-id",
    "value" : "REG-CBU-887744"
  },
  {
    "system" : "http://nmdp.org/identifier/cbb-id",
    "value" : "CBB-5521"
  }],
  "name" : [{
    "family" : "CordUnit",
    "given" : ["Unit20180415"]
  }],
  "gender" : "female",
  "birthDate" : "2018-04-15"
}

```
