# Connecting to the Donor API - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* **Connecting to the Donor API**

## Connecting to the Donor API

# Connecting to the Donor API

This page is a step-by-step guide for a **Transplant Center (TC)** that needs to connect to the NMDP Donor API. It explains how a TC obtains credentials, requests an access token using the **OAuth 2.0 Client Credentials** grant, and calls the API. It also describes the **two-claim authorization model** that controls both **what operations** a TC can perform and **which donor and patient records** it is allowed to see.

The Donor API is a **backend, system-to-system API**. There is no interactive user login and no browser redirect. A TC's own application authenticates directly with its client credentials, so this guide is written for the engineers and integrators who build and operate that application.

## At a Glance

| | |
| :--- | :--- |
| Authorization framework | OAuth 2.0 |
| Grant type | `client_credentials` |
| Authorization server | Okta |
| Token format | JWT (JSON Web Token) access token |
| Credential type | `client_id`+`client_secret`(one set per TC) |
| Client authentication | HTTP Basic (client credentials in the`Authorization`header) |
| Transport | HTTPS with TLS 1.2 or higher (required) |
| API style | FHIR R4, read-only |

Exact hostnames, the Okta authorization server ID, and the granted scopes are provided by NMDP during onboarding and differ between the test/sandbox and production environments. Treat every value shown below as a placeholder unless NMDP supplied it to you directly.

## How Authorization Works

Two independent controls decide the outcome of every request. Understanding the difference between them is the key to a smooth integration.

1. **Scopes**decide**what a TC can do**— which FHIR resource types and operations (for example, reading and searching`Patient`) the token is permitted to use.
1. **The Transplant Center affiliation claim**decides**what data a TC can see**— the API filters every response so a TC only receives donors and patients associated with its own center.

Because these are separate controls, holding a valid token is never enough on its own to reach another center's data. Even a broad scope only returns records that the TC affiliation claim allows.

### The Two-Claim Model

NMDP's Okta authorization servers carry **two custom claims** in the access token for the Donor API. This mirrors the pattern already used by other NMDP FHIR integrations (such as MatchSync Patient Import).

| | | |
| :--- | :--- | :--- |
| Authorization claim | Confirms the client is entitled to the Donor API and which access level it was granted. Derived from the client's assigned Okta scope and group membership. | `authz_donor_fhir_client` |
| TC affiliation claim | Identifies the transplant center (or centers) the client acts on behalf of. The API uses this to filter results. | `tc_id: "TC-123"` |

A single physical TC that operates under **multiple center IDs** is supported by carrying multiple values in the TC affiliation claim. During onboarding, tell NMDP every center ID your application needs to act for so the claim is provisioned correctly.

## Connection Flow

The end-to-end sequence for a TC application is:

```
Transplant Center App
        |
        |  1. Request token (client_id + client_secret, grant_type=client_credentials)
        v
      Okta  (Authorization Server)
        |
        |  2. Access token (JWT) with authorization claim + TC affiliation claim
        v
Transplant Center App
        |
        |  3. Call the Donor API with:  Authorization: Bearer <access_token>
        v
   Donor API  (FHIR R4 server, behind the NMDP API gateway)
        |
        |  4. Gateway validates the token and scopes;
        |     API reads the TC affiliation claim and filters the response
        v
   FHIR response containing only the TC's own donors / patients

```

## Step 1 — Onboard and Receive Credentials

Before you can request a token, NMDP registers your application as an Okta client. During onboarding, NMDP will:

* Create an Okta client and issue a **`client_id`** and **`client_secret`** unique to your center.
* Assign the Donor API **scope(s)** your application is entitled to.
* Provision the **TC affiliation claim** with your center ID (or IDs).
* Provide the **token endpoint URL** and the **Donor API base URL** for each environment (test and production).

You will typically be given values shaped like the following. NMDP supplies the real values:

| | |
| :--- | :--- |
| Token endpoint | `https://nmdp.okta.com/oauth2/<authz-server-id>/v1/token` |
| Donor API base URL | `https://api.nmdp.org/donor/fhir/r4` |
| Client ID | `0oa<random>` |
| Client secret | (secret string — store securely) |
| Scope | `system/Patient.rs system/Observation.rs system/ServiceRequest.rs` |

Store the `client_secret` in a secrets manager or equivalent secure store. Never embed it in source control, client-side code, or logs.

## Step 2 — Request an Access Token

Send a `POST` to the Okta token endpoint using the Client Credentials grant. Client credentials are sent using HTTP Basic authentication — the header value is `Basic ` followed by the base64 encoding of `client_id:client_secret`.

```
POST /oauth2/<authz-server-id>/v1/token HTTP/1.1
Host: nmdp.okta.com
Authorization: Basic <base64(client_id:client_secret)>
Content-Type: application/x-www-form-urlencoded

grant_type=client_credentials&scope=system/Patient.rs system/Observation.rs system/ServiceRequest.rs

```

Equivalent `curl` request:

```
curl -X POST "https://nmdp.okta.com/oauth2/<authz-server-id>/v1/token" \
  -u "<client_id>:<client_secret>" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "grant_type=client_credentials" \
  --data-urlencode "scope=system/Patient.rs system/Observation.rs system/ServiceRequest.rs"

```

A successful response returns a bearer token:

```
{
  "token_type": "Bearer",
  "expires_in": 3600,
  "access_token": "eyJraWQiOiJ...<jwt>...",
  "scope": "system/Patient.rs system/Observation.rs system/ServiceRequest.rs"
}

```

The `access_token` is a JWT. When decoded, its payload contains the authorization claim and the TC affiliation claim described above, along with standard fields such as `exp` (expiry) and the granted `scp` (scopes). Your application does not need to inspect the token to use it, but doing so is useful when troubleshooting.

## Step 3 — Call the Donor API

Include the token as a bearer credential on every request to the Donor API:

```
GET /donor/fhir/r4/Patient?identifier=http://terminology.nmdp.org/identifier/donor-id|1234567 HTTP/1.1
Host: api.nmdp.org
Authorization: Bearer <access_token>
Accept: application/fhir+json

```

Equivalent `curl` request:

```
curl "https://api.nmdp.org/donor/fhir/r4/Patient?identifier=http://terminology.nmdp.org/identifier/donor-id|1234567" \
  -H "Authorization: Bearer <access_token>" \
  -H "Accept: application/fhir+json"

```

The response contains only the records your center is authorized to see. A search that would match records belonging to another center simply omits those records rather than returning them.

## Token Lifecycle and Reuse

* **Cache and reuse tokens.** A token is valid until it expires (`expires_in`, commonly one hour). Request a new token only when the current one is close to expiring, not on every API call. Requesting a token per request will trigger rate limiting.
* **Refresh proactively.** Obtain a new token shortly before the current one expires so in-flight requests are not interrupted.
* **No refresh tokens.** The Client Credentials grant does not issue refresh tokens. To get a new access token, repeat Step 2.

## Handling Errors

| | | |
| :--- | :--- | :--- |
| `400 Bad Request`(from Okta) | Malformed token request | `grant_type`,`Content-Type`, and scope formatting |
| `401 Unauthorized` | Missing, expired, or invalid token | That the`Authorization: Bearer`header is present and the token has not expired; request a new token |
| `403 Forbidden` | Token is valid but the operation or record is not permitted | Whether the request needs a scope you were not granted, or targets data outside your TC affiliation |
| `429 Too Many Requests` | Rate limit exceeded | Token caching and reuse; back off and retry |

A `403` is expected — not an error to route around — when a request reaches beyond a center's authorized scope or data. The Donor API returns a FHIR `OperationOutcome` in the response body describing the reason.

## Security Requirements for Transplant Centers

* **Protect the client secret.** Treat it like a password. Store it in a secrets manager, rotate it on the schedule NMDP specifies, and never commit it to source control.
* **Use HTTPS with TLS 1.2+** for every request to both the token endpoint and the Donor API. This is mandatory for any transmission of donor or patient information.
* **Request only the scopes you need.** Align with the HIPAA minimum necessary principle and request only the resource access your use case requires.
* **Log access on your side** consistent with NMDP's audit expectations. See [Security and Privacy](security-and-privacy.md) for the classification of Donor API data and the audit log format NMDP recommends.

## Related Pages

* [Security and Privacy](security-and-privacy.md) — data sensitivity classification, TC-scoped authorization policy, transport security, and audit requirements.
* [Identifiers](identifiers.md) — the identifier systems (Donor ID, GRID, Center ID) you will use in search parameters.
* [Order Workflow](order-workflow.md) — how orders relate to the donors and patients returned by the API.
* [Capability Statement](capability-statement.md) — the FHIR interactions the Donor API server supports.

