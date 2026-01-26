# Perfiles

Esta sección documenta los 13 perfiles FHIR definidos en la Guía de Implementación Core de HL7 FHIR Costa Rica.

## Perfiles de Datos Demográficos

### CRCorePatient
**Perfil para Paciente**

Define cómo representar información demográfica y clínica básica de un paciente en Costa Rica.

**Elementos Clave:**
- Identificadores: Cédula, Pasaporte, otros ID locales
- Datos demográficos: Nombre, fecha de nacimiento, sexo
- Contacto: Teléfono, email, dirección
- Datos de fallecimiento
- Información de enlazamiento de pacientes

**Obligatorio:**
- Al menos un identificador
- Nombre
- Fecha de nacimiento o edad aproximada

**Datos Extendidos:**
- Idioma preferido
- Comunicación preferida
- Información de emergencia

---

### CRCorePractitioner
**Perfil para Profesional de Salud**

Define la representación de un profesional sanitario (médico, enfermero, etc.) en el sistema.

**Elementos Clave:**
- Identificadores: Cédula, Pasaporte, Licencia profesional
- Datos demográficos: Nombre, sexo
- Información de contacto
- Especialidades
- Número de colegiado

**Obligatorio:**
- Al menos un identificador
- Nombre

**Relaciones:**
- Vinculación a Organizaciones
- Calificaciones profesionales
- Áreas de práctica

---

### CRCoreOrganization
**Perfil para Organización de Salud**

Define la estructura de instituciones sanitarias, clínicas, laboratorios, etc.

**Elementos Clave:**
- Identificadores: CAJA, EBAIS, códigos locales
- Nombre y nombre comercial
- Tipo de organización
- Información de contacto
- Ubicación física
- Horas de operación
- Información de acreditación

**Obligatorio:**
- Nombre
- Tipo de organización

**Tipos Soportados:**
- Hospital
- Clínica privada
- Centro de Salud (EBAIS)
- Laboratorio
- Farmacia
- Otros proveedores

---

### CRCoreRelatedPerson
**Perfil para Persona Relacionada**

Define contactos de emergencia, cuidadores y personas relacionadas con el paciente.

**Elementos Clave:**
- Relación con el paciente
- Datos demográficos
- Información de contacto
- Idioma preferido

**Obligatorio:**
- Relación definida
- Al menos un identificador o nombre

---

## Perfiles de Datos Clínicos

### CRCoreCondition
**Perfil para Condición/Diagnóstico**

Define cómo registrar condiciones clínicas, diagnósticos y problemas de salud.

**Elementos Clave:**
- Código de diagnóstico (ICD-10-CM o SNOMED CT)
- Paciente afectado
- Clínico responsable
- Fecha de inicio y término
- Estado de la condición
- Severidad
- Notas clínicas

**Obligatorio:**
- Código de condición
- Paciente
- Estado

**Estados Soportados:**
- active (Activa)
- recurrence (Recurrencia)
- relapse (Recaída)
- inactive (Inactiva)
- remission (Remisión)
- resolved (Resuelta)

---

### CRCoreMedication
**Perfil para Medicamento**

Define medicamentos utilizados en prescripciones y administraciones.

**Elementos Clave:**
- Identificadores: Código SNOMED CT, código local
- Nombre comercial y genérico
- Forma farmacéutica
- Concentración
- Información de dosis
- Ingredientes activos

**Obligatorio:**
- Código o descripción
- Forma farmacéutica

**Información Extendida:**
- Cantidad disponible
- Fecha de expiración
- Condiciones de almacenamiento
- Fabricante

---

### CRCoreMedicationRequest
**Perfil para Prescripción de Medicamento**

Define cómo se registran las prescripciones médicas.

**Elementos Clave:**
- Medicamento prescrito
- Paciente
- Prescriptor
- Instrucciones de dosificación
- Duración del tratamiento
- Cantidad
- Reembolsable
- Motivo de la prescripción

**Obligatorio:**
- Medicamento
- Paciente
- Prescriptor
- Instrucciones

---

### CRCoreMedicationAdministration
**Perfil para Administración de Medicamento**

Define el registro de medicamentos administrados a un paciente.

**Elementos Clave:**
- Medicamento administrado
- Paciente
- Administrador
- Fecha y hora
- Dosis y vía
- Lugar de administración
- Razón
- Reacciones adversas

**Obligatorio:**
- Medicamento
- Paciente
- Fecha
- Estado

---

## Perfiles de Observaciones y Resultados

### CRCoreObservation
**Perfil para Observación Clínica General**

Define observaciones clínicas básicas (signos vitales, características físicas, etc.).

**Elementos Clave:**
- Código de observación (LOINC o SNOMED CT)
- Paciente
- Valor (cantidad, rango, código, etc.)
- Fecha y hora
- Estado
- Interpretación
- Rango de referencia
- Componentes (para observaciones compuestas)

**Obligatorio:**
- Código
- Paciente
- Valor o dataAbsentReason

---

### CRCoreAllergyIntolerance
**Perfil para Alergia e Intolerancia**

Define alergias e intolerancias a sustancias que afectan al paciente.

**Elementos Clave:**
- Sustancia alérgena (medicamento, alimento, etc.)
- Paciente
- Tipo de reacción
- Severidad
- Manifestaciones clínicas
- Fecha de identificación
- Clínico que identifica

**Obligatorio:**
- Sustancia
- Paciente
- Tipo

**Severidad:**
- mild (Leve)
- moderate (Moderada)
- severe (Grave)

---

### CRCoreImunization
**Perfil para Inmunización/Vacunación**

Define registro de vacunas administradas.

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

**Obligatorio:**
- Vacuna
- Paciente
- Fecha
- Estado

---

### CRCoreAppointment
**Perfil para Cita/Consulta**

Define citas médicas y encuentros programados.

**Elementos Clave:**
- Tipo de cita
- Paciente(s)
- Profesional/Equipo
- Fecha y hora
- Duración
- Estado
- Razón
- Descripción
- Ubicación

**Obligatorio:**
- Paciente
- Tipo
- Participante
- Fecha/Hora inicio
- Estado

---

### CRCoreEncounter
**Perfil para Encuentro Clínico**

Define un encuentro clínico (consulta, internación, emergencia, etc.).

**Elementos Clave:**
- Tipo de encuentro
- Paciente
- Profesional responsable
- Organización
- Fecha de inicio y término
- Duración
- Estado
- Diagnósticos
- Razón de la consulta

**Obligatorio:**
- Paciente
- Tipo
- Período
- Estado

**Tipos de Encuentro:**
- ambulatory (Ambulatorio)
- emergency (Emergencia)
- inpatient (Internación)
- virtual (Virtual)
- other (Otro)

---

## Conformidad

Todos los perfiles son:
- ✅ Basados en FHIR R5
- ✅ Validables automáticamente
- ✅ Documentados con ejemplos
- ✅ Alineados con estándares internacionales
- ✅ Adaptados al contexto costarricense

## Validación

Para validar un recurso contra estos perfiles:

```bash
# Usando el IG Publisher
fhirpublisher -ig ig.ini -profile StructureDefinition/cr-core-patient

# Usando herramientas en línea
# https://validator.fhir.org/
```

---

*Última actualización: Enero 2026*
