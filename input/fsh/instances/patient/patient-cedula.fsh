// 1. Paciente con CÉDULA (válido)
Instance: CRPatientCedula
InstanceOf: CRCorePatient
Title: "Paciente con Cédula Costarricense"
Description: "Ejemplo de paciente con cédula costarricense como identificador oficial."

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "1-0123-4567"

* name[0].use = #official
* name[0].family = "Pérez González"
* name[0].given[0] = "Juan"

* gender = #male
* birthDate = "1990-05-02"
* active = true

* telecom[0].system = #phone
* telecom[0].value = "+506 2555 1234"
* telecom[0].use = #home

* telecom[1].system = #email
* telecom[1].value = "juan.perez@example.cr"
* telecom[1].use = #work
