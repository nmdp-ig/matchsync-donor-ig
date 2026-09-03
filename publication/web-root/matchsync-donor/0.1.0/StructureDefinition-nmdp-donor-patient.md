# NMDP Donor Patient - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Donor Patient**

## Resource Profile: NMDP Donor Patient 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient | *Version*:0.1.0 |
| Draft as of 2026-09-03 | *Computable Name*:NMDPDonorPatient |

 
A profile representing a hematopoietic cell donor registered in the NMDP registry. Donors are identified by having an NMDP GRID identifier. The Patient.id should be the GRID value. 

**Usages:**

* Refer to this Profile: [NMDP Donor Specimen](StructureDefinition-nmdp-donor-specimen.md)
* Examples for this Profile: [Patient/ExampleDeceasedDonor](Patient-ExampleDeceasedDonor.md), [Patient/ExampleDeferredDonor](Patient-ExampleDeferredDonor.md), [Patient/ExampleDonorNoGrid](Patient-ExampleDonorNoGrid.md) and [Patient/ExampleNMDPDonor](Patient-ExampleNMDPDonor.md)
* CapabilityStatements using this Profile: [NMDP Donor API Capability Statement](CapabilityStatement-NMDPDonorAPICapabilityStatement.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-nmdp-donor-patient.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nmdp-donor-patient.csv), [Excel](StructureDefinition-nmdp-donor-patient.xlsx), [Schematron](StructureDefinition-nmdp-donor-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nmdp-donor-patient",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient",
  "version" : "0.1.0",
  "name" : "NMDPDonorPatient",
  "title" : "NMDP Donor Patient",
  "status" : "draft",
  "date" : "2026-09-03T16:43:13+00:00",
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
  "description" : "A profile representing a hematopoietic cell donor registered in the NMDP registry. Donors are identified by having an NMDP GRID identifier. The Patient.id should be the GRID value.",
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
      "id" : "Patient.extension:donorStatus",
      "path" : "Patient.extension",
      "sliceName" : "donorStatus",
      "short" : "Donor registry status",
      "definition" : "The current registration status of the donor (e.g., Available, Temporarily Unavailable, Active, Permanently Unavailable).",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/donor-status"]
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
      "id" : "Patient.identifier:grid",
      "path" : "Patient.identifier",
      "sliceName" : "grid",
      "short" : "NMDP GRID (Global Registration Identifier for Donors)",
      "definition" : "The NMDP GRID identifier that uniquely identifies a donor. A 32-character uppercase alphanumeric string (0-9 and A-F, no dashes or spaces), e.g. 99D0BA02660443B585D525525EB3F2D2. System: http://nmdp.org/identifier/grid",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:grid.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "http://nmdp.org/identifier/grid"
    },
    {
      "id" : "Patient.identifier:sourceId",
      "path" : "Patient.identifier",
      "sliceName" : "sourceId",
      "short" : "Donor source ID",
      "definition" : "The source identifier for the donor in the originating registry. System: http://nmdp.org/identifier/source-id",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:sourceId.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "http://nmdp.org/identifier/source-id"
    },
    {
      "id" : "Patient.birthDate",
      "path" : "Patient.birthDate",
      "min" : 1
    },
    {
      "id" : "Patient.managingOrganization",
      "path" : "Patient.managingOrganization",
      "short" : "Donor center (ION/DC ID)",
      "definition" : "The NMDP donor center (identified by ION/DC ID) responsible for this donor.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-organization"]
      }],
      "mustSupport" : true
    }]
  }
}

```
