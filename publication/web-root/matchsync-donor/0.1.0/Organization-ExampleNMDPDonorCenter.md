# Example NMDP Donor Center - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example NMDP Donor Center**

## Example Organization: Example NMDP Donor Center

Profile: [NMDP Organization](StructureDefinition-nmdp-organization.md)

**identifier**: `http://terminology.nmdp.org/codesystem/donor-center`/12345

**active**: true

**type**: Donor Center

**name**: Minneapolis Blood Center



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "ExampleNMDPDonorCenter",
  "meta" : {
    "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-organization"]
  },
  "identifier" : [{
    "system" : "http://terminology.nmdp.org/codesystem/donor-center",
    "value" : "12345"
  }],
  "active" : true,
  "type" : [{
    "coding" : [{
      "system" : "http://fhir.nmdp.org/ig/donor-patient/CodeSystem/nmdp-center-type",
      "code" : "donor-center",
      "display" : "Donor Center"
    }]
  }],
  "name" : "Minneapolis Blood Center"
}

```
