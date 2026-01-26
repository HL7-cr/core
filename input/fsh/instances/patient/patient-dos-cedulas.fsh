// 5. Ejemplo inválido — dos cédulas (viola invariante)
Instance: CRPatientInvalidTwoCedulas
InstanceOf: CRCorePatient
Title: "Paciente inválido con dos cédulas"
Description: "Ejemplo que viola el invariante only-one-cedula."

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "3-5678-9012"

* identifier[1].use = #old
* identifier[1].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[1].type.coding.code = #cedula-nacional
* identifier[1].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[1].value = "1-2222-2222"

* name[0].use = #official
* name[0].family = "Rodríguez"
* name[0].given[0] = "Luis"

* gender = #male
* birthDate = "1992-03-18"
* active = true