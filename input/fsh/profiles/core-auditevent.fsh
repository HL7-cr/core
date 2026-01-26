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


Profile: CRCoreAuditEvent
Parent: AuditEvent
Id: cr-core-auditevent
Title: "Evento de Auditoría"
Description: "Perfil AuditEvent para registrar eventos de auditoría en recursos clínicos y administrativos, incluyendo metadatos específicos de auditoría y trazabilidad."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

* code 1..1 MS
* code ^short = "Tipo de evento de auditoría."
* code ^definition = "Código que identifica el tipo de evento de auditoría que se está registrando."
* code from http://hl7.org/fhir/ValueSet/audit-event-sub-type (required)
* code ^binding.description = "ValueSet de tipos de eventos de auditoría definidos en FHIR."

* recorded 1..1 MS
* recorded ^short = "Fecha y hora en que se registró el evento de auditoría."
* recorded ^definition = "Fecha y hora en que se registró el evento de auditoría."

* agent 1..* MS
* agent ^short = "Agentes involucrados en el evento de auditoría."
* agent ^definition = "Lista de agentes (personas, organizaciones, dispositivos) que participaron en el evento de auditoría."

* agent.who 1..1 MS
* agent.who ^short = "Referencia al agente."
* agent.who ^definition = "Referencia al recurso FHIR que representa al agente involucrado en el evento de auditoría."
* agent.who only Reference(CRCorePractitioner or CRCoreOrganization)

* source 1..1 MS
* source ^short = "Fuente del evento de auditoría."
* source ^definition = "Información sobre la fuente que generó el evento de auditoría."

* source.observer 1..1 MS
* source.observer ^short = "Observador de la fuente."
* source.observer ^definition = "Referencia al recurso FHIR que representa al observador de la fuente del evento de auditoría."
* source.observer only Reference(CRCoreOrganization or CRCorePractitioner)