# AGENTS.md — NMDP Donor Patient IG

This file orients AI agents working in this repository. Read it first before making changes.

## What this repo is

A FHIR R4 Implementation Guide (IG) for the NMDP Donor API. It defines the data contract for how transplant centers discover and retrieve donor demographics, HLA typing, donor status, and order information from the National Marrow Donor Program (NMDP / Be The Match).

**Canonical URL:** `http://fhir.nmdp.org/ig/donor-patient`  
**FHIR version:** 4.0.1 (R4)  
**US Core dependency:** 6.1.0  

## Toolchain

| Tool | Purpose | Command |
|------|---------|---------|
| pnpm | Package manager | `pnpm install` |
| SUSHI (fsh-sushi) | FSH → FHIR compiler | `pnpm sushi` |
| IG Publisher | Full IG build (HTML + validation) | `pnpm build` |
| Volta | Node/pnpm version pinning | Automatic via `package.json` |

**Verification:** Run `pnpm sushi` after every FSH change. Exit 0 with 0 errors = passing. This is the test suite.

## Key paths

```
input/fsh/
├── aliases.fsh              # All canonical URI aliases (single source of truth)
├── profiles/                # StructureDefinitions (NMDPDonorPatient, NMDPOrganization)
├── extensions/              # Extensions (DonorStatus)
├── codesystems/             # CodeSystems
├── valuesets/               # ValueSets
└── examples/                # Example instances (must validate against profiles)

input/pagecontent/           # Narrative markdown pages for the IG
docs/
├── adr/                     # Architecture Decision Records
├── specs/                   # Specifications
└── agents/                  # Agent-specific context (issue tracker, domain)
sushi-config.yaml            # IG metadata, dependencies, page list, menu
```

## Working conventions

1. **All profiles are FSH** — never hand-edit JSON/XML in `fsh-generated/`.
2. **One concept per file** — each profile, extension, code system, value set gets its own `.fsh` file.
3. **Aliases are shared** — add new canonical URIs to `aliases.fsh`, never inline OIDs or URLs in profile files.
4. **Examples must validate** — every example instance must declare `InstanceOf:` a profile from this IG.
5. **US Core parent** — NMDPDonorPatient extends `USCorePatientProfile`, not base `Patient` (see ADR-0005).
6. **Commit message format** — `type: short description` (feat, fix, docs, chore). Reference issue numbers with `#N`.

## Decisions in effect

Active ADRs are in `docs/adr/`. Key decisions:

- **ADR-0005:** NMDPDonorPatient extends USCorePatientProfile (US Core 6.1.0)
- **ADR-0006:** Canonical URL is `donor-patient` not `donor-api` (narrower scope)
- **Namespace conventions:** identifiers use `http://terminology.nmdp.org/identifier/`, code systems use `http://terminology.nmdp.org/codesystem/`, extensions use `http://fhir.nmdp.org/StructureDefinition/`

## Issue tracker

GitHub Issues on `ericbfriday/nmdp-donor-patient-ig`. See [docs/agents/issue-tracker.md](docs/agents/issue-tracker.md) for labels and conventions.

## Domain context

See [docs/agents/domain.md](docs/agents/domain.md) for NMDP domain terminology and FHIR-specific context.

## What not to do

- Don't add dependencies without an ADR or explicit approval.
- Don't change the canonical URL or IG id.
- Don't introduce Ruby/Jekyll — the IG Publisher's internal renderer is used exclusively.
- Don't commit `fsh-generated/`, `output/`, `temp/`, `template/`, or `input-cache/`.
- Don't use deprecated OID-based identifiers — use the HTTP URI aliases in `aliases.fsh`.
