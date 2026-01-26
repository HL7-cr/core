Instance: CRPatientWithContactSpouse
InstanceOf: CRCorePatient
Title: "Paciente con Contacto Cónyuge"
Description: "Ejemplo de paciente adulto con contacto de tipo cónyuge (relación SNOMED CT 127848009) incluyendo dirección compartida."
Usage: #example

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "7-1234-5678"

* name[0].use = #official
* name[0].family = "Ramírez Solís"
* name[0].given[0] = "David"

* gender = #male
* birthDate = "1988-11-14"
* active = true

* address[0].use = #home
* address[0].type = #both
* address[0].line[0] = "Avenida Central 456"
* address[0].line[1] = "Casa 28"

* address[0].city = "Alajuela"
* address[0].city.extension[0].url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-city-ext"
* address[0].city.extension[0].valueCodeableConcept.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/city-codes"
* address[0].city.extension[0].valueCodeableConcept.coding[0].code = #201
* address[0].city.extension[0].valueCodeableConcept.coding[0].display = "Alajuela"

* address[0].state = "Alajuela"
* address[0].state.extension[0].url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-state-ext"
* address[0].state.extension[0].valueCodeableConcept.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/province-codes"
* address[0].state.extension[0].valueCodeableConcept.coding[0].code = #CR-A
* address[0].state.extension[0].valueCodeableConcept.coding[0].display = "Alajuela"

// Contacto: Cónyuge
* contact[0].relationship[0].coding[0].system = "http://snomed.info/sct"
* contact[0].relationship[0].coding[0].code = #127848009

* contact[0].name.use = #official
* contact[0].name.family = "Torres Vargas"
* contact[0].name.given[0] = "Patricia"

* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+506 7654 3210"
* contact[0].telecom[0].use = #home

* contact[0].address.use = #home
* contact[0].address.type = #both
* contact[0].address.line[0] = "Avenida Central 456"
* contact[0].address.line[1] = "Casa 28"

* contact[0].gender = #female
