# Home - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Home**

## Home

| | |
| :--- | :--- |
| *Official URL*:http://fhir.nmdp.org/ig/donor-patient/ImplementationGuide/nmdp.fhir.donor-patient | *Version*:0.1.0 |
| Draft as of 2026-09-02 | *Computable Name*:NMDPDonorPatient |

# NMDP Donor Patient Implementation Guide

This Implementation Guide defines the FHIR profiles for representing hematopoietic cell donors in the NMDP (National Marrow Donor Program / Be The Match) registry.

## Scope

The Donor Patient IG covers:

* **Donor demographics** — name, date of birth, gender, race, ethnicity
* **Donor identifiers** — NMDP Donor ID, GRID (Global Registration Identifier for Donors)
* **Donor status** — active, inactive, deferred, unavailable

## Profiles

| | | |
| :--- | :--- | :--- |
| [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.md) | Patient | A hematopoietic cell donor registered in the NMDP registry |

## Extensions

| | | |
| :--- | :--- | :--- |
| [DonorStatus](StructureDefinition-donor-status.md) | Patient | The registration status of a donor |

## Dependencies

This IG depends on:

* [FHIR R4 (4.0.1)](http://hl7.org/fhir/R4/)
* [US Core 6.1.0](http://hl7.org/fhir/us/core/STU6.1/)



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "nmdp.fhir.donor-patient",
  "url" : "http://fhir.nmdp.org/ig/donor-patient/ImplementationGuide/nmdp.fhir.donor-patient",
  "version" : "0.1.0",
  "name" : "NMDPDonorPatient",
  "title" : "NMDP Donor Patient Implementation Guide",
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
  "description" : "FHIR Implementation Guide for NMDP donor demographics, identifiers, and registration data used by the FHIR Donor API.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "US",
      "display" : "United States of America"
    }]
  }],
  "packageId" : "nmdp.fhir.donor-patient",
  "license" : "Apache-2.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.3.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.3.0"
  },
  {
    "id" : "hl7_fhir_us_core",
    "uri" : "http://hl7.org/fhir/us/core/ImplementationGuide/hl7.fhir.us.core",
    "packageId" : "hl7.fhir.us.core",
    "version" : "6.1.0"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2024+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "show-hierarchies"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludettl"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "http://fhir.nmdp.org/ig/donor-patient/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.1.2"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2024+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "show-hierarchies"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludettl"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "http://fhir.nmdp.org/ig/donor-patient/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-donor-status.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/donor-status"
      },
      "name" : "Donor Status",
      "description" : "The registration status of a donor in the NMDP registry, with an optional available date for temporarily unavailable donors.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-ExampleDeceasedDonor.html"
      }],
      "reference" : {
        "reference" : "Patient/ExampleDeceasedDonor"
      },
      "name" : "Example Deceased Donor",
      "description" : "A donor who is deceased, demonstrating the deceased[x] element with a dateTime value.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-ExampleDeferredDonor.html"
      }],
      "reference" : {
        "reference" : "Patient/ExampleDeferredDonor"
      },
      "name" : "Example Deferred Donor",
      "description" : "A donor who is temporarily unavailable (e.g., post-collection with a future available date).",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-ExampleDonorOrder.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/ExampleDonorOrder"
      },
      "name" : "Example Donor CT Order",
      "description" : "An example confirmatory typing order for an NMDP donor.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-order"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Specimen"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Specimen-ExampleDonorSpecimen.html"
      }],
      "reference" : {
        "reference" : "Specimen/ExampleDonorSpecimen"
      },
      "name" : "Example Donor Specimen",
      "description" : "An example blood specimen (EDTA tube) collected from a donor for HLA confirmatory typing.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-specimen"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-ExampleDonorNoGrid.html"
      }],
      "reference" : {
        "reference" : "Patient/ExampleDonorNoGrid"
      },
      "name" : "Example Donor Without GRID",
      "description" : "A newly registered donor who has an NMDP Donor ID but has not yet been assigned a GRID.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ExampleHLAGenotypeA.html"
      }],
      "reference" : {
        "reference" : "Observation/ExampleHLAGenotypeA"
      },
      "name" : "Example HLA-A Genotype",
      "description" : "An example HLA-A genotype observation showing a donor typed as HLA-A*02:01+HLA-A*03:01.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ExampleHLAGenotypeB.html"
      }],
      "reference" : {
        "reference" : "Observation/ExampleHLAGenotypeB"
      },
      "name" : "Example HLA-B Genotype",
      "description" : "An example HLA-B genotype observation showing a donor typed as HLA-B*07:02:01+HLA-B*44:02:01.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ExampleHLAGenotypeC.html"
      }],
      "reference" : {
        "reference" : "Observation/ExampleHLAGenotypeC"
      },
      "name" : "Example HLA-C Genotype",
      "description" : "An example HLA-C genotype observation showing a donor typed as HLA-C*07:02:01+HLA-C*05:01:01.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-ExampleHLAGenotypeDRB1.html"
      }],
      "reference" : {
        "reference" : "Observation/ExampleHLAGenotypeDRB1"
      },
      "name" : "Example HLA-DRB1 Genotype",
      "description" : "An example HLA-DRB1 genotype observation showing a donor typed as HLA-DRB1*15:01:01+HLA-DRB1*03:01:01.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-ExampleIDMOrder.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/ExampleIDMOrder"
      },
      "name" : "Example IDM Order",
      "description" : "An example infectious disease marker testing order for a donor prior to collection.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-idm-order"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-ExampleMatchSyncDonorPatient.html"
      }],
      "reference" : {
        "reference" : "Patient/ExampleMatchSyncDonorPatient"
      },
      "name" : "Example MatchSync Donor Patient",
      "description" : "A synthetic example patient used to demonstrate the starter profile.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/matchsync-donor-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-ExampleNMDPDonor.html"
      }],
      "reference" : {
        "reference" : "Patient/ExampleNMDPDonor"
      },
      "name" : "Example NMDP Donor",
      "description" : "An example donor registered in the NMDP registry.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Organization-ExampleNMDPDonorCenter.html"
      }],
      "reference" : {
        "reference" : "Organization/ExampleNMDPDonorCenter"
      },
      "name" : "Example NMDP Donor Center",
      "description" : "An example donor center in the NMDP network.",
      "exampleCanonical" : "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-nmdp-glstring-vs.html"
      }],
      "reference" : {
        "reference" : "ValueSet/nmdp-glstring-vs"
      },
      "name" : "GL String Code Value Set",
      "description" : "Genotype List String Codes from glstring.org. Codes represent HLA genotypes in GL String format (e.g., hla#3.25.0#HLA-A*01:01:01:01+HLA-A*01:02).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-matchsync-donor-patient.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/matchsync-donor-patient"
      },
      "name" : "MatchSync Donor Patient",
      "description" : "A minimal Patient profile used as the starting point for MatchSync donor data.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CodeSystem-nmdp-center-type.html"
      }],
      "reference" : {
        "reference" : "CodeSystem/nmdp-center-type"
      },
      "name" : "NMDP Center Type",
      "description" : "Types of centers in the NMDP network.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-nmdp-center-type-vs.html"
      }],
      "reference" : {
        "reference" : "ValueSet/nmdp-center-type-vs"
      },
      "name" : "NMDP Center Type ValueSet",
      "description" : "All center types in the NMDP network.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-NMDPDonorAPICapabilityStatement.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/NMDPDonorAPICapabilityStatement"
      },
      "name" : "NMDP Donor API Capability Statement",
      "description" : "Describes the expected capabilities of the NMDP Donor API FHIR server, including supported resources, interactions, and search parameters.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-nmdp-donor-order.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/nmdp-donor-order"
      },
      "name" : "NMDP Donor Order",
      "description" : "A profile representing a donor workup or collection order in the NMDP system. Orders include confirmatory typing (CT), infectious disease markers (IDM), and stem cell collection.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-nmdp-donor-patient.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/nmdp-donor-patient"
      },
      "name" : "NMDP Donor Patient",
      "description" : "A profile representing a hematopoietic cell donor registered in the NMDP registry.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-nmdp-donor-specimen.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/nmdp-donor-specimen"
      },
      "name" : "NMDP Donor Specimen",
      "description" : "A profile representing a testing specimen (blood tube, buccal swab, etc.) collected from a donor for HLA typing or infectious disease marker testing. Specimens are identified by Order Number + Donor GRID rather than individual specimen IDs.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CodeSystem-nmdp-donor-status.html"
      }],
      "reference" : {
        "reference" : "CodeSystem/nmdp-donor-status"
      },
      "name" : "NMDP Donor Status",
      "description" : "Status codes for NMDP registered donors. These codes represent the\nenterprise Registry Status maintained by NMDP, indicating a donor's availability\nfor patient search, matching, and product request activities. Source: ODS\nDonorWithSampleResponse (v05).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-nmdp-donor-status-vs.html"
      }],
      "reference" : {
        "reference" : "ValueSet/nmdp-donor-status-vs"
      },
      "name" : "NMDP Donor Status ValueSet",
      "description" : "All registry status codes for NMDP registered donors. Maps to ODS\nenterprise donor status values (AV, TU, AC, DE).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CodeSystem-nmdp-hla-gene-name.html"
      }],
      "reference" : {
        "reference" : "CodeSystem/nmdp-hla-gene-name"
      },
      "name" : "NMDP HLA Gene Name Code System",
      "description" : "HGNC Gene IDs for HLA loci used in donor typing. Subset of HGNC relevant to NMDP operations.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-nmdp-hla-gene-name-vs.html"
      }],
      "reference" : {
        "reference" : "ValueSet/nmdp-hla-gene-name-vs"
      },
      "name" : "NMDP HLA Gene Name Value Set",
      "description" : "HLA gene names (HGNC IDs) for loci typed in NMDP donor operations.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-nmdp-hla-genotype.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/nmdp-hla-genotype"
      },
      "name" : "NMDP HLA Genotype Observation",
      "description" : "A profile for HLA genotype observations. Each instance represents a genotype for a single HLA locus, expressed as a GL String Code.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-nmdp-idm-order.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/nmdp-idm-order"
      },
      "name" : "NMDP IDM Order",
      "description" : "A profile for Infectious Disease Marker (IDM) orders. IDM testing is required for donor clearance before stem cell collection.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CodeSystem-nmdp-order-type.html"
      }],
      "reference" : {
        "reference" : "CodeSystem/nmdp-order-type"
      },
      "name" : "NMDP Order Type Code System",
      "description" : "Codes identifying the type of donor workup or collection order in the NMDP system.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-nmdp-order-type-vs.html"
      }],
      "reference" : {
        "reference" : "ValueSet/nmdp-order-type-vs"
      },
      "name" : "NMDP Order Type Value Set",
      "description" : "All codes from the NMDP Order Type code system.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-nmdp-organization.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/nmdp-organization"
      },
      "name" : "NMDP Organization",
      "description" : "An organization participating in the NMDP network (donor centers, transplant centers, collection centers, apheresis centers).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CodeSystem-nmdp-specimen-type.html"
      }],
      "reference" : {
        "reference" : "CodeSystem/nmdp-specimen-type"
      },
      "name" : "NMDP Specimen Type Code System",
      "description" : "Codes identifying the type of specimen collected from a donor for HLA typing or infectious disease marker testing.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-nmdp-specimen-type-vs.html"
      }],
      "reference" : {
        "reference" : "ValueSet/nmdp-specimen-type-vs"
      },
      "name" : "NMDP Specimen Type Value Set",
      "description" : "All specimen type codes for donor testing samples in the NMDP system.",
      "exampleBoolean" : false
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Home",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "conventions.html"
        }],
        "nameUrl" : "conventions.html",
        "title" : "Conventions",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "identifiers.html"
        }],
        "nameUrl" : "identifiers.html",
        "title" : "Identifiers",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "capability-statement.html"
        }],
        "nameUrl" : "capability-statement.html",
        "title" : "Capability Statement",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "order-workflow.html"
        }],
        "nameUrl" : "order-workflow.html",
        "title" : "Order Workflow",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "security-and-privacy.html"
        }],
        "nameUrl" : "security-and-privacy.html",
        "title" : "Security and Privacy",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "related-specifications.html"
        }],
        "nameUrl" : "related-specifications.html",
        "title" : "Related Specifications",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "examples.html"
        }],
        "nameUrl" : "examples.html",
        "title" : "Examples",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/maps"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
