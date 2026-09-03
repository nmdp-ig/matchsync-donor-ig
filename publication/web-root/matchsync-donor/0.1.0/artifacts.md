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
| [NMDP ABO/Rh Observation](StructureDefinition-nmdp-abo-rh-observation.md) | An observation representing a donor or CBU's ABO and Rh blood group type. Uses LOINC 882-1 and valueCodeableConcept with codes from LOINC Answer List LL2972-9. |
| [NMDP Body Weight Observation](StructureDefinition-nmdp-body-weight-observation.md) | An observation representing a donor's body weight. Uses LOINC 29463-7 and valueQuantity in kg. |
| [NMDP CBU Order](StructureDefinition-nmdp-cbu-order.md) | A profile representing a Cord Blood Unit (CBU) workup order in the NMDP system. CBU orders can include high resolution typing for individual loci or a full panel. ServiceRequest.subject references the recipient Patient, and ServiceRequest.performer references the CBU Patient. |
| [NMDP CMV Observation](StructureDefinition-nmdp-cmv-observation.md) | An observation representing a donor or CBU's CMV IgG antibody presence status. Uses LOINC 22244-8 and valueCodeableConcept with text-only values (Positive, Negative, Inconclusive, Untested). |
| [NMDP Cord Blood Unit (CBU) Patient](StructureDefinition-nmdp-cbu-patient.md) | A profile representing a Cord Blood Unit (CBU) in the NMDP registry. CBUs are identified by having a cbu-source-id identifier (no GRID). CBUs are not tied to a real person — they represent a cord blood unit. The Patient.id should be the CBU source ID. |
| [NMDP Donor Order](StructureDefinition-nmdp-donor-order.md) | A profile representing a donor workup order in the NMDP system. For donors, the ordered item is always confirmatory typing. ServiceRequest.subject references the recipient Patient, and ServiceRequest.performer references the donor Patient. |
| [NMDP Donor Patient](StructureDefinition-nmdp-donor-patient.md) | A profile representing a hematopoietic cell donor registered in the NMDP registry. Donors are identified by having an NMDP GRID identifier. The Patient.id should be the GRID value. |
| [NMDP Donor Specimen](StructureDefinition-nmdp-donor-specimen.md) | A profile representing a testing specimen (blood tube, buccal swab, etc.) collected from a donor for HLA typing or infectious disease marker testing. Specimens are identified by Order Number + Donor GRID rather than individual specimen IDs. |
| [NMDP HLA Genotype Observation](StructureDefinition-nmdp-hla-genotype.md) | A profile for HLA genotype observations. Each instance represents a genotype for a single HLA locus, expressed as a GL String Code. The Observation.code uses a locus-specific LOINC code identifying which HLA gene was typed. |
| [NMDP Hemoglobin Observation](StructureDefinition-nmdp-hemoglobin-observation.md) | An observation representing a CBU's hemoglobin level. Uses LOINC 718-7 (Hemoglobin [Mass/volume] in Blood) and valueQuantity in g/dL. |
| [NMDP IDM Order](StructureDefinition-nmdp-idm-order.md) | A profile for Infectious Disease Marker (IDM) orders. IDM testing is required for donor clearance before stem cell collection. |
| [NMDP Organization](StructureDefinition-nmdp-organization.md) | An organization participating in the NMDP network (donor centers, transplant centers, collection centers, apheresis centers). |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [CBU Status](StructureDefinition-cbu-status.md) | The availability status of a Cord Blood Unit (CBU) in the NMDP registry. Conveyed as a simple string value (e.g., 'Available'). |
| [Donor Status](StructureDefinition-donor-status.md) | The registration status of a donor in the NMDP registry. Conveyed as a simple string value (e.g., 'Available', 'Temporarily Unavailable', 'Active', 'Permanently Unavailable'). |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ABO/Rh Blood Type Value Set](ValueSet-nmdp-abo-rh-type-vs.md) | LOINC Answer List LL2972-9 codes for ABO and Rh blood group types. |
| [GL String Code Value Set](ValueSet-nmdp-glstring-vs.md) | Genotype List String Codes from glstring.org. Codes represent HLA genotypes in GL String format (e.g., hla#3.25.0#HLA-A**01:01:01:01+HLA-A**01:02). |
| [NMDP CMV Status Value Set](ValueSet-nmdp-cmv-status-vs.md) | Allowable text-based values for CMV IgG antibody presence status used in NMDP donor and CBU payloads. |
| [NMDP Center Type ValueSet](ValueSet-nmdp-center-type-vs.md) | All center types in the NMDP network. |
| [NMDP Donor Status ValueSet](ValueSet-nmdp-donor-status-vs.md) | All registry status codes for NMDP registered donors. Maps to ODS enterprise donor status values (AV, TU, AC, DE). |
| [NMDP HLA Gene Name Value Set](ValueSet-nmdp-hla-gene-name-vs.md) | HLA gene names (HGNC IDs) for loci typed in NMDP donor operations. |
| [NMDP HLA Locus LOINC Value Set](ValueSet-nmdp-hla-locus-loinc-vs.md) | LOINC codes for HLA locus-specific high resolution typing observations used in NMDP donor and CBU payloads. |
| [NMDP Order Type Value Set](ValueSet-nmdp-order-type-vs.md) | All codes from the NMDP Order Type code system. |
| [NMDP Specimen Type Value Set](ValueSet-nmdp-specimen-type-vs.md) | All specimen type codes for donor testing samples in the NMDP system. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [NMDP CMV Status Code System](CodeSystem-nmdp-cmv-status.md) | Text-based status codes for CMV IgG antibody presence in donor and CBU testing. |
| [NMDP Center Type](CodeSystem-nmdp-center-type.md) | Types of centers in the NMDP network. |
| [NMDP Donor Status](CodeSystem-nmdp-donor-status.md) | Status codes for NMDP registered donors. These codes represent the enterprise Registry Status maintained by NMDP, indicating a donor's availability for patient search, matching, and product request activities. Source: ODS DonorWithSampleResponse (v05). In FHIR Donor API payloads, donor status is conveyed as a valueString on the donor-status extension. |
| [NMDP HLA Gene Name Code System](CodeSystem-nmdp-hla-gene-name.md) | HGNC Gene IDs for HLA loci used in donor typing. Subset of HGNC relevant to NMDP operations. |
| [NMDP Order Type Code System](CodeSystem-nmdp-order-type.md) | Codes identifying the type of donor or CBU workup order in the NMDP system. |
| [NMDP Specimen Type Code System](CodeSystem-nmdp-specimen-type.md) | Codes identifying the type of specimen collected from a donor for HLA typing or infectious disease marker testing. |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [Example CBU Hemoglobin Observation](Observation-ExampleCBUHemoglobin.md) | An example hemoglobin observation for a Cord Blood Unit (14.2 g/dL). |
| [Example CBU Order](ServiceRequest-ExampleCBUOrder.md) | An example high resolution typing order for a Cord Blood Unit. Subject is the recipient, performer is the CBU. |
| [Example CBU Patient](Patient-ExampleCBUPatient.md) | An example Cord Blood Unit (CBU) registered in the NMDP registry, demonstrating all CBU identifier slices and demographics. |
| [Example Deceased Donor](Patient-ExampleDeceasedDonor.md) | A donor who is deceased, demonstrating the donor-status extension with Permanently Unavailable. |
| [Example Deferred Donor](Patient-ExampleDeferredDonor.md) | A donor who is temporarily unavailable (e.g., post-collection). |
| [Example Donor ABO/Rh Observation](Observation-ExampleDonorABORh.md) | An example ABO/Rh blood group observation for a donor (O Positive). |
| [Example Donor Body Weight Observation](Observation-ExampleDonorBodyWeight.md) | An example body weight observation for a donor (82 kg). |
| [Example Donor CMV Observation](Observation-ExampleDonorCMV.md) | An example CMV IgG antibody observation for a donor (Negative). |
| [Example Donor CT Order](ServiceRequest-ExampleDonorOrder.md) | An example confirmatory typing order for an NMDP donor. Subject is the recipient, performer is the donor. |
| [Example Donor Specimen](Specimen-ExampleDonorSpecimen.md) | An example blood specimen (EDTA tube) collected from a donor for HLA confirmatory typing. |
| [Example Donor With GRID Only](Patient-ExampleDonorNoGrid.md) | A donor with a GRID identifier and no source ID yet assigned. |
| [Example HLA-A Genotype](Observation-ExampleHLAGenotypeA.md) | An example HLA-A genotype observation showing a donor typed as HLA-A**02:01+HLA-A**03:01. |
| [Example HLA-B Genotype](Observation-ExampleHLAGenotypeB.md) | An example HLA-B genotype observation showing a donor typed as HLA-B**07:02+HLA-B**44:02. |
| [Example HLA-C Genotype](Observation-ExampleHLAGenotypeC.md) | An example HLA-C genotype observation showing a donor typed as HLA-C**07:01+HLA-C**05:01. |
| [Example HLA-DRB1 Genotype](Observation-ExampleHLAGenotypeDRB1.md) | An example HLA-DRB1 genotype observation showing a donor typed as HLA-DRB1**15:01+HLA-DRB1**03:01. |
| [Example IDM Order](ServiceRequest-ExampleIDMOrder.md) | An example infectious disease marker testing order for a donor prior to collection. |
| [Example MatchSync Donor Patient](Patient-ExampleMatchSyncDonorPatient.md) | A synthetic example patient used to demonstrate the starter profile. |
| [Example NMDP Donor](Patient-ExampleNMDPDonor.md) | An example donor registered in the NMDP registry. |
| [Example NMDP Donor Center](Organization-ExampleNMDPDonorCenter.md) | An example donor center in the NMDP network. |
| [Example Recipient Patient](Patient-ExampleRecipientPatient.md) | An example recipient patient identified by RID and local ID. Used as the subject of donor and CBU orders. |

