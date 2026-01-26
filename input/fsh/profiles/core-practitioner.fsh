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


Profile: CRCorePractitioner
Parent: Practitioner
Id: cr-core-practitioner
Title: "Profesional de la Salud"
Description: "Perfil Practitioner para representar a los médicos, enfermeros, técnicos y otros profesionales de salud."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

* identifier 1..* MS
* identifier ^short = "Identificadores del profesional (cédula, cédula jurídica, etc.)."
* identifier ^definition = "Lista de identificadores únicos del profesional. Incluye cédula de identidad o DIMEX del profesional."

* identifier.use MS
* identifier.use ^short = "official | usual | temp | secondary | old"
* identifier.use ^definition = "Propósito del identificador. Se recomienda usar 'official' para la cédula costarricense."

* identifier.type MS
* identifier.type ^short = "Tipo de documento de identificación"
* identifier.type ^definition = "Tipo de identificación: cédula nacional, DIMEX, pasaporte u otro documento válido."
* identifier.type from $IdentifierTypesSet (required)
* identifier.type ^binding.description = "ValueSet de tipos de identificación para profesionales en Costa Rica."

* identifier.system MS
* identifier.system ^short = "Sistema que emite el identificador"
* identifier.system ^definition = "Identificador único del sistema que emite o registra el identificador del profesional."

* identifier.value MS
* identifier.value ^short = "Valor del identificador"
* identifier.value ^definition = "Valor único del identificador dentro del sistema."

* active 1..1 MS
* active ^short = "Si el profesional está activo."
* active ^definition = "Indica si el profesional está activo en el sistema. Un valor 'true' significa que el profesional está habilitado para ejercer; 'false' indica que está inactivo o suspendido."

* name 1..1 MS
* name ^short = "Nombre(s) y apellido(s) del profesional."
* name ^definition = "Nombre y apellidos del profesional. Se recomienda usar el nombre oficial tal como aparece en documentos de identidad."

* name.given 1..2 MS
* name.given ^short = "Primer nombre obligatorio, segundo nombre opcional."
* name.given ^definition = "Nombre(s) de pila. Se permite máximo dos nombres."

* name.family 1..1 MS
* name.family ^short = "Apellidos del profesional."
* name.family ^definition = "Apellidos del profesional. Se recomienda incluir los dos apellidos separados por un espacio en este campo."

* gender 1..1 MS
* gender ^short = "Sexo biológico del profesional."
* gender ^definition = "Sexo biológico del profesional. Se restringe a male (hombre) o female (mujer)."
* gender from $BiologicalSexSet (required)

* birthDate 0..1 MS
* birthDate ^short = "Fecha de nacimiento del profesional."
* birthDate ^definition = "Fecha de nacimiento del profesional (opcional)."

* deceased[x] 0..1 MS
* deceased[x] ^short = "Información sobre el fallecimiento del profesional."
* deceased[x] ^definition = "Indica si el profesional ha fallecido. Puede ser un indicador booleano o una fecha específica."
* deceasedBoolean 0..1 MS
* deceasedBoolean ^short = "Indica si el profesional ha fallecido (sí/no)."
* deceasedDateTime 0..1 MS
* deceasedDateTime ^short = "Fecha y hora exacta del fallecimiento."

* telecom 0..* MS
* telecom ^short = "Información de contacto del profesional (teléfono, correo, etc.)."
* telecom ^definition = "Teléfono, correo electrónico u otro medio de contacto para comunicarse con el profesional."

* telecom.system MS
* telecom.system ^short = "phone | fax | email | pager | url | sms | other"
* telecom.system ^definition = "Tipo de medio de comunicación."

* telecom.value MS
* telecom.value ^short = "Número telefónico o dirección de correo electrónico."
* telecom.value ^definition = "Valor del punto de contacto."

* telecom.use MS
* telecom.use ^short = "Propósito del contacto"
* telecom.use ^definition = "Propósito de este punto de contacto (principal, trabajo, móvil, etc.)."

* address 0..* MS
* address ^short = "Dirección(es) del profesional."
* address ^definition = "Una o más direcciones postales del profesional en Costa Rica. La dirección incluye provincia, cantón, distrito y detalles específicos de ubicación."
* address only CRCoreAddress

* address.use MS
* address.use ^short = "home | work | temp | old | billing"
* address.use ^definition = "Propósito de la dirección (principal, trabajo, temporal, etc.)."

* address.type MS
* address.type ^short = "postal | physical | both"
* address.type ^definition = "Tipo de dirección (postal, física o ambas)."

* address.line 1..* MS
* address.line ^short = "Línea de dirección (calle, número, referencias)."
* address.line ^definition = "Calle, número, apartamento y otras líneas de dirección específicas. Mínimo una línea requerida."

* address.district 0..1 MS
* address.district ^short = "Distrito de Costa Rica."
* address.district ^definition = "Nombre del distrito. Incluye una extensión con el código del distrito basado en el ZipCode de Costa Rica."

* address.city 0..1 MS
* address.city ^short = "Cantón de Costa Rica."
* address.city ^definition = "Nombre del cantón (ciudad). Incluye una extensión con el código del cantón basado en el ZipCode de Costa Rica."

* address.state 0..1 MS
* address.state ^short = "Provincia de Costa Rica."
* address.state ^definition = "Nombre de la provincia. Incluye una extensión con el código de la provincia basado en el ZipCode de Costa Rica."

* address.postalCode 0..1 MS
* address.postalCode ^short = "Código postal."
* address.postalCode ^definition = "Código postal o código de localidad de Costa Rica (opcional)."

* address.country 0..1 MS
* address.country ^short = "Nombre del país (CR)."
* address.country ^definition = "Nombre del país. Incluye una extensión con el código ISO 3166-1 alpha-3 (CR para Costa Rica)."

* qualification 0..* MS
* qualification ^short = "Calificaciones, credenciales y licencias del profesional."
* qualification ^definition = "Credenciales profesionales, licencias, certificados y especializaciones del profesional."

* qualification.identifier 1..* MS
* qualification.identifier ^short = "Identificador único e inmutable de la calificación (número de colegiado, licencia, etc.)."
* qualification.identifier ^definition = "Identificador único y permanente de la calificación profesional, como número de colegiado expedido por el colegio profesional. Este identificador no cambia independientemente de donde el profesional trabaje o se traslade a otra organización."

* qualification.code 1..1 MS
* qualification.code ^short = "Código de la calificación o rol del profesional."
* qualification.code ^definition = "Código del rol o especialidad profesional. Utiliza el CodeSystem de roles de profesionales de Costa Rica."
* qualification.code from $PractitionerRolesSet (extensible)
* qualification.code ^binding.description = "CodeSystem de roles y especialidades de profesionales de salud en Costa Rica."

* qualification.issuer 0..1 MS
* qualification.issuer ^short = "Organización que emitió la calificación o credencial."
* qualification.issuer ^definition = "Referencia a la organización (como colegio profesional o institución educativa) que emitió la calificación o credencial."
