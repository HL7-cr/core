# HL7 FHIR Costa Rica - Core Implementation Guide

Guía de Implementación FHIR de HL7 para Costa Rica - Módulo Core

## Descripción

Esta Implementation Guide define los perfiles, extensiones y otros artefactos FHIR necesarios para el registro de información demográfica, clínica y de trazabilidad en Costa Rica.

### Versión
- **Versión**: 0.0.1-ballot
- **FHIR Version**: 5.0.0 (R5)
- **Estado**: Ballot/Desarrollo

## Contenido Principal

### Perfiles FHIR (13)
- **Datos Demográficos**:
  - CRCorePatient - Paciente con extensiones para edad, religión y ubicación
  - CRCorePractitioner - Profesional de salud
  - CRCorePractitionerRole - Rol del profesional de salud
  - CRCoreOrganization - Organizaciones de salud

- **Datos Clínicos**:
  - CRCoreComposition - Documentos clínicos
  - CRCoreBundle - Bundles de documentos
  - CRCoreCondition - Condiciones/Diagnósticos
  - CRCoreLocation - Ubicaciones de atención
  - CRCoreImmunization - Registros de inmunización
  - CRCoreAllergyIntolerance - Alergias e intolerancias
  - CRCoreAuditEvent - Auditoría y cumplimiento
  - CRCoreProvenance - Trazabilidad de recursos
  - CRCoreDocumentReference - Referencias a documentos

### Extensiones (6)
- patient-age - Edad calculada del paciente
- patient-religion - Religión/Creencia del paciente
- city-code - Código de ciudad (ubicación)
- state-code - Código de provincia/estado
- district-code - Código de distrito/canton
- country-code - Código de país

### Instancias de Ejemplo (28)
- Ejemplos de pacientes (múltiples variantes)
- Ejemplos de organizaciones (CCSS, Hospitales, Clínicas)
- Ejemplos de profesionales de salud
- Ejemplos de datos clínicos (composiciones, condiciones, observaciones)

## Compilación Local

### Requisitos
- SUSHI 3.17.0 (FSH 3.0.0)
- Node.js 14+
- Java 8+ (para IG Publisher)

### Pasos

1. **Instalar dependencias**:
```bash
npm install
```

2. **Compilar con SUSHI**:
```bash
sushi .
```

3. **Publicar con IG Publisher** (opcional):
```bash
java -jar publisher.jar -ini ig.ini
```

## Publicación Continua

Esta IG se compila automáticamente en [build.fhir.org](https://build.fhir.org/ig/HL7-cr/core) con cada commit.

- **Rama principal**: https://build.fhir.org/ig/HL7-cr/core
- **Log de compilación**: https://build.fhir.org/ig/HL7-cr/core/build.log
- **Rama específica**: https://build.fhir.org/ig/HL7-cr/core/branches/{branch-name}

## Dependencias

- hl7.fhir.r5.core 5.0.0
- hl7.fhir.cr.terminology 0.0.1-ballot (ValueSets y CodeSystems)

## Contribuciones

Las contribuciones son bienvenidas. Para colaborar:

1. Crea una rama con tu cambio: `git checkout -b feature/tu-cambio`
2. Haz commit: `git commit -m "Descripción del cambio"`
3. Haz push: `git push origin feature/tu-cambio`
4. Abre un Pull Request

**Nota sobre nombres de ramas**: Usa solo caracteres `[A-Za-z0-9_-]` (no `/` para compatibilidad con build.fhir.org)

## Estructura de Archivos

```
core/
├── input/
│   ├── fsh/
│   │   ├── profiles/         # Definiciones de perfiles
│   │   ├── extensions/       # Definiciones de extensiones
│   │   ├── instances/        # Instancias de ejemplo
│   │   ├── valueSets/        # ValueSets locales
│   │   └── aliases.fsh       # Aliases para ValueSets de Terminology IG
│   ├── pagecontent/          # Contenido de páginas
│   └── ignoreWarnings.txt    # Warnings ignorados
├── sushi-config.yaml         # Configuración de SUSHI
├── ig.ini                    # Configuración del IG Publisher
├── package.json              # Metadata de npm
└── template-cr/              # Template personalizado para Costa Rica
```

## Licencia

Esta guía está bajo licencia [Creative Commons Attribution 4.0](https://creativecommons.org/licenses/by/4.0/)

## Contacto

- **Organización**: HL7 Costa Rica
- **Website**: https://hl7.or.cr
- **Email**: info@hl7.or.cr

## Cambios Recientes

Ver [Historial de Cambios](#) para más información sobre versiones anteriores.

---

**Última actualización**: 2026-01-25

Para más información sobre FHIR, visita [build.fhir.org](https://build.fhir.org/)
