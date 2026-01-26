Extension: CRDistrictExt
Id: cr-district-ext
Title: "Extensión para distrito"
Description: "Extensión para el código del distrito basado en el ZipCode de Costa Rica."

* ^url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-district-ext"
* ^status = #draft
* ^version = "1.0.0"
* ^publisher = "HL7 Costa Rica"
* ^experimental = false

* ^context[0].type = #element
* ^context[0].expression = "Address.district"

* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept ^short = "Código del distrito basado en el ZipCode de Costa Rica."
* valueCodeableConcept ^definition = "Código numérico del distrito en Costa Rica, utilizado en el sistema de códigos postales."
* valueCodeableConcept from $DistrictsSet (required)
* valueCodeableConcept ^binding.description = "Códigos de distritos de Costa Rica basados en el ZipCode."
* valueCodeableConcept.coding 1..* MS
  * code 1..1 MS
  * system 1..1 MS
  * display 0..1