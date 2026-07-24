# Research: Genomics IG Alignment for Donor Patient IG

**Date:** 2026-07-24
**Question:** Does NMDP already reference or plan to use the HL7 Genomics Reporting IG for HLA data? Should the Donor Patient IG declare a formal dependency on a genomics or HLA reporting IG?

---

## Executive Summary

NMDP **does** have an existing HLA Reporting IG (`https://fhir.nmdp.org/ig/hla-reporting/`) that is explicitly derived from the HL7 Genomics Reporting IG. However, the Donor Patient IG should **not** declare a formal dependency on either the Genomics Reporting IG or the HLA Reporting IG at this time. The current `NMDPHLAGenotype` profile is intentionally lightweight — it profiles base `Observation` directly and uses the same LOINC codes and GL String conventions as the HLA Reporting IG without requiring a package dependency. This keeps the Donor Patient IG focused on its narrow scope (donor demographics + registration data for the Donor API).

---

## Finding 1: NMDP Has an Existing HLA Reporting IG

**Yes.** The NMDP/CIBMTR publishes an HLA Reporting IG:

- **URL:** https://fhir.nmdp.org/ig/hla-reporting/
- **Code:** https://github.com/nmdp-ig/hla-reporting-ig (also mirrored at `bethematch/bioinfo/github/` on GitLab)
- **Dev:** https://dev1.fhir.nmdp.org/ig/hla-reporting/
- **Author:** Bob Milius (CIT/Bioinformatics)
- **Origin:** Result of the ONC "Sync for Genes" project (Phase 3, 2020)

The HLA Reporting IG defines profiles for:
- HLA Genotype Observation (per-locus)
- HLA Allele Observation
- HLA DiagnosticReport (grouping report for a complete HLA typing)
- GL String Code value sets

**Source:** Confluence page 382903095 ("Creating and Publishing FHIR Implementation Guides for NMDP", GSD space), page 252816825 ("HLA", EA space)

---

## Finding 2: Relationship to HL7 Genomics Reporting IG

The NMDP HLA Reporting IG **directly derives from** the HL7 Genomics Reporting IG:

> "This IG was the result of the Office of the National Coordinator Sync 4 Genes project. It further profiles HL7 Genomics Reporting IG STU1, adding constraints for HLA specific profiles. It should be updated to follow STU2 of the HL7 Genomics Reporting IG."
> — Confluence page 382903095

Key architectural relationships:
- The HL7 Genomics Reporting IG (`http://hl7.org/fhir/uv/genomics-reporting/`) contains a **Histocompatibility and Immunogenetics Reporting** section, largely authored by Bob Milius (NMDP staff).
- The NMDP HLA Reporting IG further constrains the Genomics Reporting IG profiles for HLA-specific use cases.
- The "GL String Code" code system (`https://glstring.org/`) was created by NMDP following a 2018 hackathon and is the canonical way to encode HLA genotype data in FHIR.

**Relevant HL7 Genomics Reporting IG pages:**
- Histocompatibility section: http://hl7.org/fhir/uv/genomics-reporting/histocompatibility.html
- HLA-A Genotype example: http://hl7.org/fhir/uv/genomics-reporting/Observation-genotype-hla-a-glstring-r4.json.html
- HLA DiagnosticReport example: http://hl7.org/fhir/uv/genomics-reporting/DiagnosticReport-diagnosticreport-hla-glstring-r4.json.html

**Source:** Confluence page 252816825 ("HLA", EA space), page 382765146 ("HLA, OCMv2, and OMOP", CIT space)

---

## Finding 3: The HLA Reporting IG Is Organization-Agnostic

An important distinction from Confluence (page 382903095):

> "This is NOT specific to any organization (NMDP or CIBMTR). However, this IG can be used to inform HLA profiles in our IGs, such as adding a section for reporting HLA to the CIBMTR Reporting IG."

The HLA Reporting IG is designed as a **universal** HLA-in-FHIR standard, not an NMDP-internal spec. It's meant for any organization that needs to exchange HLA data using FHIR.

---

## Finding 4: Current State of HLA-in-FHIR at NMDP

Per the "HLA-related notes" page (281626628, CIT space, from June 2023):

> "The current FHIR IG for HLA data was created for translating HML to FHIR for HLA data, not pure FHIR HLA data submission."

As of mid-2023, there is no "true FHIR IG" for direct HLA data submission — the existing tooling (HML2FHIR, TARR2FHIR) translates HML messages into FHIR using the HLA Reporting IG profiles. David Wroe and Matt Prestegaard identified the need for a "definitive design for HLA reporting on FHIR" for:
- Patient Import (MatchSync/MatchSource)
- Patient Antibody Report

The FHIR Roadmap (page 319260617, Enterprise FHIR space) lists these as planned capabilities:
- **HLA Diagnostic Report** (IG, Profiles, Extensions) — funded since FY2018, ongoing
- **HLA for Patient Antibody Reports** — FY2025 target
- **Infectious Disease Marker (IDM) Reports** — FY2025 target

---

## Finding 5: Other NMDP IGs in the Ecosystem

| IG | URL | Scope | Repo |
|----|-----|-------|------|
| CIBMTR Reporting IG | https://fhir.nmdp.org/ig/cibmtr-reporting/ | Transplant center outcomes reporting to CIBMTR | `bethematch/bioinfo/github/cibmtr-reporting-ig` |
| HLA Reporting IG | https://fhir.nmdp.org/ig/hla-reporting/ | Universal HLA genotype/allele representation | `nmdp-ig/hla-reporting-ig` (GitHub) |
| MatchSync IG | https://fhir.nmdp.org/ig/matchsync/ | MatchSync operational data exchange | `nmdp-ig/matchsync-ig` (GitHub) |
| HLA Antibody Report IG | https://fhir.nmdp.org/ig/HlaAntibodyReport/ | HLA antibody test results (HAML-on-FHIR) | GSD team (David Wroe), v0.2.0-Preview |
| **Donor Patient IG** (this IG) | http://fhir.nmdp.org/ig/donor-patient | Donor demographics, HLA summary, orders | This repo |

**Source:** Confluence pages 382903095, 445679841, GitLab project search results

---

## Finding 6: How HLA Observations Are Modeled

### In the HL7 Genomics Reporting IG
- `Genotype` profile extends `Observation`
- Uses LOINC 84413-4 ("Genotype display name") for the observation code
- Gene studied component uses LOINC 48018-6
- Values encoded using the GL String Code system (`http://glstring.org`)

### In the NMDP HLA Reporting IG
- Further constrains the Genomics Reporting IG genotype profile for HLA specifically
- Adds HLA-specific invariants and constraints
- References HGNC gene identifiers for locus identification

### In the Donor Patient IG (current, this repo)
- `NMDPHLAGenotype` profiles base `Observation` (not Genomics Reporting IG)
- Uses the **same LOINC codes**: 84413-4 for genotype, 48018-6 for gene studied
- Uses the **same GL String Code system** from `http://glstring.org`
- Uses HGNC gene identifiers (e.g., `HGNC:4931` for HLA-A)
- Intentionally simpler: no DiagnosticReport wrapper, no allele-level detail

The Donor Patient IG's `NMDPHLAGenotype` profile is **semantically compatible** with the HLA Reporting IG approach — it uses the same coding systems and LOINC codes — but does not technically inherit from its profiles. This is a conscious simplification for the API consumer use case (read-only summary of donor HLA for transplant center search results).

---

## Recommendation: Do NOT Declare a Formal Dependency

### Reasons Against Adding a Dependency

1. **Scope mismatch:** The Donor Patient IG provides a read-only summary of donor HLA for search/discovery. The HLA Reporting IG is designed for full genotyping laboratory reports. Inheriting the full Genomics Reporting IG chain would pull in complexity (DiagnosticReport, Specimen, Task profiles) that this IG does not need.

2. **Dependency chain weight:** Adding `hl7.fhir.uv.genomics-reporting` pulls in a large package with many profiles irrelevant to donor demographics. This increases build time and validator scope unnecessarily.

3. **Organizational intent:** Matt Prestegaard (CIBMTR) explicitly stated: "I think we are generally aligned that it will be good if our IGs (CIBMTR reporting and NMDP patient upload) resemble each other…**but we do not want to create any hard dependency or constraints between them**." (Confluence page 281626628, emphasis from source)

4. **HLA Reporting IG needs update:** The HLA Reporting IG is currently based on Genomics Reporting IG STU1 and "should be updated to follow STU2." Adding a dependency on a transitioning spec introduces risk.

5. **Semantic alignment without structural coupling:** The Donor Patient IG already uses the same LOINC codes, GL String Code system, and HGNC identifiers. Consumers can validate HLA data against the HLA Reporting IG independently if they wish, without a formal package dependency.

### What To Do Instead

1. **Document the alignment** in the IG narrative: note that `NMDPHLAGenotype` uses the same coding conventions as the HL7 Genomics Reporting IG and NMDP HLA Reporting IG.

2. **Reference but don't depend:** Add a "Related Specifications" page or section linking to:
   - HL7 Genomics Reporting IG (histocompatibility section)
   - NMDP HLA Reporting IG
   - GL String specification

3. **Consider future alignment:** If the Donor Patient IG ever needs to return full typing reports (DiagnosticReport with allele-level detail), revisit the dependency decision. For now, the per-locus Observation summary is sufficient.

4. **Use identical coding system URIs:** Continue using `http://glstring.org`, `http://loinc.org` (84413-4, 48018-6), and HGNC codes so that data produced by this IG is interoperable with the HLA Reporting IG ecosystem.

---

## Sources

| Source | Page ID / URL | Title | Space | Last Modified |
|--------|--------------|-------|-------|---------------|
| Confluence | 252816825 | HLA (Implementation Guide Design) | Enterprise Architecture | 2023-06-26 |
| Confluence | 382765146 | HLA, OCMv2, and OMOP | CIT | 2025-11-06 |
| Confluence | 319260617 | FHIR Roadmap | Enterprise FHIR | 2024-07-29 |
| Confluence | 382903095 | Creating and Publishing FHIR Implementation Guides for NMDP | Genomic Services | 2025-05-02 |
| Confluence | 281626628 | HLA-related notes | CIT | 2024-04-16 |
| Confluence | 269385809 | FHIR Genomics from EPIC | CIT | 2023-11-14 |
| Confluence | 319260609 | HL7 FHIR for Clinical Genomics | Enterprise FHIR | 2024-07-29 |
| Confluence | 445679841 | HLA Antibody Report IG for 0.2.0-Preview | Genomic Services | 2026-01-27 |
| Confluence | 545981591 | FHIR DevDays 2026 | Enterprise FHIR | 2026-05-11 |
| GitLab | bethematch/bioinfo/github/cibmtr-reporting-ig (70543402) | CIBMTR Reporting IG | — | 2025-06-05 |
| GitHub | https://github.com/nmdp-ig/hla-reporting-ig | HLA Reporting IG source | — | — |
| GitHub | https://github.com/nmdp-ig/cibmtr-reporting-ig | CIBMTR Reporting IG source | — | — |
| Published | https://fhir.nmdp.org/ig/hla-reporting/ | HLA Reporting IG (published) | — | — |
| Published | http://hl7.org/fhir/uv/genomics-reporting/histocompatibility.html | HL7 Genomics Reporting - Histocompatibility | — | — |
| Published | https://glstring.org/ | GL String Code System | — | — |
