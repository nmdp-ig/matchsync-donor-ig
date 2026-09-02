# NMDP Organization - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Organization**

## Resource Profile: NMDP Organization 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-organization | *Version*:0.1.0 |
| Draft as of 2026-09-02 | *Computable Name*:NMDPOrganization |

 
An organization participating in the NMDP network (donor centers, transplant centers, collection centers, apheresis centers). 

**Usages:**

* Refer to this Profile: [NMDP Donor Order](StructureDefinition-nmdp-donor-order.md) and [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md)
* Examples for this Profile: [Minneapolis Blood Center](Organization-ExampleNMDPDonorCenter.md)
* CapabilityStatements using this Profile: [NMDP Donor API Capability Statement](CapabilityStatement-NMDPDonorAPICapabilityStatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-nmdp-organization.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nmdp-organization.csv), [Excel](StructureDefinition-nmdp-organization.xlsx), [Schematron](StructureDefinition-nmdp-organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nmdp-organization",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-organization",
  "version" : "0.1.0",
  "name" : "NMDPOrganization",
  "title" : "NMDP Organization",
  "status" : "draft",
  "date" : "2026-09-02T19:29:11+00:00",
  "publisher" : "National Marrow Donor Program (NMDP)",
  "contact" : [{
    "name" : "National Marrow Donor Program (NMDP)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.nmdp.org"
    },
    {
      "system" : "email",
      "value" : "fhir@nmdp.org"
    }]
  }],
  "description" : "An organization participating in the NMDP network (donor centers, transplant centers, collection centers, apheresis centers).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Organization",
      "path" : "Organization"
    },
    {
      "id" : "Organization.identifier",
      "path" : "Organization.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:nmdpCenterId",
      "path" : "Organization.identifier",
      "sliceName" : "nmdpCenterId",
      "short" : "NMDP Center ID",
      "definition" : "The unique identifier assigned to a center in the NMDP network.",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:nmdpCenterId.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "http://terminology.nmdp.org/codesystem/donor-center"
    },
    {
      "id" : "Organization.identifier:nmdpCenterId.value",
      "path" : "Organization.identifier.value",
      "min" : 1
    },
    {
      "id" : "Organization.active",
      "path" : "Organization.active",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.type",
      "path" : "Organization.type",
      "mustSupport" : true,
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "http://fhir.nmdp.org/ig/donor-patient/ValueSet/nmdp-center-type-vs"
      }
    },
    {
      "id" : "Organization.name",
      "path" : "Organization.name",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
