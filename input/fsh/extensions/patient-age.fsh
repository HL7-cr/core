Extension: CRPatientCalculatedAge
Id: cr-patient-calculated-age
Title: "Edad calculada del paciente"
Description: "Extensión para representar la edad calculada del paciente en un momento dado, derivada de la fecha de nacimiento."

* ^url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-patient-calculated-age"
* ^status = #draft
* ^version = "1.0.0"
* ^publisher = "HL7 Costa Rica"
* ^experimental = false

* ^context[0].type = #element
* ^context[0].expression = "Patient"

* value[x] only Age
* valueAge 1..1
* valueAge ^short = "Edad calculada del paciente."
* valueAge ^definition = "Edad calculada del paciente en el momento de la evaluación, usualmente en años completos, derivada de la fecha de nacimiento."

* valueAge.value 1..1
* valueAge.system 1..1
* valueAge.system = "http://unitsofmeasure.org"
* valueAge.code 1..1
* valueAge.code = #a
