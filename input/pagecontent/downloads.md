# Descargas

## Acceso a Recursos

Esta página proporciona enlaces y instrucciones para descargar todos los recursos de la Guía de Implementación Core de HL7 FHIR Costa Rica.

---

## Descargas Directas

### Especificación Completa

**ZIP Archive - Todos los Recursos**
- Disponible en: [HL7 FHIR Registry](https://fhir.hl7.org/ig/HL7-cr/core/package.zip)
- Tamaño: ~5 MB
- Contenido:
  - ✅ Perfiles (StructureDefinition)
  - ✅ Extensiones
  - ✅ Ejemplos
  - ✅ Documentación HTML
  - ✅ Terminología (CodeSystems, ValueSets)

### Por Componente

#### Perfiles (StructureDefinitions)
- Los perfiles están disponibles en la página de Perfiles
- 13 StructureDefinitions en JSON
- Incluye documentación de diferencias

#### Extensiones
- Las extensiones están disponibles en la página de Extensiones
- 6 StructureDefinitions de extensión
- Ejemplos de uso en JSON

#### Ejemplos e Instancias
- Los ejemplos están disponibles en la sección Artefactos
- 28 instancias de ejemplo
- Pacientes, Organizaciones, Observaciones, etc.

#### Terminología
- Ver la [Guía de Implementación de Terminología](https://build.fhir.org/ig/HL7-cr/terminology/)
- Sistemas de códigos locales
- Mapeos entre sistemas

---

## Documentación

### Guía HTML (Navegable)

Acceso en línea (recomendado):
- **URL Principal:** https://build.fhir.org/ig/HL7-cr/core/
- **Guía de Implementación:** https://build.fhir.org/ig/HL7-cr/core/guide.html
- **Perfiles:** https://build.fhir.org/ig/HL7-cr/core/profiles.html
- **Extensiones:** https://build.fhir.org/ig/HL7-cr/core/extensions.html

### Descararga Offline

Para acceso sin internet:

```bash
# Descargar sitio completo
wget -r https://build.fhir.org/ig/HL7-cr/core/

# O usar herramienta FHIR
fhir ig download hl7.fhir.cr.core
```

---

## Código Fuente

### GitHub Repository

Accede al código fuente y historial de cambios:

- **URL:** https://github.com/HL7-cr/core
- **Branch Principal:** main
- **Licencia:** CC-BY-4.0

### Clonar Repositorio

```bash
# Clonar completo
git clone https://github.com/HL7-cr/core.git
cd core

# Navegar rama específica
git checkout -b version-0.0.1-ballot origin/version-0.0.1-ballot

# Ver historial
git log --oneline
```

### Estructura del Repositorio

```
core/
├── input/
│   ├── fsh/
│   │   ├── profiles/
│   │   ├── extensions/
│   │   ├── examples/
│   │   └── aliases.fsh
│   └── pagecontent/
│       ├── index.md
│       ├── guide.md
│       ├── profiles.md
│       └── ...
├── fsh-generated/
│   └── resources/
│       ├── StructureDefinition-*.json
│       └── ...
├── sushi-config.yaml
├── ig.ini
└── README.md
```

---

## Versión Actual y Histórico

### Versión 0.0.1-ballot
- **Fecha:** Enero 2026
- **Estado:** Ballot (bajo votación)
- **Cambios:**
  - Versión inicial compilada
  - 13 perfiles
  - 6 extensiones
  - 28 ejemplos

### Versiones Anteriores

Todas las versiones están disponibles en:
- **NPM Registry:** https://www.npmjs.com/package/hl7.fhir.cr.core/
- **GitHub Releases:** https://github.com/HL7-cr/core/releases

---

## Actualizar a Nuevas Versiones

### De Ballot a Release

Una vez publicada la versión final:

```bash
# Actualizar package.json
npm install hl7.fhir.cr.core@0.0.1

# Actualizar sushi-config.yaml
dependencies:
  hl7.fhir.cr.core: 0.0.1  # Sin -ballot
```

### Gestión de Cambios

Para cambios mayores:
1. Revisar notas de cambio (CHANGELOG.md)
2. Validar recursos contra nuevos perfiles
3. Realizar pruebas exhaustivas
4. Actualizar gradualmente en producción

---

## Ayuda y Soporte

### Resolución de Problemas

**Error: "Failed to load package"**
```bash
# Solución:
rm -rf ~/.fhir/packages/hl7.fhir.cr.core*
npm install hl7.fhir.cr.core@0.0.1-ballot
```

**Error: "Profile not found"**
- Verificar URL completa del perfil
- Asegurar que IG está instalada correctamente
- Validar sintaxis en sushi-config.yaml

**Validación lenta**
- Verificar conexión a internet
- Usar servidor de terminología local
- Aumentar timeout si es necesario

### Reportar Problemas

Encontraste un error o tienes sugerencia?

1. **GitHub Issues:** https://github.com/HL7-cr/core/issues/new
2. **Email:** info@hl7.or.cr
3. **Comunidad:** HL7 Costa Rica Discussions

Incluye:
- Versión de IG usada
- Descripción clara del problema
- Pasos para reproducir
- Archivos de ejemplo si aplica

---

## Licencia y Términos de Uso

Esta IG está licenciada bajo **Creative Commons Attribution 4.0 International (CC BY 4.0)**.

Puedes:
- ✅ Descargar y usar libremente
- ✅ Modificar para tus necesidades
- ✅ Distribuir con atribución

Debes:
- ✅ Proporcionar atribución adecuada
- ✅ Incluir copia de licencia
- ✅ Indicar cambios realizados

Para detalles: https://creativecommons.org/licenses/by/4.0/

---

*Última actualización: Enero 2026*
