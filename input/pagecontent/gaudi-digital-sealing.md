### Introducción

<img src="assets/images/gaudi_logo.png" style="width: 80px; margin-top: 12px;">

**GAUDÍ** (Generador de Autoridad de Documento por Unidad de Identificación) es una solución tecnológica de acceso electrónico que permite realizar una serie de funcionalidades con su tarjeta de firma digital, tales como firmar y validar documentos y la autenticación de los suscriptores. Le ofrece una serie de funcionalidades que le permiten autenticarse y realizar firmas.

Ademas es el sistema oficial de sellado de tiempo del Banco Central de Costa Rica. Proporciona un mecanismo confiable y legalmente reconocido para sellar documentos electrónicos, incluyendo recursos FHIR, con una marca temporal verificable e irrefutable.

En el contexto de interoperabilidad clínica FHIR, GAUDÍ garantiza que los documentos clínicos digitales (Bundles de tipo "document") pueden ser sellados con una prueba de existencia e integridad reconocida legalmente.

### Marco Legal de Costa Rica

GAUDÍ opera bajo:

- **Ley de Firma Digital y Documentos Electrónicos** (Ley 8454 de Costa Rica)
- **Ley de Protección de Datos Personales** (LGPD)
- **Regulaciones del Ministerio de Salud** para documentación clínica electrónica
- **Normas HIPAA** equivalentes para sistemas de salud

### Reconocimiento Oficial

```
┌─────────────────────────────────────────────────────────┐
│  Banco Central de Costa Rica                            │
│  Sistema de Sellado de Tiempo Oficial                   │
│                                                         │
│  ✓ Autoridad Certificadora Nacional reconocida          │
│  ✓ Infraestructura PKI de clase alta                    │
│  ✓ Disponibilidad 24/7/365                              │
│  ✓ Sincronización UTC con servidores internacionales    │
│  ✓ Auditoría permanente e inmutable                     │
└─────────────────────────────────────────────────────────┘
```


### Tipos de Bundle que pueden Sellarse

Solo los Bundles de tipo **"document"** pueden ser sellados con GAUDÍ:

```fhir
Bundle {
  type = #document  ← Único tipo soportado para sellado
  composition = Reference(Composition)  ← Referencia obligatoria
  entry[0] = Composition
  entry[1] = Patient
  entry[2..n] = Recursos clínicos (Observation, Medication, etc.)
  signature = Signature  ← Elemento opcional para GAUDÍ
}
```

### Elemento Signature del Bundle

```json
{
  "resourceType": "Bundle",
  "type": "document",
  "identifier": {
    "system": "urn:ietf:rfc:3986",
    "value": "urn:uuid:3e4130b9-e5ed-4b90-80c8-4b12f5d7f5f5"
  },
  "timestamp": "2026-01-20T10:30:00-06:00",
  "entry": [
    {
      "fullUrl": "urn:uuid:composition-001",
      "resource": {
        "resourceType": "Composition",
        "type": {
          "coding": [{
            "system": "http://loinc.org",
            "code": "34840-9",
            "display": "Neurology Consultation note"
          }]
        },
        "subject": { "reference": "Patient/..." },
        "date": "2026-01-20",
        "author": [ { "reference": "Practitioner/..." } ],
        "title": "Documento Clínico - Consulta de Neurología",
        "section": [ { "entry": [...] } ]
      }
    },
    { "fullUrl": "urn:uuid:patient-001", "resource": { ... } },
    { "fullUrl": "urn:uuid:observation-001", "resource": { ... } }
  ],
  "signature": {
    "type": [{
      "system": "urn:iso-std:iec:61208:2012#urn:adoc:sigform:gaudi",
      "code": "GAUDI-TSA"
    }],
    "when": "2026-01-20T10:35:00Z",
    "who": {
      "reference": "Organization/laboratorio-nacional",
      "display": "Laboratorio Nacional de Referencia"
    },
    "onBehalfOf": {
      "reference": "Organization/ministerio-salud",
      "display": "Ministerio de Salud de Costa Rica"
    },
    "sigFormat": "application/gaudi+json",
    "data": "MIIDxDCC...base64-encoded-gaudi-signature..."
  }
}
```

### 1. Crear Documento Clínico (Bundle type=document)

```
Profesional Clínico
        ↓
Crea Composición con datos clínicos
        ↓
Agrupa recursos en Bundle tipo "document"
        ↓
Bundle listo para sellado
```

### 2. Preparar para Sellado

```
Bundle JSON Canonizado
        ↓
Calcular SHA-256 del contenido
        ↓
Generar hash verificable
```

### 3. Solicitar Sello GAUDÍ

```
POST https://urlfake-gaud.fi.cr/api/v1/sello-temporal

Solicitud:
{
  "documento": {
    "hash": "d4735d7e98...sha256...",
    "algoritmo": "SHA256",
    "tipo": "documento-clinico-fhir",
    "institucion": "laboratorio-nacional",
    "paciente-hash": "hash-del-identificador-paciente"
  },
  "metadatos": {
    "tipos-recursos": ["Composition", "Patient", "Observation"],
    "timestamp-local": "2026-01-20T10:30:00-06:00"
  }
}

Respuesta:
{
  "sello": {
    "timestamp": "2026-01-20T10:35:00.123Z",
    "referencia": "GAUDI-2026-BCR-001234",
    "certificado": "MIIFXzCCA0e...X.509 certificate...",
    "cadena-confianza": ["Certificado BCR", "Certificado Raíz"],
    "algoritmo": "SHA256withRSA"
  },
  "validacion": {
    "estado": "SELLADO",
    "tokens-registrados": 1,
    "proxima-validacion": "2026-01-20T10:36:00Z"
  }
}
```

### 4. Incorporar Sello en Bundle

El sello GAUDÍ se añade al elemento `Bundle.signature` con:

- **Timestamp oficial** del Banco Central
- **Referencia única** (GAUDI-2026-BCR-XXXXX)
- **Certificado X.509** de GAUDÍ
- **Firma criptográfica** del documento

### 5. Distribuir Documento Sellado

```
Bundle con Sello GAUDÍ
        ↓
Transmisión segura (TLS/HTTPS)
        ↓
Sistema receptor
        ↓
Validación de sello (verificación de integridad)
```

### Estados Posibles

| Estado | Significado | Acción |
|--------|-------------|--------|
| **SELLADO** | Documento válido con sello GAUDÍ vigente | Aceptar documento |
| **EXPIRADO** | Sello vencido (rara vez ocurre) | Solicitar resello |
| **REVOCADO** | Certificado revocado | Rechazar documento |
| **NO_VERIFICADO** | No tiene sello GAUDÍ | Requerir sellado |


### Caso 1: Informe de Laboratorio Clínico

```
┌──────────────────────────────────────┐
│ Laboratorio Nacional                  │
│ Resultado de Prueba COVID-19          │
├──────────────────────────────────────┤
│ ✓ Bundledocument con Observation      │
│ ✓ Datos del paciente (Patient)        │
│ ✓ Organización responsable            │
│ ✓ Sellado con GAUDÍ                   │
│ ✓ Referencia: GAUDI-2026-BCR-00456    │
│ ✓ Timestamp: 2026-01-20T10:35:00Z     │
├──────────────────────────────────────┤
│ ESTADO: ÍNTEGRO Y VERIFICADO         │
└──────────────────────────────────────┘
```

### Caso 2: Nota Clínica de Consulta

```
┌──────────────────────────────────────┐
│ Clínica Médica Central                │
│ Nota de Consulta - Cardiología        │
├──────────────────────────────────────┤
│ ✓ Composition: Estructura clínica      │
│ ✓ Observaciones diagnósticas          │
│ ✓ Medicamentos prescritos             │
│ ✓ Firma del médico (dentro de Comp.)  │
│ ✓ Sello GAUDÍ en Bundle              │
│ ✓ Cadena de confianza completa       │
├──────────────────────────────────────┤
│ ESTADO: VÁLIDO LEGALMENTE             │
└──────────────────────────────────────┘
```

### Caso 3: Informe Forense/Legal

```
┌──────────────────────────────────────┐
│ Instituto Médico Legal                │
│ Informe de Autopsia (Documento)       │
├──────────────────────────────────────┤
│ ✓ Bundle document con datos completos│
│ ✓ Múltiples observaciones clínicas    │
│ ✓ Sellado GAUDÍ (prueba de tiempo)   │
│ ✓ No repudiable                       │
│ ✓ Válido como prueba forense         │
├──────────────────────────────────────┤
│ ESTADO: LEGAL Y ADMISIBLE             │
└──────────────────────────────────────┘
```

### Arquitectura Recomendada

```
┌─────────────────┐
│ Sistema Clínico │
│  (EHR/HIS)      │
└────────┬────────┘
         │
    Crea documento
         │
         ↓
┌─────────────────────────────────────┐
│  Generador FHIR                     │
│  - Composition                      │
│  - Bundle type=document             │
└────────┬────────────────────────────┘
         │
   Serializa como JSON
         │
         ↓
┌─────────────────────────────────────┐
│  Cliente GAUDÍ                      │
│  - Calcula hash SHA-256             │
│  - Solicita sello a BCR             │
│  - Incorpora respuesta              │
└────────┬────────────────────────────┘
         │
 Documento con sello
         │
         ↓
┌─────────────────────────────────────┐
│  Almacenamiento / Intercambio       │
│  - Base de datos clínica            │
│  - Portal del paciente              │
│  - Envío a otras instituciones      │
└─────────────────────────────────────┘
```

### Mejores Prácticas

#### ✅ Recomendado

- **Sellar documentos importantes**: Informes, diagnósticos, prescripciones
- **Usar Bundle type=document**: Único tipo permitido para sellado
- **Almacenar referencias GAUDÍ**: GAUDI-XXXX-BCR-XXXXX para auditoría
- **Validar periódicamente**: Verificar integridad de documentos antiguos
- **Mantener copias certificadas**: Preservar el Bundle sellado original
- **Usar canales seguros**: HTTPS/TLS para transmisión
- **Documentar procedencia**: Quién selló, cuándo, por qué

#### ❌ Evitar

- ❌ Modificar documentos después de sellado
- ❌ Usar sellos locales (usar siempre GAUDÍ)
- ❌ Descartar referencia GAUDÍ
- ❌ Confiar en sellos sin validar certificado BCR
- ❌ Almacenar claves privadas sin protección
- ❌ Ignorar errores de validación

### Contacto y Recursos

Por definir

#### Proceso de Integración

1. **Registrarse** como institución autenticada en GAUDÍ
2. **Obtener credenciales**
3. **Implementar cliente** GAUDÍ en el sistema FHIR
4. **Solicitar sello** para cada Bundle document
5. **Validar sellos** al recibir documentos
6. **Mantener auditoría** de todas las operaciones

### Referencias y Estándares

Por definir


