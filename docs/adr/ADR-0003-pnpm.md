# ADR-0003: Use pnpm as package manager

**Status:** Accepted  
**Date:** 2026-07-22

## Context

The IG workspace needs a package manager for:

1. Installing `fsh-sushi` as a local devDependency (not global)
2. Running build scripts (`pnpm sushi`, `pnpm build`)
3. Managing potential future dev tools (linters, validators, test harnesses)

Options considered: npm, yarn, pnpm.

Additional constraints:

- We use Volta for Node version pinning (see ADR-0001 for devcontainer context)
- Volta has experimental pnpm support requiring `VOLTA_FEATURE_PNPM=1`
- We want SUSHI installed locally to the project, not globally, for version reproducibility

## Decision

Use **pnpm** as the package manager, pinned via Volta in `package.json`:

```json
{
  "volta": {
    "node": "22.21.1",
    "pnpm": "10.33.0"
  },
  "devDependencies": {
    "fsh-sushi": "^3.13.0"
  },
  "scripts": {
    "sushi": "sushi .",
    "build": "./_genonce.sh"
  }
}
```

Key choices:

- **SUSHI as devDependency** — `fsh-sushi@^3.13.0` installed locally, not globally. Ensures all developers and CI use the same SUSHI version.
- **Volta pins versions** — Node 22.21.1 and pnpm 10.33.0 are locked in package.json. Volta shims route to the correct versions automatically.
- **pnpm-lock.yaml committed** — lock file ensures deterministic installs across environments.

## Consequences

### Positive

- **Disk efficiency** — pnpm's content-addressable store deduplicates packages across projects on the same machine.
- **Strict dependency resolution** — pnpm's default strictness prevents phantom dependencies (packages used but not declared).
- **Fast installs** — pnpm is consistently faster than npm for cold and warm installs.
- **Volta integration** — automatic version switching when entering the project directory.
- **Local SUSHI** — `pnpm sushi` runs the project-pinned version, not whatever is globally installed.

### Negative

- **Volta pnpm is experimental** — requires `VOLTA_FEATURE_PNPM=1` environment variable. Without it, pnpm commands fail. This is documented in the README and handled automatically in the devcontainer.
- **Less ubiquitous than npm** — new contributors may not have pnpm experience (mitigated by Volta auto-installing it).
- **Global installs unsupported** — Volta's pnpm support does not handle `pnpm install -g`. This is acceptable since we don't use global installs.

### Developer Setup

For local development without devcontainer:

```bash
# One-time setup
export VOLTA_FEATURE_PNPM=1  # Add to shell profile
volta install node@22.21.1
volta install pnpm@10.33.0

# Project setup
pnpm install
pnpm sushi  # Verify FSH compiles
```

## Alternatives Considered

| Option | Rejected because |
|--------|-----------------|
| npm | Slower installs; flat node_modules allows phantom dependencies; no content-addressable store |
| yarn (v1) | Maintenance mode; no strict mode equivalent; Berry migration adds complexity |
| yarn (berry/v4) | PnP mode has compatibility issues with SUSHI; Volta support less mature than pnpm |
| Global SUSHI install | Version drift across developers; can't pin in package.json; CI must separately manage version |

## References

- pnpm documentation: https://pnpm.io
- Volta pnpm support: https://docs.volta.sh/advanced/pnpm
- fsh-sushi npm package: https://www.npmjs.com/package/fsh-sushi

## Review Triggers

Re-open this ADR if:

- Volta drops pnpm support or the experimental flag becomes a blocker
- pnpm introduces breaking changes to the content-addressable store
- The team standardizes on a different package manager organization-wide
