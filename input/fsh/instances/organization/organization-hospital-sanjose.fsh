Instance: CROrganizationHospitalClinicalSanJose
InstanceOf: CRCoreOrganization
Title: "Organización Hospital San Vicente de Paul (Público)"
Description: "Ejemplo de hospital público que forma parte de la CCSS, demostrando la relación partOf (parte de) y especializaciones hospitalarias."
Usage: #example

* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[0].type.coding.code = #cedula-juridica
* identifier[0].type.coding.display = "Cédula Jurídica"
* identifier[0].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[0].value = "3-005-678901"

* identifier[1].use = #secondary
* identifier[1].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-identifier-type"
* identifier[1].type.coding.code = #codigo-prestador
* identifier[1].type.coding.display = "Código de Prestador"
* identifier[1].system = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* identifier[1].value = "HOS-SVP-001"

* active = true

* type[0].coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/organization-type"
* type[0].coding.code = #hospital-periferico
* type[0].coding.display = "Hospital Periferico"

* name = "Hospital San Vicente de Paul"

* alias[0] = "HSVP"
* alias[1] = "Hospital San Vicente"

* description = "Hospital público de segundo nivel ubicado en San José, especializado en medicina general, cirugía, pediatría y ginecología. Cuenta con servicios de urgencias 24/7, laboratorio, imagenología e internación. Forma parte del sistema público de salud de la CCSS."

* contact[0].name.given = "María"
* contact[0].name.family = "López"

* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+506 2547 8100"

* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "direccion@hsvp.ccss.sa.cr"

* partOf = Reference(CROrganizationCCSS)
