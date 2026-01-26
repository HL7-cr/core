Extension: CRCityExt
Id: cr-city-ext
Title: "Extensión para cantón"
Description: "Extensión para el código del cantón basado en el ZipCode de Costa Rica."

* ^url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-city-ext"
* ^status = #draft
* ^version = "1.0.0"
* ^publisher = "HL7 Costa Rica"
* ^experimental = false

* ^context[0].type = #element
* ^context[0].expression = "Address.city"

* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept ^short = "Código del cantón basado en el ZipCode de Costa Rica."
* valueCodeableConcept ^definition = "Código numérico del cantón en Costa Rica, utilizado en el sistema de códigos postales."
* valueCodeableConcept from $CitiesSet (required)
* valueCodeableConcept ^binding.description = "Códigos de cantones de Costa Rica basados en el ZipCode."
* valueCodeableConcept.coding 1..* MS
  * code 1..1 MS
  * system 1..1 MS
  * display 0..1