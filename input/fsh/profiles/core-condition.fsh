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


Profile: CRCoreCondition
Parent: Condition
Id: cr-core-condition
Title: "Condición o Diagnóstico Clínico"
Description: "Perfil Condition para representar condiciones o diagnósticos clínicos, incluyendo soporte para codificación según CIE-10-CA y metadatos específicos del diagnóstico."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

* identifier 1..1 MS
* identifier ^short = "Identificador único del diagnóstico clínico."
* identifier ^definition = "Identificador único del diagnóstico clínico, como un número de informe o código asignado por el sistema de gestión de documentos."

* clinicalStatus 1..1 MS
* clinicalStatus ^short = "Estado clínico del diagnóstico."
* clinicalStatus ^definition = "Estado clínico actual del diagnóstico."
* clinicalStatus from http://hl7.org/fhir/ValueSet/condition-clinical (required)
* clinicalStatus ^binding.description = "ValueSet de estados clínicos de Condition definidos en FHIR."

* verificationStatus 0..1 MS
* verificationStatus ^short = "Estado de verificación del diagnóstico."
* verificationStatus ^definition = "Estado de verificación del diagnóstico clínico: unconfirmed | provisional | differential | confirmed | refuted | entered-in-error"

* code 1..1 MS
* code ^short = "Código del diagnóstico clínico."
* code ^definition = "Código que representa el diagnóstico clínico, preferiblemente utilizando SNOMED CT"
* code from http://hl7.org/fhir/ValueSet/condition-code (preferred)
* code ^binding.description = "ValueSet de códigos de Condition definidos en FHIR. Se recomienda utilizar SNOMED CT para codificar diagnósticos clínicos en Costa Rica."

* subject 1..1 MS
* subject ^short = "Paciente al que se refiere el diagnóstico clínico."
* subject ^definition = "Referencia al recurso Patient que es el sujeto del diagnóstico clínico."
* subject only Reference(CRCorePatient)
* subject ^comment = "El paciente debe estar tener un cédula costarricense, dimex o  válido."

* onset[x] 0..1 MS
* onset[x] ^short = "Fecha y hora de inicio del diagnóstico clínico."
* onset[x] ^definition = "Fecha y hora en que se identificó o diagnosticó la condición clínica. Puede expresarse como fecha exacta (onsetDateTime), edad (onsetAge), o período (onsetPeriod)."
* onset[x] ^comment = "Se recomienda utilizar onsetDateTime para registrar la fecha exacta. Si solo se conoce la edad, use onsetAge. Si es un rango de fechas, use onsetPeriod."
