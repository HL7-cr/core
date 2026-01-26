# Perfiles

Esta sección documenta los 13 perfiles FHIR definidos en la Guía de Implementación Core de HL7 FHIR Costa Rica.

## Perfiles de Datos Demográficos

### CRCoreAddress
**Perfil para Dirección**

Define cómo estructurar información de dirección según estándares costarricenses.

**Elemento Base:** Address (DataType)

**Elementos Clave:**
- Tipo de dirección (home, work, temp, etc.)
- Líneas de dirección
- Ciudad/Municipio
- Provincia/Estado
- Código postal
- País
- Período de validez

---

### CRCorePatient
**Perfil para Paciente**

Define cómo representar información demográfica y clínica básica de un paciente en Costa Rica.

**Elemento Base:** Patient

**Elementos Clave:**
- Identificadores: Cédula, Pasaporte, otros ID locales
- Datos demográficos: Nombre, fecha de nacimiento, sexo
- Contacto: Teléfono, email, dirección
- Datos de fallecimiento
- Información de enlazamiento de pacientes

---

### CRCorePractitioner
**Perfil para Profesional de Salud**

Define la representación de un profesional sanitario (médico, enfermero, etc.) en el sistema.

**Elemento Base:** Practitioner

**Elementos Clave:**
- Identificadores: Cédula, Pasaporte, Licencia profesional
- Datos demográficos: Nombre, sexo
- Información de contacto
- Especialidades
- Número de colegiado

---

### CRCoreOrganization
**Perfil para Organización de Salud**

Define la estructura de instituciones sanitarias, clínicas, laboratorios, etc.

**Elemento Base:** Organization

**Elementos Clave:**
- Identificadores: CAJA, EBAIS, códigos locales
- Nombre y nombre comercial
- Tipo de organización
- Información de contacto
- Ubicación física
- Horas de operación
- Información de acreditación

---

### CRCorePractitionerRole
**Perfil para Rol de Profesional**

Define el rol que desempeña un profesional de salud en una organización específica.

**Elemento Base:** PractitionerRole

**Elementos Clave:**
- Profesional asociado
- Organización
- Especialidad
- Ubicación de trabajo
- Horarios de disponibilidad
- Métodos de contacto

---

### CRCoreLocation
**Perfil para Ubicación/Localización**

Define sitios físicos donde se prestan servicios de salud.

**Elemento Base:** Location

**Elementos Clave:**
- Nombre de la ubicación
- Dirección física
- Coordenadas geográficas
- Organización responsable
- Tipo de ubicación
- Horarios de atención
- Teléfono y contacto

---

## Perfiles de Datos Clínicos

### CRCoreCondition
**Perfil para Condición/Diagnóstico**

Define cómo registrar condiciones clínicas, diagnósticos y problemas de salud.

**Elemento Base:** Condition

**Elementos Clave:**
- Código de diagnóstico (ICD-10-CM o SNOMED CT)
- Paciente afectado
- Clínico responsable
- Fecha de inicio y término
- Estado de la condición
- Severidad
- Notas clínicas

---

### CRCoreAllergyIntolerance
**Perfil para Alergia e Intolerancia**

Define alergias e intolerancias a sustancias que afectan al paciente.

**Elemento Base:** AllergyIntolerance

**Elementos Clave:**
- Sustancia alérgena (medicamento, alimento, etc.)
- Paciente
- Tipo de reacción
- Severidad
- Manifestaciones clínicas
- Fecha de identificación
- Clínico que identifica

---

### CRCoreImmunization
**Perfil para Inmunización/Vacunación**

Define registro de vacunas administradas.

**Elemento Base:** Immunization

**Elementos Clave:**
- Vacuna administrada
- Paciente
- Fecha de administración
- Administrador
- Lote/Serie
- Sitio de administración
- Vía
- Dosis
- Reacciones adversas
- Razón de no administración (si aplica)

---

## Perfiles de Documentación Clínica

### CRCoreComposition
**Perfil para Composición/Documento Clínico**

Define documentos clínicos como notas de evolución, informes médicos, etc.

**Elemento Base:** Composition

**Elementos Clave:**
- Tipo de documento
- Paciente
- Autor/Profesional
- Fecha de creación
- Estatus
- Secciones del documento
- Organización responsable

---

### CRCoreBundleDoc
**Perfil para Agrupación de Documentos**

Define cómo agrupar múltiples recursos relacionados con un documento clínico.

**Elemento Base:** Bundle

**Elementos Clave:**
- Tipo de bundle (document, transaction, etc.)
- Identificador único
- Timestamp
- Entrada con recursos relacionados

---

### CRCoreAuditEvent
**Perfil para Evento de Auditoría**

Define el registro de acciones en el sistema para fines de auditoría y seguridad.

**Elemento Base:** AuditEvent

**Elementos Clave:**
- Tipo de evento
- Subtipo
- Acción realizada
- Resultado del evento
- Timestamp
- Usuario/Agente responsable
- Recursos afectados
- Dirección IP

---

### CRCoreProvenance
**Perfil para Provenance/Trazabilidad**

Define el origen y trazabilidad de los datos e información clínica.

**Elemento Base:** Provenance

**Elementos Clave:**
- Recursos relacionados
- Agentes involucrados
- Actividades realizadas
- Timestamp
- Firma digital (si aplica)
- Información de autorización

---

## Conformidad

Todos los perfiles son:
- ✅ Basados en FHIR R5
- ✅ Validables automáticamente
- ✅ Documentados con ejemplos
- ✅ Alineados con estándares internacionales
- ✅ Adaptados al contexto costarricense

---

*Última actualización: Enero 2026*
