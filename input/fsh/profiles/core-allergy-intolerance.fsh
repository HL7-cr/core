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


Profile: CRCoreAllergyIntolerance
Parent: AllergyIntolerance
Id: cr-core-allergy-intolerance
Title: "Alergia e Intolerancia"
Description: "Perfil AllergyIntolerance para registrar alergias e intolerancias de pacientes, incluyendo metadatos específicos relacionados con reacciones adversas y su manejo."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

* identifier 0..* MS
* clinicalStatus 1..1 MS
* clinicalStatus from http://hl7.org/fhir/ValueSet/allergyintolerance-clinical (required)
  * ^short = "active | inactive | resolved"
  * ^definition = "Estado clínico de la alergia o intolerancia."
  * ^comment = "Se recomienda utilizar este campo para reflejar el estado clínico actual de la alergia o intolerancia."

* verificationStatus 1..1 MS
* verificationStatus from http://hl7.org/fhir/ValueSet/allergyintolerance-verification (required)
  * ^short = "unconfirmed | confirmed | refuted"
  * ^definition = "Estado de verificación de la alergia o intolerancia."

* type 0..1 MS
  * ^short = "allergy | intolerance"
  * ^definition = "Tipo de reacción: alergia o intolerancia."

* category 0..* MS
* category from AllergyIntoleranceCategory (required)
  * ^short = "food | medication | environment | biologic | vaccine"
  * ^definition = "Categoría de la alergia o intolerancia."

* code 1..1 MS
* code from ConditionProblemDiagnosisCodes (required)
  * ^short = "Código SNOMED-CT de la alergia o intolerancia."
  * ^definition = "Código SNOMED-CT de la alergia o intolerancia."

* patient 1..1 MS
* patient only Reference(CRCorePatient)
  * ^short = "Paciente al que se le asocia la alergia o intolerancia."
  * ^definition = "Paciente al que se le asocia la alergia o intolerancia."

* onset[x] MS
* onset[x] only dateTime
  * ^short = "Fecha y hora de inicio de la alergia o intolerancia."
  * ^definition = "Fecha y hora de inicio de la alergia o intolerancia."

* recordedDate 0..1 MS
* recordedDate only dateTime
  * ^short = "Fecha y hora en que se registró la alergia o intolerancia."
  * ^definition = "Fecha y hora en que se registró la alergia o intolerancia."

* reaction 0..* MS
  * ^short = "Reacción asociada a la alergia o intolerancia."
  * ^definition = "Descripción de la reacción asociada a la alergia o intolerancia."

* reaction.manifestation 1..* MS
* reaction.manifestation from SNOMEDCTClinicalFindings (required)
  * ^short = "Manifestación clínica de la reacción."
  * ^definition = "Manifestación clínica observada durante la reacción alérgica o intolerancia."

* reaction.severity 0..1 MS
  * ^short = "Gravedad de la reacción. mild | severe | moderate"
  * ^definition = "Gravedad de la reacción alérgica o intolerancia."
  * ^comment = "Se recomienda utilizar este campo para reflejar la gravedad de la reacción."

* reaction.description 0..1 MS
  * ^short = "Descripción de la reacción."
  * ^definition = "Descripción detallada de la reacción alérgica o intolerancia."

* note 0..* MS
  * ^short = "Notas adicionales sobre la alergia o intolerancia."
  * ^definition = "Notas adicionales que el profesional de salud considere relevantes sobre la alergia o intolerancia."