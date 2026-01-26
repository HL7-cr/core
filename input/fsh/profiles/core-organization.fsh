/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® Profile Resource
 @about:        HL7® FHIR® CORE Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-12-09
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - DHIT Costa Rica
                - Cámara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
                - Instituto Nacional de Seguros
--------------------------------------------------------------------*/


Profile: CRCoreOrganization
Parent: Organization
Id: cr-core-organization
Title: "Organización"
Description: "Perfil Organization para instituciones de salud, hospitales, clínicas y otros prestadores de servicios en Costa Rica."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

* identifier 1..* MS
* identifier ^short = "Identificadores de la organización (Cédula Jurídica, Código de Prestador, etc.)."
* identifier ^definition = "Lista de identificadores únicos de la organización. Incluye Cédula Jurídica del Registro Nacional y Código de Prestador de Servicios de Salud."

* identifier.use MS
* identifier.use ^short = "official | usual | temp | secondary | old"
* identifier.use ^definition = "Propósito del identificador. Se recomienda usar 'official' para la Cédula Jurídica."

* identifier.type MS
* identifier.type ^short = "Tipo de identificador"
* identifier.type ^definition = "Tipo de identificador: Cédula Jurídica, Código de Prestador u otro tipo de identificación."
* identifier.type from $OrganizationIdentifierTypesSet (extensible)
* identifier.type ^binding.description = "CodeSystem de tipos de identificadores para organizaciones en Costa Rica."

* identifier.system MS
* identifier.system ^short = "Sistema que emite el identificador"
* identifier.system ^definition = "Identificador único del sistema que emite o registra el identificador de la organización."

* identifier.value MS
* identifier.value ^short = "El valor del identificador"
* identifier.value ^definition = "Valor único del identificador dentro del sistema."

* active 1..1 MS
* active ^short = "Si la organización está activa."
* active ^definition = "Indica si la organización está activa y operativa. Un valor 'true' significa que la organización está activa; 'false' indica que está inactiva o ha sido desactivada."

* type 0..* MS
* type ^short = "Tipo de organización (hospital, clínica, centro de diagnóstico, etc.)."
* type ^definition = "Tipo de organización según la clasificación de prestadores de salud en Costa Rica. Incluye hospitales, clínicas, centros especializados, entre otros."
* type from $OrganizationTypesSet (extensible)
* type ^binding.description = "CodeSystem de tipos de organizaciones de salud en Costa Rica."

* name 1..1 MS
* name ^short = "Razón social de la organización."
* name ^definition = "Nombre legal o razón social de la organización, tal como aparece registrada en el Registro Nacional."

* alias 0..* MS
* alias ^short = "Nombre(s) comercial(es) o alternativo(s) de la organización."
* alias ^definition = "Nombre comercial, nombre corto o cualquier otro nombre alternativo con el que es conocida la organización."

* description 0..1 MS
* description ^short = "Descripción adicional de la organización."
* description ^definition = "Información adicional sobre la organización, sus servicios, especialidades o características distintivas."

* contact 0..* MS
* contact ^short = "Contacto(s) de la organización."
* contact ^definition = "Persona responsable o punto de contacto dentro de la organización."

* contact.name 0..1 MS
* contact.name ^short = "Nombre del contacto."
* contact.name ^definition = "Nombre completo de la persona de contacto."

* contact.telecom 0..* MS
* contact.telecom ^short = "Información de contacto."
* contact.telecom ^definition = "Teléfono, correo u otro dato para contactar a la persona."

* partOf 0..1 MS
* partOf ^short = "Organización superior de la cual esta organización forma parte."
* partOf ^definition = "Referencia a la organización de la cual esta organización es parte. Por ejemplo, un hospital es parte de la CCSS."
* partOf only Reference(CRCoreOrganization)
