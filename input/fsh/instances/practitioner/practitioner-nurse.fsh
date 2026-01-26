Instance: CRPractitionerNurse
InstanceOf: CRCorePractitioner
Title: "Profesional de la Salud - Enfermera Especialista"
Description: "Ejemplo de profesional enfermera especialista activa con cédula nacional, número de colegiado inmutable (ENF-54321-CR) que permanece constante sin importar cambios de organización, y múltiples cualificaciones."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/worker-health-registry"
* identifier[0].value = "3-5678-9012"

* active = true

* name[0].use = #official
* name[0].family = "González Ramírez"
* name[0].given[0] = "María"
* name[0].given[1] = "Elena"

* gender = #female

* birthDate = "1990-03-22"

* telecom[0].system = #phone
* telecom[0].value = "+506 7654 3210"
* telecom[0].use = #mobile

* telecom[1].system = #email
* telecom[1].value = "maria.gonzalez@clinicavidasalud.cr"
* telecom[1].use = #work

* address[0].use = #work
* address[0].type = #physical
* address[0].line = "Calle 10, Avenida 2"
* address[0].city = "San José"
* address[0].district = "San José"
* address[0].state = "San José"
* address[0].postalCode = "10100"
* address[0].country = "CR"

* qualification[0].identifier[0].value = "ENF-54321-CR"

* qualification[0].code.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/practitioner-role"
* qualification[0].code.coding[0].code = #2221
* qualification[0].code.coding[0].display = "Profesionales de enfermería (generales)"

* qualification[0].issuer = Reference(CROrganizationClinicaPrivada)

* qualification[1].identifier[0].value = "ENF-54321-CR"

* qualification[1].code.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/practitioner-role"
* qualification[1].code.coding[0].code = #2223
* qualification[1].code.coding[0].display = "Profesionales de enfermería especialistas (excluye ginecoobstetricia)"

* qualification[1].issuer = Reference(CROrganizationClinicaPrivada)
