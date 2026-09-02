# Related Specifications - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Related Specifications**

## Related Specifications

# Related Specifications

This page documents the relationship between the NMDP Donor Patient IG and other relevant specifications. Where this IG maintains semantic compatibility with external standards, it does so through shared coding systems and conventions rather than formal package dependencies.

## HL7 Genomics Reporting IG

This IG does **NOT** declare a formal dependency on the [HL7 Genomics Reporting IG](http://hl7.org/fhir/uv/genomics-reporting/) (`hl7.fhir.uv.genomics-reporting`).

### Rationale

The Donor Patient IG provides a read-only summary of donor HLA for search and discovery use cases. The HL7 Genomics Reporting IG is designed for full genotyping laboratory reports with DiagnosticReport, Specimen, and Task profiles that exceed the scope of this IG. Adding the dependency would introduce unnecessary complexity and weight for a donor demographics API.

### Semantic Compatibility

The `NMDPHLAGenotype` profile in this IG maintains semantic compatibility with the HL7 Genomics Reporting IG and the NMDP HLA Reporting IG through shared coding systems:

| | | |
| :--- | :--- | :--- |
| LOINC`84413-4`(Genotype display name) | `Observation.code`for HLA genotype observations | HL7 Genomics Reporting IG Genotype profile |
| LOINC`48018-6`(Gene studied) | `Observation.component`for gene/locus identification | HL7 Genomics Reporting IG |
| GL String Code (`http://glstring.org`) | `Observation.value`encoding of HLA genotype strings | NMDP HLA Reporting IG, HL7 Genomics Reporting IG |
| HGNC gene identifiers (e.g.,`HGNC:4931`for HLA-A) | Locus identification in gene studied component | HL7 Genomics Reporting IG, NMDP HLA Reporting IG |

Data produced by this IG is interoperable with systems that consume HL7 Genomics Reporting IG or NMDP HLA Reporting IG data, without requiring a formal package dependency.

### NMDP HLA Reporting IG

The [NMDP HLA Reporting IG](https://fhir.nmdp.org/ig/hla-reporting/) (`https://fhir.nmdp.org/ig/hla-reporting/`) is the full HLA genotyping and allele-level reporting specification published by NMDP. It further constrains the HL7 Genomics Reporting IG for HLA-specific use cases, including:

* HLA Genotype Observation (per-locus)
* HLA Allele Observation
* HLA DiagnosticReport (grouping report for a complete typing)
* GL String Code value sets

The Donor Patient IG's `NMDPHLAGenotype` profile is intentionally simpler — it provides a per-locus genotype summary without the full DiagnosticReport wrapper or allele-level detail. If future versions of this IG require full typing reports, the dependency on the HLA Reporting IG may be revisited.

## US Core 6.1.0

This IG declares a formal dependency on [US Core 6.1.0](http://hl7.org/fhir/us/core/) (`hl7.fhir.us.core#6.1.0`).

The `NMDPDonorPatient` profile extends `USCorePatientProfile`, inheriting its requirements for:

* Patient identifiers (MRN, SSN patterns)
* Name, gender, birthDate
* Race and ethnicity extensions
* US-realm address constraints

See [ADR-0005](https://github.com/ericbfriday/nmdp-donor-patient-ig/blob/main/docs/adr/0005-extend-uscore-patient.md) for the decision rationale.

## ISBT 128

The [ISBT 128](https://www.iccbba.org/tech-library/iccbba-documents/databases-702/grid-database) standard defines the Global Registration Identifier for Donors (GRID), used in this IG as a donor identifier:

* **System URI:** `http://terminology.nmdp.org/identifier/grid`
* **Format:** 19-character alphanumeric string with a check character
* **Purpose:** Internationally unique, persistent identifier for donors across registries worldwide
* **Issuing authority:** World Marrow Donor Association (WMDA) via ICCBBA

The GRID enables unambiguous donor identification across international registry boundaries without exposing registry-internal identifiers.

