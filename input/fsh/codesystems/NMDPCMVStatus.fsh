CodeSystem: NMDPCMVStatusCS
Id: nmdp-cmv-status
Title: "NMDP CMV Status Code System"
Description: "Text-based status codes for CMV IgG antibody presence in donor and CBU testing."
* ^url = "http://fhir.nmdp.org/CodeSystem/cmv-status"
* ^status = #active
* ^caseSensitive = false
* ^content = #complete
* #Positive "Positive" "CMV IgG antibody detected."
* #Negative "Negative" "CMV IgG antibody not detected."
* #Inconclusive "Inconclusive" "CMV IgG antibody test result is inconclusive."
* #Untested "Untested" "CMV IgG antibody testing has not been performed."
