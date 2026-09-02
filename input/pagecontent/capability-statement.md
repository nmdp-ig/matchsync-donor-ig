# Capability Statement

The [NMDP Donor API Capability Statement](CapabilityStatement-nmdp-donor-api.html) describes the expected capabilities of a server implementing the NMDP Donor API FHIR interface. The server provides read and search access to donor demographics, HLA typing results, and order information for authorized transplant centers.

## Server Summary

| Property | Value |
|----------|-------|
| FHIR Version | 4.0.1 (R4) |
| Supported Formats | JSON, XML |
| Mode | Server |
| Kind | Requirements |

## Supported Resources

The server exposes the following resource types, each constrained by a profile defined in this IG:

### Patient (NMDPDonorPatient)

Profile: [`NMDPDonorPatient`](StructureDefinition-nmdp-donor-patient.html)

Represents hematopoietic cell donors registered in the NMDP registry.

**Interactions:**

| Interaction | Description |
|-------------|-------------|
| `read` | Retrieve a single donor by logical ID |
| `search-type` | Search for donors |

**Search Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `identifier` | token | Search by NMDP Donor ID or GRID |
| `_id` | token | Search by logical resource ID |

### Observation (NMDPHLAGenotype)

Profile: [`NMDPHLAGenotype`](StructureDefinition-nmdp-hla-genotype.html)

Represents HLA genotyping results for a donor at a specific gene locus.

**Interactions:**

| Interaction | Description |
|-------------|-------------|
| `read` | Retrieve a single HLA observation by logical ID |
| `search-type` | Search for HLA observations |

**Search Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `subject` | reference | Search HLA observations by donor Patient reference |
| `code` | token | Search by observation code (e.g., LOINC gene code) |

### ServiceRequest (NMDPDonorOrder)

Profile: [`NMDPDonorOrder`](StructureDefinition-nmdp-donor-order.html)

Represents donor workup and collection orders (CT, IDM, PBSC, Marrow).

**Interactions:**

| Interaction | Description |
|-------------|-------------|
| `read` | Retrieve a single order by logical ID |
| `search-type` | Search for orders |

**Search Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `subject` | reference | Search orders by donor Patient reference |
| `identifier` | token | Search by NMDP Order ID |

### Organization (NMDPOrganization)

Profile: [`NMDPOrganization`](StructureDefinition-nmdp-organization.html)

Represents donor centers, transplant centers, and collection centers participating in the NMDP network.

**Interactions:**

| Interaction | Description |
|-------------|-------------|
| `read` | Retrieve a single organization by logical ID |
| `search-type` | Search for organizations |

**Search Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `identifier` | token | Search by NMDP Center ID |
| `name` | string | Search by organization name |

## Security

The NMDP Donor API requires OAuth 2.0 authorization. Only authenticated transplant centers with appropriate data-sharing agreements may access donor information. Access is scoped per transplant center — a center may only retrieve donors and orders relevant to its own search activities.
