Instance: CROrganizationClinicaPrivada
InstanceOf: CRCoreOrganization
Title: "Organización Clínica Privada Independiente (Privado)"
Description: "Ejemplo de clínica privada independiente que ofrece servicios de segundo nivel con múltiples especialidades médicas."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[0].type.coding.code = #cedula-juridica
* identifier[0].type.coding.display = "Cédula Jurídica"
* identifier[0].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[0].value = "3-101-234567"

* identifier[1].use = #secondary
* identifier[1].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[1].type.coding.code = #codigo-prestador
* identifier[1].type.coding.display = "Código de Prestador"
* identifier[1].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[1].value = "CLIV-SJ-001"

* active = true

* type[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-type"
* type[0].coding.code = #clinica-privada
* type[0].coding.display = "Clínica Privada"

* name = "Clínica Privada Vida Salud"

* alias[0] = "Clínica Vida Salud"
* alias[1] = "Vida Salud"
* alias[2] = "CVSP"

* description = "Clínica privada independiente de segundo nivel que brinda atención integral en medicina general, pediatría, ginecología, medicina interna y servicios de diagnóstico. Cuenta con equipamiento moderno y profesionales especializados. Centro enfocado en la atención ambulatoria y diagnóstica."

* contact[0].name.given = "Roberto"
* contact[0].name.given[1] = "Carlos"
* contact[0].name.family = "Fernández González"

* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+506 2253 5010"

* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "director@clinicavidasalud.cr"
