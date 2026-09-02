Instance: NMDPDonorAPICapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
Title: "NMDP Donor API Capability Statement"
Description: "Describes the expected capabilities of the NMDP Donor API FHIR server, including supported resources, interactions, and search parameters."
* url = "http://fhir.nmdp.org/ig/donor-patient/CapabilityStatement/nmdp-donor-api"
* version = "0.1.0"
* name = "NMDPDonorAPICapabilityStatement"
* title = "NMDP Donor API Capability Statement"
* status = #draft
* experimental = true
* date = "2026-07-23"
* publisher = "National Marrow Donor Program (NMDP)"
* description = "This CapabilityStatement describes the expected capabilities of a server implementing the NMDP Donor API FHIR interface. The server provides read and search access to donor demographics, HLA typing results, and order information."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml
* implementationGuide = "http://fhir.nmdp.org/ig/donor-patient/ImplementationGuide/nmdp.fhir.donor-patient"

* rest[0].mode = #server
* rest[0].documentation = "The NMDP Donor API server provides RESTful access to donor information for authorized transplant centers."

// Patient resource (NMDPDonorPatient)
* rest[0].resource[0].type = #Patient
* rest[0].resource[0].profile = "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-patient"
* rest[0].resource[0].interaction[0].code = #read
* rest[0].resource[0].interaction[1].code = #search-type
* rest[0].resource[0].searchParam[0].name = "identifier"
* rest[0].resource[0].searchParam[0].type = #token
* rest[0].resource[0].searchParam[0].documentation = "Search by NMDP Donor ID or GRID"
* rest[0].resource[0].searchParam[1].name = "_id"
* rest[0].resource[0].searchParam[1].type = #token

// Observation resource (NMDPHLAGenotype)
* rest[0].resource[1].type = #Observation
* rest[0].resource[1].profile = "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-hla-genotype"
* rest[0].resource[1].interaction[0].code = #read
* rest[0].resource[1].interaction[1].code = #search-type
* rest[0].resource[1].searchParam[0].name = "subject"
* rest[0].resource[1].searchParam[0].type = #reference
* rest[0].resource[1].searchParam[0].documentation = "Search HLA observations by donor Patient reference"
* rest[0].resource[1].searchParam[1].name = "code"
* rest[0].resource[1].searchParam[1].type = #token

// ServiceRequest resource (NMDPDonorOrder)
* rest[0].resource[2].type = #ServiceRequest
* rest[0].resource[2].profile = "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-donor-order"
* rest[0].resource[2].interaction[0].code = #read
* rest[0].resource[2].interaction[1].code = #search-type
* rest[0].resource[2].searchParam[0].name = "subject"
* rest[0].resource[2].searchParam[0].type = #reference
* rest[0].resource[2].searchParam[0].documentation = "Search orders by donor Patient reference"
* rest[0].resource[2].searchParam[1].name = "identifier"
* rest[0].resource[2].searchParam[1].type = #token
* rest[0].resource[2].searchParam[1].documentation = "Search by NMDP Order ID"

// Organization resource (NMDPOrganization)
* rest[0].resource[3].type = #Organization
* rest[0].resource[3].profile = "http://fhir.nmdp.org/ig/donor-patient/StructureDefinition/nmdp-organization"
* rest[0].resource[3].interaction[0].code = #read
* rest[0].resource[3].interaction[1].code = #search-type
* rest[0].resource[3].searchParam[0].name = "identifier"
* rest[0].resource[3].searchParam[0].type = #token
* rest[0].resource[3].searchParam[0].documentation = "Search by NMDP Center ID"
* rest[0].resource[3].searchParam[1].name = "name"
* rest[0].resource[3].searchParam[1].type = #string
