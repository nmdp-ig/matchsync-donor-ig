# NMDP Donor Patient Implementation Guide

This Implementation Guide defines the FHIR profiles for representing hematopoietic cell donors in the NMDP (National Marrow Donor Program / Be The Match) registry.

## Scope

The Donor Patient IG covers:

- **Donor demographics** — name, date of birth, gender, race, ethnicity
- **Donor identifiers** — NMDP Donor ID, GRID (Global Registration Identifier for Donors)
- **Donor status** — active, inactive, deferred, unavailable

## Profiles

| Profile | Base Resource | Description |
|---------|--------------|-------------|
| [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.html) | Patient | A hematopoietic cell donor registered in the NMDP registry |

## Extensions

| Extension | Context | Description |
|-----------|---------|-------------|
| [DonorStatus](StructureDefinition-donor-status.html) | Patient | The registration status of a donor |

## Dependencies

This IG depends on:
- [FHIR R4 (4.0.1)](http://hl7.org/fhir/R4/)
- [US Core 6.1.0](http://hl7.org/fhir/us/core/STU6.1/)
