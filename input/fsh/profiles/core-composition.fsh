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


Profile: CRCoreComposition
Parent: Composition
Id: cr-core-composition
Title: "Descripción Clínica"
Description: "Perfil Composition para representar descripciones clínicas, incluyendo metadatos específicos del documento clínico."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

* identifier 1..1 MS
* identifier ^short = "Identificador único del documento clínico."
* identifier ^definition = "Identificador único del documento clínico, como un número de informe o código asignado por el sistema de gestión de documentos."

* status 1..1 MS
* status ^short = "Estado del documento clínico."
* status ^definition = "Estado actual del documento clínico."
* status from CompositionStatus (required)
* status ^binding.description = "ValueSet de estados de Composition definidos en FHIR."

// Basado en LOINC para documentos clínicos
* type 1..1 MS
* type ^short = "Tipo de documento clínico."
* type ^definition = "Tipo de documento clínico representado en el Composition, como informe médico, nota de evolución, etc."
* type from $CompositionDocumentTypesSet (required)
* type ^binding.description = "ValueSet de tipos de documentos clínicos basado en LOINC para Costa Rica."

* category 0..* MS
* category ^short = "Categoría del documento clínico."
* category ^definition = "Categoría o clasificación del documento clínico."
* category from http://hl7.org/fhir/ValueSet/referenced-item-category (extensible)
* category ^binding.description = "ValueSet de categorías de ítems referenciados definidos en FHIR."

* subject 1..1 MS
* subject ^short = "Paciente al que se refiere el documento clínico."
* subject ^definition = "Referencia al recurso Patient que es el sujeto del documento clínico."
* subject only Reference(CRCorePatient)
* subject ^comment = "El paciente debe estar tener un cédula costarricense, dimex o  válido."

// * encounter 0..1 MS
// * encounter ^short = "Encuentro asociado al documento clínico."
// * encounter ^definition = "Referencia al recurso Encounter asociado con el documento clínico."

* date 1..1 MS
* date ^short = "Fecha y hora de creación del documento clínico."
* date ^definition = "Fecha y hora en que se creó el documento clínico."
* date ^comment = "Se recomienda que la fecha y hora reflejen el momento en que se finalizó el documento clínico."

* name 0..0

* title 1..1 MS
* title ^short = "Título del documento clínico."
* title ^definition = "Título descriptivo del documento clínico."
* title ^comment = "El título debe ser claro y reflejar el contenido del documento clínico."

* attester 0..1 MS
* attester ^short = "Persona que atestigua el documento clínico."
* attester ^definition = "Referencia a la persona que atestigua la validez del documento clínico."
* attester.party only Reference(CRCorePatient or CRCorePractitioner or CRCoreOrganization)
* attester.party ^comment = "La persona que atestigua debe ser un profesional de la salud o una organización autorizada."
* attester.mode 1..1 MS
* attester.mode ^short = "Modo de atestiguamiento."
* attester.mode ^definition = "Modo en que la persona atestigua el documento clínico."
* attester.mode from http://hl7.org/fhir/ValueSet/composition-attestation-mode (required)
* attester.mode ^binding.description = "ValueSet de modos de atestiguamiento definidos en FHIR."
* attester.mode = #legal

* attester.time 0..1 MS
* attester.time ^short = "Fecha y hora del atestiguamiento."
* attester.time ^definition = "Fecha y hora en que se realizó la validación del documento clínico."
* attester.time ^comment = "Se recomienda que la fecha y hora reflejen el momento en que se atestiguó el documento clínico."

* custodian 1..1 MS
* custodian ^short = "Organización responsable del documento clínico."
* custodian ^definition = "Referencia a la organización responsable de la custodia del documento clínico."
* custodian only Reference(CRCoreOrganization)

* section 1..* MS
* section ^short = "Secciones del documento clínico."
* section ^definition = "Secciones que componen el documento clínico, cada una con su propio contenido y estructura."

* section.code 0..1 MS
* section.code ^short = "Código de la sección del documento clínico."
* section.code ^definition = "Código que identifica la sección del documento clínico."
* section.code from http://hl7.org/fhir/ValueSet/doc-section-codes (extensible)
* section.code ^binding.description = "ValueSet de códigos de secciones de documentos definidos en FHIR."

* section.text 0..1 MS
* section.text ^short = "Contenido narrativo de la sección."
* section.text ^definition = "Contenido narrativo o textual de la sección del documento clínico."
* section.text ^comment = "Se recomienda incluir un resumen narrativo en cada sección para facilitar la comprensión del contenido."

* section.entry 0..* MS
* section.entry ^short = "Entradas referenciadas en la sección."
* section.entry ^definition = "Referencias a otros recursos FHIR que forman parte del contenido de la sección del documento clínico."
* section.entry only Reference(Resource)
* section.entry ^comment = "Las entradas pueden incluir recursos como Observations, Medications, Procedures, entre otros, según corresponda al contenido del documento clínico."