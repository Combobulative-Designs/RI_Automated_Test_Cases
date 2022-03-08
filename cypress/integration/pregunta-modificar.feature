Feature: Creacion de preguntas
    
    Modificacion de una pregunta de multiple opcion o de desarrollo

#@ignore-this
Scenario: Modificacion exitosa de pregunta de Multiple Opcion 

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And genere un valor unico consignaNueva
    And ya existe una pregunta de multiple opcion con consigna consignaAnterior
    When entro a modificar la pregunta con consigna consignaAnterior
    And completo el campo id_consigna con el valor consignaNueva
    And modifico la opcion 0 al contenido "Opcion A" y marco incorrecta
    And modifico la opcion 1 al contenido "Opcion B" y marco correcta
    And elimino la opcion 2
    And guardo el formulario
    Then verifico la url es /admin/LPA/multipleopcion/
    And verifico existe pregunta con consigna consignaNueva
    And entro a modificar la pregunta con consigna consignaNueva
    And verifico existe la opcion correcta "Opcion B"
    And verifico existe la opcion incorrecta "Opcion A"
    And verifico existen solo 2 opciones

#@ignore-this
Scenario: Modificacion fallida de pregunta de Multiple Opcion - Consigna vacia

    Given usuario ha iniciado sesion
    And genere un valor unico consigna
    And ya existe una pregunta de multiple opcion con consigna consigna
    When entro a modificar la pregunta con consigna consigna
    And vacio el campo id_consigna
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/multipleopcion\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de pregunta de Multiple Opcion - Consigna duplicada

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And genere un valor unico consignaADuplicar
    And ya existe una pregunta de multiple opcion con consigna consignaAnterior
    And ya existe una pregunta de multiple opcion con consigna consignaADuplicar
    When entro a modificar la pregunta con consigna consignaAnterior
    And completo el campo id_consigna con el valor consignaADuplicar
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/multipleopcion\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de pregunta de Multiple Opcion - Opciones removidas

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And ya existe una pregunta de multiple opcion con consigna consignaAnterior
    When entro a modificar la pregunta con consigna consignaAnterior
    And elimino la opcion 0
    And elimino la opcion 1
    And elimino la opcion 2
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/multipleopcion\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de pregunta de Multiple Opcion - Solo una opcion

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And ya existe una pregunta de multiple opcion con consigna consignaAnterior
    When entro a modificar la pregunta con consigna consignaAnterior
    And elimino la opcion 1
    And elimino la opcion 2
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/multipleopcion\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de pregunta de Multiple Opcion - Opcion con contenido vacio

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And ya existe una pregunta de multiple opcion con consigna consignaAnterior
    When entro a modificar la pregunta con consigna consignaAnterior
    And modifico la opcion 0 al contenido "" y marco correcta
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/multipleopcion\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion exitosa de pregunta de Desarrollo

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And genere un valor unico consignaNueva
    And ya existe una pregunta de desarrollo con consigna consignaAnterior
    When entro a modificar la pregunta con consigna consignaAnterior
    And completo el campo id_consigna con el valor consignaNueva
    And modifico la palabra clave 0 al contenido "Palabra Clave A"
    And modifico la palabra clave 1 al contenido "Palabra Clave B"
    And elimino la palabra clave 2
    And guardo el formulario
    Then verifico la url es /admin/LPA/textolibre/
    And verifico existe pregunta con consigna consignaNueva
    And entro a modificar la pregunta con consigna consignaNueva
    And verifico existe la palabra clave "Palabra Clave A"
    And verifico existe la palabra clave "Palabra Clave B"
    And verifico existen solo 2 palabras clave

#@ignore-this
Scenario: Modificacion fallida de pregunta de Desarrollo - Consigna vacia

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And ya existe una pregunta de desarrollo con consigna consignaAnterior
    When entro a modificar la pregunta con consigna consignaAnterior
    And vacio el campo id_consigna
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/textolibre\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de pregunta de Desarrollo - Consigna duplicada

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And genere un valor unico consignaADuplicar
    And ya existe una pregunta de desarrollo con consigna consignaAnterior
    And ya existe una pregunta de desarrollo con consigna consignaADuplicar
    When entro a modificar la pregunta con consigna consignaAnterior
    And completo el campo id_consigna con el valor consignaADuplicar
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/textolibre\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de pregunta de Desarrollo - Sin palabras clave

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And ya existe una pregunta de desarrollo con consigna consignaAnterior
    When entro a modificar la pregunta con consigna consignaAnterior
    And elimino la palabra clave 0
    And elimino la palabra clave 1
    And elimino la palabra clave 2
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/textolibre\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de pregunta de Desarrollo - Palabra clave vacia

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And ya existe una pregunta de desarrollo con consigna consignaAnterior
    When entro a modificar la pregunta con consigna consignaAnterior
    And modifico la palabra clave 0 al contenido ""
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/textolibre\/\d+\/change\/"
    And mensaje de error visible

#@ignore-this
Scenario: Modificacion fallida de pregunta de Desarrollo - Palabra clave duplicada

    Given usuario ha iniciado sesion
    And genere un valor unico consignaAnterior
    And ya existe una pregunta de desarrollo con consigna consignaAnterior
    When entro a modificar la pregunta con consigna consignaAnterior
    And modifico la palabra clave 0 al contenido "Palabra Clave Dup"
    And modifico la palabra clave 1 al contenido "Palabra Clave Dup"
    And guardo el formulario
    Then verifico la url verifica "\/admin\/LPA\/textolibre\/\d+\/change\/"
    And mensaje de error visible