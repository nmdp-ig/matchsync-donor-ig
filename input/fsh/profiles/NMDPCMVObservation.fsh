Profile: NMDPCMVObservation
Parent: Observation
Id: nmdp-cmv-observation
Title: "NMDP CMV Observation"
Description: "An observation representing a donor or CBU's CMV IgG antibody presence status. Uses LOINC 22244-8 and valueCodeableConcept with text-only values (Positive, Negative, Inconclusive, Untested)."

* status MS
* status = #final

* code 1..1 MS
* code = $loinc#22244-8 "CMV IgG Ab [Presence] in Serum"
* code ^short = "CMV IgG Ab [Presence] in Serum (LOINC 22244-8)"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "The donor or CBU this CMV result belongs to"

* value[x] 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept ^short = "CMV status (text-based: Positive, Negative, Inconclusive, Untested)"
* valueCodeableConcept ^definition = "The CMV IgG antibody presence result. In FHIR Donor API payloads, this is conveyed as a text-only value in valueCodeableConcept.text."
