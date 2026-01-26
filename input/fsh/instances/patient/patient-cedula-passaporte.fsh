// 4. Paciente con CÉDULA + PASAPORTE (válido)
Instance: CRPatientMultipleId
InstanceOf: CRCorePatient
Title: "Paciente con Cédula y Pasaporte"
Description: "Ejemplo válido de paciente con cédula y pasaporte."

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "2-0666-0888"

* identifier[1].use = #secondary
* identifier[1].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[1].type.coding.code = #pasaporte
* identifier[1].type.coding.display = "Pasaporte"
* identifier[1].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[1].value = "P0048822"

* name[0].use = #official
* name[0].family = "Vargas Jiménez"
* name[0].given[0] = "Mariela"

* gender = #female
* birthDate = "1998-02-21"
* active = true