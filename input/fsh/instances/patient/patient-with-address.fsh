Instance: CRPatientWithAddress
InstanceOf: CRCorePatient
Title: "Paciente con Dirección"
Description: "Ejemplo de paciente con dirección completa incluyendo provincia, cantón y distrito de Costa Rica."
Usage: #example

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "6-9876-5432"

* name[0].use = #official
* name[0].family = "Sánchez Rojas"
* name[0].given[0] = "Francisco"
* name[0].given[1] = "Xavier"

* gender = #male
* birthDate = "1982-06-18"
* active = true

* address[0].use = #home
* address[0].type = #both
* address[0].line[0] = "Calle Principal 1234"
* address[0].line[1] = "Apartado 567"

* address[0].district = "San José"
* address[0].district.extension[0].url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-district-ext"
* address[0].district.extension[0].valueCodeableConcept.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/district-codes"
* address[0].district.extension[0].valueCodeableConcept.coding[0].code = #10101
* address[0].district.extension[0].valueCodeableConcept.coding[0].display = "Carmen"

* address[0].city = "San José"
* address[0].city.extension[0].url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-city-ext"
* address[0].city.extension[0].valueCodeableConcept.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/city-codes"
* address[0].city.extension[0].valueCodeableConcept.coding[0].code = #101
* address[0].city.extension[0].valueCodeableConcept.coding[0].display = "San José"

* address[0].state = "San José"
* address[0].state.extension[0].url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-state-ext"
* address[0].state.extension[0].valueCodeableConcept.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/province-codes"
* address[0].state.extension[0].valueCodeableConcept.coding[0].code = #CR-SJ
* address[0].state.extension[0].valueCodeableConcept.coding[0].display = "San José"

* address[0].postalCode = "10101"

* address[0].country = "Costa Rica"
* address[0].country.extension[0].url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-country-ext"
* address[0].country.extension[0].valueCodeableConcept.coding[0].system = "urn:iso:std:iso:3166"
* address[0].country.extension[0].valueCodeableConcept.coding[0].code = #CRI
* address[0].country.extension[0].valueCodeableConcept.coding[0].display = "Costa Rica"
