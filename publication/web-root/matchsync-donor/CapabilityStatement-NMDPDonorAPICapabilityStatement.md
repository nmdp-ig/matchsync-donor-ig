# NMDP Donor API Capability Statement - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NMDP Donor API Capability Statement**

## CapabilityStatement: NMDP Donor API Capability Statement (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/CapabilityStatement/nmdp-donor-api | *Version*:0.1.0 |
| Draft as of 2026-07-23 | *Computable Name*:NMDPDonorAPICapabilityStatement |

 
This CapabilityStatement describes the expected capabilities of a server implementing the NMDP Donor API FHIR interface. The server provides read and search access to donor demographics, HLA typing results, and order information. 

 [Raw OpenAPI-Swagger Definition file](NMDPDonorAPICapabilityStatement.openapi.json) | [Download](NMDPDonorAPICapabilityStatement.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "NMDPDonorAPICapabilityStatement",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/CapabilityStatement/nmdp-donor-api",
  "version" : "0.1.0",
  "name" : "NMDPDonorAPICapabilityStatement",
  "title" : "NMDP Donor API Capability Statement",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-07-23",
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
  "description" : "This CapabilityStatement describes the expected capabilities of a server implementing the NMDP Donor API FHIR interface. The server provides read and search access to donor demographics, HLA typing results, and order information.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["json", "xml"],
  "implementationGuide" : ["http://fhir.nmdp.org/ig/donor-patient/ImplementationGuide/nmdp.fhir.donor-patient"],
  "rest" : [{
    "mode" : "server",
    "documentation" : "The NMDP Donor API server provides RESTful access to donor information for authorized transplant centers.",
    "resource" : [{
      "type" : "Patient",
      "profile" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "search-type"
      }],
      "searchParam" : [{
        "name" : "identifier",
        "type" : "token",
        "documentation" : "Search by NMDP Donor ID or GRID"
      },
      {
        "name" : "_id",
        "type" : "token"
      }]
    },
    {
      "type" : "Observation",
      "profile" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "search-type"
      }],
      "searchParam" : [{
        "name" : "subject",
        "type" : "reference",
        "documentation" : "Search HLA observations by donor Patient reference"
      },
      {
        "name" : "code",
        "type" : "token"
      }]
    },
    {
      "type" : "ServiceRequest",
      "profile" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-order",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "search-type"
      }],
      "searchParam" : [{
        "name" : "subject",
        "type" : "reference",
        "documentation" : "Search orders by donor Patient reference"
      },
      {
        "name" : "identifier",
        "type" : "token",
        "documentation" : "Search by NMDP Order ID"
      }]
    },
    {
      "type" : "Organization",
      "profile" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-organization",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "search-type"
      }],
      "searchParam" : [{
        "name" : "identifier",
        "type" : "token",
        "documentation" : "Search by NMDP Center ID"
      },
      {
        "name" : "name",
        "type" : "string"
      }]
    }]
  }]
}

```
