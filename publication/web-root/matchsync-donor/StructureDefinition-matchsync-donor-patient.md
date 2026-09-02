# MatchSync Donor Patient - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MatchSync Donor Patient**

## Resource Profile: MatchSync Donor Patient 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/matchsync-donor-patient | *Version*:0.1.0 |
| Draft as of 2026-09-02 | *Computable Name*:MatchSyncDonorPatient |

 
A minimal Patient profile used as the starting point for MatchSync donor data. 

**Usages:**

* Examples for this Profile: [Patient/ExampleMatchSyncDonorPatient](Patient-ExampleMatchSyncDonorPatient.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/nmdp.fhir.donor-patient|current/StructureDefinition/StructureDefinition-matchsync-donor-patient.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-matchsync-donor-patient.csv), [Excel](StructureDefinition-matchsync-donor-patient.xlsx), [Schematron](StructureDefinition-matchsync-donor-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "matchsync-donor-patient",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/matchsync-donor-patient",
  "version" : "0.1.0",
  "name" : "MatchSyncDonorPatient",
  "title" : "MatchSync Donor Patient",
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
  "description" : "A minimal Patient profile used as the starting point for MatchSync donor data.",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Patient",
      "path" : "Patient"
    },
    {
      "id" : "Patient.active",
      "path" : "Patient.active",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name",
      "path" : "Patient.name",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name.family",
      "path" : "Patient.name.family",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
