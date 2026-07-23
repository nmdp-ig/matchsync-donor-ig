# ADR-0001: Use devcontainer for reproducible development environment

**Status:** Accepted  
**Date:** 2026-07-22

## Context

IG development requires a specific toolchain:

- **Node.js 22** — runtime for SUSHI (FSH compiler)
- **JDK 17** — runtime for the FHIR IG Publisher
- **pnpm** — package manager for installing SUSHI and dev tools
- **SUSHI (fsh-sushi)** — compiles FSH to FHIR JSON artifacts

Different developers may have incompatible tool versions installed locally. JDK version mismatches are a common source of IG Publisher failures. Node version drift can cause SUSHI compatibility issues. We want:

1. Consistent environments across all contributors
2. Zero-setup onboarding for new developers
3. CI/CD parity — local builds match pipeline builds

## Decision

Provide a `.devcontainer/` configuration with all required tools pre-installed.

```jsonc
// .devcontainer/devcontainer.json (simplified)
{
  "image": "mcr.microsoft.com/devcontainers/javascript-node:22",
  "features": {
    "ghcr.io/devcontainers/features/java:1": {
      "version": "17",
      "installGradle": false,
      "installMaven": false
    }
  },
  "postCreateCommand": "pnpm install"
}
```

Key choices:

- Use Microsoft devcontainer base images (`mcr.microsoft.com/devcontainers/`)
- Pin Node 22 and JDK 17 in devcontainer.json
- pnpm is installed via corepack or the Node feature
- `postCreateCommand` runs `pnpm install` to hydrate dependencies on container creation

## Consequences

### Positive

- All toolchain configuration lives in `.devcontainer/` — version-controlled and auditable.
- Works with VS Code Dev Containers, GitHub Codespaces, and Kiro.
- New contributors can start building in minutes without installing Java, Node, or pnpm manually.
- CI can reuse the same container image for build reproducibility.

### Negative

- Container image adds ~1.5GB to initial pull (Node + JDK + base OS layers).
- Local development without a container still works via Volta pinning (see ADR-0003), but JDK must be installed separately.
- Developers unfamiliar with devcontainers have a small learning curve.

### Coexistence with Local Development

The devcontainer is optional. Local development without a container remains supported:

- Node and pnpm versions are pinned via Volta (`package.json` volta field)
- JDK 17 must be installed manually (or via sdkman/asdf)
- The devcontainer is the *recommended* path, not the *only* path

## Alternatives Considered

| Option | Rejected because |
|--------|-----------------|
| Docker Compose only | Heavier; doesn't integrate with IDE features (extensions, settings) |
| Nix flake | Steeper learning curve; less IDE integration; team unfamiliar with Nix |
| README install instructions only | Drift between documented and actual versions; doesn't solve JDK/Node conflicts |
| GitHub Actions only (no local parity) | Developers can't reproduce CI failures locally |

## Review Triggers

Re-open this ADR if:

- The IG Publisher drops its JDK requirement (unlikely near-term)
- A lighter-weight alternative to devcontainers emerges with equivalent IDE support
- The team standardizes on a different containerization approach (e.g., Nix)
