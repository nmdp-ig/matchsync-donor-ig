# Examples - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Examples**

## Examples

# Examples

This page lists the example instances included in the NMDP Donor Patient IG and describes how to use them for validation testing.

For a representative **response** returned by the Donor API (a search-result `Bundle`, which clients receive rather than send), see [Example Donor API Response](#example-donor-api-response) at the bottom of this page.

## Example Instances

| | | |
| :--- | :--- | :--- |
| [ExampleNMDPDonor](Patient-ExampleNMDPDonor.md) | [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.md) | A complete donor registration with all required fields populated |
| [ExampleDeferredDonor](Patient-ExampleDeferredDonor.md) | [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.md) | A donor who is temporarily deferred from donation |
| [ExampleDonorNoGrid](Patient-ExampleDonorNoGrid.md) | [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.md) | A newly registered donor without a GRID |
| [ExampleDeceasedDonor](Patient-ExampleDeceasedDonor.md) | [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.md) | A deceased donor demonstrating the deceased[x] element |
| [ExampleDonorOrder](ServiceRequest-ExampleDonorOrder.md) | [NMDPDonorOrder](StructureDefinition-nmdp-donor-order.md) | A confirmatory typing order demonstrating the NMDPDonorOrder profile |
| [ExampleNMDPDonorCenter](Organization-ExampleNMDPDonorCenter.md) | [NMDPOrganization](StructureDefinition-nmdp-organization.md) | An NMDP donor center demonstrating the NMDPOrganization profile |
| [ExampleHLAGenotypeA](Observation-ExampleHLAGenotypeA.md) | [NMDPHLAGenotype](StructureDefinition-nmdp-hla-genotype.md) | HLA-A genotype (HLA-A*02:01+HLA-A*03:01) |
| [ExampleHLAGenotypeB](Observation-ExampleHLAGenotypeB.md) | [NMDPHLAGenotype](StructureDefinition-nmdp-hla-genotype.md) | HLA-B genotype (HLA-B*07:02:01+HLA-B*44:02:01) |
| [ExampleHLAGenotypeC](Observation-ExampleHLAGenotypeC.md) | [NMDPHLAGenotype](StructureDefinition-nmdp-hla-genotype.md) | HLA-C genotype (HLA-C*07:02:01+HLA-C*05:01:01) |
| [ExampleHLAGenotypeDRB1](Observation-ExampleHLAGenotypeDRB1.md) | [NMDPHLAGenotype](StructureDefinition-nmdp-hla-genotype.md) | HLA-DRB1 genotype (HLA-DRB1*15:01:01+HLA-DRB1*03:01:01) |

### ExampleNMDPDonor

This example demonstrates a fully conformant NMDP donor Patient resource including:

* **GRID** (`6939DKM001392612726`) — the required NMDP global donor identifier
* **Donor ID / source-id** (`SRC-77412`) — the NMDP donor source identifier
* **Demographics** — name, gender, and date of birth (all required by the profile)
* **Race/Ethnicity** — US Core race and ethnicity extensions

The example represents a typical adult donor registered in the NMDP Be The Match registry.

### ExampleDeferredDonor

This example demonstrates a donor who is temporarily deferred:

* **Donor Status** — `#deferred` indicating temporary unavailability
* **No GRID** — demonstrates that GRID is optional
* **Race/Ethnicity** — Asian race and Hispanic or Latino ethnicity

### ExampleDonorNoGrid

This example demonstrates a donor identified by GRID with no donor source ID yet assigned:

* **GRID only** — no source-id slice present
* **Donor Status** — `#active`
* **Communication** — English language preference

This is common for donors early in the registration process before a source ID is assigned.

### ExampleDeceasedDonor

This example demonstrates the `deceased[x]` element:

* **deceasedDateTime** — date of death (`2025-06-15`)
* **Donor Status** — `#unavailable`
* **Both identifiers** — GRID and Donor ID (source-id) present

### ExampleDonorOrder

This example demonstrates the NMDPDonorOrder profile for donor workup orders:

* **NMDP Order ID** (`ORD-2026-001234`) — the required order identifier
* **Order type** — `#ct` (Confirmatory Typing) from NMDPOrderTypeVS
* **Subject** — references ExampleNMDPDonor (the donor being tested)
* **Requester** — the transplant center that initiated the order
* **Performer** — the donor center performing the work

This represents a typical confirmatory typing order placed by a transplant center during donor workup.

### ExampleNMDPDonorCenter

This example demonstrates the NMDPOrganization profile for donor centers:

* **NMDP Center ID** — the required center identifier
* **Organization type** — center-type code from NMDPCenterTypeVS
* **Active status** — required boolean indicating operational status

This represents a typical donor center in the NMDP network that manages donor registrations.

### HLA Genotype Examples

The following examples demonstrate the NMDPHLAGenotype profile for different HLA loci. Each observation represents a single-locus genotype expressed as a GL String Code.

#### ExampleHLAGenotypeA

* **Locus** — HLA-A (HGNC:4931)
* **GL String** — `hla#3.59.0#HLA-A*02:01+HLA-A*03:01`
* **Subject** — references ExampleNMDPDonor

#### ExampleHLAGenotypeB

* **Locus** — HLA-B (HGNC:4932)
* **GL String** — `hla#3.59.0#HLA-B*07:02:01+HLA-B*44:02:01`
* **Subject** — references ExampleNMDPDonor

#### ExampleHLAGenotypeC

* **Locus** — HLA-C (HGNC:4933)
* **GL String** — `hla#3.59.0#HLA-C*07:02:01+HLA-C*05:01:01`
* **Subject** — references ExampleNMDPDonor

#### ExampleHLAGenotypeDRB1

* **Locus** — HLA-DRB1 (HGNC:4948)
* **GL String** — `hla#3.59.0#HLA-DRB1*15:01:01+HLA-DRB1*03:01:01`
* **Subject** — references ExampleNMDPDonor

All HLA genotype examples share the same structure:

* **Status** — `#final` (typing is complete)
* **Category** — `laboratory` (an HLA typing is a lab result)
* **Code** — LOINC 84413-4 "Genotype display name"
* **Value** — GL String from http://glstring.org encoding allele pairs with `+` separator
* **Gene studied component** — HGNC gene ID from NMDPHLAGeneNameCS identifying which locus

## Using Examples for Validation

### Validate with the FHIR Validator

You can validate resources against this IG's profiles using the [HL7 FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator):

```
java -jar validator_cli.jar patient-resource.json \
  -ig nmdp.fhir.donor-patient#0.1.0 \
  -profile http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient

```

### Validate with SUSHI

During development, running SUSHI validates that example instances conform to their declared profiles:

```
pnpm sushi

```

SUSHI will report errors if an example instance violates constraints defined in its profile (missing required fields, invalid value set bindings, etc.).

### Write Your Own Examples

To add a new example, create a `.fsh` file in `input/fsh/examples/`:

```
Instance: ExampleNewDonor
InstanceOf: NMDPDonorPatient
Usage: #example
Title: "Example New Donor"
Description: "Description of what this example demonstrates."
* identifier[nmdpDonorId].system = $nmdp-donor
* identifier[nmdpDonorId].value = "9999999"
* name[0].family = "Smith"
* name[0].given[0] = "Jane"
* gender = #female
* birthDate = "1990-01-01"

```

Key requirements:

* `InstanceOf` must reference a profile defined in this IG
* `Usage: #example` marks it as an example (included in the IG narrative but not as a conformance resource)
* All required elements per the profile must be populated
* Use aliases from `aliases.fsh` for system URIs

## Example Donor API Response

This section shows a representative **response** returned by the NMDP Donor API for a single donor search. It is provided purely to illustrate the shape of the data a client receives.

> **This is API output, not input.** Clients do **not** send this Bundle to the API. It is an example of what the Donor API returns. A client issues a search (for example, a `GET` against the Patient endpoint with the appropriate search parameters) and the server responds with a `Bundle` of type `collection` like the one below. Do not treat any part of this example as a required request payload.

### What the response contains

The response is a FHIR `Bundle` (`type: collection`). In this condensed example it carries **two donor Patients**, each accompanied by the Observations that describe that donor:

* **Donor `1ABCD2345EF6GH7`** — an adult male donor, with ABO/Rh, CMV, body weight, and HLA-A/B/DRB1 typing results.
* **Donor `9ZYXW8765VU4TS3`** — an adult female donor, with ABO/Rh, CMV, body weight, and HLA-A/B/DRB1 typing results.

Each `Observation` references its donor through the entry `fullUrl` using `subject.reference`. A full production response may contain additional donors, Cord Blood Units, recipients, and order (`ServiceRequest`) resources; those have been omitted here to keep the example focused on the donor data.

### Example response Bundle

```
{
  "resourceType": "Bundle",
  "type": "collection",
  "entry": [
    {
      "fullUrl": "urn:uuid:22222222-2222-2222-2222-222222222222",
      "resource": {
        "resourceType": "Patient",
        "id": "1ABCD2345EF6GH7",
        "identifier": [
          {
            "system": "http://nmdp.org/identifier/grid",
            "value": "1ABCD2345EF6GH7"
          },
          {
            "system": "http://nmdp.org/identifier/source-id",
            "value": "DON-SRC-4401"
          }
        ],
        "birthDate": "1994-06-12",
        "gender": "male",
        "extension": [
          {
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race",
            "extension": [
              {
                "url": "ombCategory",
                "valueCoding": {
                  "system": "urn:oid:2.16.840.1.113883.6.238",
                  "code": "2106-3",
                  "display": "White"
                }
              },
              {
                "url": "text",
                "valueString": "White"
              }
            ]
          },
          {
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity",
            "extension": [
              {
                "url": "ombCategory",
                "valueCoding": {
                  "system": "urn:oid:2.16.840.1.113883.6.238",
                  "code": "2186-5",
                  "display": "Not Hispanic or Latino"
                }
              },
              {
                "url": "text",
                "valueString": "Not Hispanic or Latino"
              }
            ]
          },
          {
            "url": "http://fhir.nmdp.org/StructureDefinition/donor-status",
            "valueString": "available"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:22222222-2222-2222-2222-222222222222a1",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "882-1",
              "display": "ABO and Rh group [Type] in Blood"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:22222222-2222-2222-2222-222222222222"
        },
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "LA21325-8",
              "display": "A Pos"
            }
          ]
        }
      }
    },
    {
      "fullUrl": "urn:uuid:22222222-2222-2222-2222-222222222222a2",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "22244-8",
              "display": "CMV IgG Ab [Presence] in Serum"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:22222222-2222-2222-2222-222222222222"
        },
        "valueCodeableConcept": {
          "text": "Negative"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:22222222-2222-2222-2222-222222222222a3",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "29463-7",
              "display": "Body weight"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:22222222-2222-2222-2222-222222222222"
        },
        "valueQuantity": {
          "value": 82,
          "unit": "kg",
          "system": "http://unitsofmeasure.org",
          "code": "kg"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:22222222-2222-2222-2222-222222222222b1",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "57290-9",
              "display": "HLA-A [Type] by High resolution"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:22222222-2222-2222-2222-222222222222"
        },
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://glstring.org",
              "code": "HLA-A*01:01+HLA-A*02:01"
            }
          ]
        }
      }
    },
    {
      "fullUrl": "urn:uuid:22222222-2222-2222-2222-222222222222b2",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "57291-7",
              "display": "HLA-B [Type] by High resolution"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:22222222-2222-2222-2222-222222222222"
        },
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://glstring.org",
              "code": "HLA-B*07:02+HLA-B*08:01"
            }
          ]
        }
      }
    },
    {
      "fullUrl": "urn:uuid:22222222-2222-2222-2222-222222222222b3",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "57293-3",
              "display": "HLA-DRB1 [Type] by High resolution"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:22222222-2222-2222-2222-222222222222"
        },
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://glstring.org",
              "code": "HLA-DRB1*15:01+HLA-DRB1*03:01"
            }
          ]
        }
      }
    },
    {
      "fullUrl": "urn:uuid:44444444-4444-4444-4444-444444444444",
      "resource": {
        "resourceType": "Patient",
        "id": "9ZYXW8765VU4TS3",
        "identifier": [
          {
            "system": "http://nmdp.org/identifier/grid",
            "value": "9ZYXW8765VU4TS3"
          },
          {
            "system": "http://nmdp.org/identifier/source-id",
            "value": "DON-SRC-4402"
          }
        ],
        "birthDate": "1988-11-30",
        "gender": "female",
        "extension": [
          {
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race",
            "extension": [
              {
                "url": "ombCategory",
                "valueCoding": {
                  "system": "urn:oid:2.16.840.1.113883.6.238",
                  "code": "2054-5",
                  "display": "Black or African American"
                }
              },
              {
                "url": "text",
                "valueString": "Black or African American"
              }
            ]
          },
          {
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity",
            "extension": [
              {
                "url": "ombCategory",
                "valueCoding": {
                  "system": "urn:oid:2.16.840.1.113883.6.238",
                  "code": "2135-2",
                  "display": "Hispanic or Latino"
                }
              },
              {
                "url": "text",
                "valueString": "Hispanic or Latino"
              }
            ]
          },
          {
            "url": "http://fhir.nmdp.org/StructureDefinition/donor-status",
            "valueString": "available"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:44444444-4444-4444-4444-444444444444a1",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "882-1",
              "display": "ABO and Rh group [Type] in Blood"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:44444444-4444-4444-4444-444444444444"
        },
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "LA21321-7",
              "display": "O Pos"
            }
          ]
        }
      }
    },
    {
      "fullUrl": "urn:uuid:44444444-4444-4444-4444-444444444444a2",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "22244-8",
              "display": "CMV IgG Ab [Presence] in Serum"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:44444444-4444-4444-4444-444444444444"
        },
        "valueCodeableConcept": {
          "text": "Positive"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:44444444-4444-4444-4444-444444444444a3",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "29463-7",
              "display": "Body weight"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:44444444-4444-4444-4444-444444444444"
        },
        "valueQuantity": {
          "value": 65,
          "unit": "kg",
          "system": "http://unitsofmeasure.org",
          "code": "kg"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:44444444-4444-4444-4444-444444444444b1",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "57290-9",
              "display": "HLA-A [Type] by High resolution"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:44444444-4444-4444-4444-444444444444"
        },
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://glstring.org",
              "code": "HLA-A*03:01+HLA-A*24:02"
            }
          ]
        }
      }
    },
    {
      "fullUrl": "urn:uuid:44444444-4444-4444-4444-444444444444b2",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "57291-7",
              "display": "HLA-B [Type] by High resolution"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:44444444-4444-4444-4444-444444444444"
        },
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://glstring.org",
              "code": "HLA-B*15:01+HLA-B*44:02"
            }
          ]
        }
      }
    },
    {
      "fullUrl": "urn:uuid:44444444-4444-4444-4444-444444444444b3",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "57293-3",
              "display": "HLA-DRB1 [Type] by High resolution"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:44444444-4444-4444-4444-444444444444"
        },
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://glstring.org",
              "code": "HLA-DRB1*04:01+HLA-DRB1*07:01"
            }
          ]
        }
      }
    }
  ]
}

```

