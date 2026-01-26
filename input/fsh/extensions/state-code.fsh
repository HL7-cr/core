Extension: CRStateExt
Id: cr-state-ext
Title: "Extensión para provincia"
Description: "Extensión para el código de la provincia basado en el ZipCode de Costa Rica."

* ^url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-state-ext"
* ^status = #draft
* ^version = "1.0.0"
* ^publisher = "HL7 Costa Rica"
* ^experimental = false

* ^context[0].type = #element
* ^context[0].expression = "Address.state"

* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept ^short = "Código de la provincia basado en el ZipCode de Costa Rica."
* valueCodeableConcept ^definition = "Código numérico de la provincia en Costa Rica, utilizado en el sistema de códigos postales."
* valueCodeableConcept from $ProvincesSet (required)
* valueCodeableConcept ^binding.description = "Códigos de provincias de Costa Rica basados en el ZipCode."
* valueCodeableConcept.coding 1..* MS
  * code 1..1 MS
  * system 1..1 MS
  * display 0..1