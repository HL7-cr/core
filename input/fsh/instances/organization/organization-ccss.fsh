Instance: CROrganizationCCSS
InstanceOf: CRCoreOrganization
Title: "Organización CCSS - Caja Costarricense de Seguro Social (Pública)"
Description: "Ejemplo de organización pública superior (CCSS) que actúa como organización matriz para hospitales públicos, EBAIS y otros centros de salud en Costa Rica."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[0].type.coding.code = #cedula-juridica
* identifier[0].type.coding.display = "Cédula Jurídica"
* identifier[0].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[0].value = "3-002-345678"

* active = true

* type[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-type"
* type[0].coding.code = #clinica-t4
* type[0].coding.display = "Clínica Pública Tipo 4"

* name = "Caja Costarricense de Seguro Social"

* alias[0] = "CCSS"
* alias[1] = "Seguro Social"
* alias[2] = "Institución Pública"

* description = "Institución estatal costarricense encargada del aseguramiento en salud y pensiones. Brinda atención integral de salud a través de una red de hospitales públicos, EBAIS, clínicas y centros especializados a nivel nacional."

* contact[0].name.given = "José"
* contact[0].name.family = "Rodríguez"

* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+506 2250 1234"

* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "jose.rodriguez@ccss.sa.cr"
