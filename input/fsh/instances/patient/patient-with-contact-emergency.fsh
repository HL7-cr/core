Instance: CRPatientWithContactEmergency
InstanceOf: CRCorePatient
Title: "Paciente con Contacto de Emergencia"
Description: "Ejemplo de paciente con múltiples contactos: madre (72705000) y amigo (125680007) como contacto de emergencia."
Usage: #example

* identifier[0].use = #official
* identifier[0].use = #official
* identifier[0].type.coding.system = "https://hl7.or.cr/fhir/terminology/CodeSystem/identifier-type"
* identifier[0].type.coding.code = #cedula-nacional
* identifier[0].type.coding.display = "Cédula Nacional"
* identifier[0].system = "https://hl7.or.cr/fhir/identifier/client-registry"
* identifier[0].value = "6-1234-5678"

* name[0].use = #official
* name[0].family = "Fernández Arias"
* name[0].given[0] = "Carlos"
* name[0].given[1] = "Alberto"

* gender = #male
* birthDate = "1995-07-10"
* active = true

// Contacto 1: Madre
* contact[0].relationship[0].coding[0].system = "http://snomed.info/sct"
* contact[0].relationship[0].coding[0].code = #72705000

* contact[0].name.use = #official
* contact[0].name.family = "Arias Méndez"
* contact[0].name.given[0] = "Rosa"

* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "+506 2345 6789"
* contact[0].telecom[0].use = #home

* contact[0].gender = #female

// Contacto 2: Amigo (contacto de emergencia)
* contact[1].relationship[0].coding[0].system = "http://snomed.info/sct"
* contact[1].relationship[0].coding[0].code = #125680007

* contact[1].name.use = #official
* contact[1].name.family = "Morales Campos"
* contact[1].name.given[0] = "Juan"

* contact[1].telecom[0].system = #phone
* contact[1].telecom[0].value = "+506 9876 5432"
* contact[1].telecom[0].use = #mobile

* contact[1].telecom[1].system = #email
* contact[1].telecom[1].value = "juan.morales@example.cr"

* contact[1].gender = #male
