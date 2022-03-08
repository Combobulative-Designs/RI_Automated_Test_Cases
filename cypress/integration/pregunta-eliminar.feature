Feature: Creacion de preguntas
    
    Eliminacion de una pregunta de multiple opcion o de desarrollo

#@ignore-this
Scenario: Eliminacion exitosa de pregunta de Multiple Opcion 

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And ya existe una pregunta de multiple opcion con consigna consignaAnterior
    When entro a modificar la pregunta con consigna consignaAnterior
    And elijo eliminar el registro
    Then verifico la url es /admin/LPA/multipleopcion/
    And verifico no existe pregunta con consigna consignaAnterior

#@ignore-this
Scenario: Eliminacion exitosa de pregunta de Desarrollo

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And ya existe una pregunta de desarrollo con consigna consignaAnterior
    When entro a modificar la pregunta con consigna consignaAnterior
    And elijo eliminar el registro
    Then verifico la url es /admin/LPA/textolibre/
    And verifico no existe pregunta con consigna consignaAnterior


