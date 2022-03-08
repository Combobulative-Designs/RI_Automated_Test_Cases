Feature: Creacion de textos
    
    Creacion de una texto para asociar a una sesion

#@ignore-this
Scenario: Creacion exitosa de Texto - Sin definiciones

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/texto/add/
    And genere un valor unico textoNuevo
    When completo el campo id_texto con el valor textoNuevo
    And guardo el formulario
    Then verifico la url es /admin/LPA/texto/
    And verifico existe texto con texto textoNuevo
    And entro a modificar el texto con texto textoNuevo
    And verifico existen solo 0 definiciones

#@ignore-this
Scenario: Creacion exitosa de Texto - Con definiciones

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/texto/add/
    And genere un valor unico textoNuevo
    When completo el campo id_texto con el valor textoNuevo
    And añado la definicion "Palabra 1" con el contenido "Contenido 1"
    And añado la definicion "Palabra 2" con el contenido "Contenido 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/texto/
    And verifico existe texto con texto textoNuevo
    And entro a modificar el texto con texto textoNuevo
    And verifico existen solo 2 definiciones
    And verifico existe la definicion "Palabra 1" con el contenido "Contenido 1"
    And verifico existe la definicion "Palabra 2" con el contenido "Contenido 2"

#@ignore-this
Scenario: Creacion fallida de Texto - Texto vacio

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/texto/add/
    When guardo el formulario
    Then verifico la url es /admin/LPA/texto/add/
    And mensaje de error visible

#@ignore-this
Scenario: Creacion fallida de Texto - Texto duplidado

    Given usuario ha iniciado sesion
    And genere un valor unico textoViejo
    And ya existe un texto con texto textoViejo
    And la url es /admin/LPA/texto/add/
    When completo el campo id_texto con el valor textoViejo
    And guardo el formulario
    Then verifico la url es /admin/LPA/texto/add/
    And mensaje de error visible

#@ignore-this
Scenario: Creacion fallida de Texto - Definicion sin contenido

    Given usuario ha iniciado sesion
    And genere un valor unico textoNuevo
    And la url es /admin/LPA/texto/add/
    When completo el campo id_texto con el valor textoNuevo
    And añado la definicion "Palabra 1" con el contenido ""
    And añado la definicion "Palabra 2" con el contenido "Contenido 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/texto/add/
    And mensaje de error visible

#@ignore-this
Scenario: Creacion fallida de Texto - Definicion sin palabra

    Given usuario ha iniciado sesion
    And genere un valor unico textoNuevo
    And la url es /admin/LPA/texto/add/
    When completo el campo id_texto con el valor textoNuevo
    And añado la definicion "" con el contenido "Contenido 1"
    And añado la definicion "Palabra 2" con el contenido "Contenido 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/texto/add/
    And mensaje de error visible

#@ignore-this
Scenario: Creacion fallida de Texto - Definicion duplicada

    Given usuario ha iniciado sesion
    And genere un valor unico textoNuevo
    And la url es /admin/LPA/texto/add/
    When completo el campo id_texto con el valor textoNuevo
    And añado la definicion "Palabra 1" con el contenido "Contenido 1"
    And añado la definicion "Palabra 1" con el contenido "Contenido 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/texto/add/
    And mensaje de error visible

