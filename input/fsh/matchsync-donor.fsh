Profile: MatchSyncDonorPatient
Parent: Patient
Id: matchsync-donor-patient
Title: "MatchSync Donor Patient"
Description: "A minimal Patient profile used as the starting point for MatchSync donor data."
* active 1..1 MS
* name 1..1 MS
* name.family 1..1 MS

Instance: ExampleMatchSyncDonorPatient
InstanceOf: MatchSyncDonorPatient
Usage: #example
Title: "Example MatchSync Donor Patient"
Description: "A synthetic example patient used to demonstrate the starter profile."
* active = true
* name[0].family = "Smith"
* name[0].given[0] = "John"
