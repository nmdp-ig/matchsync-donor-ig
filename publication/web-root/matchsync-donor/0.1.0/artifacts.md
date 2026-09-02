# Artifacts Summary - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Capability Statements 

The following artifacts define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

| | |
| :--- | :--- |
| [NMDP Donor API Capability Statement](CapabilityStatement-NMDPDonorAPICapabilityStatement.md) | Describes the expected capabilities of the NMDP Donor API FHIR server, including supported resources, interactions, and search parameters. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [MatchSync Donor Patient](StructureDefinition-matchsync-donor-patient.md) | A minimal Patient profile used as the starting point for MatchSync donor data. |
| [NMDP Donor Order](StructureDefinition-nmdp-donor-order.md) | A profile representing a donor workup or collection order in the NMDP system. Orders include confirmatory typing (CT), infectious disease markers (IDM), and stem cell collection. |
| [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md) | A profile representing a hematopoietic cell donor registered in the NMDP registry. |
| [NMDP Donor Specimen](StructureDefinition-nmdp-donor-specimen.md) | A profile representing a testing specimen (blood tube, buccal swab, etc.) collected from a donor for HLA typing or infectious disease marker testing. Specimens are identified by Order Number + Donor GRID rather than individual specimen IDs. |
| [NMDP HLA Genotype Observation](StructureDefinition-nmdp-hla-genotype.md) | A profile for HLA genotype observations. Each instance represents a genotype for a single HLA locus, expressed as a GL String Code. |
| [NMDP IDM Order](StructureDefinition-nmdp-idm-order.md) | A profile for Infectious Disease Marker (IDM) orders. IDM testing is required for donor clearance before stem cell collection. |
| [NMDP Organization](StructureDefinition-nmdp-organization.md) | An organization participating in the NMDP network (donor centers, transplant centers, collection centers, apheresis centers). |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Donor Status](StructureDefinition-donor-status.md) | The registration status of a donor in the NMDP registry, with an optional available date for temporarily unavailable donors. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [GL String Code Value Set](ValueSet-nmdp-glstring-vs.md) | Genotype List String Codes from glstring.org. Codes represent HLA genotypes in GL String format (e.g., hla#3.25.0#HLA-A**01:01:01:01+HLA-A**01:02). |
| [NMDP Center Type ValueSet](ValueSet-nmdp-center-type-vs.md) | All center types in the NMDP network. |
| [NMDP Donor Status ValueSet](ValueSet-nmdp-donor-status-vs.md) | All registry status codes for NMDP registered donors. Maps to ODS enterprise donor status values (AV, TU, AC, DE). |
| [NMDP HLA Gene Name Value Set](ValueSet-nmdp-hla-gene-name-vs.md) | HLA gene names (HGNC IDs) for loci typed in NMDP donor operations. |
| [NMDP Order Type Value Set](ValueSet-nmdp-order-type-vs.md) | All codes from the NMDP Order Type code system. |
| [NMDP Specimen Type Value Set](ValueSet-nmdp-specimen-type-vs.md) | All specimen type codes for donor testing samples in the NMDP system. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [NMDP Center Type](CodeSystem-nmdp-center-type.md) | Types of centers in the NMDP network. |
| [NMDP Donor Status](CodeSystem-nmdp-donor-status.md) | Status codes for NMDP registered donors. These codes represent the enterprise Registry Status maintained by NMDP, indicating a donor's availability for patient search, matching, and product request activities. Source: ODS DonorWithSampleResponse (v05). |
| [NMDP HLA Gene Name Code System](CodeSystem-nmdp-hla-gene-name.md) | HGNC Gene IDs for HLA loci used in donor typing. Subset of HGNC relevant to NMDP operations. |
| [NMDP Order Type Code System](CodeSystem-nmdp-order-type.md) | Codes identifying the type of donor workup or collection order in the NMDP system. |
| [NMDP Specimen Type Code System](CodeSystem-nmdp-specimen-type.md) | Codes identifying the type of specimen collected from a donor for HLA typing or infectious disease marker testing. |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [Example Deceased Donor](Patient-ExampleDeceasedDonor.md) | A donor who is deceased, demonstrating the deceased[x] element with a dateTime value. |
| [Example Deferred Donor](Patient-ExampleDeferredDonor.md) | A donor who is temporarily unavailable (e.g., post-collection with a future available date). |
| [Example Donor CT Order](ServiceRequest-ExampleDonorOrder.md) | An example confirmatory typing order for an NMDP donor. |
| [Example Donor Specimen](Specimen-ExampleDonorSpecimen.md) | An example blood specimen (EDTA tube) collected from a donor for HLA confirmatory typing. |
| [Example Donor Without GRID](Patient-ExampleDonorNoGrid.md) | A newly registered donor who has an NMDP Donor ID but has not yet been assigned a GRID. |
| [Example HLA-A Genotype](Observation-ExampleHLAGenotypeA.md) | An example HLA-A genotype observation showing a donor typed as HLA-A**02:01+HLA-A**03:01. |
| [Example HLA-B Genotype](Observation-ExampleHLAGenotypeB.md) | An example HLA-B genotype observation showing a donor typed as HLA-B**07:02:01+HLA-B**44:02:01. |
| [Example HLA-C Genotype](Observation-ExampleHLAGenotypeC.md) | An example HLA-C genotype observation showing a donor typed as HLA-C**07:02:01+HLA-C**05:01:01. |
| [Example HLA-DRB1 Genotype](Observation-ExampleHLAGenotypeDRB1.md) | An example HLA-DRB1 genotype observation showing a donor typed as HLA-DRB1**15:01:01+HLA-DRB1**03:01:01. |
| [Example IDM Order](ServiceRequest-ExampleIDMOrder.md) | An example infectious disease marker testing order for a donor prior to collection. |
| [Example MatchSync Donor Patient](Patient-ExampleMatchSyncDonorPatient.md) | A synthetic example patient used to demonstrate the starter profile. |
| [Example NMDP Donor](Patient-ExampleNMDPDonor.md) | An example donor registered in the NMDP registry. |
| [Example NMDP Donor Center](Organization-ExampleNMDPDonorCenter.md) | An example donor center in the NMDP network. |

