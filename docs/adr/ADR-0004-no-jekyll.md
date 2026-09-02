# ADR-0004: No Jekyll — use IG Publisher internal renderer exclusively

**Status:** Accepted  
**Date:** 2026-07-22

## Context

The FHIR IG Publisher historically used Jekyll (a Ruby-based static site generator) for rendering narrative pages to HTML. This required:

- Ruby runtime
- Bundler (Ruby package manager)
- Jekyll gem + dependencies
- A `Gemfile` and `_config.yml` in the IG repo

Recent versions of the IG Publisher (since ~2022) include an **internal rendering engine** that processes Markdown pages directly without Jekyll. This removes the entire Ruby dependency chain.

Problems with Jekyll in IG development:

1. **Ruby version conflicts** — system Ruby vs. rbenv vs. rvm; gem native extension failures on different platforms
2. **CI complexity** — CI pipelines need a Ruby setup step, gem caching, and Bundler configuration
3. **Slow builds** — Jekyll adds overhead to each IG Publisher run
4. **Maintenance burden** — Gemfile.lock drift, security updates to gems, Jekyll deprecation warnings
5. **Onboarding friction** — new developers must install Ruby in addition to Java and Node

## Decision

Do not use Jekyll. Use the IG Publisher's internal rendering engine exclusively.

Specific actions:

1. **No `Gemfile`, `_config.yml`, or Jekyll configuration** in the repository
2. **Add `.nojekyll`** marker file to prevent GitHub Pages from running Jekyll if the output is deployed there
3. **Narrative pages** in `input/pagecontent/` are plain Markdown processed by the IG Publisher directly
4. **No Ruby/Jekyll/Bundler** in devcontainer, CI, or documented prerequisites

The IG Publisher flag `ig.ini` or `sushi-config.yaml` does not require any special setting — the publisher auto-detects the absence of Jekyll and uses its internal renderer.

## Consequences

### Positive

- **No Ruby dependency** — one less runtime to install, manage, and update.
- **Simpler CI** — no `gem install` step, no Bundler caching, no Ruby version matrix.
- **Faster builds** — the internal renderer is faster than spawning Jekyll as a subprocess.
- **Fewer moving parts** — eliminates an entire class of build failures (gem conflicts, native extensions, Bundler version mismatches).
- **Lower onboarding cost** — contributors only need Java + Node, not Java + Node + Ruby.

### Negative

- **Fewer template customization options** — Jekyll's Liquid templates allow rich page layouts, includes, and conditional logic. The internal renderer supports Markdown and basic HTML only.
- **No Jekyll plugins** — features like auto-generated navigation, custom tag processing, or dynamic content require alternative approaches.
- **Some IG examples use Jekyll** — community IG templates may assume Jekyll. Our pages must be compatible with the internal renderer's subset of features.

### Page Authoring Guidelines

All pages in `input/pagecontent/` must follow these constraints:

- Standard Markdown (CommonMark-compatible)
- HTML fragments are allowed but should be minimal
- No Liquid template syntax (`{% %}`, `{{ }}`)
- No Jekyll front matter (`---` YAML blocks at file start)
- Images referenced via relative paths from `input/images/`

## Alternatives Considered

| Option | Rejected because |
|--------|-----------------|
| Jekyll with Bundler | Adds Ruby dependency; CI complexity; version conflicts; slow builds |
| Jekyll in Docker only | Still requires maintaining Gemfile; adds container orchestration for rendering step |
| Hugo or other SSG | Non-standard for FHIR IGs; IG Publisher doesn't integrate with alternatives |
| Custom build scripts wrapping Jekyll | Complexity without benefit; the internal renderer exists and is maintained by HL7 |

## References

- IG Publisher documentation: https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation
- IG Publisher no-Jekyll mode: https://confluence.hl7.org/pages/viewpage.action?pageId=35718627#IGPublisherDocumentation-jekyll
- `.nojekyll` for GitHub Pages: https://github.blog/2009-12-29-bypassing-jekyll-on-github-pages/

## Review Triggers

Re-open this ADR if:

- The IG Publisher deprecates its internal renderer (extremely unlikely)
- A page authoring requirement arises that cannot be met without a templating engine
- The team needs dynamic page generation that Markdown alone cannot support
