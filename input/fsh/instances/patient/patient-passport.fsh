// 3. Paciente con PASAPORTE extranjero (válido)
Instance: CRPatientPassport
InstanceOf: CRCorePatient
Title: "Paciente con Pasaporte"
Description: "Ejemplo de paciente identificado únicamente con pasaporte extranjero."

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #pasaporte
* identifier[0].type.coding.display = "Pasaporte"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "P123456789"

* name[0].use = #official
* name[0].family = "Kovář"
* name[0].given[0] = "Petr"

* gender = #male
* birthDate = "1979-04-30"
* active = true

* telecom[0].system = #phone
* telecom[0].value = "+506 7654 3210"
* telecom[0].use = #home

* telecom[1].system = #email
* telecom[1].value = "petr.kovar@example.cz"