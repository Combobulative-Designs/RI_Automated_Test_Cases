Feature: Modificacion de Grupos de Alumnos
    
    Modificacion de un grupo de alumnos

#@ignore-this
Scenario: Modificacion exitosa de Grupo de Alumnos

    Given usuario ha iniciado sesion
    And genere un valor unico grupoViejo
    And genere un valor unico grupoNuevo
    And ya existe un grupo de alumnos con nombre grupoViejo
    And la url es /admin/LPA/grupo/
    When entro a modificar el grupo de alumnos con nombre grupoViejo
    And completo el campo id_nombre con el valor grupoNuevo
    And guardo el formulario
    Then verifico la url es /admin/LPA/grupo/
    And verifico existe grupo de alumnos con nombre grupoNuevo

#@ignore-this
Scenario: Modificacion fallida de Grupo de Alumnos - Nombre vacio

    Given usuario ha iniciado sesion
    And genere un valor unico grupoViejo
    And ya existe un grupo de alumnos con nombre grupoViejo
    And la url es /admin/LPA/grupo/
    When entro a modificar el grupo de alumnos con nombre grupoViejo
    And vacio el campo id_nombre
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/grupo\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de Grupo de Alumnos - Nombre duplicado

    Given usuario ha iniciado sesion
    And genere un valor unico grupoViejo
    And genere un valor unico grupoADup
    And ya existe un grupo de alumnos con nombre grupoViejo
    And ya existe un grupo de alumnos con nombre grupoADup
    And la url es /admin/LPA/grupo/
    When entro a modificar el grupo de alumnos con nombre grupoViejo
    And completo el campo id_nombre con el valor grupoADup
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/grupo\/\d+\/change\/"
    And mensaje de error visible