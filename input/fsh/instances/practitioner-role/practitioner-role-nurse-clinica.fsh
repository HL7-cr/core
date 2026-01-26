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

Instance: CRPractitionerRoleNurseClinica
InstanceOf: CRCorePractitionerRole
Title: "Rol - María González en Clínica Privada"
Description: "Ejemplo del rol de enfermera especialista que desempeña María González en Clínica Privada Vida Salud."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/practitioner-role-organization"
* identifier[0].value = "EMP-CVSP-00789"

* active = true

* practitioner = Reference(CRPractitionerNurse)

* organization = Reference(CROrganizationClinicaPrivada)

* code[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/practitioner-role"
* code[0].coding.code = #2223
* code[0].coding.display = "Profesionales de enfermería especialistas (excluye ginecoobstetricia)"

* specialty[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/practitioner-speciality"
* specialty[0].coding.code = #04.05.07
* specialty[0].coding.display = "Enfermería con especialidad en Salud Pública"
