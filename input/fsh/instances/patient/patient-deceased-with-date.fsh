Instance: CRPatientDeceasedWithDate
InstanceOf: CRCorePatient
Title: "Paciente Fallecido con Fecha"
Description: "Ejemplo de un paciente que ha fallecido, registrando la fecha exacta del deceso."
Usage: #example

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "501230456"

* name[0].use = #official
* name[0].family = "Rodríguez"
* name[0].given[0] = "Carlos"

* gender = #male
* birthDate = "1950-03-15"
* active = false

* deceasedDateTime = "2024-01-20T14:30:00-06:00"
