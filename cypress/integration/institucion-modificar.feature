Feature: Modificacion de instituciones
    
    Modificacion de una institucion

#@ignore-this
Scenario: Modificacion exitosa de Institucion

    Given usuario ha iniciado sesion
    And genere un valor unico institucionVieja
    And genere un valor unico institucionNueva
    And ya existe una institucion con nombre institucionVieja
    And la url es /admin/LPA/institucion/
    When entro a modificar la institucion con nombre institucionVieja
    And completo el campo id_nombre con el valor institucionNueva
    And guardo el formulario
    Then verifico la url es /admin/LPA/institucion/
    And verifico existe institucion con nombre institucionNueva

#@ignore-this
Scenario: Modificacion fallida de Institucion - Nombre vacio

    Given usuario ha iniciado sesion
    And genere un valor unico institucionVieja
    And ya existe una institucion con nombre institucionVieja
    And la url es /admin/LPA/institucion/
    When entro a modificar la institucion con nombre institucionVieja
    And vacio el campo id_nombre
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/institucion\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de Institucion - Nombre duplicado

    Given usuario ha iniciado sesion
    And genere un valor unico institucionVieja
    And genere un valor unico institucionADup
    And ya existe una institucion con nombre institucionVieja
    And ya existe una institucion con nombre institucionADup
    And la url es /admin/LPA/institucion/
    When entro a modificar la institucion con nombre institucionVieja
    And completo el campo id_nombre con el valor institucionADup
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/institucion\/\d+\/change\/"
    And mensaje de error visible