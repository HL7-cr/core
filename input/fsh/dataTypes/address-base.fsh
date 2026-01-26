/* ##################################################################### 
# Type:         FSH-File for a FHIR® DataType Resource
# About:        HL7® FHIR® CORE Costa Rica
# Created by:   National Working Group for FHIR® - Costa Rica
# Date:         2025-03-03
# FHIR version: 5.0.0
# Authors:      - Ministerio de Salud
#               - Caja Costarricense de Seguro Social
#               - Camara Costarricense de la Salud
#               - Cámara de Tecnologías de Información y Comunicación
#               - Global Life-Centered Hub
#               - Instituto Nacional de Seguros
######################################################################*/

Profile:            CRCoreAddress
Parent:             Address
Id:                 cr-address-base
Title:              "Tipo de Dato Dirección Base"
Description:        "Tipo de dato FHIR Dirección utilizado en HL7 FHIR Costa Rica - Core."

* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 Costa Rica"

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open

/* Dirección */
* use 0..1
* use ^short = "Tipo de dirección."
* use ^definition = "Tipo de dirección."

* type 0..1
* type ^short = "Tipo de dirección."
* type ^definition = "Tipo de dirección."

* line 1.. MS
* line ^short = "La dirección completa, incluyendo la calle, el número de la casa o apartamento, la ciudad, el estado, el código postal, etc., si es relevante."
* line ^definition = "La dirección completa, incluyendo la calle, el número de la casa o apartamento, la ciudad, el estado, el código postal, etc., si es relevante."

* district 0..1
* district ^short = "Nombre del distrito."
* district ^definition = "Nombre del distrito."
* district.extension contains CRDistrictExt named districtCode 0..1
* district.extension ^short = "Código del distrito basado en el ZipCode de Costa Rica"
* district.extension ^definition = "Código del distrito basado en el ZipCode de Costa Rica."

* city 0..1
* city ^short = "Nombre de la ciudad."
* city ^definition = "Nombre de la ciudad."
* city.extension contains CRCityExt named cityCode 0..1
* city.extension ^short = "Código de la ciudad basado en el ZipCode de Costa Rica"
* city.extension ^definition = "Código de la ciudad basado en el ZipCode de Costa Rica."

* state 0..1
* state ^short = "Nombre del estado o provincia."
* state ^definition = "Nombre del estado o provincia."
* state.extension contains CRStateExt named stateCode 0..1
* state.extension ^short = "Código de la provincia basado en el ZipCode de Costa Rica"
* state.extension ^definition = "Código de la provincia basado en el ZipCode de Costa Rica."

* postalCode 0..1
* postalCode ^short = "Código postal."
* postalCode ^definition = "Código postal."

* country 0..1 MS
* country ^short = "Nombre del país."
* country ^definition = "Nombre del país."
* country.extension contains CRCountryExt named countryCode 0..1 MS
* country.extension ^short = "Código de país en formato ISO 3166-1 alpha-3"
* country.extension ^definition = "Código de país en formato ISO 3166-1 alpha-3"

