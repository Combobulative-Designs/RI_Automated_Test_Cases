Feature: Creacion de instituciones
    
    Creacion de una institucion

#@ignore-this
Scenario: Creacion exitosa de Institucion

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/institucion/add/
    And genere un valor unico institucionNueva
    When completo el campo id_nombre con el valor institucionNueva
    And guardo el formulario
    Then verifico la url es /admin/LPA/institucion/
    And verifico existe institucion con nombre institucionNueva

#@ignore-this
Scenario: Creacion fallida de Institucion - Nombre vacio

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/institucion/add/
    When guardo el formulario
    Then verifico la url es /admin/LPA/institucion/add/
    And mensaje de error visible

#@ignore-this
Scenario: Creacion fallida de Institucion - Nombre duplicado

    Given usuario ha iniciado sesion
    And genere un valor unico institucionADup
    And ya existe una institucion con nombre institucionADup
    And la url es /admin/LPA/institucion/add/
    When completo el campo id_nombre con el valor institucionADup
    And guardo el formulario
    Then verifico la url es /admin/LPA/institucion/add/
    And mensaje de error visible