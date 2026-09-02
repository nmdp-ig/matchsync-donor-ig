# NMDP Donor Patient - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Donor Patient**

## Resource Profile: NMDP Donor Patient 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient | *Version*:0.1.0 |
| Draft as of 2026-09-02 | *Computable Name*:NMDPDonorPatient |

 
A profile representing a hematopoietic cell donor registered in the NMDP registry. 

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
  "description" : "A profile representing a hematopoietic cell donor registered in the NMDP registry.",
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
      "id" : "Patient.extension:race",
      "path" : "Patient.extension",
      "sliceName" : "race",
      "short" : "US Core Race"
    },
    {
      "id" : "Patient.extension:ethnicity",
      "path" : "Patient.extension",
      "sliceName" : "ethnicity",
      "short" : "US Core Ethnicity"
    },
    {
      "id" : "Patient.extension:donorStatus",
      "path" : "Patient.extension",
      "sliceName" : "donorStatus",
      "short" : "Donor registry status",
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
      "id" : "Patient.identifier:nmdpDonorId",
      "path" : "Patient.identifier",
      "sliceName" : "nmdpDonorId",
      "short" : "NMDP Donor ID",
      "definition" : "The unique identifier assigned to a donor by the National Marrow Donor Program.",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:nmdpDonorId.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "http://terminology.nmdp.org/identifier/donor"
    },
    {
      "id" : "Patient.identifier:grid",
      "path" : "Patient.identifier",
      "sliceName" : "grid",
      "short" : "Global Registration Identifier for Donors (GRID)",
      "definition" : "The ISBT 128 Global Registration Identifier for Donors.",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:grid.system",
      "path" : "Patient.identifier.system",
      "patternUri" : "http://www.isbt128.org/uri/GRID"
    },
    {
      "id" : "Patient.birthDate",
      "path" : "Patient.birthDate",
      "min" : 1
    },
    {
      "id" : "Patient.deceased[x]",
      "path" : "Patient.deceased[x]",
      "short" : "Indicates if the donor is deceased",
      "definition" : "Indicates if the donor is deceased, either as a boolean flag or a dateTime of death.",
      "mustSupport" : true
    },
    {
      "id" : "Patient.communication",
      "path" : "Patient.communication",
      "mustSupport" : true
    },
    {
      "id" : "Patient.managingOrganization",
      "path" : "Patient.managingOrganization",
      "short" : "Donor center managing this donor",
      "definition" : "The NMDP-affiliated organization (typically a donor center) that manages this donor's registration.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-organization"]
      }],
      "mustSupport" : true
    }]
  }
}

```
