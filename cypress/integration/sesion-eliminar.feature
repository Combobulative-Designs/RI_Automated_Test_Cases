Feature: Eliminacion de Sesiones
    
    Modificacion de una Sesion

#@ignore-this
Scenario: Eliminacion exitosa de Sesion

    Given usuario ha iniciado sesion
    And genere un valor unico pruebaVieja
    And ya existe una sesion con titulo pruebaVieja
    And la url es /admin/LPA/prueba/
    When entro a modificar la sesion con titulo pruebaVieja
    And elijo eliminar el registro
    Then verifico la url es /admin/LPA/prueba/
    And verifico no existe prueba con titulo pruebaVieja

