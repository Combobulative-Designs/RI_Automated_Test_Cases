Feature: Modificacion de textos
    
    Modificacion de texto

#@ignore-this
Scenario: Modificacion exitosa de Texto - Cambio de Texto

    Given usuario ha iniciado sesion
    And genere un valor unico textoViejo
    And genere un valor unico textoNuevo
    And ya existe un texto con texto textoViejo
    And la url es /admin/LPA/texto/
    When entro a modificar el texto con texto textoViejo
    And completo el campo id_texto con el valor textoNuevo
    And guardo el formulario
    Then verifico la url es /admin/LPA/texto/
    And verifico existe texto con texto textoNuevo

#@ignore-this
Scenario: Modificacion exitosa de Texto - Agregado de definiciones

    Given usuario ha iniciado sesion
    And genere un valor unico textoViejo
    And ya existe un texto con texto textoViejo
    And la url es /admin/LPA/texto/
    When entro a modificar el texto con texto textoViejo
    And añado la definicion "Palabra A" con el contenido "Contenido A"
    And guardo el formulario
    Then verifico la url es /admin/LPA/texto/
    And verifico existe texto con texto textoViejo
    And entro a modificar el texto con texto textoViejo
    And verifico existen solo 4 definiciones
    And verifico existe la definicion "Palabra 1" con el contenido "Contenido 1"
    And verifico existe la definicion "Palabra 2" con el contenido "Contenido 2"
    And verifico existe la definicion "Palabra 3" con el contenido "Contenido 3"
    And verifico existe la definicion "Palabra A" con el contenido "Contenido A"

#@ignore-this
Scenario: Modificacion exitosa de Texto - Remover definiciones

    Given usuario ha iniciado sesion
    And genere un valor unico textoViejo
    And ya existe un texto con texto textoViejo
    And la url es /admin/LPA/texto/
    When entro a modificar el texto con texto textoViejo
    And elimino la definicion 1
    And guardo el formulario
    Then verifico la url es /admin/LPA/texto/
    And verifico existe texto con texto textoViejo
    And entro a modificar el texto con texto textoViejo
    And verifico existen solo 2 definiciones
    And verifico existe la definicion "Palabra 1" con el contenido "Contenido 1"
    And verifico existe la definicion "Palabra 3" con el contenido "Contenido 3"

#@ignore-this
Scenario: Modificacion exitosa de Texto - Cambiar definicion

    Given usuario ha iniciado sesion
    And genere un valor unico textoViejo
    And ya existe un texto con texto textoViejo
    And la url es /admin/LPA/texto/
    When entro a modificar el texto con texto textoViejo
    And modifico la definicion 0 a la palabra "Palabra 1" y contenido "Contenido A"
    And modifico la definicion 1 a la palabra "Palabra B" y contenido "Contenido B"
    And guardo el formulario
    Then verifico la url es /admin/LPA/texto/
    And verifico existe texto con texto textoViejo
    And entro a modificar el texto con texto textoViejo
    And verifico existen solo 3 definiciones
    And verifico existe la definicion "Palabra 1" con el contenido "Contenido A"
    And verifico existe la definicion "Palabra B" con el contenido "Contenido B"
    And verifico existe la definicion "Palabra 3" con el contenido "Contenido 3"

#@ignore-this
Scenario: Modificacion fallida de Texto - Texto vacio

    Given usuario ha iniciado sesion
    And genere un valor unico textoViejo
    And ya existe un texto con texto textoViejo
    And la url es /admin/LPA/texto/
    When entro a modificar el texto con texto textoViejo
    And vacio el campo id_texto
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/texto\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de Texto - Texto duplicado

    Given usuario ha iniciado sesion
    And genere un valor unico textoViejo
    And genere un valor unico textoADup
    And ya existe un texto con texto textoViejo
    And ya existe un texto con texto textoADup
    And la url es /admin/LPA/texto/
    When entro a modificar el texto con texto textoViejo
    And completo el campo id_texto con el valor textoADup
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/texto\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de Texto - Definicion sin contenido

    Given usuario ha iniciado sesion
    And genere un valor unico textoViejo
    And ya existe un texto con texto textoViejo
    And la url es /admin/LPA/texto/
    When entro a modificar el texto con texto textoViejo
    And modifico la definicion 0 a la palabra "Palabra 1" y contenido ""
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/texto\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de Texto - Definicion sin palabra

    Given usuario ha iniciado sesion
    And genere un valor unico textoViejo
    And ya existe un texto con texto textoViejo
    And la url es /admin/LPA/texto/
    When entro a modificar el texto con texto textoViejo
    And modifico la definicion 0 a la palabra "" y contenido "Contenido 1"
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/texto\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de Texto - Definicion duplicada

    Given usuario ha iniciado sesion
    And genere un valor unico textoViejo
    And ya existe un texto con texto textoViejo
    And la url es /admin/LPA/texto/
    When entro a modificar el texto con texto textoViejo
    And modifico la definicion 0 a la palabra "Palabra 2" y contenido "Contenido 1"
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/texto\/\d+\/change\/"
    And mensaje de error visible