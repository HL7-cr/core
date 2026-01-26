Extension: CRCountryExt
Id: cr-country-ext
Title: "Extensión para país"
Description: "Extensión para el código de país en formato ISO 3166-1 alpha-3."

* ^url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-country-ext"
* ^status = #draft
* ^version = "1.0.0"
* ^publisher = "HL7 Costa Rica"
* ^experimental = false

* ^context[0].type = #element
* ^context[0].expression = "Address.country"

* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept ^short = "Código de país en formato ISO 3166-1 alpha-3."
* valueCodeableConcept ^definition = "Código de país utilizando el estándar ISO 3166-1 alpha-3, representado como un concepto codificable."
* valueCodeableConcept from http://hl7.org/fhir/ValueSet/iso3166-1-3 (required)
* valueCodeableConcept ^binding.description = "Códigos de país en formato ISO 3166-1 alpha-3."
* valueCodeableConcept.coding 1..* MS
  * code 1..1 MS
  * system 1..1 MS
  * display 0..1