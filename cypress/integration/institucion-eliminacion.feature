Feature: Elimincacion de instituciones
    
    Eliminacion de una institucion

#@ignore-this
Scenario: Eliminacion exitosa de Institucion

    Given usuario ha iniciado sesion
    And genere un valor unico institucionVieja
    And ya existe una institucion con nombre institucionVieja
    And la url es /admin/LPA/institucion/
    When entro a modificar la institucion con nombre institucionVieja
    And elijo eliminar el registro
    Then verifico la url es /admin/LPA/institucion/
    And verifico no existe institucion con nombre institucionVieja

@ignore-this
Scenario: Eliminacion fallida de Institucion - Asociada a alumnos

    Given usuario ha iniciado sesion
    #Falta definir alumno