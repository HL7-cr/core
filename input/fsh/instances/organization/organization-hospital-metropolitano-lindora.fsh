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

Instance: CROrganizationHospitalMetropolitanoSedeLindora
InstanceOf: CRCoreOrganization
Title: "Organización Hospital Metropolitano - Sede Lindora (Privado)"
Description: "Ejemplo de sede hospitalaria privada de Hospital Metropolitano en Lindora, demostrando la relación partOf con la red matriz."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[0].type.coding.code = #cedula-juridica
* identifier[0].type.coding.display = "Cédula Jurídica"
* identifier[0].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[0].value = "3-101-567892"

* identifier[1].use = #secondary
* identifier[1].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[1].type.coding.code = #codigo-prestador
* identifier[1].type.coding.display = "Código de Prestador"
* identifier[1].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[1].value = "HM-LI-001"

* active = true

* type[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-type"
* type[0].coding.code = #hospital-nacional-privado
* type[0].coding.display = "Hospital General Privado"

* name = "Hospital Metropolitano - Sede Lindora"

* alias[0] = "HM Lindora"
* alias[1] = "Metropolitano Lindora"

* description = "Sede especializada de Hospital Metropolitano ubicada en Lindora. Ofrece servicios de segundo nivel con énfasis en medicina interna, cirugía general, ginecología y servicios de diagnóstico. Centro enfocado en atención electiva de alta calidad."

* contact[0].name.given = "Miguel"
* contact[0].name.family = "Ramírez"

* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+506 2280 1200"

* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "direccion.lindora@hospitalmetropolitano.cr"

* partOf = Reference(CROrganizationHospitalMetropolitano)
