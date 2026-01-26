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


Profile: CRCorePatient
Parent: Patient
Id: cr-core-patient
Title: "Paciente"
Description: "Perfil Patient para representar pacientes en Costa Rica, incluyendo identificadores oficiales y metadatos específicos del paciente."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

// Soporte para etiquetas de seguridad
* meta.security ^short = "Etiqueta de seguridad"
* meta.security ^definition = "Las etiquetas de seguridad se pueden utilizar para proteger información sensible del paciente, como nombre y dirección. Se recomienda usar la etiqueta 'R' (Restricted) del vocabulario HL7 v3 ActCode cuando sea necesario proteger datos de pacientes."
* meta.security from Confidentiality

// TODO: Qué pasa en caso de que el paciente no tenga identificador?
// Aplica invariantes de identificación a todo el recurso
* obeys only-one-cedula and only-one-dimex

* identifier 1..* MS
* identifier ^short = "Identificadores oficiales y alternativos del paciente."
* identifier ^definition = "Lista de todos los documentos de identificación asociados a un paciente en Costa Rica. Incluye cédula de identidad, DIMEX, pasaporte u otros documentos válidos."

* identifier.use MS
* identifier.use ^short = "usual | official | temp | secondary | old"
* identifier.use ^definition = "Indica el rol del identificador. Si el paciente posee una cédula de identidad costarricense, esta se recomienda como identificador 'official'."

// TODO: Revisar si se require más de un tipo de identificador
* identifier.type ^short = "Tipo de documento de identificación (Required)"
* identifier.type ^definition = "Define el tipo de documento de identificación del paciente. Incluye cédula costarricense, DIMEX y pasaporte. Este perfil utiliza un conjunto de códigos nacionales para garantizar consistencia en la identificación."
* identifier.type from $IdentifierTypesSet (required)
* identifier.type ^binding.description = "ValueSet de tipos de identificación oficiales y permitidos para pacientes en Costa Rica."

// Nombres y apellidos
* name 1..1 MS
* name ^short = "Nombre(s) y apellido(s) del paciente."
* name ^definition = "El nombre completo del paciente, incluyendo nombre(s) y apellido(s). Se recomienda utilizar el nombre oficial registrado en documentos de identidad."

// Se modela como:
// - given[0]: primer nombre (obligatorio)
// - given[1]: segundo nombre (opcional)
// No se permiten más de dos nombres de pila.
* name.given 1..2 MS
* name.given ^short = "Primer nombre obligatorio, segundo nombre opcional."

// El primer apellido es obligatorio. El segundo puede incluirse en el mismo campo family
// o mediante extensiones específicas si se requieren los apellidos separados.
* name.family 1..1 MS
* name.family ^short = "Primer apellido obligatorio; puede incluir el segundo apellido."

// Aplicar invariantes al elemento name
// * name obeys cr-name-given-required and cr-name-family-required

* birthDate 1..1 MS
* birthDate ^short = "Fecha de nacimiento del paciente."
* birthDate ^definition = "Fecha de nacimiento del paciente. Este dato es obligatorio para el perfil CRCorePatient."

* gender 1..1 MS
* gender ^short = "Sexo biológico del paciente."
* gender ^definition = "Sexo biológico del paciente. Para Costa Rica se restringe a Hombre (male) o Mujer (female) en este perfil."
* gender from $BiologicalSexSet (required)

* active 0..1 MS
* active ^short = "Si el registro del paciente está activo."
* active ^definition = "Indica si el paciente está activo en el sistema. Un valor 'true' significa que el paciente tiene un registro activo y es un paciente vigente. Un valor 'false' significa que el paciente es inactivo o ha sido desactivado del sistema."

* telecom 0..* MS
* telecom ^short = "Información de contacto del paciente (teléfono, correo electrónico, etc.)."
* telecom ^definition = "Teléfono, correo electrónico u otro medio de contacto para comunicarse con el paciente. Puede incluir múltiples números telefónicos y direcciones de correo."

* telecom.system MS
* telecom.system ^short = "phone | fax | email | pager | url | sms | other"
* telecom.system ^definition = "Tipo de medio de comunicación: teléfono móvil, correo electrónico, etc."

* telecom.value MS
* telecom.value ^short = "El número telefónico o dirección de correo electrónico."
* telecom.value ^definition = "El valor del punto de contacto, como un número telefónico o dirección de correo electrónico."

* telecom.use MS
* telecom.use ^short = "home | work | temp | old | mobile"
* telecom.use ^definition = "Propósito de este punto de contacto (principal, trabajo, móvil, etc.)."

* address 0..* MS
* address ^short = "Dirección(es) del paciente."
* address ^definition = "Una o más direcciones postales del paciente en Costa Rica. La dirección incluye provincia, cantón, distrito y detalles específicos de ubicación."
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

* deceased[x] 0..1 MS
* deceased[x] ^short = "Información sobre el fallecimiento del paciente."
* deceased[x] ^definition = "Indica si el paciente ha fallecido. Puede ser un indicador booleano (deceasedBoolean) o una fecha/hora específica del fallecimiento (deceasedDateTime). Es un campo opcional."
* deceasedBoolean 0..1 MS
* deceasedBoolean ^short = "Indica si el paciente ha fallecido (sí/no)."
* deceasedDateTime 0..1 MS
* deceasedDateTime ^short = "Fecha y hora exacta del fallecimiento."

// Extensión opcional
* extension contains CRPatientCalculatedAge named calculatedAge 0..1 MS
* extension contains CRPatientReligion named religion 0..1 MS

* contact 0..* MS
* contact ^short = "Contacto(s) del paciente (familiares, tutores, etc.)."
* contact ^definition = "Contacto personal o cuidador designado del paciente. Puede incluir familiares, tutores legales o personas de contacto de emergencia con relaciones específicas definidas en el CodeSystem de relaciones de Costa Rica."

* contact.relationship 0..* MS
* contact.relationship ^short = "Tipo de relación (madre, padre, hermano, cónyuge, hijo/a, tutor, amigo, conviviente)."
* contact.relationship ^definition = "Tipo de relación entre el contacto y el paciente. Utiliza códigos SNOMED CT del CodeSystem de relaciones de Costa Rica."
* contact.relationship from $RelationsSet (extensible)
* contact.relationship ^binding.description = "CodeSystem de relaciones: madre, padre, hermano, cónyuge, hijo, tutor legal, amigo, conviviente"

* contact.name 0..1 MS
* contact.name ^short = "Nombre del contacto."
* contact.name ^definition = "Nombre completo del contacto del paciente."

* contact.telecom 0..* MS
* contact.telecom ^short = "Información de contacto (teléfono, correo, etc.)."
* contact.telecom ^definition = "Teléfono, correo electrónico u otro dato para contactar al contacto del paciente."

* contact.address 0..1 MS
* contact.address ^short = "Dirección del contacto."
* contact.address ^definition = "Dirección postal del contacto del paciente."

* contact.gender 0..1 MS
* contact.gender ^short = "Sexo del contacto."
* contact.gender ^definition = "Sexo biológico del contacto."


// INVARIANTS
Invariant: only-one-cedula
Description: "El paciente no puede tener más de una cédula costarricense."
Expression: "identifier.where(type.coding.code='cedula').count() <= 1"
Severity: #error

Invariant: only-one-dimex
Description: "El paciente no puede tener más de un DIMEX."
Expression: "identifier.where(type.coding.code='dimex').count() <= 1"
Severity: #error

// Invariant: cr-name-given-required
// Description: "El primer nombre del paciente es obligatorio."
// Expression: "given.exists()"
// Severity: #error

// Invariant: cr-name-family-required
// Description: "El primer apellido del paciente es obligatorio."
// Expression: "family.exists()"
// Severity: #error

// Invariant: cr-birthdate-required
// Description: "La fecha de nacimiento es obligatoria."
// Expression: "birthDate.exists()"
// Severity: #error

// Invariant: cr-gender-binary
// Description: "El sexo biológico es obligatorio y debe ser Hombre (male) o Mujer (female)."
// Expression: "gender.exists() and (gender = 'male' or gender = 'female')"
// Severity: #error
