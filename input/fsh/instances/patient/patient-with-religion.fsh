// Paciente con extensión de religión
Instance: CRPatientWithReligion
InstanceOf: CRCorePatient
Title: "Paciente con Religión Declarada"
Description: "Ejemplo de paciente con la extensión de religión declarada."

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "9-1234-5678"

* name[0].use = #official
* name[0].family = "López Castro"
* name[0].given[0] = "Roberto"

* gender = #male
* birthDate = "1965-07-22"
* active = true

* telecom[0].system = #phone
* telecom[0].value = "+506 4444 5555"
* telecom[0].use = #mobile

* telecom[1].system = #email
* telecom[1].value = "roberto.lopez@example.cr"

* extension[0].url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-patient-religion"
* extension[0].valueCodeableConcept.text = "Católica"


