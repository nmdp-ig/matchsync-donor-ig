# Conventions - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Conventions**

## Conventions

# Conventions

This page describes the naming conventions, namespace patterns, and file organization used in the NMDP Donor Patient Implementation Guide.

## Namespace Conventions

NMDP FHIR artifacts follow a consistent URI structure across three namespace prefixes:

| | | |
| :--- | :--- | :--- |
| Identifier systems | `http://terminology.nmdp.org/identifier/` | `http://terminology.nmdp.org/identifier/donor` |
| Code systems | `http://terminology.nmdp.org/codesystem/` | `http://terminology.nmdp.org/codesystem/donor-center` |
| Extensions | `http://fhir.nmdp.org/StructureDefinition/` | `http://fhir.nmdp.org/StructureDefinition/donor-status` |

Profiles and other StructureDefinitions published in this IG use the IG canonical as their base:

```
http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/<id>

```

## Naming Patterns

| | | | |
| :--- | :--- | :--- | :--- |
| Profile | PascalCase (`NMDPDonorPatient`) | kebab-case (`nmdp-donor-patient`) | `NMDPDonorPatient` |
| Extension | PascalCase (`DonorStatus`) | kebab-case (`donor-status`) | `DonorStatus` |
| CodeSystem | PascalCase +`CS`suffix (`NMDPDonorStatusCS`) | kebab-case (`nmdp-donor-status`) | `NMDPDonorStatusCS` |
| ValueSet | PascalCase +`VS`suffix (`NMDPDonorStatusVS`) | kebab-case +`-vs`suffix (`nmdp-donor-status-vs`) | `NMDPDonorStatusVS` |
| Example | `Example`prefix (`ExampleNMDPDonor`) | auto-generated from name | `ExampleNMDPDonor` |

## FSH File Organization

FSH source files are organized into subdirectories by artifact type:

```
input/fsh/
├── aliases.fsh          # Shared alias definitions
├── profiles/            # StructureDefinition profiles
│   └── NMDPDonorPatient.fsh
├── extensions/          # Extension definitions
│   └── DonorStatus.fsh
├── examples/            # Example instances
│   └── ExampleNMDPDonor.fsh
├── valuesets/           # ValueSet definitions
│   └── NMDPDonorStatus.fsh
└── codesystems/         # CodeSystem definitions
    └── NMDPDonorStatus.fsh

```

Each file contains a single primary artifact. File names match the FSH artifact name.

## Alias Usage

All canonical URIs referenced across FSH files are defined as aliases in `input/fsh/aliases.fsh`. This provides a single source of truth for system URIs and avoids hard-coding URLs in profile, extension, or example definitions.

### Identifier System Aliases

| | | |
| :--- | :--- | :--- |
| `$nmdp-donor` | `http://terminology.nmdp.org/identifier/donor` | NMDP Donor ID |
| `$nmdp-cbu` | `http://terminology.nmdp.org/identifier/cbu` | Cord Blood Unit ID |
| `$nmdp-recipient` | `http://terminology.nmdp.org/identifier/recipient` | Recipient ID |
| `$nmdp-local-id` | `http://terminology.nmdp.org/identifier/local-id` | Local ID (center-specific) |
| `$nmdp-order` | `http://terminology.nmdp.org/identifier/order` | Order ID |
| `$nmdp-hmlid` | `http://terminology.nmdp.org/identifier/hmlid` | HML message ID |
| `$nmdp-specimen` | `http://terminology.nmdp.org/identifier/specimen` | Specimen ID |
| `$nmdp-id-grid` | `http://nmdp.org/identifier/grid` | NMDP GRID |
| `$cibmtr-crid` | `http://terminology.cibmtr.org/identifier/CRID` | CIBMTR CRID |

### Code System Aliases

| | | |
| :--- | :--- | :--- |
| `$nmdp-center-type` | `http://terminology.nmdp.org/codesystem/center-type` | Center type codes |
| `$nmdp-donor-center` | `http://terminology.nmdp.org/codesystem/donor-center` | Donor center codes |
| `$nmdp-tc` | `http://terminology.nmdp.org/codesystem/transplant-center` | Transplant center codes |
| `$nmdp-cc` | `http://terminology.nmdp.org/codesystem/collection-center` | Collection center codes |
| `$nmdp-ac` | `http://terminology.nmdp.org/codesystem/apheresis-center` | Apheresis center codes |
| `$cibmtr-tc` | `http://terminology.cibmtr.org/codesystem/transplant-center` | CIBMTR transplant center codes |
| `$cibmtr-subject-type` | `http://terminology.cibmtr.org/codesystem/subject-type` | CIBMTR subject type codes |

### External System Aliases

| | | |
| :--- | :--- | :--- |
| `$loinc` | `http://loinc.org` | LOINC |
| `$sct` | `http://snomed.info/sct` | SNOMED CT |
| `$us-core-race` | `http://hl7.org/fhir/us/core/StructureDefinition/us-core-race` | US Core Race extension |
| `$us-core-ethnicity` | `http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity` | US Core Ethnicity extension |

When adding new canonical URIs, define an alias in `aliases.fsh` first, then reference it by alias name in all other FSH files.

