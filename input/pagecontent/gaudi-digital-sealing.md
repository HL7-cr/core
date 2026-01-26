## GAUDÍ: Sellado de Tiempo Digital

### Introducción

**GAUDÍ** (Generador de Autoridad de Documento por Unidad de Identificación) es el sistema oficial de sellado de tiempo del Banco Central de Costa Rica. Proporciona un mecanismo confiable y legalmente reconocido para sellar documentos electrónicos, incluyendo recursos FHIR, con una marca temporal verificable e irrefutable.

En el contexto de interoperabilidad clínica FHIR, GAUDÍ garantiza que los documentos clínicos digitales (Bundles de tipo "document") pueden ser sellados con una prueba de existencia e integridad reconocida legalmente.

### Contexto Legal y Normativo

#### Marco Legal de Costa Rica

GAUDÍ opera bajo:

- **Ley de Firma Digital y Documentos Electrónicos** (Ley 8454 de Costa Rica)
- **Ley de Protección de Datos Personales** (LGPD)
- **Regulaciones del Ministerio de Salud** para documentación clínica electrónica
- **Normas HIPAA** equivalentes para sistemas de salud

#### Reconocimiento Oficial

```
┌─────────────────────────────────────────────────────────┐
│  Banco Central de Costa Rica                            │
│  Sistema de Sellado de Tiempo Oficial                   │
│                                                         │
│  ✓ Autoridad Certificadora Nacional reconocida         │
│  ✓ Infraestructura PKI de clase alta                   │
│  ✓ Disponibilidad 24/7/365                             │
│  ✓ Sincronización UTC con servidores internacionales   │
│  ✓ Auditoría permanente e inmutable                    │
└─────────────────────────────────────────────────────────┘
```

### Alcance: Documentos Clínicos FHIR

#### Tipos de Bundle que pueden Sellarse

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

#### Bundles NO Sellables

Los Bundles de otro tipo **no deben sellarse**:

- ❌ `type = #transaction` - Para operaciones en sistemas
- ❌ `type = #batch` - Para procesamiento por lotes
- ❌ `type = #history` - Para históricos de versiones
- ❌ `type = #searchset` - Para resultados de búsqueda

### Estructura del Sello GAUDÍ en FHIR

#### Elemento Signature del Bundle

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
    "data": "MIIDxDCC...base64-encoded-gaudi-signature...",
    "extension": [
      {
        "url": "https://hl7.or.cr/fhir/StructureDefinition/gaudi-timestamp",
        "valueDateTime": "2026-01-20T10:35:00.123Z"
      },
      {
        "url": "https://hl7.or.cr/fhir/StructureDefinition/gaudi-reference",
        "valueString": "GAUDI-2026-BCR-001234"
      },
      {
        "url": "https://hl7.or.cr/fhir/StructureDefinition/gaudi-certificate",
        "valueString": "MIIFXzCCA0e...base64-encoded-bcr-certificate..."
      },
      {
        "url": "https://hl7.or.cr/fhir/StructureDefinition/document-hash-algorithm",
        "valueString": "SHA256"
      }
    ]
  }
}
```

### Flujo de Sellado GAUDÍ

#### 1. Crear Documento Clínico (Bundle type=document)

```
Profesional Clínico
        ↓
Crea Composición con datos clínicos
        ↓
Agrupa recursos en Bundle tipo "document"
        ↓
Bundle listo para sellado
```

#### 2. Preparar para Sellado

```
Bundle JSON Canonizado
        ↓
Calcular SHA-256 del contenido
        ↓
Generar hash verificable
```

#### 3. Solicitar Sello GAUDÍ

```
POST https://servidorgaudí.bcr.fi.cr/api/v1/sello-temporal

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

#### 4. Incorporar Sello en Bundle

El sello GAUDÍ se añade al elemento `Bundle.signature` con:

- **Timestamp oficial** del Banco Central
- **Referencia única** (GAUDI-2026-BCR-XXXXX)
- **Certificado X.509** de GAUDÍ
- **Firma criptográfica** del documento

#### 5. Distribuir Documento Sellado

```
Bundle con Sello GAUDÍ
        ↓
Transmisión segura (TLS/HTTPS)
        ↓
Sistema receptor
        ↓
Validación de sello (verificación de integridad)
```

### Validación de Documentos Sellados

#### Proceso de Verificación

```javascript
// 1. Extraer sello GAUDÍ
const sello = bundle.signature;
const hashDocumento = sello.extension
  .find(e => e.url.includes('document-hash'))?.value;

// 2. Recalcular hash del Bundle
const contenidoActual = canonicalizeBundle(bundle);
const hashActual = sha256(contenidoActual);

// 3. Comparar hashes
if (hashActual === hashDocumento) {
  // 4. Validar Certificado BCR
  const certificado = parseCertificate(sello.data);
  const esBCR = validarCadenaConfianza(certificado);
  
  if (esBCR) {
    console.log("✓ Documento íntegro y sellado por BCR");
    console.log("  Referencia:", sello.extension
      .find(e => e.url.includes('gaudi-reference'))?.value);
    return true;
  }
}
return false;
```

#### Estados Posibles

| Estado | Significado | Acción |
|--------|-------------|--------|
| **SELLADO** | Documento válido con sello GAUDÍ vigente | Aceptar documento |
| **EXPIRADO** | Sello vencido (rara vez ocurre) | Solicitar resello |
| **REVOCADO** | Certificado revocado | Rechazar documento |
| **NO_VERIFICADO** | No tiene sello GAUDÍ | Requerir sellado |

### Casos de Uso Clínicos

#### Caso 1: Informe de Laboratorio Clínico

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

#### Caso 2: Nota Clínica de Consulta

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

#### Caso 3: Informe Forense/Legal

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

### Integración en Sistemas FHIR

#### Arquitectura Recomendada

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

- ❌ Sellar Bundles no-documento (transaction, batch, etc.)
- ❌ Modificar documentos después de sellado
- ❌ Usar sellos locales (usar siempre GAUDÍ)
- ❌ Descartar referencia GAUDÍ
- ❌ Confiar en sellos sin validar certificado BCR
- ❌ Almacenar claves privadas sin protección
- ❌ Ignorar errores de validación

### Contacto y Recursos

#### Banco Central de Costa Rica - GAUDÍ

| Elemento | Detalles |
|----------|----------|
| **Portal Oficial** | https://servidorgaudí.bcr.fi.cr |
| **API de Sello** | https://servidorgaudí.bcr.fi.cr/api/v1 |
| **Documentación** | https://www.bcr.fi.cr/regulaciones/gaudi |
| **Email Soporte** | gaudi@bcr.fi.cr |
| **Teléfono** | +506 2243-2000 (ext. GAUDÍ) |
| **Disponibilidad** | 24/7/365 |
| **SLA** | < 100ms para sellado |

#### Proceso de Integración

1. **Registrarse** como institución autenticada en GAUDÍ
2. **Obtener credenciales** (cliente OAuth2 o certificado mutuo TLS)
3. **Implementar cliente** GAUDÍ en el sistema FHIR
4. **Solicitar sello** para cada Bundle document
5. **Validar sellos** al recibir documentos
6. **Mantener auditoría** de todas las operaciones

### Referencias y Estándares

- [ETSI TS 119 122 - Electronic Signatures and Infrastructures](https://www.etsi.org/deliver/etsi_ts/119100_119199/119122/03.01.01_60/ts_119122v030101p.pdf)
- [IETF RFC 3161 - Time-Stamp Protocol](https://tools.ietf.org/html/rfc3161)
- [Ley 8454 - Firma Digital y Documentos Electrónicos de Costa Rica](https://www.pgrweb.go.cr/normas/)
- [FHIR Bundle.signature](http://hl7.org/fhir/R5/bundle.html#signature)
- [FHIR Composition](http://hl7.org/fhir/R5/composition.html)
- [W3C Verifiable Credentials Data Model](https://www.w3.org/TR/vc-data-model/)

### Conclusión

GAUDÍ proporciona una solución confiable, legal y técnicamente sólida para el sellado de documentos clínicos en formato FHIR. Su integración asegura que los documentos clínicos digitales pueden circular con garantía de:

- ✓ **Autenticidad**: Procedencia verificable
- ✓ **Integridad**: Imposible modificar sin detectarse
- ✓ **No Repudio**: El emisor no puede negar autoría
- ✓ **Legalidad**: Reconocido por ley costarricense
- ✓ **Trazabilidad**: Auditoría completa y perpetua

Esto es fundamental para la confianza en los sistemas de información de salud en Costa Rica.
