### Consideraciones Importantes
- Esta Guía de Implementación se encuentra en fase **Draft (Borrador)** y está actualmente en revisión y desarrollo.
- Esta guía **NO debe utilizarse en ambientes de producción** hasta que sea oficializada como normativa por el **Ministerio de Salud de Costa Rica**
- El **Ministerio de Salud de Costa Rica** es ente competente que oficializa las Guías de Implementación FHIR como normativas a nivel nacionales. Solo las guías que han sido formalmente aprobadas y publicadas como normativas pueden ser utilizadas en sistemas de producción y en la prestación de servicios de salud o las que esten basadas en la CR Core.
- Para conocer el estado oficial de esta guía, contacte al Ministerio de Salud o a la Iniciativa HL7 Costa Rica en: **info@hl7.or.cr**

### Introducción
Esta guía de implementación y los perfiles (Core) se han convertido en la base de las guías de implementación de FHIR en el ámbito de Costa Rica. Esta versión refleja los cambios en los Datos Básicos (Set Mínimo de Datos interoperables) de Costa Rica para la Interoperabilidad, así como los comentarios y solicitudes de la comunidad de FHIR en el ámbito de Costa Rica (La página de la Hoja de Ruta de CRE Core describe este enfoque para las actualizaciones). CR Core se ha beneficiado de las pruebas y la orientación de los equipos multisectorieales del país. Sus comentarios siguen sentando las bases para documentar el diseño, las interacciones, los requisitos y las directrices de los perfiles de CR Core para el acceso a los datos de pacientes. Bajo la dirección de la iniciativa de HL7 Costa Rica, el Comité Técnico de Salud Digital y el Ministerio de Salud de Costa Rica, el contenido se ampliará en futuras versiones para satisfacer las necesidades específicas del ámbito de Costa Rica.

La Guía de Implementación de CR Core se basa en la versión R5 de FHIR. Define las restricciones mínimas de los recursos de FHIR para crear los perfiles de CR Core. Se identifican los elementos, extensiones, vocabularios y conjuntos de valores que DEBEN estar presentes y se define su uso. También documenta las interacciones RESTful mínimas de FHIR para que cada perfil de CR Core acceda a los datos de los pacientes. El establecimiento de estándares mínimos para promover la interoperabilidad y la adopción mediante una implementación común permite una mayor evolución del desarrollo de estándares para casos de uso específicos. Existen dos maneras diferentes de implementar CR Core:

1. Soporte solo para perfiles: los sistemas pueden admitir solo los perfiles principales de Costa Rica para representar información clínica.
2. Soporte de perfil + Soporte de interacción: los sistemas pueden soportar tanto la estructura de contenido del perfil principal de Costa Rica como las interacciones RESTful definidas para un recurso.

Para obtener una descripción detallada de estos diferentes usos de CR Core, consulte la página de Requisitos de conformidad.

### Contexto
La transformación digital del sistema de salud en Costa Rica requiere mecanismos estandarizados que permitan el intercambio oportuno, seguro y confiable de información clínica y administrativa entre los distintos actores del ecosistema de salud. La diversidad de sistemas de información, proveedores tecnológicos y niveles de madurez digital ha generado históricamente silos de información que dificultan la continuidad de la atención, la toma de decisiones basada en datos y la interoperabilidad a nivel nacional y regional.

En este contexto, la adopción del estándar HL7 FHIR (Fast Healthcare Interoperability Resources) se establece como un habilitador fundamental para lograr la interoperabilidad semántica, técnica y organizacional. FHIR proporciona un marco moderno, extensible y ampliamente adoptado que facilita el intercambio de información en salud mediante el uso de recursos bien definidos, perfiles, extensiones y vocabularios controlados.

La Guía de Implementación CORE FHIR de Costa Rica define el conjunto mínimo de perfiles, extensiones, terminologías y reglas de conformidad necesarias para asegurar una base común de interoperabilidad entre los sistemas que intercambian información en el país. Esta guía busca establecer un lenguaje compartido que permita la evolución progresiva de los sistemas de información en salud, respetando la autonomía tecnológica de las organizaciones, pero garantizando la coherencia y compatibilidad a nivel nacional.

Asimismo, esta guía sirve como fundamento para el desarrollo de casos de uso prioritarios, la construcción de guías de implementación específicas por dominio (por ejemplo, atención clínica, laboratorio, imágenes médicas, salud pública) y la alineación con iniciativas regionales e internacionales, promoviendo la reutilización, la sostenibilidad y la escalabilidad de las soluciones de interoperabilidad en el sistema de salud costarricense.

### Uso
CR Core es particularmente útil para definir:
- Un nivel comprobable de conformidad del sistema.
- Se asume el soporte de las aplicaciones del cliente.
- La base de las guías de implementación posteriores.

La implementación de las capacidades definidas en CR Core permite desarrollar especificaciones, aplicaciones y lógica de negocio con confianza. Este documento es una especificación funcional que los desarrolladores de sistemas FHIR®© pueden implementar directamente.

Los eventos Connectathon de FHIR®© son clave para verificar la idoneidad de la guía para su implementación. Esta guía de implementación se utilizará como base para los eventos Connectathon costarricenses.

### Como Leer Esta Guía
Esta Guía de Implementación está diseñada para desarrolladores, arquitectos de software, administradores de TI y profesionales de la salud que buscan implementar soluciones basadas en el estándar HL7 FHIR en Costa Rica. Se recomienda comenzar explorando los perfiles disponibles y sus especificaciones técnicas para integrarlos en aplicaciones y sistemas existentes.

### Licencia y Términos Legales
Esta guía está disponible bajo licencia **Creative Commons Attribution 4.0 International (CC BY 4.0)**.

Usted es libre de:
- Compartir y distribuir la guía
- Adaptar la guía para sus necesidades
- Usar comercialmente

Bajo los términos de:
- Atribución apropiada a HL7 Costa Rica
- Sin garantías adicionales más allá de las especificadas

Para más información, visite [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

### Autores y Colaboración
Esta guía es producto del trabajo colaborativo realizado con participantes de:

| Nombre                           | Rol                                         | Organización/Institución                    |
| -------------------------------- | ------------------------------------------- | ------------------------------------------- |
| Ing. Alejandro Benavides         | Coordinación, Autor y Asedor                | Meddyg - DHIT Costa Rica                    |
| Ing. Deivert Sivianny Guiltrichs | Coordinación Nacional                       | Ministerio de Salud                         |
| Ing. Pedro Meckbel               | Coordinación Nacional                       | Ministerio de Salud                         |
| Ing. Manuel Rodriguez            | Coordinación Institucional                  | Caja Costarricense del Seguro Social (CCSS) |
| Dr.  Eduardo Rodríguez           | Coordinación Institucional y Asesor Clínico | Caja Costarricense del Seguro Social (CCSS) |
| Lic. Paul Fervoy                 | Asesor Técnico                              | Siftia - CAMTIC                             | 
| Dr.  Daniel Quesada              | Coordinación Nacional y Estratégico         | Ministerio de Salud                         | 

