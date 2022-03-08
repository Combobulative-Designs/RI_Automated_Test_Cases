Feature: Creacion de Sesiones
    
    Creacion de una Sesion

#@ignore-this
Scenario: Creacion exitosa de Sesion

    Given usuario ha iniciado sesion
    And genere un valor unico pruebaNueva
    And genere un valor unico textoViejo
    And genere un valor unico grupoViejo
    And ya existe un texto con texto textoViejo
    And ya existe un grupo de alumnos con nombre grupoViejo
    And la url es /admin/LPA/prueba/add/
    When completo el campo id_titulo con el valor pruebaNueva
    And selecciono en el campo id_grupo el valor grupoViejo
    And selecciono en el campo id_texto el valor textoViejo
    And completo el campo id_instrucciones con el valor "Instrucciones para la prueba"
    And guardo el formulario
    Then verifico la url es /admin/LPA/prueba/
    And verifico existe sesion con titulo pruebaNueva
    And entro a modificar la sesion con el titulo pruebaNueva
    And verifico el campo id_instrucciones tiene el valor "Instrucciones para la prueba"
    And verifico el combo id_grupo tiene el valor seleccionado grupoViejo
    And verifico el combo id_texto tiene el valor seleccionado textoViejo

#@ignore-this
Scenario: Creacion fallida de Sesion - Titulo vacio

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/prueba/add/
    When completo el campo id_instrucciones con el valor "Instrucciones para la prueba"
    And guardo el formulario
    Then verifico la url es /admin/LPA/prueba/add/
    And mensaje de error visible

#@ignore-this
Scenario: Creacion fallida de Sesion - Titulo duplicado

    Given usuario ha iniciado sesion
    And genere un valor unico pruebaADup
    And ya existe una sesion con titulo pruebaADup
    And la url es /admin/LPA/prueba/add/
    When completo el campo id_titulo con el valor pruebaADup
    When completo el campo id_instrucciones con el valor "Instrucciones para la prueba"
    And guardo el formulario
    Then verifico la url es /admin/LPA/prueba/add/
    And mensaje de error visible

#@ignore-this
Scenario: Creacion fallida de Sesion - Instrucciones vacias

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/prueba/add/
    And genere un valor unico pruebaNueva
    When completo el campo id_titulo con el valor pruebaNueva
    And guardo el formulario
    Then verifico la url es /admin/LPA/prueba/add/
    And mensaje de error visible