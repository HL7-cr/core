# Extensiones

Esta sección documenta las 6 extensiones FHIR definidas en la Guía de Implementación Core de HL7 FHIR Costa Rica. Las extensiones añaden información adicional que no está disponible en los recursos base de FHIR.

## Extensiones Demográficas

### extension-cr-residency-status
**Estado de Residencia**

Indica el estado de residencia de una persona en Costa Rica (residente, no residente, residente temporal, etc.).

**Contexto de Uso:**
- Patient
- Practitioner
- RelatedPerson

**Tipo de Dato:**
- CodeableConcept

**Valores Válidos:**
- resident (Residente)
- non-resident (No Residente)
- temporary-resident (Residente Temporal)
- refugee (Refugiado)
- undocumented (Indocumentado)

**Ejemplo:**
```json
{
  "extension": [
    {
      "url": "https://hl7.or.cr/fhir/core/StructureDefinition/extension-cr-residency-status",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "https://hl7.or.cr/fhir/core/CodeSystem/residency-status",
            "code": "resident",
            "display": "Residente"
          }
        ]
      }
    }
  ]
}
```

---

### extension-cr-ethnic-group
**Grupo Étnico**

Permite documentar la etnia o grupo étnico de una persona según clasificaciones locales.

**Contexto de Uso:**
- Patient
- RelatedPerson

**Tipo de Dato:**
- CodeableConcept

**Valores Válidos:**
- hispanic (Hispano)
- indigenous (Indígena)
- afro-caribbean (Afrocaribeño)
- white (Blanco)
- asian (Asiático)
- other (Otro)

**Documentación Clínica:**
Importante para investigación epidemiológica y análisis de disparidades en salud.

---

## Extensiones de Identificadores

### extension-cr-document-type
**Tipo de Documento de Identificación**

Especifica el tipo de documento de identificación utilizado (cédula, pasaporte, permiso de residencia, etc.).

**Contexto de Uso:**
- Patient.identifier
- Practitioner.identifier
- Organization.identifier

**Tipo de Dato:**
- CodeableConcept

**Valores Válidos:**
- cedula (Cédula de Identidad)
- cedula-extrangera (Cédula de Extranjería)
- pasaporte (Pasaporte)
- carnet-migracion (Carnet de Migración)
- permiso-residencia (Permiso de Residencia)
- dimex (DIMEX - Documento Identificación Migrante Extranjero)

**Ejemplo:**
```json
{
  "identifier": [
    {
      "extension": [
        {
          "url": "https://hl7.or.cr/fhir/core/StructureDefinition/extension-cr-document-type",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "https://hl7.or.cr/fhir/core/CodeSystem/document-type",
                "code": "cedula",
                "display": "Cédula de Identidad"
              }
            ]
          }
        }
      ],
      "system": "https://hl7.or.cr/fhir/core/NameSystem/cedula",
      "value": "123456789"
    }
  ]
}
```

---

## Extensiones Clínicas

### extension-cr-clinical-specialty
**Especialidad Clínica**

Define la especialidad médica o de enfermería de un profesional de salud.

**Contexto de Uso:**
- Practitioner
- PractitionerRole

**Tipo de Dato:**
- CodeableConcept

**Valores Válidos:**
Clasificación basada en estándares locales e internacionales:
- internal-medicine (Medicina Interna)
- pediatrics (Pediatría)
- surgery (Cirugía)
- obstetrics-gynecology (Ginecología y Obstetricia)
- cardiology (Cardiología)
- neurology (Neurología)
- orthopedics (Ortopedia)
- psychiatry (Psiquiatría)
- nursing (Enfermería)
- dental (Odontología)
- pharmacy (Farmacia)
- other (Otra)

---

### extension-cr-emergency-contact-preference
**Preferencia de Contacto de Emergencia**

Especifica el método preferido para contactar a una persona en caso de emergencia.

**Contexto de Uso:**
- Patient
- RelatedPerson

**Tipo de Dato:**
- CodeableConcept

**Valores Válidos:**
- phone (Teléfono)
- email (Correo Electrónico)
- sms (SMS/Mensaje de Texto)
- whatsapp (WhatsApp)
- signal (Signal)
- telegram (Telegram)

**Atributos Relacionados:**
- Orden de preferencia
- Disponibilidad horaria
- Notas especiales

---

## Extensiones de Contacto

### extension-cr-communication-channel
**Canal de Comunicación Preferido**

Define el canal de comunicación preferido para un paciente o profesional (teléfono, email, mensajería, etc.).

**Contexto de Uso:**
- Patient
- Practitioner
- Organization

**Tipo de Dato:**
- CodeableConcept

**Valores Válidos:**
- voice-call (Llamada Telefónica)
- sms (Mensaje de Texto)
- email (Correo Electrónico)
- whatsapp (WhatsApp)
- messaging-app (Aplicación de Mensajería)
- video-call (Videollamada)
- in-person (Presencial)

**Ejemplo de Uso:**
Facilita comunicación preferida para recordatorios, consultas de seguimiento, y cambios en tratamiento.

---

## Extensiones de Configuración

### extension-cr-language-preference-order
**Orden de Preferencia de Idioma**

Define el orden de preferencia cuando un paciente o profesional habla múltiples idiomas.

**Contexto de Uso:**
- Patient
- Practitioner
- RelatedPerson

**Tipo de Dato:**
- Sequence (integer)

**Valores Válidos:**
1. Spanish (Español)
2. English (Inglés)
3. Portuguese (Portugués)
4. Indigenous Languages (Lenguas Indígenas)

**Ejemplo:**
```json
{
  "extension": [
    {
      "url": "https://hl7.or.cr/fhir/core/StructureDefinition/extension-cr-language-preference-order",
      "extension": [
        {
          "url": "language",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "urn:ietf:bcp:47",
                "code": "es",
                "display": "Spanish"
              }
            ]
          }
        },
        {
          "url": "order",
          "valueInteger": 1
        }
      ]
    }
  ]
}
```

---

## Uso de Extensiones

### Consideraciones Importantes

1. **Cuando Usar Extensiones**
   - No hay elemento base en FHIR que capture la información
   - La información es específica del contexto costarricense
   - Es necesario para conformidad regulatoria local

2. **Validación**
   - Todas las extensiones están definidas en StructureDefinition
   - Son validables mediante herramientas FHIR estándar
   - Algunos elementos pueden ser obligatorios en ciertos perfiles

3. **Compatibilidad**
   - Las extensiones no deben afectar la compatibilidad con sistemas externos
   - Los sistemas que no reconocen extensiones pueden ignorarlas
   - El contenido crítico debe estar en elementos base de FHIR

### Mejores Prácticas

✅ **Hacer:**
- Usar extensiones para información realmente adicional
- Documentar claramente el propósito y uso
- Incluir ejemplos en implementaciones
- Mantener versionamiento compatible

❌ **No Hacer:**
- Duplicar información que ya existe en elementos base
- Crear extensiones para cada variación de datos
- Ignorar validación de extensiones
- Cambiar significado de extensiones sin versionado

---

## Referencia Rápida

| Extensión | Contexto | Tipo | Estatus |
|-----------|---------|------|---------|
| extension-cr-residency-status | Patient, Practitioner | CodeableConcept | Active |
| extension-cr-ethnic-group | Patient, RelatedPerson | CodeableConcept | Active |
| extension-cr-document-type | Identifier | CodeableConcept | Active |
| extension-cr-clinical-specialty | Practitioner | CodeableConcept | Active |
| extension-cr-emergency-contact-preference | Patient | CodeableConcept | Active |
| extension-cr-communication-channel | Patient, Organization | CodeableConcept | Active |

---

*Última actualización: Enero 2026*
