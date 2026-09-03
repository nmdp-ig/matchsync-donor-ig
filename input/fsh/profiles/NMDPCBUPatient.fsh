Profile: NMDPCBUPatient
Parent: USCorePatientProfile
Id: nmdp-cbu-patient
Title: "NMDP Cord Blood Unit (CBU) Patient"
Description: "A profile representing a Cord Blood Unit (CBU) in the NMDP registry. CBUs are identified by having a cbu-source-id identifier (no GRID). CBUs are not tied to a real person — they represent a cord blood unit. The Patient.id should be the CBU source ID."

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice on identifier system"
* identifier contains
    cbuSourceId 1..1 MS and
    cbuRegistryId 0..1 MS and
    cbbId 0..1 MS
* identifier[cbuSourceId].system 1..1
* identifier[cbuSourceId].system = $nmdp-id-cbu-source-id
* identifier[cbuSourceId].value 1..1
* identifier[cbuSourceId] ^short = "CBU Source ID"
* identifier[cbuSourceId] ^definition = "The source identifier for the cord blood unit. System: http://nmdp.org/identifier/cbu-source-id"
* identifier[cbuRegistryId].system 1..1
* identifier[cbuRegistryId].system = $nmdp-id-cbu-registry-id
* identifier[cbuRegistryId].value 1..1
* identifier[cbuRegistryId] ^short = "CBU Registry ID"
* identifier[cbuRegistryId] ^definition = "The registry-assigned identifier for the cord blood unit. System: http://nmdp.org/identifier/cbu-registry-id"
* identifier[cbbId].system 1..1
* identifier[cbbId].system = $nmdp-id-cbb-id
* identifier[cbbId].value 1..1
* identifier[cbbId] ^short = "Cord Blood Bank ID"
* identifier[cbbId] ^definition = "The identifier of the cord blood bank that stores this unit. System: http://nmdp.org/identifier/cbb-id"

* gender MS
* birthDate MS

* extension contains
    CBUStatus named cbuStatus 0..1
* extension[cbuStatus] ^short = "CBU availability status"
* extension[cbuStatus] ^definition = "The current availability status of the cord blood unit (e.g., Available)."
