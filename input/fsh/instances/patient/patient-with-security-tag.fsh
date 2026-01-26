// Paciente con etiqueta de seguridad "Restricted"
Instance: CRPatientWithSecurityTag
InstanceOf: CRCorePatient
Title: "Paciente con Etiqueta de Seguridad"
Description: "Ejemplo de paciente con información protegida mediante etiqueta de seguridad. El nombre y dirección están restringidos según la ley costarricense."

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "10-1234-5678"

* meta.security[0].system = "http://terminology.hl7.org/CodeSystem/v3-Confidentiality"
* meta.security[0].code = #R
* meta.security[0].display = "Restricted"

* name[0].use = #official
* name[0].family = "García Morales"
* name[0].given[0] = "Carlos"

* gender = #male
* birthDate = "1988-07-15"
* active = true

