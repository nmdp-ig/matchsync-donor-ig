# Issue Tracker Conventions

**Platform:** GitHub Issues  
**Repo:** `ericbfriday/nmdp-donor-patient-ig`

## Labels

| Label | Meaning | When to apply |
|-------|---------|---------------|
| `ready-for-agent` | Issue has enough context for an AI agent to implement | After triage, acceptance criteria are clear |
| `bug` | Something broken or non-conformant | Compilation errors, validation failures, wrong constraints |
| `feature` | New profile, extension, example, or narrative page | New FSH artifacts or IG content |
| `research` | Needs investigation before implementation | Domain questions, LOINC lookup, ODS mapping |
| `docs` | Documentation-only change | ADRs, narrative pages, AGENTS.md updates |
| `chore` | Toolchain, CI, config, non-functional | Dependency updates, devcontainer, scripts |
| `blocked` | Cannot proceed without external input | Waiting on ODS research, NMDP SME answer |

## Issue structure

A well-formed issue for this repo contains:

```markdown
## Context
What problem or gap this addresses.

## Acceptance criteria
- [ ] Specific, verifiable outcomes
- [ ] SUSHI compiles 0 errors 0 warnings
- [ ] Example instance validates (if applicable)

## References
Links to ADRs, spec sections, or external standards.
```

## Workflow

1. **Open** — issue exists, may need triage
2. **Labeled `ready-for-agent`** — acceptance criteria are clear, agent can pick it up
3. **In progress** — assigned (to human or agent session)
4. **Closed** — delivered with commit reference in closing comment

## Closing convention

When closing an issue, add a comment with:
- The commit SHA that delivers it
- Brief description of what was done
- Any follow-up issues created

Example: `Delivered in abc1234: Created NMDPOrganization profile with center type terminology.`
