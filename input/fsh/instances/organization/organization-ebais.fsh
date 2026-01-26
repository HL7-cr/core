/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® Instance Resource
 @about:        HL7® FHIR® CORE Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-12-11
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - DHIT Costa Rica
                - Cámara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
                - Instituto Nacional de Seguros
--------------------------------------------------------------------*/

Instance: CROrganizationEBAIS
InstanceOf: CRCoreOrganization
Title: "Organización EBAIS - Centro de Atención de Primer Nivel (Público)"
Description: "Ejemplo de EBAIS (Equipo Básico de Atención Integral en Salud), centro de atención de primer nivel que forma parte de la CCSS, proporcionando servicios de medicina familiar y atención preventiva."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[0].type.coding.code = #cedula-juridica
* identifier[0].type.coding.display = "Cédula Jurídica"
* identifier[0].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[0].value = "3-006-789012"

* identifier[1].use = #secondary
* identifier[1].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[1].type.coding.code = #codigo-prestador
* identifier[1].type.coding.display = "Código de Prestador"
* identifier[1].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[1].value = "EBAIS-SJO-001"

* active = true

* type[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-type"
* type[0].coding.code = #ebais
* type[0].coding.display = "EBAIS"

* name = "EBAIS San José Centro"

* alias[0] = "EBAIS Centro"
* alias[1] = "Centro de Salud San José"

* description = "Equipo Básico de Atención Integral en Salud (EBAIS) especializado en atención de primer nivel, medicina familiar y atención preventiva. Ofrece servicios de consulta externa, inmunizaciones, control del embarazo y manejo de enfermedades crónicas. Forma parte de la red pública de la CCSS."

* contact[0].name.given = "Carlos"
* contact[0].name.family = "Mora"

* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+506 2221 1234"

* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "direccion@ebais.ccss.sa.cr"

* partOf = Reference(CROrganizationCCSS)
