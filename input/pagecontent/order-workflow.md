# Order Workflow

This page describes the donor order workflow — how transplant centers request donor workup and collection through the NMDP system, and how those orders are represented in FHIR.

## Overview

When a transplant center identifies a potential donor match, it initiates a series of orders through NMDP to confirm compatibility and ultimately collect stem cells. Each order is represented as a [ServiceRequest](http://hl7.org/fhir/R4/servicerequest.html) resource conforming to the [`NMDPDonorOrder`](StructureDefinition-nmdp-donor-order.html) profile.

## Order Types

The following order types are defined in the [`NMDPOrderTypeVS`](ValueSet-nmdp-order-type-vs.html) value set:

| Code | Display | Description |
|------|---------|-------------|
| `ct` | Confirmatory Typing | HLA confirmatory typing to verify initial typing results |
| `idm` | Infectious Disease Markers | IDM testing required for donor clearance before collection |
| `collection` | Collection | Generic stem cell collection order |
| `pbsc` | Peripheral Blood Stem Cell | PBSC collection via apheresis |
| `marrow` | Bone Marrow | Bone marrow harvest collection |

## Typical Order Sequence

A donor workup follows this general sequence:

1. **Confirmatory Typing (CT)** — The transplant center requests repeat HLA typing to verify the donor's initial results match at high resolution.
2. **Infectious Disease Markers (IDM)** — Once typing is confirmed, IDM testing screens the donor for transmissible infections (HIV, Hepatitis B/C, CMV, etc.).
3. **Collection (PBSC or Marrow)** — After medical clearance, the transplant center requests the final stem cell collection, specifying the product type (peripheral blood via apheresis or bone marrow harvest).

Each step is an independent ServiceRequest with its own lifecycle status. Orders progress through the standard FHIR [request status](http://hl7.org/fhir/R4/valueset-request-status.html) values: `draft` → `active` → `completed` (or `cancelled`/`revoked`).

## Profiles

### NMDPDonorOrder

[`NMDPDonorOrder`](StructureDefinition-nmdp-donor-order.html) is the base profile for all donor orders. It constrains `ServiceRequest` with:

- **identifier** — Required NMDP Order ID (`http://terminology.nmdp.org/identifier/order`)
- **intent** — Fixed to `#order`
- **code** — The order type, drawn from `NMDPOrderTypeVS` (extensible binding)
- **subject** — The donor (`Patient` reference)
- **authoredOn** — When the order was created
- **requester** — The transplant center or practitioner initiating the order
- **performer** — The donor center, collection center, or lab fulfilling the order

### NMDPIDMOrder

[`NMDPIDMOrder`](StructureDefinition-nmdp-idm-order.html) is a child profile that extends `NMDPDonorOrder` specifically for Infectious Disease Marker testing. It adds:

- **code** — Fixed to `NMDPOrderTypeCS#idm`
- **specimen** — References to blood specimens collected for IDM testing

## Requester vs. Performer

The `requester` and `performer` roles clarify organizational responsibility:

| Role | Description | Typical Organization |
|------|-------------|---------------------|
| `requester` | The organization or practitioner who initiated the order | Transplant center |
| `performer` | The organization responsible for executing the order | Donor center, collection center, or testing lab |

In the NMDP context, the transplant center caring for the patient (recipient) is typically the **requester**. NMDP coordinates with a **donor center** (for CT and IDM) or a **collection center** (for PBSC/Marrow) to perform the work.

## ServiceRequest Lifecycle

```
┌─────────┐      ┌─────────┐      ┌───────────┐
│  draft  │ ───► │ active  │ ───► │ completed │
└─────────┘      └─────────┘      └───────────┘
                      │
                      ▼
               ┌─────────────┐
               │  cancelled  │
               │  / revoked  │
               └─────────────┘
```

- **draft** — Order created but not yet submitted
- **active** — Order accepted and in progress
- **completed** — Order fulfilled; results available
- **cancelled / revoked** — Order withdrawn before or during execution

## Examples

- [`ExampleDonorOrder`](ServiceRequest-ExampleDonorOrder.html) — A confirmatory typing order
- [`ExampleIDMOrder`](ServiceRequest-ExampleIDMOrder.html) — An IDM testing order
