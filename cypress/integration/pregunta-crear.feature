Feature: Creacion de preguntas
    
    Creacion de una pregunta de multiple opcion o de desarrollo

Scenario: Creacion exitosa de pregunta de Multiple Opcion 

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/multipleopcion/add/
    And genere una consigna unica
    When completo el campo id_consigna con el valor generado
    And añado la opcion correcta "Opcion 1"
    And añado la opcion incorrecta "Opcion 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/multipleopcion/
    And verifico existe pregunta de consigna generada
    And entro a modificar la pregunta de consigna generada
    And verifico existe la opcion correcta "Opcion 1"
    And verifico existe la opcion incorrecta "Opcion 2"

Scenario: Creacion de pregunta fallida de Multiple Opcion - Consigna vacia

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/multipleopcion/add/
    When vacio el campo id_consigna
    And añado la opcion correcta "Opcion 1"
    And añado la opcion incorrecta "Opcion 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/multipleopcion/add/
    And mensaje de error visible

Scenario: Creacion de pregunta fallida de Multiple Opcion - Consigna duplicada
    
    Given usuario ha iniciado sesion
    And genere una consigna unica
    And ya existe una pregunta de multiple opcion con consigna generada
    And la url es /admin/LPA/multipleopcion/add/
    When completo el campo id_consigna con el valor generado
    And añado la opcion correcta "Opcion 1"
    And añado la opcion incorrecta "Opcion 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/multipleopcion/add/
    And mensaje de error visible

Scenario: Creacion de pregunta fallida de Multiple Opcion - Sin opciones
    
    Given usuario ha iniciado sesion
    And genere una consigna unica
    And la url es /admin/LPA/multipleopcion/add/
    When completo el campo id_consigna con el valor generado
    And guardo el formulario
    Then verifico la url es /admin/LPA/multipleopcion/add/
    And mensaje de error visible

Scenario: Creacion de pregunta fallida de Multiple Opcion - Solo una opcion
    
    Given usuario ha iniciado sesion
    And genere una consigna unica
    And la url es /admin/LPA/multipleopcion/add/
    When completo el campo id_consigna con el valor generado
    And añado la opcion correcta "Opcion 1"
    And guardo el formulario
    Then verifico la url es /admin/LPA/multipleopcion/add/
    And mensaje de error visible

Scenario: Creacion de pregunta fallida de Multiple Opcion - Opcion vacia
    
    Given usuario ha iniciado sesion
    And genere una consigna unica
    And la url es /admin/LPA/multipleopcion/add/
    When completo el campo id_consigna con el valor generado
    And añado la opcion correcta ""
    And añado la opcion incorrecta "Opcion 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/multipleopcion/add/
    And mensaje de error visible

Scenario: Creacion de pregunta fallida de Multiple Opcion - Sin opcion correcta
    
    Given usuario ha iniciado sesion
    And genere una consigna unica
    And la url es /admin/LPA/multipleopcion/add/
    When completo el campo id_consigna con el valor generado
    And añado la opcion incorrecta "Opcion 1"
    And añado la opcion incorrecta "Opcion 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/multipleopcion/add/
    And mensaje de error visible

Scenario: Creacion exitosa de pregunta de Desarrollo

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/textolibre/add/
    And genere una consigna unica
    When completo el campo id_consigna con el valor generado
    And añado la palabra clave "Palabra Clave 1"
    And añado la palabra clave "Palabra Clave 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/textolibre/
    And verifico existe pregunta de consigna generada
    And entro a modificar la pregunta de consigna generada
    And verifico existe la palabra clave "Palabra Clave 1"
    And verifico existe la palabra clave "Palabra Clave 2"

Scenario: Creacion de pregunta fallida de Desarrollo - Consigna vacia

    Given usuario ha iniciado sesion
    And la url es /admin/LPA/textolibre/add/
    When vacio el campo id_consigna
    And añado la palabra clave "Palabra Clave 1"
    And añado la palabra clave "Palabra Clave 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/textolibre/add/
    And mensaje de error visible

Scenario: Creacion de pregunta fallida de Desarrollo - Consigna duplicada
    
    Given usuario ha iniciado sesion
    And genere una consigna unica
    And ya existe una pregunta de desarrollo con consigna generada
    And la url es /admin/LPA/textolibre/add/
    When completo el campo id_consigna con el valor generado
    And añado la palabra clave "Palabra Clave 1"
    And añado la palabra clave "Palabra Clave 2"
    And guardo el formulario
    Then verifico la url es /admin/LPA/textolibre/add/
    And mensaje de error visible

Scenario: Creacion de pregunta fallida de Desarrollo - Sin palabras clave
    
    Given usuario ha iniciado sesion
    And genere una consigna unica
    And la url es /admin/LPA/textolibre/add/
    When completo el campo id_consigna con el valor generado
    And guardo el formulario
    Then verifico la url es /admin/LPA/textolibre/add/
    And mensaje de error visible

Scenario: Creacion de pregunta fallida de Desarrollo - Con palabra clave vacia
    
    Given usuario ha iniciado sesion
    And genere una consigna unica
    And la url es /admin/LPA/textolibre/add/
    When completo el campo id_consigna con el valor generado
    And añado la palabra clave ""
    And guardo el formulario
    Then verifico la url es /admin/LPA/textolibre/add/
    And mensaje de error visible

Scenario: Creacion de pregunta fallida de Desarrollo - Con palabra clave repetida
    
    Given usuario ha iniciado sesion
    And genere una consigna unica
    And la url es /admin/LPA/textolibre/add/
    When completo el campo id_consigna con el valor generado
    And añado la palabra clave "Palabra Clave 1"
    And añado la palabra clave "Palabra Clave 1"
    And guardo el formulario
    Then verifico la url es /admin/LPA/textolibre/add/
    And mensaje de error visible