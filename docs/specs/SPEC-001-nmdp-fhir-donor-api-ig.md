# SPEC-001: NMDP FHIR Donor API Implementation Guide

**Status:** Draft  
**Date:** 2026-07-22  
**Author:** Eric Friday  
**Label:** `ready-for-agent`

---

## Problem Statement

The MatchSync team at NMDP needs a published FHIR Implementation Guide that codifies the data contract for the **FHIR Donor API** — the API through which transplant centers discover and retrieve donor demographics, HLA typing results, donor status, and order information. Today, this contract exists informally in ODS (Operational Data Services) SOAP/REST endpoints and internal documentation. Without a formal IG, consumers have no machine-readable conformance resources, no validation tooling, and no shared vocabulary for integration testing.

Additionally, the workspace itself needs to be configured for agent-assisted development using the Matt Pocock engineering skills (`/setup-matt-pocock-skills`), domain glossary, and issue-tracker conventions so that future work can be triaged, grilled, and implemented by AI agents with full context.

---

## Solution

Build and publish a FHIR R4 Implementation Guide for the NMDP Donor API using FSH/SUSHI, hosted in the `fhir-ig-builder` repository. The IG defines:

1. **NMDPDonorPatient** — a Patient profile for donors with required NMDP Donor ID and optional GRID identifiers, plus donor-status extension
2. **HLA Observation profiles** — Observation resources per locus carrying GL String Codes
3. **Donor Order (ServiceRequest)** — order coordination for CT, IDM, and collection
4. **Supporting terminology** — CodeSystems, ValueSets, and Extensions specific to NMDP

The workspace is configured with devcontainer-first development (Node 22 + JDK 17 + pnpm), Kiro/Claude agent skills, and GitHub Issues as the issue tracker.

---

## User Stories

1. As a **transplant center developer**, I want a published FHIR Patient profile for NMDP donors, so that I can validate donor demographic payloads from the Donor API against a formal schema.
2. As a **transplant center developer**, I want identifier slicing on the donor Patient profile, so that I know exactly which identifier systems (NMDP Donor ID, GRID) are required or optional.
3. As a **transplant center developer**, I want an HLA Observation profile with LOINC-coded locus observations and GL String Code values, so that I can parse typing results without ambiguity.
4. As a **transplant center developer**, I want a ServiceRequest profile for donor orders, so that I can validate order payloads for CT, IDM, and collection workflows.
5. As a **registry data steward**, I want a DonorStatus extension bound to a formal CodeSystem, so that donor availability status is machine-readable and consistent across consumers.
6. As an **IG author**, I want a devcontainer with Node 22, JDK 17, and pnpm pre-installed, so that I can compile FSH and build the full IG without wrestling with local dependencies.
7. As an **IG author**, I want `pnpm sushi` to compile all FSH files and report errors, so that I get fast feedback on profile correctness.
8. As an **IG author**, I want `pnpm build` to produce a full HTML IG site, so that I can review narrative documentation alongside machine-readable artifacts.
9. As an **IG author**, I want `pnpm watch` to recompile on save, so that I can iterate quickly on FSH definitions.
10. As an **IG author**, I want shared `aliases.fsh` with all canonical NMDP namespace URIs, so that I don't introduce typos or deprecated URIs.
11. As a **MatchSync engineer**, I want the repo configured with GitHub Issues and triage labels (`ready-for-agent`, `bug`, `feature`, `research`, etc.), so that agent skills can publish and consume tickets.
12. As a **MatchSync engineer**, I want CONTEXT.md and UBIQUITOUS_LANGUAGE.md maintained alongside the FSH source, so that AI agents use correct domain terminology.
13. As an **AI agent**, I want ADRs documenting key decisions (namespace conventions, pnpm choice, no-Jekyll), so that I don't contradict existing architectural choices.
14. As a **QA engineer**, I want example instances (ExampleNMDPDonor, ExampleBloodTypeObservation, ExampleOrderInstance) that validate against their profiles, so that I can use them as test fixtures.
15. As a **CIBMTR integration developer**, I want the Donor API IG to declare its US Core 6.x dependency, so that profiles inherit US Core constraints where appropriate.
16. As an **IG publisher**, I want CI (GitHub Actions) to validate FSH on every PR, so that broken profiles don't merge to main.
17. As an **IG publisher**, I want the IG published at `http://fhir.nmdp.org/ig/donor-api/` on merge to main, so that consumers can always reference the latest conformance resources.
18. As a **donor center developer**, I want a CBU (Cord Blood Unit) profile variant, so that cord blood units are distinguishable from adult donors while sharing the same identifier patterns.
19. As a **lab integration developer**, I want the HLA Observation profile to reference the HL7 Genomics Reporting IG where appropriate, so that we don't reinvent genomic observation patterns.
20. As a **security reviewer**, I want the IG to document which identifier systems are PHI-sensitive, so that downstream consumers apply appropriate access controls.

---

## Implementation Decisions

### Architecture

- **FSH as source of truth** — All profiles, extensions, value sets, and examples are authored in FHIR Shorthand (`.fsh` files in `input/fsh/`). No hand-edited JSON/XML.
- **FHIR R4 (4.0.1)** — The only FHIR version targeted. No STU3 backward compatibility.
- **US Core 6.1.0 dependency** — Declared in `sushi-config.yaml`. Enables US Core Race and Ethnicity extensions on the donor Patient profile.
- **Devcontainer-first** — All toolchain lives in `.devcontainer/` (Node 22 + JDK 17 + corepack/pnpm). No local toolchain setup required (ADR-0001).
- **pnpm with local SUSHI devDependency** — SUSHI installed as `fsh-sushi@^3.13.0` via pnpm, not globally (ADR-0003).
- **No Ruby/Jekyll** — IG Publisher's internal renderer used exclusively (ADR-0004).

### Namespace Conventions (ADR-0002)

- Identifier systems use `http://terminology.nmdp.org/identifier/` prefix
- Code systems use `http://terminology.nmdp.org/codesystem/` prefix
- Extensions use `http://fhir.nmdp.org/StructureDefinition/` prefix
- ISBT GRID uses `http://www.isbt128.org/uri/GRID`
- All aliases centralized in `input/fsh/aliases.fsh`

### Profile Design: NMDPDonorPatient

- Constrains `Patient` (base FHIR R4)
- Identifier slicing: `nmdpDonorId` (1..1 MS, required), `grid` (0..1 MS, optional)
- Required elements: `name` (1..*), `gender` (1..1), `birthDate` (1..1)
- Extensions: US Core Race, US Core Ethnicity, DonorStatus (custom)
- The profile uses `#open` slicing rules so consumers can add additional identifiers (e.g., local-id)

### Profile Design: ExampleDonorOrder (ServiceRequest)

- Fixed `intent = #order`
- Identifier slicing: `nmdpOrderId` (1..1 MS)
- `subject` constrained to `Reference(NMDPDonorPatient)` only
- `authoredOn` required (1..1)
- `code` optional — bound to future order-type CodeSystem

### Extension: DonorStatus

- Context: `Patient`
- Value type: `code`
- Bound to `NMDPDonorStatusVS` (required strength)
- Codes: `active`, `inactive`, `deferred`, `unavailable`

### Terminology

- **NMDPDonorStatusCS** — Complete CodeSystem with 4 codes
- **NMDPDonorStatusVS** — Includes all codes from NMDPDonorStatusCS
- **ExampleABOBloodTypeVS** — SNOMED CT codes for ABO blood types (demonstration only)

### Workspace Configuration

- **Issue tracker:** GitHub Issues (`gh` CLI, repo: `ericbfriday/fhir-ig-builder`)
- **Triage labels:** `ready-for-agent`, `bug`, `feature`, `research`, `wayfinder:map`, `wayfinder:research`, `wayfinder:task`
- **Domain docs:** Single-context layout — `CONTEXT.md` + `UBIQUITOUS_LANGUAGE.md` at root, `docs/adr/` for decisions
- **Agent skills:** Kiro skills linked in `.kiro/skills/`, Claude skills in `.claude/skills/`, universal in `.agents/skills/`
- **Volta pinning:** Node 22.21.1, pnpm 10.33.0

---

## Testing Decisions

### What Makes a Good Test in This Context

- **Test external behavior, not implementation details** — Validate that SUSHI compiles FSH without errors and that generated resources conform to their declared base profiles. Don't test internal SUSHI mechanics.
- **Example instances ARE the tests** — Each `Usage: #example` instance must validate against its profile. If SUSHI compiles without errors and the IG Publisher validates without errors, the examples serve as conformance tests.
- **The seam is the SUSHI compiler** — The primary verification boundary is `pnpm sushi` (exit code 0, no errors). This is the highest seam available and the one we test against.

### What Gets Tested

| Layer | Test | Tooling |
|-------|------|---------|
| FSH compilation | `pnpm sushi` exits 0, no ERRORs | SUSHI CLI |
| Profile validation | Example instances validate against profiles | IG Publisher (`pnpm validate`) |
| Narrative | Pages render without broken links | IG Publisher HTML output |
| CI gate | All of the above run on every PR | GitHub Actions |

### Prior Art

- The CIBMTR Reporting IG uses the same pattern: FSH → SUSHI → IG Publisher, with example instances as conformance tests.
- HL7 IG best practice: every profile SHOULD have at least one conforming example instance.

### Seams

1. **Primary seam: `pnpm sushi`** — Compiles FSH to FHIR JSON. If this passes, the FSH is syntactically and structurally correct.
2. **Secondary seam: `pnpm validate`** — Runs IG Publisher validation. Catches semantic errors (invalid bindings, broken references, cardinality violations in examples).
3. **No additional test framework needed** — FSH/SUSHI doesn't benefit from Jest/Vitest. The compiler IS the test runner.

---

## Out of Scope

- **HLA Observation profile with GL String Code binding** — Requires coordination with the Genomics Reporting IG and resolution of LOINC code assignments per locus. Deferred to a follow-up spec.
- **CBU (Cord Blood Unit) profile** — Shares patterns with NMDPDonorPatient but needs its own identifier system (`$nmdp-cbu`) and potentially different required fields. Deferred.
- **CapabilityStatement** — Defining what the Donor API server SHALL support. Requires API surface finalization.
- **SMART-on-FHIR launch/auth specification** — Okta integration details are out of scope for the IG itself.
- **CI/CD pipeline for IG publishing** — GitHub Actions workflow creation is tracked separately.
- **HealthLake data validation** — Validating existing data in AWS HealthLake against these profiles is a separate operational concern.
- **Mapping from ODS SOAP responses to FHIR** — The transformation logic lives in the Donor API service, not in the IG.

---

## Further Notes

### Current State (as of 2026-07-22)

The following artifacts are **already built and compiling**:

| Artifact | File | Status |
|----------|------|--------|
| NMDPDonorPatient profile | `input/fsh/profiles/NMDPDonorPatient.fsh` | ✅ Complete (v1) |
| ExampleDonorOrder profile | `input/fsh/profiles/ExampleDonorOrder.fsh` | ✅ Complete |
| ExampleLabObservation profile | `input/fsh/profiles/ExampleLabObservation.fsh` | ✅ Complete (demo) |
| DonorStatus extension | `input/fsh/extensions/DonorStatus.fsh` | ✅ Complete |
| NMDPDonorStatusCS CodeSystem | `input/fsh/codesystems/NMDPDonorStatus.fsh` | ✅ Complete |
| NMDPDonorStatusVS ValueSet | `input/fsh/valuesets/NMDPDonorStatus.fsh` | ✅ Complete |
| ExampleABOBloodTypeVS | `input/fsh/valuesets/ExampleABOBloodTypeVS.fsh` | ✅ Complete (demo) |
| ExampleNMDPDonor instance | `input/fsh/examples/ExampleNMDPDonor.fsh` | ✅ Complete |
| ExampleBloodTypeObservation | `input/fsh/examples/ExampleBloodTypeObservation.fsh` | ✅ Complete |
| ExampleOrderInstance | `input/fsh/examples/ExampleOrderInstance.fsh` | ✅ Complete |
| Shared aliases | `input/fsh/aliases.fsh` | ✅ Complete |
| Devcontainer | `.devcontainer/` | ✅ Complete |
| Domain glossary | `UBIQUITOUS_LANGUAGE.md` | ✅ Complete |
| Domain context | `CONTEXT.md` | ✅ Complete |
| ADR-0001 through ADR-0004 | `docs/adr/` | ✅ Complete |

### Workspace Configuration Status

| Item | Status | Notes |
|------|--------|-------|
| `/setup-matt-pocock-skills` run | ✅ Done | Skills symlinked in `.kiro/skills/`, `.claude/skills/`, `.agents/skills/` |
| GitHub Issues configured | ✅ Done | See `docs/agents/issue-tracker.md` |
| Domain docs layout | ✅ Done | Single-context: `CONTEXT.md` + `docs/adr/` |
| Triage labels | ⚠️ Need to verify | Should have: `ready-for-agent`, `bug`, `feature`, `research`, `blocked`, `in-progress` |
| Kiro steering files | ✅ Done | `devcontainer.md` in `.kiro/steering/` |

---

## Work Tracker: Known Tickets

### Tier 0: Workspace Hygiene (Do First)

| # | Title | Type | Status |
|---|-------|------|--------|
| 1 | Verify/create triage labels on GitHub repo | task | 🔲 TODO |
| 2 | Add GitHub Actions CI workflow (`pnpm sushi` on PRs) | feature | 🔲 TODO |
| 3 | Update `sushi-config.yaml` canonical to `http://fhir.nmdp.org/ig/donor-api/` | task | 🔲 TODO |
| 4 | Add `CONTRIBUTING.md` FSH style conventions section | task | ✅ DONE |

### Tier 1: Core Profile Hardening

| # | Title | Type | Status |
|---|-------|------|--------|
| 5 | Add `managingOrganization` constraint to NMDPDonorPatient (Reference to NMDP Organization) | feature | 🔲 TODO |
| 6 | Add `communication` language support to NMDPDonorPatient | feature | 🔲 TODO |
| 7 | Define HLAObservation profile (per-locus, LOINC-coded, GL String Code value) | feature | 🔲 TODO |
| 8 | Define NMDPOrganization profile (for donor centers, transplant centers, collection centers) | feature | 🔲 TODO |
| 9 | Expand DonorStatus CodeSystem with full ODS-sourced status codes | research | 🔲 TODO |
| 10 | Add `deceased[x]` handling to NMDPDonorPatient (donor death reporting) | feature | 🔲 TODO |

### Tier 2: Order & Coordination Profiles

| # | Title | Type | Status |
|---|-------|------|--------|
| 11 | Formalize order-type CodeSystem (CT, IDM, Collection, PBSC, Marrow) | feature | 🔲 TODO |
| 12 | Add `requester` and `performer` constraints to ExampleDonorOrder | feature | 🔲 TODO |
| 13 | Define IDM ServiceRequest sub-profile for infectious disease marker orders | feature | 🔲 TODO |
| 14 | Define Specimen profile for donor samples | feature | 🔲 TODO |

### Tier 3: Terminology & Validation

| # | Title | Type | Status |
|---|-------|------|--------|
| 15 | Define NMDP Center Type CodeSystem and ValueSet | feature | 🔲 TODO |
| 16 | Research: Map LOINC codes to HLA loci (A, B, C, DRB1, DQB1, DPB1) | research | 🔲 TODO |
| 17 | Research: GL String Code representation in FHIR (valueCodeableConcept vs. extension) | research | 🔲 TODO |
| 18 | Add CapabilityStatement for Donor API server | feature | 🔲 TODO |

### Tier 4: Publishing & CI

| # | Title | Type | Status |
|---|-------|------|--------|
| 19 | Create `publish-ig.yml` GitHub Actions workflow for main-branch deploys | feature | 🔲 TODO |
| 20 | Configure `fhir.nmdp.org` hosting for IG publication | task | 🔲 TODO |
| 21 | Add QA page content (narrative documentation for each profile) | feature | 🔲 TODO |

---

## Dependency Graph (Blocking Relationships)

```
[2: CI workflow] ← blocks everything that needs automated validation

[7: HLAObservation] ← blocked by [16: LOINC research] and [17: GL String research]
[13: IDM ServiceRequest] ← blocked by [11: order-type CodeSystem]
[18: CapabilityStatement] ← blocked by [7], [8], [12]
[19: publish workflow] ← blocked by [2: CI workflow]
[20: hosting] ← blocked by [19: publish workflow]
```

---

## How to Use This Document

1. **Starting a session:** Read `CONTEXT.md` and this spec to understand scope.
2. **Picking up work:** Look at the Work Tracker above. Items in Tier 0 unblock everything else. Within a tier, items without blockers can be worked in any order.
3. **Publishing tickets:** Use `gh issue create` per the conventions in `docs/agents/issue-tracker.md`. Apply `ready-for-agent` label.
4. **Verifying work:** Run `pnpm sushi` after any FSH change. Zero errors = passing.
5. **Adding domain terms:** Update `UBIQUITOUS_LANGUAGE.md` when new terms emerge.
6. **Recording decisions:** Create ADRs in `docs/adr/` for non-trivial architectural choices.
