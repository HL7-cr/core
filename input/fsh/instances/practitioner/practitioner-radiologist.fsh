Instance: CRPractitionerRadiologist
InstanceOf: CRCorePractitioner
Title: "Profesional de la Salud - Especialista en Radiología"
Description: "Ejemplo de profesional especialista en radiología, inactivo (fallecido), con cédula nacional y número de colegiado inmutable (RAD-11111-CR) que es único e invariable durante toda su carrera profesional."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/worker-health-registry"
* identifier[0].value = "2-9876-5432"

* active = false

* name[0].use = #official
* name[0].family = "Sánchez López"
* name[0].given[0] = "Francisco"
* name[0].given[1] = "Javier"

* gender = #male

* birthDate = "1955-11-10"

* deceasedBoolean = true

* telecom[0].system = #phone
* telecom[0].value = "+506 2234 5678"
* telecom[0].use = #work

* telecom[1].system = #email
* telecom[1].value = "francisco.sanchez@ccss.sa.cr"
* telecom[1].use = #work

* address[0].use = #work
* address[0].type = #physical
* address[0].line = "Barrio Escalante, San José"
* address[0].city = "San José"
* address[0].district = "San José"
* address[0].state = "San José"
* address[0].postalCode = "10100"
* address[0].country = "CR"

* qualification[0].identifier[0].value = "RAD-11111-CR"

* qualification[0].code.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/practitioner-role"
* qualification[0].code.coding[0].code = #2212
* qualification[0].code.coding[0].display = "Médicos especialistas"

* qualification[0].issuer = Reference(CROrganizationHospitalClinicalSanJose)

* qualification[1].identifier[0].value = "RAD-11111-CR"

* qualification[1].code.coding[0].system = "https://hl7.or.cr/fhir/terminology/CodeSystem/practitioner-role"
* qualification[1].code.coding[0].code = #3211
* qualification[1].code.coding[0].display = "Técnicos en aparatos de diagnóstico y tratamiento médico"

* qualification[1].issuer = Reference(CROrganizationHospitalClinicalSanJose)
