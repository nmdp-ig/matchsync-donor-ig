# MatchSync Donor Implementation Guide

This repository is a fresh starter [FHIR](https://hl7.org/fhir/R4/) Implementation Guide for MatchSync donor data. The source of truth is the `main` branch. Generated SUSHI and FHIR IG Publisher output is ignored and is not part of the source project.

The canonical URL in `sushi-config.yaml` is provisional: `http://fhir.nmdp.org/ig/matchsync-donor`. Confirm the final canonical and publication URLs before a formal release.

## Prerequisites

- Node.js LTS and npm
- Ruby 3.3+ with Jekyll 4.3.3 for the Publisher's page generation:

```bash
gem install jekyll -v 4.3.3
```

- Java JDK 17 or 21 for the HL7 FHIR IG Publisher
- SUSHI 3.12.1 or a compatible version:

```bash
npm install -g fsh-sushi@3.12.1
```

## Project layout

```text
.
├── _genonce.sh                 # Run SUSHI and the IG Publisher
├── _updatePublisher.sh         # Download the official Publisher jar
├── ig.ini                      # IG Publisher configuration
├── input/
│   ├── fsh/                    # FSH profiles, extensions, and examples
│   └── pagecontent/            # Markdown narrative pages
└── sushi-config.yaml           # IG metadata and publishing configuration
```

## Build locally

From the repository root:

```bash
sushi .
./_updatePublisher.sh
./_genonce.sh
```

SUSHI compiles FSH into `fsh-generated/`. The Publisher creates the browsable guide in `output/`, including `output/index.html` and QA reports. Open `output/index.html` in a browser after a successful build.

The scripts are also usable directly after making them executable:

```bash
chmod +x _updatePublisher.sh _genonce.sh
```

Do not commit `fsh-generated/`, `input-cache/`, `output/`, `temp/`, or `template/`; these are generated or downloaded build artifacts. The future `deploy-ready` branch is reserved for generated publication output and is intentionally not populated by this starter source commit.
