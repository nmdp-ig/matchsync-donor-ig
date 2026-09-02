# MatchSync Donor Implementation Guide

This is the starter Implementation Guide for MatchSync donor data. It currently contains one minimal Patient profile and a synthetic example instance so that the SUSHI and FHIR IG Publisher toolchain can be validated end to end.

## Scope

The guide is intentionally small while the source model and publication requirements are being defined. Add profiles, extensions, value sets, examples, and narrative pages under `input/` as the guide evolves.

## Build output

Run SUSHI and the FHIR IG Publisher from the repository root. Generated files are written to `fsh-generated/`, `input-cache/`, and `output/`; these directories are not source and must not be committed to `main`.
