Instance: CRPatientWithContactMother
InstanceOf: CRCorePatient
Title: "Paciente con Contacto Madre"
Description: "Ejemplo de paciente con un contacto de tipo madre (relación SNOMED CT 72705000)."
Usage: #example

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "8-1234-5678"

* name[0].use = #official
* name[0].family = "Rodríguez García"
* name[0].given[0] = "Ana"
* name[0].given[1] = "María"

* gender = #female
* birthDate = "2010-03-22"
* active = true

// Contacto: Madre
* contact[0].relationship[0].coding[0].system = "http://snomed.info/sct"
* contact[0].relationship[0].coding[0].code = #72705000

* contact[0].name.use = #official
* contact[0].name.family = "García López"
* contact[0].name.given[0] = "María"
* contact[0].name.given[1] = "Elena"

* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+506 8765 4321"
* contact[0].telecom[0].use = #mobile

* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "maria.elena.garcia@example.cr"

* contact[0].gender = #female
