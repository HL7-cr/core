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

Instance: CROrganizationHospitalMetropolitanoSedeSanJose
InstanceOf: CRCoreOrganization
Title: "Organización Hospital Metropolitano - Sede San José (Privado)"
Description: "Ejemplo de sede hospitalaria privada de Hospital Metropolitano en San José, demostrando la relación partOf con la red matriz."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[0].type.coding.code = #cedula-juridica
* identifier[0].type.coding.display = "Cédula Jurídica"
* identifier[0].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[0].value = "3-101-567891"

* identifier[1].use = #secondary
* identifier[1].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[1].type.coding.code = #codigo-prestador
* identifier[1].type.coding.display = "Código de Prestador"
* identifier[1].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[1].value = "HM-SJ-001"

* active = true

* type[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-type"
* type[0].coding.code = #hospital-nacional-privado
* type[0].coding.display = "Hospital General Privado"

* name = "Hospital Metropolitano - Sede San José"

* alias[0] = "HM San José"
* alias[1] = "Metropolitano San José"

* description = "Sede principal de Hospital Metropolitano ubicada en San José. Ofrece servicios de segundo y tercer nivel con especialidades médicas, quirúrgicas, servicios de diagnóstico avanzado y cuidados intensivos. Cuenta con equipamiento de última generación."

* contact[0].name.given = "Andrea"
* contact[0].name.family = "Estrada"

* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+506 2280 1100"

* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "direccion.sanjose@hospitalmetropolitano.cr"

* partOf = Reference(CROrganizationHospitalMetropolitano)
