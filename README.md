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
├── .github/workflows/ig-build-publish.yml # Build and publish automation
├── _genonce.sh                            # Run SUSHI and the IG Publisher
├── _updatePublisher.sh                    # Download the official Publisher jar
├── ig.ini                                 # IG Publisher configuration
├── input/
│   ├── fsh/                               # FSH profiles, extensions, and examples
│   ├── history/                           # Publication-history template snippets
│   ├── ignoreWarnings.txt                 # Publisher suppression-file header
│   └── pagecontent/                       # Markdown narrative pages
├── package-list.json                       # IG package/history metadata
├── publish-setup.json                      # Publisher history configuration
└── sushi-config.yaml                       # IG metadata and publishing configuration
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

## GitHub Actions publication

`.github/workflows/ig-build-publish.yml` runs for pushes to `main` (including merged pull requests), pushes to `feature/**`, pull requests targeting `main`, and manual dispatches. It sets up Java 17, Ruby 3.3 with Jekyll `4.3.3`, Node.js 20, SUSHI `3.12.1`, and IG Publisher `2.3.3` directly in the workflow.

For a push to `main`, the workflow:

1. Builds and validates the guide.
2. Creates the current and versioned site under `publication/web-root/matchsync-donor/`.
3. Updates publication history from `package-list.json`.
4. Deploys the site to [GitHub Pages](https://nmdp-ig.github.io/matchsync-donor-ig/).
5. Commits generated publication output to the `deploy-ready` branch.

Feature-branch pushes and pull requests run the build and Publisher QA steps only; they do not update `deploy-ready` or GitHub Pages. Manual dispatches build and deploy without committing to `deploy-ready`. Every run attempts to upload `output/qa.html`, `output/qa.json`, and `output/qa.txt` as the `ig-output` artifact, retained for 30 days. Configure the repository's Pages source as **GitHub Actions** and grant the workflow **Read and write permissions** under **Settings > Actions > General**. Do not manually edit generated content on `deploy-ready`; it is replaced by successful `main` publication runs.

The workflow pins the history-template and FHIR IG registry revisions used by the publication-history step. The generated `publication/`, `fhir-ig-history-template/`, `ig-registry/`, and `tmp/` directories are ignored locally.
