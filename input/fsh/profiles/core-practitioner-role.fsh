/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® Profile Resource
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


Profile: CRCorePractitionerRole
Parent: PractitionerRole
Id: cr-core-practitioner-role
Title: "Rol de Profesional de la Salud"
Description: "Perfil PractitionerRole que describe la relación entre un profesional de la salud y una organización específica, incluyendo el rol, especialidad y contacto en esa organización."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

* identifier 0..* MS
* identifier ^short = "Identificadores del rol del profesional en la organización."
* identifier ^definition = "Identificadores únicos del rol del profesional en una organización específica, como número de empleado o credencial institucional."

* active 1..1 MS
* active ^short = "Si el profesional está activo en este rol."
* active ^definition = "Indica si el profesional está activo desempeñando este rol en la organización. Un valor 'true' significa que está ejerciendo actualmente; 'false' indica que ha dejado ese rol."

* practitioner 1..1 MS
* practitioner ^short = "Referencia al profesional de la salud."
* practitioner ^definition = "Referencia al recurso Practitioner que describe los datos personales e información inmutable del profesional."
* practitioner only Reference(CRCorePractitioner)

* organization 1..1 MS
* organization ^short = "Organización donde el profesional desempeña el rol."
* organization ^definition = "Referencia a la organización (hospital, clínica, EBAIS, etc.) donde el profesional trabaja en este rol."
* organization only Reference(CRCoreOrganization)

* code 0..* MS
* code ^short = "Rol(es) del profesional en la organización."
* code ^definition = "Código(s) que describen el rol del profesional en esta organización específica (médico, enfermera, técnico, etc.)."
* code from $PractitionerRolesSet (extensible)
* code ^binding.description = "ValueSet de roles de profesionales de salud en Costa Rica."

* specialty 0..* MS
* specialty ^short = "Especialidad(es) del profesional en esta organización."
* specialty ^definition = "Especialidad o subespecialidad que desempeña el profesional en esta organización. Permite especificar especialidades específicas del profesional."
* specialty from $PractitionerSpecialtiesSet (extensible)
* specialty ^binding.description = "ValueSet de especialidades de profesionales de salud en Costa Rica."

* location 0..* MS
* location ^short = "Ubicación(es) donde el profesional trabaja en la organización."
* location ^definition = "Ubicación física (departamento, clínica, sede) dentro de la organización donde el profesional atiende."

* endpoint 0..* MS
* endpoint ^short = "Punto de acceso técnico para contactar al profesional."
* endpoint ^definition = "Referencia a puntos de acceso técnicos (como sistemas de citas electrónicas, telemedicina) específicos para este rol."
