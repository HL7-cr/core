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

Instance: CRPractitionerRolePhysicianCCSS
InstanceOf: CRCorePractitionerRole
Title: "Rol - Dr. Carlos Rodríguez en CCSS"
Description: "Ejemplo del rol de médico general que desempeña el Dr. Carlos Rodríguez en la CCSS."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/practitioner-role-organization"
* identifier[0].value = "EMP-CCSS-12345"

* active = true

* practitioner = Reference(CRPractitionerPhysician)

* organization = Reference(CROrganizationCCSS)

* code[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/practitioner-role"
* code[0].coding.code = #2211
* code[0].coding.display = "Médicos generales"

* specialty[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/practitioner-speciality"
* specialty[0].coding.code = #03.04.01
* specialty[0].coding.display = "Medicina y Cirugía (licenciado)"
