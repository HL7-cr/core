Extension: CRPatientReligion
Id: cr-patient-religion
Title: "Religión del paciente"
Description: "Extensión para representar la religión declarada del paciente, utilizando conceptos de SNOMED CT."

* ^url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-patient-religion"
* ^status = #draft
* ^version = "1.0.0"
* ^publisher = "HL7 Costa Rica"
* ^experimental = false

// Contexto: solo se permite en Patient
* ^context[0].type = #element
* ^context[0].expression = "Patient"

// Valor de la extensión
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept ^short = "Religión declarada del paciente."
* valueCodeableConcept ^definition = "Religión declarada del paciente, representada mediante un concepto de SNOMED CT."
* valueCodeableConcept from $ReligionsSet (extensible)
* valueCodeableConcept ^binding.description = "Conjunto de religiones para Costa Rica basado en SNOMED CT."
