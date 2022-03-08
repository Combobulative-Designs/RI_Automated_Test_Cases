Feature: Modificacion de Sesiones
    
    Modificacion de una Sesion

@ignore-this
Scenario: Modificacion exitosa de Sesion - Campos generales

    Given usuario ha iniciado sesion
    And genere un valor unico pruebaNueva
    And genere un valor unico pruebaVieja
    And genere un valor unico textoViejo
    And genere un valor unico grupoViejo
    And ya existe un texto con texto textoViejo
    And ya existe un grupo de alumnos con nombre grupoViejo
    And ya existe una sesion con titulo pruebaVieja
    And la url es /admin/LPA/prueba/
    When entro a modificar la sesion con titulo pruebaVieja
    And completo el campo id_titulo con el valor pruebaNueva
    And selecciono en el campo id_grupo el valor grupoViejo
    And selecciono en el campo id_texto el valor textoViejo
    And completo el campo id_instrucciones con el valor "Instrucciones para la prueba modificadas."
    And guardo el formulario
    Then verifico la url es /admin/LPA/prueba/
    And verifico existe sesion con titulo pruebaNueva
    And entro a modificar la sesion con el titulo pruebaNueva
    And verifico el campo id_instrucciones tiene el valor "Instrucciones para la prueba modificadas."
    And verifico el combo id_grupo tiene el valor seleccionado grupoViejo
    And verifico el combo id_texto tiene el valor seleccionado textoViejo

@ignore-this
Scenario: Modificacion exitosa de Sesion - Agregar palabra clave

    Given usuario ha iniciado sesion
    And genere un valor unico pruebaVieja
    And ya existe una sesion con titulo pruebaVieja
    And la url es /admin/LPA/prueba/
    When entro a modificar la sesion con titulo pruebaVieja
    And agrego la palabra clave "Palabra Clave 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/prueba/
    And verifico existe sesion con titulo pruebaVieja
    And entro a modificar la sesion con el titulo pruebaVieja
    And verifico existe la palabra clave "Palabra Clave 2"

@ignore-this
Scenario: Modificacion exitosa de Sesion - Eliminar palabra clave

    Given usuario ha iniciado sesion
    And genere un valor unico pruebaVieja
    And ya existe una sesion con titulo pruebaVieja
    And la url es /admin/LPA/prueba/
    When entro a modificar la sesion con titulo pruebaVieja
    And elimino la palabra clave 0
    And guardo el formulario
    Then verifico la url es /admin/LPA/prueba/
    And verifico existe sesion con titulo pruebaVieja
    And entro a modificar la sesion con el titulo pruebaVieja
    And verifico existen solo 0 palabras clave

@ignore-this
Scenario: Modificacion fallida de Sesion - Titulo vacio

    Given usuario ha iniciado sesion
    And genere un valor unico pruebaVieja
    And ya existe una sesion con titulo pruebaVieja
    And la url es /admin/LPA/prueba/
    When entro a modificar la sesion con titulo pruebaVieja
    And vacio el campo id_titulo
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/prueba\/\d+\/change\/"
    And mensaje de error visible

@ignore-this
Scenario: Modificacion fallida de Sesion - Titulo duplicado

    Given usuario ha iniciado sesion
    And genere un valor unico pruebaVieja
    And genere un valor unico pruebaADup
    And ya existe una sesion con titulo pruebaVieja
    And ya existe una sesion con titulo pruebaADup
    And la url es /admin/LPA/prueba/
    When entro a modificar la sesion con titulo pruebaVieja
    And completo el campo id_titulo con el valor pruebaADup
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/prueba\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de Sesion - Instrucciones vacias

    Given usuario ha iniciado sesion
    And genere un valor unico pruebaVieja
    And ya existe una sesion con titulo pruebaVieja
    And la url es /admin/LPA/prueba/
    When entro a modificar la sesion con titulo pruebaVieja
    And vacio el campo id_instrucciones
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/prueba\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion exitosa de Sesion - Agregar palabra clave

    Given usuario ha iniciado sesion
    And genere un valor unico pruebaVieja
    And ya existe una sesion con titulo pruebaVieja
    And la url es /admin/LPA/prueba/
    When entro a modificar la sesion con titulo pruebaVieja
    And agrego la palabra clave "Palabra Clave 1"
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/prueba\/\d+\/change\/"
    And mensaje de error visible