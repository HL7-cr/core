// 2. Paciente con DIMEX (válido)
Instance: CRPatientDimex
InstanceOf: CRCorePatient
Title: "Paciente con DIMEX"
Description: "Ejemplo de paciente utilizando DIMEX como identificación oficial."

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #dimex
* identifier[0].type.coding.display = "DIMEX"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "123456789012"

* name[0].use = #official
* name[0].family = "Rojas Méndez"
* name[0].given[0] = "María"
* name[0].given[1] = "Fernanda"

* gender = #female
* birthDate = "1985-11-15"
* active = true

* telecom[0].system = #phone
* telecom[0].value = "+506 8765 4321"
* telecom[0].use = #mobile

* telecom[1].system = #email
* telecom[1].value = "maria.rojas@example.cr"