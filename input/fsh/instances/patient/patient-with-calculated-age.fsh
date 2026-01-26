// Paciente con extensión de edad calculada
Instance: CRPatientWithCalculatedAge
InstanceOf: CRCorePatient
Title: "Paciente con Edad Calculada"
Description: "Ejemplo de paciente con la extensión de edad calculada derivada de la fecha de nacimiento."

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "1-2034-5678"

* name[0].use = #official
* name[0].family = "Mora Reyes"
* name[0].given[0] = "Ana"
* name[0].given[1] = "María"

* gender = #female
* birthDate = "1975-03-15"
* active = true

* telecom[0].system = #phone
* telecom[0].value = "+506 2222 3333"
* telecom[0].use = #home

* telecom[1].system = #email
* telecom[1].value = "ana.mora@example.cr"

* extension[0].url = "https://hl7.or.cr/fhir/core/StructureDefinition/cr-patient-calculated-age"
* extension[0].valueAge.value = 50
* extension[0].valueAge.system = "http://unitsofmeasure.org"
* extension[0].valueAge.code = #a


