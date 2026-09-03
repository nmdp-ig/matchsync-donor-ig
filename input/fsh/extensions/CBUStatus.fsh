Extension: CBUStatus
Id: cbu-status
Title: "CBU Status"
Description: "The availability status of a Cord Blood Unit (CBU) in the NMDP registry. Conveyed as a simple string value (e.g., 'Available')."
Context: Patient
* value[x] only string
* valueString 1..1
* valueString ^short = "CBU availability status"
* valueString ^definition = "The current availability status of the cord blood unit in the NMDP registry."
