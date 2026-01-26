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


Profile: CRCoreProvenance
Parent: Provenance
Id: cr-core-provenance
Title: "Procedencia"
Description: "Perfil Provenance para registrar la procedencia de recursos clínicos y administrativos, incluyendo metadatos específicos de auditoría y trazabilidad."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

* target 1..* MS
* target ^short = "Recursos objetivo de la procedencia."
* target ^definition = "Lista de referencias a los recursos FHIR cuya procedencia se está registrando."
* target only Reference(Resource)

* target.reference 0..1 MS
* target.reference ^short = "Referencia al recurso objetivo."
* target.reference ^definition = "URL o referencia al recurso FHIR objetivo cuya procedencia se está registrando."

* recorded 1..1 MS
* recorded ^short = "Fecha y hora en que se registró la procedencia."
* recorded ^definition = "Fecha y hora en que se registró la información de procedencia."
* location 0..1 MS
* location ^short = "Ubicación asociada a la procedencia."
* location ^definition = "Referencia a la ubicación (Location) donde se generó o modificó el recurso."
* location only Reference(CRCoreLocation)

* activity 0..1 MS
* activity ^short = "Actividad que generó la procedencia."
* activity ^definition = "Código que describe la actividad o acción que generó la procedencia del recurso."
* activity from http://hl7.org/fhir/ValueSet/provenance-activity-type (extensible)
* activity ^binding.description = "ValueSet de actividades de procedencia definidas en FHIR."

* agent 1..* MS
* agent ^short = "Agentes involucrados en la procedencia."
* agent ^definition = "Lista de agentes (personas, organizaciones, dispositivos) que participaron en la creación o modificación del recurso."

* agent.type 1..1 MS
* agent.type ^short = "Tipo de agente."
* agent.type ^definition = "Tipo de agente que participó en la procedencia (por ejemplo, autor, editor, verificador)."
* agent.type from http://hl7.org/fhir/ValueSet/participation-role-type (required)
* agent.type ^binding.description = "ValueSet de tipos de agentes de procedencia definidos en FHIR."

* agent.who 1..1 MS
* agent.who ^short = "Referencia al agente."
* agent.who ^definition = "Referencia al recurso que representa al agente (Practitioner, Organization, Device, etc.) que participó en la procedencia."
* agent.who only Reference(CRCorePractitioner or CRCoreOrganization or CRCorePatient or Device or CareTeam or RelatedPerson or PractitionerRole)
* agent.who ^comment = "Se recomienda referenciar recursos perfilados en HL7 FHIR Costa Rica - Core cuando sea posible."

* agent.role 0..1 MS
* agent.role ^short = "Rol del agente en la procedencia."
* agent.role ^definition = "Rol específico que desempeñó el agente en la creación o modificación del recurso."
* agent.role from http://hl7.org/fhir/ValueSet/security-role-type (extensible)
* agent.role ^binding.description = "ValueSet de roles de agentes de procedencia definidos en FHIR."

* signature 0..* MS
* signature ^short = "Firma digital de la procedencia."
* signature ^definition = "Firma digital que autentica la información de procedencia, asegurando su integridad y origen."
* signature ^comment = "Se recomienda incluir firmas digitales para garantizar la autenticidad de la procedencia. Para Costa Rica se debe soportar el formato de firma digital JAdES."
