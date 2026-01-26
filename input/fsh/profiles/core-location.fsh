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


Profile: CRCoreLocation
Parent: Location
Id: cr-core-location
Title: "Ubicación"
Description: "Perfil Location para representar ubicaciones físicas como hospitales, clínicas, centros de salud y otros lugares relevantes en Costa Rica."

* insert ProfileMeta
* insert RuleSetStatus (0, draft, pc)

* identifier 0..* MS
* identifier ^short = "Identificadores de la ubicación (Cédula Jurídica, Código de Prestador, etc.)."
* identifier ^definition = "Lista de identificadores únicos de la ubicación. Incluye Cédula Jurídica del Registro Nacional y Código de Prestador de Servicios de Salud."

* identifier.use MS
* identifier.use ^short = "official | usual | temp | secondary | old"
* identifier.use ^definition = "Propósito del identificador. Se recomienda usar 'official' para la Cédula Jurídica."

* identifier.type MS
* identifier.type ^short = "Tipo de identificador"
* identifier.type ^definition = "Tipo de identificador: Cédula Jurídica, Código de Prestador u otro tipo de identificación."
* identifier.type from $OrganizationIdentifierTypesSet (extensible)
* identifier.type ^binding.description = "CodeSystem de tipos de identificadores para ubicaciones en Costa Rica."

* identifier.system MS
* identifier.system ^short = "Sistema que emite el identificador"
* identifier.system ^definition = "Identificador único del sistema que emite o registra el identificador de la ubicación."

* identifier.value MS
* identifier.value ^short = "El valor del identificador"
* identifier.value ^definition = "Valor único del identificador dentro del sistema."

* status 0..1 MS
* status ^short = "Estado de la ubicación."
* status ^definition = "Indica si la ubicación está activa y operativa. Un valor 'active' significa que la ubicación está en uso; 'suspended' indica que está temporalmente inactiva; 'inactive' indica que ha sido desactivada."
* status from LocationStatus (required)
* status ^binding.description = "ValueSet de estados de Location definidos en FHIR."

* name 1..1 MS
* name ^short = "Nombre de la ubicación."
* name ^definition = "Nombre oficial de la ubicación, tal como aparece registrada en el Registro Nacional."
* name ^comment = "Se recomienda usar el nombre oficial registrado."

* alias 0..* MS
* alias ^short = "Nombres alternativos o apodos de la ubicación."
* alias ^definition = "Nombres alternativos, apodos o nombres comunes utilizados para referirse a la ubicación."

* address 0..1 MS
* address ^short = "Dirección física de la ubicación."
* address ^definition = "Dirección postal completa de la ubicación, incluyendo calle, ciudad, provincia y código postal."
* address ^comment = "Se recomienda usar direcciones oficiales registradas."
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

* contact 0..* MS
* contact ^short = "Contacto(s) de la ubicación."
* contact ^definition = "Persona responsable o punto de contacto dentro de la ubicación."

* contact.name 0..1 MS
* contact.name ^short = "Nombre del contacto."
* contact.name ^definition = "Nombre completo de la persona de contacto."

* contact.telecom 0..* MS
* contact.telecom ^short = "Información de contacto."
* contact.telecom ^definition = "Teléfono, correo u otro dato para contactar a la persona."

* position 0..1 MS
* position ^short = "Coordenadas geográficas de la ubicación."
* position ^definition = "Coordenadas geográficas (latitud y longitud) que representan la ubicación física."
* position.latitude 1..1 MS
* position.latitude ^short = "Latitud de la ubicación."
* position.latitude ^definition = "Valor decimal que representa la latitud de la ubicación."
* position.longitude 1..1 MS
* position.longitude ^short = "Longitud de la ubicación."
* position.longitude ^definition = "Valor decimal que representa la longitud de la ubicación."
* position.altitude 0..1 MS
* position.altitude ^short = "Altitud de la ubicación."
* position.altitude ^definition = "Valor decimal que representa la altitud de la ubicación en metros sobre el nivel del mar."

* partOf 0..1 MS
* partOf ^short = "Ubicación superior de la cual esta ubicación forma parte."
* partOf ^definition = "Referencia a otra ubicación de la cual esta ubicación es parte. Por ejemplo, una sala es parte de un hospital o consultorio."
* partOf only Reference(CRCoreLocation)