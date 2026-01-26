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

Instance: CROrganizationMinistryOfHealth
InstanceOf: CRCoreOrganization
Title: "Organización Ministerio de Salud (Público)"
Description: "Ejemplo de organización pública reguladora y rectora del sector salud en Costa Rica, responsable de la vigilancia epidemiológica, regulación sanitaria y políticas de salud."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[0].type.coding.code = #cedula-juridica
* identifier[0].type.coding.display = "Cédula Jurídica"
* identifier[0].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[0].value = "3-001-234567"

* active = true

* type[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-type"
* type[0].coding.code = #prestadora-servicios-salud
* type[0].coding.display = "Prestadora de Servicios de Salud"

* name = "Ministerio de Salud"

* alias[0] = "MS"
* alias[1] = "MINSA"
* alias[2] = "Ministerio de Salud Pública"

* description = "Institución pública responsable de formular, ejecutar y evaluar las políticas, programas y proyectos en materia de salud. Actúa como rectora del sector salud en Costa Rica, responsable de la vigilancia epidemiológica, regulación sanitaria, autorización de medicamentos y coordinación intersectorial en salud."

* contact[0].name.given = "Patricia"
* contact[0].name.family = "García"

* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+506 2233 3000"

* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "info@ministeriodesalud.go.cr"
