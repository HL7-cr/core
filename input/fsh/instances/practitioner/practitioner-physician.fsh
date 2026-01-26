Instance: CRPractitionerPhysician
InstanceOf: CRCorePractitioner
Title: "Profesional de la Salud - Médico General"
Description: "Ejemplo de profesional médico general activo con cédula nacional, número de colegiado inmutable (MED-12345-CR) que no cambia independientemente de la organización donde trabaje, y contacto."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/worker-health-registry"
* identifier[0].value = "1-1234-5678"

* active = true

* name[0].use = #official
* name[0].family = "Rodríguez García"
* name[0].given[0] = "Carlos"
* name[0].given[1] = "Alberto"

* gender = #male

* birthDate = "1982-06-15"

* telecom[0].system = #phone
* telecom[0].value = "+506 8765 4321"
* telecom[0].use = #mobile

* telecom[1].system = #email
* telecom[1].value = "carlos.rodriguez@ccss.sa.cr"
* telecom[1].use = #work

* address[0].use = #work
* address[0].type = #physical
* address[0].line = "Avenida Central 100"
* address[0].city = "San José"
* address[0].district = "San José"
* address[0].state = "San José"
* address[0].postalCode = "10100"
* address[0].country = "CR"

* qualification[0].identifier[0].value = "MED-12345-CR"

* qualification[0].code.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/practitioner-role"
* qualification[0].code.coding[0].code = #2211
* qualification[0].code.coding[0].display = "Médicos generales"

* qualification[0].issuer = Reference(CROrganizationCCSS)

* qualification[1].identifier[0].value = "MED-12345-CR"

* qualification[1].code.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/practitioner-role"
* qualification[1].code.coding[0].code = #2212
* qualification[1].code.coding[0].display = "Médicos especialistas"

* qualification[1].issuer = Reference(CROrganizationClinicaPrivada)
