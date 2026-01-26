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

Instance: CROrganizationHospitalMetropolitano
InstanceOf: CRCoreOrganization
Title: "Organización Hospital Metropolitano - Red de Hospitales Privados"
Description: "Ejemplo de red hospitalaria privada (Hospital Metropolitano) que actúa como organización matriz para múltiples sedes hospitalarias."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[0].type.coding.code = #cedula-juridica
* identifier[0].type.coding.display = "Cédula Jurídica"
* identifier[0].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[0].value = "3-101-567890"

* identifier[1].use = #secondary
* identifier[1].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[1].type.coding.code = #codigo-prestador
* identifier[1].type.coding.display = "Código de Prestador"
* identifier[1].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[1].value = "HM-CORP-001"

* active = true

* type[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-type"
* type[0].coding.code = #hospital-nacional-privado
* type[0].coding.display = "Hospital General Privado"

* name = "Hospital Metropolitano S.A."

* alias[0] = "Hospital Metropolitano"
* alias[1] = "HM"
* alias[2] = "Red Metropolitana de Salud"

* description = "Red hospitalaria privada con múltiples sedes especializadas. Ofrece atención de segundo y tercer nivel con servicios en medicina general, especialidades médicas y quirúrgicas, servicios de diagnóstico avanzado y cuidados intensivos. Opera sedes en San José y Lindora."

* contact[0].name.given = "Fernando"
* contact[0].name.family = "Jiménez"

* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+506 2280 1000"

* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "direccion@hospitalmetropolitano.cr"
