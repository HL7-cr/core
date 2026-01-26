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


Profile: CRCoreBundleDoc
Parent: Bundle
Id: cr-core-bundle-doc
Title: "Documento Clínico Electrónico"
Description: "Perfil Bundle para representar documentos clínicos electrónicos en formato Bundle, incluyendo soporte para firma digital y metadatos específicos del documento."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

// Soporte para etiquetas de seguridad
* meta.security ^short = "Etiqueta de seguridad"
* meta.security ^definition = "Las etiquetas de seguridad se pueden utilizar para proteger información sensible del paciente, como nombre y dirección. Se recomienda usar la etiqueta 'R' (Restricted) del vocabulario HL7 v3 ActCode cuando sea necesario proteger datos de pacientes."
* meta.security from Confidentiality

* identifier 1..1 MS
* identifier ^short = "Identificador único del documento clínico."
* identifier ^definition = "Identificador único del documento clínico, como un número de informe o código asignado por el sistema de gestión de documentos."

* type 1..1 MS
* type ^short = "Tipo de documento clínico."
* type ^definition = "Tipo de documento clínico representado en el Bundle, como informe médico, nota de evolución, etc."
* type from BundleType (required)
* type ^binding.description = "ValueSet de tipos de Bundle definidos en FHIR."

* timestamp 1..1 MS
* timestamp ^short = "Fecha y hora de creación del documento clínico."
* timestamp ^definition = "Fecha y hora en que se creó el documento clínico."

* entry 1..* MS
* entry ^short = "Entradas del documento clínico."
* entry ^definition = "Lista de recursos FHIR que componen el documento clínico, como Patient, Practitioner, Observation, etc."

* signature 1..1 MS
* signature ^short = "Firma digital del documento clínico."
* signature ^definition = "Firma digital que autentica el documento clínico, asegurando su integridad y origen."
* signature ^comment = "Se recomienda incluir una firma digital para garantizar la autenticidad del documento clínico. Para Costa Rica se debe soportar el formato de firma digital JAdES."

* signature.type 1..* MS
* signature.type ^short = "Tipo de firma digital."
* signature.type ^definition = "Tipo de firma digital utilizada en el documento clínico."
* signature.type from http://hl7.org/fhir/ValueSet/signature-type (required)
* signature.type ^binding.description = "ValueSet de tipos de firma definidos en FHIR."

* signature.when 1..1 MS
* signature.when ^short = "Fecha y hora de la firma digital."
* signature.when ^definition = "Fecha y hora en que se realizó la firma digital del documento clínico."

* signature.who 1..1 MS
* signature.who ^short = "Entidad que realizó la firma digital."
* signature.who ^definition = "Referencia a la entidad (persona u organización) que realizó la firma digital del documento clínico."
* signature.who only Reference(CRCorePractitioner or CRCoreOrganization)

* signature.onBehalfOf 0..1 MS
* signature.onBehalfOf ^short = "Firma en representación de otra entidad."
* signature.onBehalfOf ^definition = "Referencia a la entidad en cuyo nombre se realizó la firma digital del documento clínico."
* signature.onBehalfOf only Reference(CRCoreOrganization)

* signature.targetFormat 0..1 MS
* signature.targetFormat ^short = "Formato de destino del documento clínico."
* signature.targetFormat ^definition = "Formato en el que se desea representar el documento clínico al exportarlo o compartirlo."
* signature.targetFormat = #json

* signature.sigFormat 0..1 MS
* signature.sigFormat ^short = "Formato de la firma digital."
* signature.sigFormat ^definition = "Formato utilizado para la firma digital del documento clínico."
* signature.sigFormat = #jades

// No utilizamos issues en la IG de Costa Rica
* issues 0..0