### Alcance y uso
El perfil base de paciente para Costas Rica pretende encapsular el modelo de datos más común y básico de pacientes en los sistemas de salud costarricense, abarcando tanto el sector primario como el secundario (médicos especialistas y hospitales) y los casos regionales. Por lo tanto, el perfil debería ser utilizable en la mayoría de los contextos costarricenses. Cabe destacar que el perfil es útil para quienes reciben atención en salud y social en las diferentes regiones del país.

### Identificadores de pacientes
Actualmente, este perfil de paciente solo refleja el uso de los identificadores nacionales de Costa Ruca de pacientes establecidos. A este punto, se soporta solo tres tipos de identificación:

1. [Cédula de identidad](https://www.tse.go.cr/cedula.html)
2. [DIMEX](https://migracion.go.cr/dimex/)
3. [Pasaporte](https://migracion.go.cr/pasaportes-y-permisos-de-salida/)

### Uso de la etiqueta de seguridad en pacientes
Si un proyecto de implementación necesita proteger el nombre y la dirección de un ciudadano costarricense, se recomienda incluir la etiqueta de seguridad de la siguiente manera:

```
{
  "resourceType" : "Bundle",
  "type" : "searchset",
  ... otros headers etc.....
  "entry" : [
     ... otroe entries ....
     {
       "resource": {
         "id" : "1",
         "meta" : {
           "security" : [{
             "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
             "code" : "R",
             "display" : "Restricted"
           }]
         }
         ... otros content etc.....
       }
     },
     ... otros entries ....
  ]
}
```
El uso de esta etiqueta debe interpretarse de acuerdo con la ley, lo que significa en términos generales que solo el personal que utiliza sistemas en asuntos públicos/oficiales puede ver el nombre y la dirección del paciente/ciudadano.
