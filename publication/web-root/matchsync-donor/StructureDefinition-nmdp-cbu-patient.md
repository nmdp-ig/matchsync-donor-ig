# NMDP Cord Blood Unit (CBU) Patient - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Cord Blood Unit (CBU) Patient**

## Resource Profile: NMDP Cord Blood Unit (CBU) Patient 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-cbu-patient | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:NMDPCBUPatient |

 
A profile representing a Cord Blood Unit (CBU) in the NMDP registry. CBUs are identified by having a cbu-source-id identifier (no GRID). CBUs are not tied to a real person — they represent a cord blood unit. The Patient.id should be the CBU source ID. 

**Usages:**

* Examples for this Profile: [Patient/ExampleCBUPatient](Patient-ExampleCBUPatient.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-nmdp-cbu-patient.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nmdp-cbu-patient.csv), [Excel](StructureDefinition-nmdp-cbu-patient.xlsx), [Schematron](StructureDefinition-nmdp-cbu-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nmdp-cbu-patient",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-cbu-patient",
  "version" : "0.1.0",
  "name" : "NMDPCBUPatient",
  "title" : "NMDP Cord Blood Unit (CBU) Patient",
  "status" : "draft",
  "date" : "2026-09-03T14:51:12+00:00",
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
  "description" : "A profile representing a Cord Blood Unit (CBU) in the NMDP registry. CBUs are identified by having a cbu-source-id identifier (no GRID). CBUs are not tied to a real person — they represent a cord blood unit. The Patient.id should be the CBU source ID.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "loinc",
    "uri" : "http://loinc.org",
    "name" : "LOINC code for the element"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Patient",
      "path" : "Patient"
    },
    {
      "id" : "Patient.extension:cbuStatus",
      "path" : "Patient.extension",
      "sliceName" : "cbuStatus",
      "short" : "CBU availability status",
      "definition" : "The current availability status of the cord blood unit (e.g., Available).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/cbu-status"]
      }]
    },
    {
      "id" : "Patient.identifier",
      "path" : "Patient.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "system"
        }],
        "description" : "Slice on identifier system",
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.identifier:cbuSourceId",
      "path" : "Patient.identifier",
      "sliceName" : "cbuSourceId",
      "short" : "CBU Source ID",
      "definition" : "The source identifier for the cord blood unit. System: http://nmdp.org/identifier/cbu-source-id",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:cbuSourceId.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "http://nmdp.org/identifier/cbu-source-id"
    },
    {
      "id" : "Patient.identifier:cbuRegistryId",
      "path" : "Patient.identifier",
      "sliceName" : "cbuRegistryId",
      "short" : "CBU Registry ID",
      "definition" : "The registry-assigned identifier for the cord blood unit. System: http://nmdp.org/identifier/cbu-registry-id",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:cbuRegistryId.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "http://nmdp.org/identifier/cbu-registry-id"
    },
    {
      "id" : "Patient.identifier:cbbId",
      "path" : "Patient.identifier",
      "sliceName" : "cbbId",
      "short" : "Cord Blood Bank ID",
      "definition" : "The identifier of the cord blood bank that stores this unit. System: http://nmdp.org/identifier/cbb-id",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:cbbId.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "http://nmdp.org/identifier/cbb-id"
    }]
  }
}

```
