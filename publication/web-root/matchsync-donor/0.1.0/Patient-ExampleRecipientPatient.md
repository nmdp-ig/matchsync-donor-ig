# Example Recipient Patient - NMDP Donor Patient Implementation Guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example Recipient Patient**

## Example Patient: Example Recipient Patient

Profile: [US Core Patient Profile](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-patient.html)

Maria Garcia Female, DoB: 1975-06-20 ( http://nmdp.org/identifier/rid#RID-9988776)

-------

| | |
| :--- | :--- |
| Other Id: | `http://nmdp.org/identifier/local-id`/TC-LOCAL-44321 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleRecipientPatient",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"]
  },
  "identifier" : [{
    "system" : "http://nmdp.org/identifier/rid",
    "value" : "RID-9988776"
  },
  {
    "system" : "http://nmdp.org/identifier/local-id",
    "value" : "TC-LOCAL-44321"
  }],
  "name" : [{
    "family" : "Garcia",
    "given" : ["Maria"]
  }],
  "gender" : "female",
  "birthDate" : "1975-06-20"
}

```
