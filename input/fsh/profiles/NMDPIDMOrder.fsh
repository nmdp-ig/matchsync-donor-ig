Profile: NMDPIDMOrder
Parent: NMDPDonorOrder
Id: nmdp-idm-order
Title: "NMDP IDM Order"
Description: "A profile for Infectious Disease Marker (IDM) orders. IDM testing is required for donor clearance before stem cell collection."

* code 1..1 MS
* code = NMDPOrderTypeCS#idm "Infectious Disease Markers"
* code ^short = "Fixed to IDM order type"

* specimen 0..* MS
* specimen ^short = "Blood specimens for IDM testing"
* specimen ^definition = "References to specimens collected for infectious disease marker testing."
