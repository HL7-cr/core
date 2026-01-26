/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® Profile Resource
 @about:        HL7® FHIR® CORE Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-11-29
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - DHIT Costa Rica
                - Cámara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
                - Instituto Nacional de Seguros
--------------------------------------------------------------------*/


Profile: CRCoreImmunization
Parent: Immunization
Id: cr-core-immunization
Title: "Inmunización"
Description: "Perfil Immunization para registrar eventos de inmunización, incluyendo metadatos específicos relacionados con la administración de vacunas."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

* identifier 0..* MS
* identifier ^short = "Identificadores de la inmunización."
* identifier ^definition = "Lista de identificadores únicos asociados con la inmunización, como números de lote o códigos internos."

* status 1..1 MS
* status ^short = "Estado de la inmunización."
* status ^definition = "Estado actual de la inmunización."
* status from ImmunizationStatusCodes (required)
* status ^binding.description = "ValueSet de estados de Immunization definidos en FHIR."

* statusReason 0..1 MS
* statusReason ^short = "Razón del estado de la inmunización."
* statusReason ^definition = "Razón que explica el estado actual de la inmunización."
* statusReason from http://hl7.org/fhir/ValueSet/immunization-status-reason (extensible)
* statusReason ^binding.description = "ValueSet de razones de estado de Immunization definidas en FHIR."

* vaccineCode 1..1 MS
* vaccineCode ^short = "Código de la vacuna administrada."
* vaccineCode ^definition = "Código que identifica la vacuna administrada."
* vaccineCode ^comment = "Se recomienda utilizar un código del ValueSet de códigos de vacunas de FHIR o códigos locales registrados."

* patient 1..1 MS
* patient only Reference(CRCorePatient)
* patient ^short = "Paciente que recibió la inmunización."
* patient ^definition = "Referencia al recurso Patient que es el sujeto de la inmunización."
* patient ^comment = "El paciente debe estar tener un cédula costarricense, dimex o  válido."

* encounter 0..1 MS

* occurrenceDateTime 1..1 MS
* primarySource 0..1 MS
* informationSource 0..1 MS
* informationSource only CodeableReference(CRCorePractitioner or CRCoreOrganization)
* location 0..1 MS
* location only Reference(CRCoreLocation)
* manufacturer 0..1 MS
* lotNumber 0..1 MS
* expirationDate 0..1 MS
* performer 0..* MS
* performer.function 0..1 MS
* performer.actor 1..1 MS
* performer.actor only Reference(CRCorePractitioner or CRCoreOrganization)
* note 0..* MS
* reaction 0..* MS
