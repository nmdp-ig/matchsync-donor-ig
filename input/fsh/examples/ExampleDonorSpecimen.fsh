Instance: ExampleDonorSpecimen
InstanceOf: NMDPDonorSpecimen
Usage: #example
Title: "Example Donor Specimen"
Description: "An example blood specimen (EDTA tube) collected from a donor for HLA confirmatory typing."
* status = #available
* type = NMDPSpecimenTypeCS#blood-edta "Blood (EDTA)"
* subject = Reference(ExampleNMDPDonor)
* request = Reference(ExampleDonorOrder)
* collection.collectedDateTime = "2026-07-16T09:30:00Z"
