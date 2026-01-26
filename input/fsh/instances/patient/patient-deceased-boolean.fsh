Instance: CRPatientDeceasedBoolean
InstanceOf: CRCorePatient
Title: "Paciente Fallecido - Estado Desconocido"
Description: "Ejemplo de un paciente que ha fallecido, pero la fecha exacta del deceso es desconocida. Se utiliza el indicador booleano."
Usage: #example

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "5-1234-5678"

* name[0].use = #official
* name[0].family = "García"
* name[0].given[0] = "María"

* gender = #female
* birthDate = "1945-07-22"
* active = false

* deceasedBoolean = true
