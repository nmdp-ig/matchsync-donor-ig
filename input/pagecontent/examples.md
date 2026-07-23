# Examples

This page lists the example instances included in the NMDP Donor Patient IG and describes how to use them for validation testing.

## Example Instances

| Example | Profile | Description |
|---------|---------|-------------|
| [ExampleNMDPDonor](Patient-ExampleNMDPDonor.html) | [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.html) | A complete donor registration with all required fields populated |
| [ExampleDeferredDonor](Patient-ExampleDeferredDonor.html) | [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.html) | A donor who is temporarily deferred from donation |
| [ExampleDonorNoGrid](Patient-ExampleDonorNoGrid.html) | [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.html) | A newly registered donor without a GRID |
| [ExampleDeceasedDonor](Patient-ExampleDeceasedDonor.html) | [NMDPDonorPatient](StructureDefinition-nmdp-donor-patient.html) | A deceased donor demonstrating the deceased[x] element |
| [ExampleDonorOrder](ServiceRequest-ExampleDonorOrder.html) | [NMDPDonorOrder](StructureDefinition-nmdp-donor-order.html) | A confirmatory typing order demonstrating the NMDPDonorOrder profile |
| [ExampleNMDPDonorCenter](Organization-ExampleNMDPDonorCenter.html) | [NMDPOrganization](StructureDefinition-nmdp-organization.html) | An NMDP donor center demonstrating the NMDPOrganization profile |

### ExampleNMDPDonor

This example demonstrates a fully conformant NMDP donor Patient resource including:

- **NMDP Donor ID** (`1234567`) — the required registry identifier
- **GRID** (`AAAA1111111`) — the optional ISBT 128 global identifier
- **Demographics** — name, gender, and date of birth (all required by the profile)
- **Race/Ethnicity** — US Core race and ethnicity extensions

The example represents a typical adult donor registered in the NMDP Be The Match registry.

### ExampleDeferredDonor

This example demonstrates a donor who is temporarily deferred:

- **Donor Status** — `#deferred` indicating temporary unavailability
- **No GRID** — demonstrates that GRID is optional
- **Race/Ethnicity** — Asian race and Hispanic or Latino ethnicity

### ExampleDonorNoGrid

This example demonstrates a newly registered donor who has not yet been assigned a GRID:

- **NMDP Donor ID only** — no GRID slice present
- **Donor Status** — `#active`
- **Communication** — English language preference

This is common for donors early in the registration process before international identifiers are assigned.

### ExampleDeceasedDonor

This example demonstrates the `deceased[x]` element:

- **deceasedDateTime** — date of death (`2025-06-15`)
- **Donor Status** — `#unavailable`
- **Both identifiers** — NMDP Donor ID and GRID present

### ExampleDonorOrder

This example demonstrates the NMDPDonorOrder profile for donor workup orders:

- **NMDP Order ID** (`ORD-2026-001234`) — the required order identifier
- **Order type** — `#ct` (Confirmatory Typing) from NMDPOrderTypeVS
- **Subject** — references ExampleNMDPDonor (the donor being tested)
- **Requester** — the transplant center that initiated the order
- **Performer** — the donor center performing the work

This represents a typical confirmatory typing order placed by a transplant center during donor workup.

### ExampleNMDPDonorCenter

This example demonstrates the NMDPOrganization profile for donor centers:

- **NMDP Center ID** — the required center identifier
- **Organization type** — center-type code from NMDPCenterTypeVS
- **Active status** — required boolean indicating operational status

This represents a typical donor center in the NMDP network that manages donor registrations.

## Using Examples for Validation

### Validate with the FHIR Validator

You can validate resources against this IG's profiles using the [HL7 FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator):

```bash
java -jar validator_cli.jar patient-resource.json \
  -ig nmdp.fhir.donor-patient#0.1.0 \
  -profile http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient
```

### Validate with SUSHI

During development, running SUSHI validates that example instances conform to their declared profiles:

```bash
pnpm sushi
```

SUSHI will report errors if an example instance violates constraints defined in its profile (missing required fields, invalid value set bindings, etc.).

### Write Your Own Examples

To add a new example, create a `.fsh` file in `input/fsh/examples/`:

```fsh
Instance: ExampleNewDonor
InstanceOf: NMDPDonorPatient
Usage: #example
Title: "Example New Donor"
Description: "Description of what this example demonstrates."
* identifier[nmdpDonorId].system = $nmdp-donor
* identifier[nmdpDonorId].value = "9999999"
* name[0].family = "Smith"
* name[0].given[0] = "Jane"
* gender = #female
* birthDate = "1990-01-01"
```

Key requirements:
- `InstanceOf` must reference a profile defined in this IG
- `Usage: #example` marks it as an example (included in the IG narrative but not as a conformance resource)
- All required elements per the profile must be populated
- Use aliases from `aliases.fsh` for system URIs
