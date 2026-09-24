# NMDP Donor Patient - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Donor Patient**

## Resource Profile: NMDP Donor Patient 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient | *Version*:0.1.0 |
| Draft as of 2026-09-24 | *Computable Name*:NMDPDonorPatient |

 
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
  "date" : "2026-09-24T13:17:04+00:00",
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
      "id" : "Patient.extension:tribalAffiliation",
      "path" : "Patient.extension",
      "sliceName" : "tribalAffiliation",
      "max" : "0"
    },
    {
      "id" : "Patient.extension:birthsex",
      "path" : "Patient.extension",
      "sliceName" : "birthsex",
      "max" : "0"
    },
    {
      "id" : "Patient.extension:sex",
      "path" : "Patient.extension",
      "sliceName" : "sex",
      "max" : "0"
    },
    {
      "id" : "Patient.extension:genderIdentity",
      "path" : "Patient.extension",
      "sliceName" : "genderIdentity",
      "max" : "0"
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
      "short" : "Donor identifier",
      "definition" : "An identifier for the donor. May be any of the supported NMDP identifiers (e.g. GRID, Donor source ID). The identifier system distinguishes which identifier type is present.",
      "max" : "1"
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
