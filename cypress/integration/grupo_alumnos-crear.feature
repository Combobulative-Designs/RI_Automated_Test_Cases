Feature: Creacion de grupos de alumnos
    
    Creacion de un grupo de alumnos

#@ignore-this
Scenario: Creacion exitosa de Grupo de Alumnos

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/grupo/add/
    And genere un valor unico grupoNuevo
    When completo el campo id_nombre con el valor grupoNuevo
    And guardo el formulario
    Then verifico la url es /admin/LPA/grupo/
    And verifico existe grupo de alumnos con nombre grupoNuevo

#@ignore-this
Scenario: Creacion fallida de Grupo de Alumnos - Nombre vacio

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/grupo/add/
    When guardo el formulario
    Then verifico la url es /admin/LPA/grupo/add/
    And mensaje de error visible

#@ignore-this
Scenario: Creacion fallida de Grupo de Alumnos - Nombre duplicado

    Given usuario ha iniciado sesion
    And genere un valor unico grupoADup
    And ya existe un grupo de alumnos con nombre grupoADup
    And la url es /admin/LPA/grupo/add/
    When completo el campo id_nombre con el valor grupoADup
    And guardo el formulario
    Then verifico la url es /admin/LPA/grupo/add/
    And mensaje de error visible