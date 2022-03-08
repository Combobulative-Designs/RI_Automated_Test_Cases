Feature: Eliminacion de textos
    
    Eliminacion de un texto en el sistema

#@ignore-this
Scenario: Eliminacion exitosa de Texto

    Given usuario ha iniciado sesion
    And genere un valor unico textoViejo
    And ya existe un texto con texto textoViejo
    And la url es /admin/LPA/texto/
    When entro a modificar el texto con texto textoViejo
    And elijo eliminar el registro
    Then verifico la url es /admin/LPA/texto/
    And verifico no existe texto con texto textoViejo

#@ignore-this
Scenario: Eliminacion fallida de Texto

    Given usuario ha iniciado sesion
    And genere un valor unico pruebaVieja
    And genere un valor unico textoViejo
    And genere un valor unico grupoViejo
    And ya existe un texto con texto textoViejo
    And ya existe un grupo de alumnos con nombre grupoViejo
    And ya existe una sesion con titulo pruebaVieja asociada al texto textoViejo y al grupo grupoViejo
    And la url es /admin/LPA/texto/
    When entro a modificar el texto con texto textoViejo
    And elijo eliminar el registro
    Then verifico la url es /admin/LPA/texto/
    And verifico no existe texto con texto textoViejo
